@info "Scraping information from mujoco's introspect module"
include("scrape_introspect.jl")

using Clang.Generators
using MuJoCo_jll

cd(@__DIR__)

include_dir = normpath(MuJoCo_jll.artifact_dir, "include")
mujoco_dir = joinpath(include_dir, "mujoco")

# Wrapper generator options
options = load_options(joinpath(@__DIR__, "generator.toml"))

# add compiler flags, e.g. "-DXXXXXXXXX"
args = get_default_args()  # Must call this function first and then append your own flags
push!(args, "-I$include_dir")

headers = [joinpath(mujoco_dir, header) for header in readdir(mujoco_dir) if endswith(header, ".h")]

# create context
ctx = create_context(headers, args, options)


if !isdir("./LibMuJoCo")
    mkdir("./LibMuJoCo")
end

# run generator
build!(ctx)

if !isdir("../src/LibMuJoCo")
    mkdir("../src/LibMuJoCo")
end

@info "Fixing autogenerated code"

# Fix the autogenerated code
lines_to_remove = [
    "const MJAPI",
    "const MJLOCAL",
    "const MJOPTION_FLOATS",
    "const MJOPTION_SCALARS",
    "const MJOPTION_VECTORS",
    "const XMJV",
    "const MJMODEL_INTS",
    "const MJMODEL_POINTERS",
    "const MJDATA_POINTERS",
    "const MJDATA_ARENA_POINTERS_CONTACT",
    "const MJDATA_ARENA_POINTERS_PRIMAL",
    "const MJDATA_ARENA_POINTERS_DUAL",
    "const MJDATA_ARENA_POINTERS",
    "const MJDATA_SCALAR",
    "const MJDATA_VECTOR",
    "const MJOPTION_INTS",
]

replace_math_functions = Dict{String, String}(
    "const mju_atan2 = atan2" => "const mju_atan2 = atan",
    "const mju_pow = pow" => "const mju_pow = ^",
    "const mju_abs = fabs" => "const mju_abs = abs",
)

file_lines = readlines("./LibMuJoCo/LibMuJoCo.jl")

function remove_lines_starting_with(lines, line_starting)
    filter(lines) do line
        return !any(startswith(line, s) for s in line_starting)
    end
end
function replace_lines_with(lines, replacements)
    c = 0
    new_lines = map(lines) do line
        if haskey(replacements, line)
            c += 1
            return replacements[line]
        else
            return line
        end
    end
    @assert length(replacements) == c
    return new_lines
end

multiline_remove = [
    "const mjMARKSTACK",
    "const mjFREESTACK"
]

file_lines = remove_lines_starting_with(file_lines, lines_to_remove)
file_lines = replace_lines_with(file_lines, replace_math_functions)

function remove_multilines(lines, multiline_removals)
    io = IOBuffer()
    is_removing = false

    for line in lines
        if any(startswith(line, m) for m in multiline_removals)
            is_removing = true
        end

        if is_removing
            if endswith(line, "end)))")
                is_removing = false
            end
        else
            println(io, line)
        end
    end
    return String(take!(io))
end

libmujoco_text_content = remove_multilines(file_lines, multiline_remove);

function print_expr(io, expr)
    if expr isa LineNumberNode
        println(io, expr)
        return
    end

    if expr.head == :module 
        module_name = expr.args[2]
        module_block = expr.args[3]
        println(io, "module $(module_name)")
        for expr in module_block.args
            print_expr(io, expr)
        end
        println(io, "end")
        return
    end

    if expr.head == :macrocall && expr.args[begin] == :(Core.var"@doc")
        # Documentation!
        println(io, "\"\"\"")
        println(io, expr.args[3])
        println(io, "\"\"\"")
        println(io, expr.args[end])
    else
        println(io, expr)
    end
end
function create_file_from_expr(filepath, expr)
    remove_line_comments = r"#=.*=#\s*"
    remove_main_qualifiers = r"Main.LibMuJoCo."
    b = IOBuffer()
    print_expr(b, expr)
    open(filepath, "w") do io
        print(io, replace(String(take!(b)), remove_line_comments=>"", remove_main_qualifiers=>""))
    end
end
function create_file_from_expr(filepath, exprs::AbstractArray)
    remove_line_comments = r"#=.*=#\s*"
    remove_main_qualifiers = r"Main.LibMuJoCo."
    b = IOBuffer()
    for expr in exprs
        print_expr(b, expr)
    end
    open(filepath, "w") do io
        print(io, replace(String(take!(b)), remove_line_comments=>"", remove_main_qualifiers=>""))
    end
end

function insert_ctors!(expr)
    expr = insert_default_ctor!(expr)
    expr = insert_regular_ctor!(expr)
    expr
end
function insert_default_ctor!(expr)
    @assert expr.head == :struct

    # Insert a default constructor to the struct definition
    fields_block = expr.args[end]
    @assert fields_block.head == :block
    new_ctor_expr = Expr(:(=), Expr(:call, expr.args[2]), Expr(:call, :new))
    push!(fields_block.args, new_ctor_expr)
    return expr
end
function insert_regular_ctor!(expr)
    @assert expr.head == :struct

    # Insert a default constructor to the struct definition
    fields_block = expr.args[end]
    @assert fields_block.head == :block
    # Assume after default constructor
    fields = [a for a in fields_block.args if !(typeof(a) <: LineNumberNode) && a.head == :(::)]
    fields_no_types = [a.args[1] for a in fields]
    new_ctor_expr = Expr(:(=), Expr(:call, expr.args[2], fields...), Expr(:call, :new, fields_no_types...))
    push!(fields_block.args, new_ctor_expr)
    return expr
end


function write_content_files(destination_dir, module_content)
    # Uses global variables function_mapping, and calls functions relying on struct_mapping from the scraped introspect module.

    module_expr = Meta.parse(module_content)
    module_block = module_expr.args[end]

    original_module_block_args = Expr[]
    const_block_args = Expr[]
    enum_block_args = Expr[]
    struct_block_args = Expr[]
    function_block_args = Expr[]
    for_block_args = Expr[]

    # types are for, struct, using, const, macrocall, export, function
    for def in module_block.args
        if def isa LineNumberNode
            continue
        end

        if def.head == :macrocall
            push!(enum_block_args, def)
        elseif def.head == :struct
            def = insert_ctors!(def)
            push!(struct_block_args, construct_struct_docs(def))
        elseif def.head == :function
            fn_sig = def.args[1]
            fn_name = string(fn_sig.args[1])
            if haskey(function_mapping, fn_name)
                documented_fn = Expr(:macrocall, :(Core.var"@doc"), LineNumberNode(1), function_mapping[fn_name].doc, def)
                push!(function_block_args, documented_fn) 
            else
                push!(function_block_args, def)
            end
        elseif def.head == :const 
            target_def = string(def.args[begin].args[end])
            if endswith(target_def, "_")
                if count(target_def, module_content) > 1
                    push!(struct_block_args, def)
                end
            else
                push!(const_block_args, def)
            end
        elseif def.head ==:for
            push!(for_block_args, def)
        else
            push!(original_module_block_args, def)
        end
    end

    for (filename, exprs) in zip(["consts.jl", "enums.jl", "structs.jl", "functions.jl"], [const_block_args, enum_block_args, struct_block_args, function_block_args])
        push!(original_module_block_args, Expr(:call, :include, filename))
        create_file_from_expr(joinpath(destination_dir, filename), exprs)
    end

    for arg in for_block_args
        push!(original_module_block_args, arg)
    end

    module_expr.args[end] = Expr(:block, original_module_block_args...)

    create_file_from_expr(joinpath(destination_dir, "LibMuJoCo.jl"), module_expr)

    nothing
end

libmujoco_dir = joinpath(abspath(pwd()), "LibMuJoCo")
staging_dir = joinpath(abspath(pwd()), "staging")
if !isdir(staging_dir)
    mkdir(staging_dir)
end
dest_dir = joinpath(abspath(pwd()), "..", "src")
if !isdir(dest_dir)
    mkdir(dest_dir)
end
dest_libmujoco_dir = joinpath(dest_dir, "LibMuJoCo")
if !isdir(dest_libmujoco_dir)
    mkdir(dest_libmujoco_dir)
end

@info "Writing generated files to staging directory..."
write_content_files(libmujoco_dir, libmujoco_text_content)

@info "Formatting..."
using JuliaFormatter
format_file(joinpath(libmujoco_dir, "enums.jl"))
format_file(joinpath(libmujoco_dir, "consts.jl"))
format_file(joinpath(libmujoco_dir, "structs.jl"))
format_file(joinpath(libmujoco_dir, "LibMuJoCo.jl"))

include("LibMuJoCo/LibMuJoCo.jl")
import .LibMuJoCo

@info "Generating wrappers"
include("gen_api.jl")
create_basic_wrappers()
module Wrappers
    staging_dir = joinpath(abspath(pwd()), "staging")
    using ..LibMuJoCo
end
@eval Wrappers include(joinpath(staging_dir, "wrappers.jl"))
@eval Wrappers include(joinpath(staging_dir, "visualiser_wrappers.jl"))
import .Wrappers

@info "Generating named access wrappers"
include("named_access.jl")
generate_named_access()

@info "Copying into src directory..."
begin
    for file in readdir(libmujoco_dir)
        staging_path = joinpath(libmujoco_dir, file)
        dest_path = joinpath(dest_libmujoco_dir, file)
        cp(staging_path, dest_path, force=true)
    end
    for file in readdir(staging_dir)
        staging_path = joinpath(staging_dir, file)
        dest_path = joinpath(dest_dir, file)
        cp(staging_path, dest_path, force=true)
    end
end

@info "Finished!"
