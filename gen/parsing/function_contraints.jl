function extract_text_block(io, starting_line)
    buffer = IOBuffer()
    write(buffer, starting_line)
    bracket_num = 0;
    line = starting_line
    while true
        for char in line
            if char == '('
                bracket_num += 1
            elseif char == ')'
                bracket_num -= 1
            elseif char == ';'
                if bracket_num == 0
                    break # stop once at the end
                end
            end
        end
        line = readline(io)
        write(buffer, '\n')
        write(buffer, line)
    end

    return strip(String(take!(buffer)))
end

function extract_anon_fn(block)
    fn_buffer = IOBuffer()
    bracket_num = 0
    start_collection = false
    has_started_fn = false
    curly_bracket_num = 0
    for char in block
        if char == '('
            bracket_num += 1
        elseif char == ')'
            bracket_num -= 1
        end

        if bracket_num == 1
            if char == ',' && !start_collection
                start_collection = true
            elseif start_collection && has_started_fn
                write(fn_buffer, char)
                if char == '{'
                    curly_bracket_num += 1
                elseif char == '}'
                    curly_bracket_num -= 1
                    if curly_bracket_num == 0
                        has_started_fn = false
                    end
                end
            elseif char == '['
                has_started_fn = true
                if length(fn_buffer) > 0
                    error("Unexpected second function definition when parsing function constraints. Block:\n$block")
                end
                write(fn_buffer, char)
            end
        elseif bracket_num == 0 && start_collection
            start_collection = false # stop collecting when closing a bracket
        end
    end

    return String(take!(fn_buffer))
end

function convert_fn_body(fn_body)

    # Added below match to convert to 1 based indexing
    index_offset_match = r"\[([^[]+?)\s?-\s?1\s?\]"
    fn_body = replace(fn_body, index_offset_match=>s"[\1]")

    # Added below to replace all dimension and size extractions
    rows_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)rows\(\)"
    cols_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)cols\(\)"
    size_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)size\(\)"





    # Change to Julia syntax
    exception_regex = r"throw py::type_error\(([^)]*)\);"
    data_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)data\(\)"
    cstr_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)c_str\(\)"
    intercept_error_regex = r"InterceptMjErrors\(::\b([a-zA-Z_][a-zA-Z0-9_]*)\)"
    return_fn_regex = r"return ::\b([a-zA-Z_][a-zA-Z0-9_]*)\("
    error_regex = r"throw FatalError\(std::string\((.*)\)\);"
    other_exception = r"throw \b([a-zA-Z_][a-zA-Z0-9_]*)\((.+)\);"
    has_value_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)(?:.|->)has_value\(\)"

    fn_body = replace(fn_body,
        rows_regex=>s"size(\1, 1)",
        cols_regex=>s"size(\1, 2)",
        size_regex=>s"length(\1)",
        exception_regex=>s"throw(ArgumentError(\1))",
        data_regex => s"\1",
        cstr_regex => s"\1",
        intercept_error_regex=> s"\1",
        return_fn_regex => s"return \1(",
        error_regex => s"error(String(\1))",
        other_exception => s"error(\1)",
        has_value_regex => s"!isnothing(\1)",
        "nullptr"=>"C_NULL"
    )

    # Modify pointer references
    pointer_access_regex = r"\b([a-zA-Z_][a-zA-Z0-9_]*)->\b([a-zA-Z_][a-zA-Z0-9_]*)"
    pointer_defref = r"&\(\*\b([a-zA-Z_][a-zA-Z0-9_]*)\)\[(\d+)\]"
    fn_body = replace(fn_body,
        pointer_access_regex => s"\1.\2",
        pointer_defref => s"\1[\2+1]" # Convert to 1-based
    )

    return fn_body
end

function convert_argument(argument)
    argument = strip(argument)
    static_array_regex = r"(const )?\b([a-zA-Z_][a-zA-Z0-9_]*)\s*\(\*\s*\b([a-zA-Z_][a-zA-Z0-9_]*)\s*\)\s*\[\s*(\d+)\s*\]"
    m = match(static_array_regex, argument)
    identifier = ""
    if !isnothing(m)
        is_const = isnothing(m.captures[1])
        array_type = m.captures[2]
        identifier = m.captures[3]
        array_size = n.captures[4]
    else 
        # TODO: Make sure we can parse the other argument types
        splitter_index = findlast(' ', argument)
        if isnothing(splitter_index)
            error("Could not parse argument: $argument")
        end
        identifier = argument[splitter_index+1:end]
    end
    return identifier
end

function extract_fn_info(fn_block)
    bracket_num = 0
    angle_bracket_count = 0
    curly_bracket_count = 0
    has_finished_args = false

    arguments = String[]
    arg_buffer = IOBuffer()

    fn_body_buffer = IOBuffer()

    function consume_arg()
        if length(arg_buffer) > 0
            push!(arguments, String(take!(arg_buffer)))
        end
        nothing
    end
    

    for char in fn_block
        if char == '('
            bracket_num += 1
        elseif char == ')'
            bracket_num -= 1
            if bracket_num == 0 && !has_finished_args
                has_finished_args = true
                consume_arg()
            end
        end

        if !has_finished_args
            if char == '<'
                angle_bracket_count += 1
            elseif char == '>'
                angle_bracket_count -= 1
            elseif angle_bracket_count == 0 && char == ','
                consume_arg()
                continue
            end
            
            write(arg_buffer, char)
        else
            if char == '{'
                curly_bracket_count += 1
                if curly_bracket_count == 1
                    continue # go to next character                    
                end
            elseif char == '}'
                curly_bracket_count -= 1
            end

            write(fn_body_buffer, char)
        end
    end

    fn_body = convert_fn_body(String(take!(fn_body_buffer)))
    args = convert_argument.(arguments)

    return args, fn_body
end

function extract_normal_def(block)
    trait_def = r"Def<traits::([^>]+)>"
    m = match(trait_def, block)
    if isnothing(m)
        error("Could not find function name for block:\n$block")
    end
    fn_name = m.captures[begin]

    anon_fn = extract_anon_fn(block)

    args, fn_body = extract_fn_info(anon_fn)

    fn_buffer = IOBuffer()
    write(fn_buffer, "function LibMuJoCo.$fn_name(")
    write(fn_buffer, join(args, ", "))
    write(fn_buffer, ")\n")
    write(fn_buffer, fn_body)
    write(fn_buffer, "\nend")

    return String(take!(fn_buffer))
end
function extract_other_def(block)
    trait_def = r"DEF_WITH_OMITTED_PY_ARGS\((traits)?::\b([a-zA-Z_][a-zA-Z0-9_]*)"
    m = match(trait_def, block)
    if isnothing(m)
        error("Could not find function name for block:\n$block")
    end
    fn_name = m.captures[2]

    anon_fn = extract_anon_fn(block)

    args, fn_body = extract_fn_info(anon_fn)

    fn_buffer = IOBuffer()
    write(fn_buffer, "function LibMuJoCo.$fn_name(")
    write(fn_buffer, join(args, ", "))
    write(fn_buffer, ")\n")
    write(fn_buffer, fn_body)
    write(fn_buffer, "\nend")

    return String(take!(fn_buffer))
end



function extract_blocks(io, fileloc)
    open(fileloc, "w") do fw
        while !eof(io)
            line = readline(io)
            if startswith(strip(line), "//") # skip comments
                continue
            end
            if contains(line, "Def<traits")
                println(fw, extract_normal_def(extract_text_block(io, line)))
                print("#")
            elseif contains(line, "DEF_WITH_OMITTED_PY_ARGS")
                println(fw, extract_other_def(extract_text_block(io, line)))
                print("#")
            end
        end
    end
    println("")
    println("Finished!")
    nothing
end


function main()
    file_location = joinpath(@__DIR__, "..", "mujoco", "python", "mujoco", "functions.cc")
    open(file_location, "r") do io
        extract_blocks(io, "tmp.jl")
    end
end