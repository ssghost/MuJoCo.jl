using UnsafeArrays
export Options, Statistics, Model, Data
struct Options
    internal_pointer::Ptr{mjOption}
end
struct Statistics
    internal_pointer::Ptr{mjStatistic}
end
struct Model
    internal_pointer::Ptr{mjModel}
end
struct Data
    internal_pointer::Ptr{mjData}
end
function Base.propertynames(x::Options)
    (:timestep, :apirate, :impratio, :tolerance, :noslip_tolerance, :mpr_tolerance, :gravity, :wind, :magnetic, :density, :viscosity, :o_margin, :o_solref, :o_solimp, :integrator, :collision, :cone, :jacobian, :solver, :iterations, :noslip_iterations, :mpr_iterations, :disableflags, :enableflags)
end
function Base.getproperty(x::Options, f::Symbol)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && return internal_pointer
    f === :timestep && return unsafe_load(Ptr{Float64}(internal_pointer + 0))
    f === :apirate && return unsafe_load(Ptr{Float64}(internal_pointer + 8))
    f === :impratio && return unsafe_load(Ptr{Float64}(internal_pointer + 16))
    f === :tolerance && return unsafe_load(Ptr{Float64}(internal_pointer + 24))
    f === :noslip_tolerance && return unsafe_load(Ptr{Float64}(internal_pointer + 32))
    f === :mpr_tolerance && return unsafe_load(Ptr{Float64}(internal_pointer + 40))
    f === :gravity && return UnsafeArray(Ptr{Float64}(internal_pointer + 48), (3,))
    f === :wind && return UnsafeArray(Ptr{Float64}(internal_pointer + 72), (3,))
    f === :magnetic && return UnsafeArray(Ptr{Float64}(internal_pointer + 96), (3,))
    f === :density && return unsafe_load(Ptr{Float64}(internal_pointer + 120))
    f === :viscosity && return unsafe_load(Ptr{Float64}(internal_pointer + 128))
    f === :o_margin && return unsafe_load(Ptr{Float64}(internal_pointer + 136))
    f === :o_solref && return UnsafeArray(Ptr{Float64}(internal_pointer + 144), (2,))
    f === :o_solimp && return UnsafeArray(Ptr{Float64}(internal_pointer + 160), (5,))
    f === :integrator && return unsafe_load(Ptr{Int32}(internal_pointer + 200))
    f === :collision && return unsafe_load(Ptr{Int32}(internal_pointer + 204))
    f === :cone && return unsafe_load(Ptr{Int32}(internal_pointer + 208))
    f === :jacobian && return unsafe_load(Ptr{Int32}(internal_pointer + 212))
    f === :solver && return unsafe_load(Ptr{Int32}(internal_pointer + 216))
    f === :iterations && return unsafe_load(Ptr{Int32}(internal_pointer + 220))
    f === :noslip_iterations && return unsafe_load(Ptr{Int32}(internal_pointer + 224))
    f === :mpr_iterations && return unsafe_load(Ptr{Int32}(internal_pointer + 228))
    f === :disableflags && return unsafe_load(Ptr{Int32}(internal_pointer + 232))
    f === :enableflags && return unsafe_load(Ptr{Int32}(internal_pointer + 236))
    error("Could not find property $(f)")
end
function Base.setproperty!(x::Options, f::Symbol, value)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && error("Cannot set the internal pointer, create a new struct instead.")
    if f === :timestep
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 0), cvalue)
        return cvalue
    end
    if f === :apirate
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 8), cvalue)
        return cvalue
    end
    if f === :impratio
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 16), cvalue)
        return cvalue
    end
    if f === :tolerance
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 24), cvalue)
        return cvalue
    end
    if f === :noslip_tolerance
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 32), cvalue)
        return cvalue
    end
    if f === :mpr_tolerance
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 40), cvalue)
        return cvalue
    end
    if f === :density
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 48), cvalue)
        return cvalue
    end
    if f === :viscosity
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 56), cvalue)
        return cvalue
    end
    if f === :o_margin
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 64), cvalue)
        return cvalue
    end
    if f === :integrator
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 72), cvalue)
        return cvalue
    end
    if f === :collision
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 76), cvalue)
        return cvalue
    end
    if f === :cone
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 80), cvalue)
        return cvalue
    end
    if f === :jacobian
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 84), cvalue)
        return cvalue
    end
    if f === :solver
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 88), cvalue)
        return cvalue
    end
    if f === :iterations
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 92), cvalue)
        return cvalue
    end
    if f === :noslip_iterations
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 96), cvalue)
        return cvalue
    end
    if f === :mpr_iterations
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 100), cvalue)
        return cvalue
    end
    if f === :disableflags
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 104), cvalue)
        return cvalue
    end
    if f === :enableflags
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 108), cvalue)
        return cvalue
    end
    if f in (:gravity, :wind, :magnetic, :o_solref, :o_solimp)
        error("Cannot overwrite array field. Mutate the array instead.")
    end
    error("Could not find property $(f) to set.")
end
function Base.propertynames(x::Statistics)
    (:meaninertia, :meanmass, :meansize, :extent, :center)
end
function Base.getproperty(x::Statistics, f::Symbol)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && return internal_pointer
    f === :meaninertia && return unsafe_load(Ptr{Float64}(internal_pointer + 0))
    f === :meanmass && return unsafe_load(Ptr{Float64}(internal_pointer + 8))
    f === :meansize && return unsafe_load(Ptr{Float64}(internal_pointer + 16))
    f === :extent && return unsafe_load(Ptr{Float64}(internal_pointer + 24))
    f === :center && return UnsafeArray(Ptr{Float64}(internal_pointer + 32), (3,))
    error("Could not find property $(f)")
end
function Base.setproperty!(x::Statistics, f::Symbol, value)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && error("Cannot set the internal pointer, create a new struct instead.")
    if f === :meaninertia
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 0), cvalue)
        return cvalue
    end
    if f === :meanmass
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 8), cvalue)
        return cvalue
    end
    if f === :meansize
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 16), cvalue)
        return cvalue
    end
    if f === :extent
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 24), cvalue)
        return cvalue
    end
    if f in (:center,)
        error("Cannot overwrite array field. Mutate the array instead.")
    end
    error("Could not find property $(f) to set.")
end
function Base.propertynames(x::Model)
    (:nq, :nv, :nu, :na, :nbody, :nbvh, :njnt, :ngeom, :nsite, :ncam, :nlight, :nmesh, :nmeshvert, :nmeshnormal, :nmeshtexcoord, :nmeshface, :nmeshgraph, :nskin, :nskinvert, :nskintexvert, :nskinface, :nskinbone, :nskinbonevert, :nhfield, :nhfielddata, :ntex, :ntexdata, :nmat, :npair, :nexclude, :neq, :ntendon, :nwrap, :nsensor, :nnumeric, :nnumericdata, :ntext, :ntextdata, :ntuple, :ntupledata, :nkey, :nmocap, :nplugin, :npluginattr, :nuser_body, :nuser_jnt, :nuser_geom, :nuser_site, :nuser_cam, :nuser_tendon, :nuser_actuator, :nuser_sensor, :nnames, :nnames_map, :nM, :nD, :nB, :nemax, :njmax, :nconmax, :nstack, :nuserdata, :nsensordata, :npluginstate, :nbuffer, :opt, :vis, :stat, :buffer, :qpos0, :qpos_spring, :body_parentid, :body_rootid, :body_weldid, :body_mocapid, :body_jntnum, :body_jntadr, :body_dofnum, :body_dofadr, :body_geomnum, :body_geomadr, :body_simple, :body_sameframe, :body_pos, :body_quat, :body_ipos, :body_iquat, :body_mass, :body_subtreemass, :body_inertia, :body_invweight0, :body_gravcomp, :body_user, :body_plugin, :body_bvhadr, :body_bvhnum, :bvh_depth, :bvh_child, :bvh_geomid, :bvh_aabb, :jnt_type, :jnt_qposadr, :jnt_dofadr, :jnt_bodyid, :jnt_group, :jnt_limited, :jnt_actfrclimited, :jnt_solref, :jnt_solimp, :jnt_pos, :jnt_axis, :jnt_stiffness, :jnt_range, :jnt_actfrcrange, :jnt_margin, :jnt_user, :dof_bodyid, :dof_jntid, :dof_parentid, :dof_Madr, :dof_simplenum, :dof_solref, :dof_solimp, :dof_frictionloss, :dof_armature, :dof_damping, :dof_invweight0, :dof_M0, :geom_type, :geom_contype, :geom_conaffinity, :geom_condim, :geom_bodyid, :geom_dataid, :geom_matid, :geom_group, :geom_priority, :geom_sameframe, :geom_solmix, :geom_solref, :geom_solimp, :geom_size, :geom_aabb, :geom_rbound, :geom_pos, :geom_quat, :geom_friction, :geom_margin, :geom_gap, :geom_fluid, :geom_user, :geom_rgba, :site_type, :site_bodyid, :site_matid, :site_group, :site_sameframe, :site_size, :site_pos, :site_quat, :site_user, :site_rgba, :cam_mode, :cam_bodyid, :cam_targetbodyid, :cam_pos, :cam_quat, :cam_poscom0, :cam_pos0, :cam_mat0, :cam_fovy, :cam_ipd, :cam_user, :light_mode, :light_bodyid, :light_targetbodyid, :light_directional, :light_castshadow, :light_active, :light_pos, :light_dir, :light_poscom0, :light_pos0, :light_dir0, :light_attenuation, :light_cutoff, :light_exponent, :light_ambient, :light_diffuse, :light_specular, :mesh_vertadr, :mesh_vertnum, :mesh_faceadr, :mesh_facenum, :mesh_bvhadr, :mesh_bvhnum, :mesh_normaladr, :mesh_normalnum, :mesh_texcoordadr, :mesh_texcoordnum, :mesh_graphadr, :mesh_vert, :mesh_normal, :mesh_texcoord, :mesh_face, :mesh_facenormal, :mesh_facetexcoord, :mesh_graph, :skin_matid, :skin_group, :skin_rgba, :skin_inflate, :skin_vertadr, :skin_vertnum, :skin_texcoordadr, :skin_faceadr, :skin_facenum, :skin_boneadr, :skin_bonenum, :skin_vert, :skin_texcoord, :skin_face, :skin_bonevertadr, :skin_bonevertnum, :skin_bonebindpos, :skin_bonebindquat, :skin_bonebodyid, :skin_bonevertid, :skin_bonevertweight, :hfield_size, :hfield_nrow, :hfield_ncol, :hfield_adr, :hfield_data, :tex_type, :tex_height, :tex_width, :tex_adr, :tex_rgb, :mat_texid, :mat_texuniform, :mat_texrepeat, :mat_emission, :mat_specular, :mat_shininess, :mat_reflectance, :mat_rgba, :pair_dim, :pair_geom1, :pair_geom2, :pair_signature, :pair_solref, :pair_solreffriction, :pair_solimp, :pair_margin, :pair_gap, :pair_friction, :exclude_signature, :eq_type, :eq_obj1id, :eq_obj2id, :eq_active, :eq_solref, :eq_solimp, :eq_data, :tendon_adr, :tendon_num, :tendon_matid, :tendon_group, :tendon_limited, :tendon_width, :tendon_solref_lim, :tendon_solimp_lim, :tendon_solref_fri, :tendon_solimp_fri, :tendon_range, :tendon_margin, :tendon_stiffness, :tendon_damping, :tendon_frictionloss, :tendon_lengthspring, :tendon_length0, :tendon_invweight0, :tendon_user, :tendon_rgba, :wrap_type, :wrap_objid, :wrap_prm, :actuator_trntype, :actuator_dyntype, :actuator_gaintype, :actuator_biastype, :actuator_trnid, :actuator_actadr, :actuator_actnum, :actuator_group, :actuator_ctrllimited, :actuator_forcelimited, :actuator_actlimited, :actuator_dynprm, :actuator_gainprm, :actuator_biasprm, :actuator_ctrlrange, :actuator_forcerange, :actuator_actrange, :actuator_gear, :actuator_cranklength, :actuator_acc0, :actuator_length0, :actuator_lengthrange, :actuator_user, :actuator_plugin, :sensor_type, :sensor_datatype, :sensor_needstage, :sensor_objtype, :sensor_objid, :sensor_reftype, :sensor_refid, :sensor_dim, :sensor_adr, :sensor_cutoff, :sensor_noise, :sensor_user, :sensor_plugin, :plugin, :plugin_stateadr, :plugin_statenum, :plugin_attr, :plugin_attradr, :numeric_adr, :numeric_size, :numeric_data, :text_adr, :text_size, :text_data, :tuple_adr, :tuple_size, :tuple_objtype, :tuple_objid, :tuple_objprm, :key_time, :key_qpos, :key_qvel, :key_act, :key_mpos, :key_mquat, :key_ctrl, :name_bodyadr, :name_jntadr, :name_geomadr, :name_siteadr, :name_camadr, :name_lightadr, :name_meshadr, :name_skinadr, :name_hfieldadr, :name_texadr, :name_matadr, :name_pairadr, :name_excludeadr, :name_eqadr, :name_tendonadr, :name_actuatoradr, :name_sensoradr, :name_numericadr, :name_textadr, :name_tupleadr, :name_keyadr, :name_pluginadr, :names, :names_map)
end
function Base.getproperty(x::Model, f::Symbol)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && return internal_pointer
    f === :nq && return unsafe_load(Ptr{Int32}(internal_pointer + 0))
    f === :nv && return unsafe_load(Ptr{Int32}(internal_pointer + 4))
    f === :nu && return unsafe_load(Ptr{Int32}(internal_pointer + 8))
    f === :na && return unsafe_load(Ptr{Int32}(internal_pointer + 12))
    f === :nbody && return unsafe_load(Ptr{Int32}(internal_pointer + 16))
    f === :nbvh && return unsafe_load(Ptr{Int32}(internal_pointer + 20))
    f === :njnt && return unsafe_load(Ptr{Int32}(internal_pointer + 24))
    f === :ngeom && return unsafe_load(Ptr{Int32}(internal_pointer + 28))
    f === :nsite && return unsafe_load(Ptr{Int32}(internal_pointer + 32))
    f === :ncam && return unsafe_load(Ptr{Int32}(internal_pointer + 36))
    f === :nlight && return unsafe_load(Ptr{Int32}(internal_pointer + 40))
    f === :nmesh && return unsafe_load(Ptr{Int32}(internal_pointer + 44))
    f === :nmeshvert && return unsafe_load(Ptr{Int32}(internal_pointer + 48))
    f === :nmeshnormal && return unsafe_load(Ptr{Int32}(internal_pointer + 52))
    f === :nmeshtexcoord && return unsafe_load(Ptr{Int32}(internal_pointer + 56))
    f === :nmeshface && return unsafe_load(Ptr{Int32}(internal_pointer + 60))
    f === :nmeshgraph && return unsafe_load(Ptr{Int32}(internal_pointer + 64))
    f === :nskin && return unsafe_load(Ptr{Int32}(internal_pointer + 68))
    f === :nskinvert && return unsafe_load(Ptr{Int32}(internal_pointer + 72))
    f === :nskintexvert && return unsafe_load(Ptr{Int32}(internal_pointer + 76))
    f === :nskinface && return unsafe_load(Ptr{Int32}(internal_pointer + 80))
    f === :nskinbone && return unsafe_load(Ptr{Int32}(internal_pointer + 84))
    f === :nskinbonevert && return unsafe_load(Ptr{Int32}(internal_pointer + 88))
    f === :nhfield && return unsafe_load(Ptr{Int32}(internal_pointer + 92))
    f === :nhfielddata && return unsafe_load(Ptr{Int32}(internal_pointer + 96))
    f === :ntex && return unsafe_load(Ptr{Int32}(internal_pointer + 100))
    f === :ntexdata && return unsafe_load(Ptr{Int32}(internal_pointer + 104))
    f === :nmat && return unsafe_load(Ptr{Int32}(internal_pointer + 108))
    f === :npair && return unsafe_load(Ptr{Int32}(internal_pointer + 112))
    f === :nexclude && return unsafe_load(Ptr{Int32}(internal_pointer + 116))
    f === :neq && return unsafe_load(Ptr{Int32}(internal_pointer + 120))
    f === :ntendon && return unsafe_load(Ptr{Int32}(internal_pointer + 124))
    f === :nwrap && return unsafe_load(Ptr{Int32}(internal_pointer + 128))
    f === :nsensor && return unsafe_load(Ptr{Int32}(internal_pointer + 132))
    f === :nnumeric && return unsafe_load(Ptr{Int32}(internal_pointer + 136))
    f === :nnumericdata && return unsafe_load(Ptr{Int32}(internal_pointer + 140))
    f === :ntext && return unsafe_load(Ptr{Int32}(internal_pointer + 144))
    f === :ntextdata && return unsafe_load(Ptr{Int32}(internal_pointer + 148))
    f === :ntuple && return unsafe_load(Ptr{Int32}(internal_pointer + 152))
    f === :ntupledata && return unsafe_load(Ptr{Int32}(internal_pointer + 156))
    f === :nkey && return unsafe_load(Ptr{Int32}(internal_pointer + 160))
    f === :nmocap && return unsafe_load(Ptr{Int32}(internal_pointer + 164))
    f === :nplugin && return unsafe_load(Ptr{Int32}(internal_pointer + 168))
    f === :npluginattr && return unsafe_load(Ptr{Int32}(internal_pointer + 172))
    f === :nuser_body && return unsafe_load(Ptr{Int32}(internal_pointer + 176))
    f === :nuser_jnt && return unsafe_load(Ptr{Int32}(internal_pointer + 180))
    f === :nuser_geom && return unsafe_load(Ptr{Int32}(internal_pointer + 184))
    f === :nuser_site && return unsafe_load(Ptr{Int32}(internal_pointer + 188))
    f === :nuser_cam && return unsafe_load(Ptr{Int32}(internal_pointer + 192))
    f === :nuser_tendon && return unsafe_load(Ptr{Int32}(internal_pointer + 196))
    f === :nuser_actuator && return unsafe_load(Ptr{Int32}(internal_pointer + 200))
    f === :nuser_sensor && return unsafe_load(Ptr{Int32}(internal_pointer + 204))
    f === :nnames && return unsafe_load(Ptr{Int32}(internal_pointer + 208))
    f === :nnames_map && return unsafe_load(Ptr{Int32}(internal_pointer + 212))
    f === :nM && return unsafe_load(Ptr{Int32}(internal_pointer + 216))
    f === :nD && return unsafe_load(Ptr{Int32}(internal_pointer + 220))
    f === :nB && return unsafe_load(Ptr{Int32}(internal_pointer + 224))
    f === :nemax && return unsafe_load(Ptr{Int32}(internal_pointer + 228))
    f === :njmax && return unsafe_load(Ptr{Int32}(internal_pointer + 232))
    f === :nconmax && return unsafe_load(Ptr{Int32}(internal_pointer + 236))
    f === :nstack && return unsafe_load(Ptr{Int32}(internal_pointer + 240))
    f === :nuserdata && return unsafe_load(Ptr{Int32}(internal_pointer + 244))
    f === :nsensordata && return unsafe_load(Ptr{Int32}(internal_pointer + 248))
    f === :npluginstate && return unsafe_load(Ptr{Int32}(internal_pointer + 252))
    f === :nbuffer && return unsafe_load(Ptr{Int32}(internal_pointer + 256))
    f === :opt && return Options(Ptr{mjOption_}(internal_pointer + 260))
    f === :vis && return unsafe_load(Ptr{mjVisual_}(internal_pointer + 500))
    f === :stat && return Statistics(Ptr{mjStatistic_}(internal_pointer + 1068))
    f === :buffer && return (Ptr{Nothing})(internal_pointer + 1124)
    f === :qpos0 && return (Ptr{Float64})(internal_pointer + 1132)
    f === :qpos_spring && return (Ptr{Float64})(internal_pointer + 1140)
    f === :body_parentid && return (Ptr{Int32})(internal_pointer + 1148)
    f === :body_rootid && return (Ptr{Int32})(internal_pointer + 1156)
    f === :body_weldid && return (Ptr{Int32})(internal_pointer + 1164)
    f === :body_mocapid && return (Ptr{Int32})(internal_pointer + 1172)
    f === :body_jntnum && return (Ptr{Int32})(internal_pointer + 1180)
    f === :body_jntadr && return (Ptr{Int32})(internal_pointer + 1188)
    f === :body_dofnum && return (Ptr{Int32})(internal_pointer + 1196)
    f === :body_dofadr && return (Ptr{Int32})(internal_pointer + 1204)
    f === :body_geomnum && return (Ptr{Int32})(internal_pointer + 1212)
    f === :body_geomadr && return (Ptr{Int32})(internal_pointer + 1220)
    f === :body_simple && return (Ptr{UInt8})(internal_pointer + 1228)
    f === :body_sameframe && return (Ptr{UInt8})(internal_pointer + 1236)
    f === :body_pos && return (Ptr{Float64})(internal_pointer + 1244)
    f === :body_quat && return (Ptr{Float64})(internal_pointer + 1252)
    f === :body_ipos && return (Ptr{Float64})(internal_pointer + 1260)
    f === :body_iquat && return (Ptr{Float64})(internal_pointer + 1268)
    f === :body_mass && return (Ptr{Float64})(internal_pointer + 1276)
    f === :body_subtreemass && return (Ptr{Float64})(internal_pointer + 1284)
    f === :body_inertia && return (Ptr{Float64})(internal_pointer + 1292)
    f === :body_invweight0 && return (Ptr{Float64})(internal_pointer + 1300)
    f === :body_gravcomp && return (Ptr{Float64})(internal_pointer + 1308)
    f === :body_user && return (Ptr{Float64})(internal_pointer + 1316)
    f === :body_plugin && return (Ptr{Int32})(internal_pointer + 1324)
    f === :body_bvhadr && return (Ptr{Int32})(internal_pointer + 1332)
    f === :body_bvhnum && return (Ptr{Int32})(internal_pointer + 1340)
    f === :bvh_depth && return (Ptr{Int32})(internal_pointer + 1348)
    f === :bvh_child && return (Ptr{Int32})(internal_pointer + 1356)
    f === :bvh_geomid && return (Ptr{Int32})(internal_pointer + 1364)
    f === :bvh_aabb && return (Ptr{Float64})(internal_pointer + 1372)
    f === :jnt_type && return (Ptr{Int32})(internal_pointer + 1380)
    f === :jnt_qposadr && return (Ptr{Int32})(internal_pointer + 1388)
    f === :jnt_dofadr && return (Ptr{Int32})(internal_pointer + 1396)
    f === :jnt_bodyid && return (Ptr{Int32})(internal_pointer + 1404)
    f === :jnt_group && return (Ptr{Int32})(internal_pointer + 1412)
    f === :jnt_limited && return (Ptr{UInt8})(internal_pointer + 1420)
    f === :jnt_actfrclimited && return (Ptr{UInt8})(internal_pointer + 1428)
    f === :jnt_solref && return (Ptr{Float64})(internal_pointer + 1436)
    f === :jnt_solimp && return (Ptr{Float64})(internal_pointer + 1444)
    f === :jnt_pos && return (Ptr{Float64})(internal_pointer + 1452)
    f === :jnt_axis && return (Ptr{Float64})(internal_pointer + 1460)
    f === :jnt_stiffness && return (Ptr{Float64})(internal_pointer + 1468)
    f === :jnt_range && return (Ptr{Float64})(internal_pointer + 1476)
    f === :jnt_actfrcrange && return (Ptr{Float64})(internal_pointer + 1484)
    f === :jnt_margin && return (Ptr{Float64})(internal_pointer + 1492)
    f === :jnt_user && return (Ptr{Float64})(internal_pointer + 1500)
    f === :dof_bodyid && return (Ptr{Int32})(internal_pointer + 1508)
    f === :dof_jntid && return (Ptr{Int32})(internal_pointer + 1516)
    f === :dof_parentid && return (Ptr{Int32})(internal_pointer + 1524)
    f === :dof_Madr && return (Ptr{Int32})(internal_pointer + 1532)
    f === :dof_simplenum && return (Ptr{Int32})(internal_pointer + 1540)
    f === :dof_solref && return (Ptr{Float64})(internal_pointer + 1548)
    f === :dof_solimp && return (Ptr{Float64})(internal_pointer + 1556)
    f === :dof_frictionloss && return (Ptr{Float64})(internal_pointer + 1564)
    f === :dof_armature && return (Ptr{Float64})(internal_pointer + 1572)
    f === :dof_damping && return (Ptr{Float64})(internal_pointer + 1580)
    f === :dof_invweight0 && return (Ptr{Float64})(internal_pointer + 1588)
    f === :dof_M0 && return (Ptr{Float64})(internal_pointer + 1596)
    f === :geom_type && return (Ptr{Int32})(internal_pointer + 1604)
    f === :geom_contype && return (Ptr{Int32})(internal_pointer + 1612)
    f === :geom_conaffinity && return (Ptr{Int32})(internal_pointer + 1620)
    f === :geom_condim && return (Ptr{Int32})(internal_pointer + 1628)
    f === :geom_bodyid && return (Ptr{Int32})(internal_pointer + 1636)
    f === :geom_dataid && return (Ptr{Int32})(internal_pointer + 1644)
    f === :geom_matid && return (Ptr{Int32})(internal_pointer + 1652)
    f === :geom_group && return (Ptr{Int32})(internal_pointer + 1660)
    f === :geom_priority && return (Ptr{Int32})(internal_pointer + 1668)
    f === :geom_sameframe && return (Ptr{UInt8})(internal_pointer + 1676)
    f === :geom_solmix && return (Ptr{Float64})(internal_pointer + 1684)
    f === :geom_solref && return (Ptr{Float64})(internal_pointer + 1692)
    f === :geom_solimp && return (Ptr{Float64})(internal_pointer + 1700)
    f === :geom_size && return (Ptr{Float64})(internal_pointer + 1708)
    f === :geom_aabb && return (Ptr{Float64})(internal_pointer + 1716)
    f === :geom_rbound && return (Ptr{Float64})(internal_pointer + 1724)
    f === :geom_pos && return (Ptr{Float64})(internal_pointer + 1732)
    f === :geom_quat && return (Ptr{Float64})(internal_pointer + 1740)
    f === :geom_friction && return (Ptr{Float64})(internal_pointer + 1748)
    f === :geom_margin && return (Ptr{Float64})(internal_pointer + 1756)
    f === :geom_gap && return (Ptr{Float64})(internal_pointer + 1764)
    f === :geom_fluid && return (Ptr{Float64})(internal_pointer + 1772)
    f === :geom_user && return (Ptr{Float64})(internal_pointer + 1780)
    f === :geom_rgba && return (Ptr{Float32})(internal_pointer + 1788)
    f === :site_type && return (Ptr{Int32})(internal_pointer + 1796)
    f === :site_bodyid && return (Ptr{Int32})(internal_pointer + 1804)
    f === :site_matid && return (Ptr{Int32})(internal_pointer + 1812)
    f === :site_group && return (Ptr{Int32})(internal_pointer + 1820)
    f === :site_sameframe && return (Ptr{UInt8})(internal_pointer + 1828)
    f === :site_size && return (Ptr{Float64})(internal_pointer + 1836)
    f === :site_pos && return (Ptr{Float64})(internal_pointer + 1844)
    f === :site_quat && return (Ptr{Float64})(internal_pointer + 1852)
    f === :site_user && return (Ptr{Float64})(internal_pointer + 1860)
    f === :site_rgba && return (Ptr{Float32})(internal_pointer + 1868)
    f === :cam_mode && return (Ptr{Int32})(internal_pointer + 1876)
    f === :cam_bodyid && return (Ptr{Int32})(internal_pointer + 1884)
    f === :cam_targetbodyid && return (Ptr{Int32})(internal_pointer + 1892)
    f === :cam_pos && return (Ptr{Float64})(internal_pointer + 1900)
    f === :cam_quat && return (Ptr{Float64})(internal_pointer + 1908)
    f === :cam_poscom0 && return (Ptr{Float64})(internal_pointer + 1916)
    f === :cam_pos0 && return (Ptr{Float64})(internal_pointer + 1924)
    f === :cam_mat0 && return (Ptr{Float64})(internal_pointer + 1932)
    f === :cam_fovy && return (Ptr{Float64})(internal_pointer + 1940)
    f === :cam_ipd && return (Ptr{Float64})(internal_pointer + 1948)
    f === :cam_user && return (Ptr{Float64})(internal_pointer + 1956)
    f === :light_mode && return (Ptr{Int32})(internal_pointer + 1964)
    f === :light_bodyid && return (Ptr{Int32})(internal_pointer + 1972)
    f === :light_targetbodyid && return (Ptr{Int32})(internal_pointer + 1980)
    f === :light_directional && return (Ptr{UInt8})(internal_pointer + 1988)
    f === :light_castshadow && return (Ptr{UInt8})(internal_pointer + 1996)
    f === :light_active && return (Ptr{UInt8})(internal_pointer + 2004)
    f === :light_pos && return (Ptr{Float64})(internal_pointer + 2012)
    f === :light_dir && return (Ptr{Float64})(internal_pointer + 2020)
    f === :light_poscom0 && return (Ptr{Float64})(internal_pointer + 2028)
    f === :light_pos0 && return (Ptr{Float64})(internal_pointer + 2036)
    f === :light_dir0 && return (Ptr{Float64})(internal_pointer + 2044)
    f === :light_attenuation && return (Ptr{Float32})(internal_pointer + 2052)
    f === :light_cutoff && return (Ptr{Float32})(internal_pointer + 2060)
    f === :light_exponent && return (Ptr{Float32})(internal_pointer + 2068)
    f === :light_ambient && return (Ptr{Float32})(internal_pointer + 2076)
    f === :light_diffuse && return (Ptr{Float32})(internal_pointer + 2084)
    f === :light_specular && return (Ptr{Float32})(internal_pointer + 2092)
    f === :mesh_vertadr && return (Ptr{Int32})(internal_pointer + 2100)
    f === :mesh_vertnum && return (Ptr{Int32})(internal_pointer + 2108)
    f === :mesh_faceadr && return (Ptr{Int32})(internal_pointer + 2116)
    f === :mesh_facenum && return (Ptr{Int32})(internal_pointer + 2124)
    f === :mesh_bvhadr && return (Ptr{Int32})(internal_pointer + 2132)
    f === :mesh_bvhnum && return (Ptr{Int32})(internal_pointer + 2140)
    f === :mesh_normaladr && return (Ptr{Int32})(internal_pointer + 2148)
    f === :mesh_normalnum && return (Ptr{Int32})(internal_pointer + 2156)
    f === :mesh_texcoordadr && return (Ptr{Int32})(internal_pointer + 2164)
    f === :mesh_texcoordnum && return (Ptr{Int32})(internal_pointer + 2172)
    f === :mesh_graphadr && return (Ptr{Int32})(internal_pointer + 2180)
    f === :mesh_vert && return (Ptr{Float32})(internal_pointer + 2188)
    f === :mesh_normal && return (Ptr{Float32})(internal_pointer + 2196)
    f === :mesh_texcoord && return (Ptr{Float32})(internal_pointer + 2204)
    f === :mesh_face && return (Ptr{Int32})(internal_pointer + 2212)
    f === :mesh_facenormal && return (Ptr{Int32})(internal_pointer + 2220)
    f === :mesh_facetexcoord && return (Ptr{Int32})(internal_pointer + 2228)
    f === :mesh_graph && return (Ptr{Int32})(internal_pointer + 2236)
    f === :skin_matid && return (Ptr{Int32})(internal_pointer + 2244)
    f === :skin_group && return (Ptr{Int32})(internal_pointer + 2252)
    f === :skin_rgba && return (Ptr{Float32})(internal_pointer + 2260)
    f === :skin_inflate && return (Ptr{Float32})(internal_pointer + 2268)
    f === :skin_vertadr && return (Ptr{Int32})(internal_pointer + 2276)
    f === :skin_vertnum && return (Ptr{Int32})(internal_pointer + 2284)
    f === :skin_texcoordadr && return (Ptr{Int32})(internal_pointer + 2292)
    f === :skin_faceadr && return (Ptr{Int32})(internal_pointer + 2300)
    f === :skin_facenum && return (Ptr{Int32})(internal_pointer + 2308)
    f === :skin_boneadr && return (Ptr{Int32})(internal_pointer + 2316)
    f === :skin_bonenum && return (Ptr{Int32})(internal_pointer + 2324)
    f === :skin_vert && return (Ptr{Float32})(internal_pointer + 2332)
    f === :skin_texcoord && return (Ptr{Float32})(internal_pointer + 2340)
    f === :skin_face && return (Ptr{Int32})(internal_pointer + 2348)
    f === :skin_bonevertadr && return (Ptr{Int32})(internal_pointer + 2356)
    f === :skin_bonevertnum && return (Ptr{Int32})(internal_pointer + 2364)
    f === :skin_bonebindpos && return (Ptr{Float32})(internal_pointer + 2372)
    f === :skin_bonebindquat && return (Ptr{Float32})(internal_pointer + 2380)
    f === :skin_bonebodyid && return (Ptr{Int32})(internal_pointer + 2388)
    f === :skin_bonevertid && return (Ptr{Int32})(internal_pointer + 2396)
    f === :skin_bonevertweight && return (Ptr{Float32})(internal_pointer + 2404)
    f === :hfield_size && return (Ptr{Float64})(internal_pointer + 2412)
    f === :hfield_nrow && return (Ptr{Int32})(internal_pointer + 2420)
    f === :hfield_ncol && return (Ptr{Int32})(internal_pointer + 2428)
    f === :hfield_adr && return (Ptr{Int32})(internal_pointer + 2436)
    f === :hfield_data && return (Ptr{Float32})(internal_pointer + 2444)
    f === :tex_type && return (Ptr{Int32})(internal_pointer + 2452)
    f === :tex_height && return (Ptr{Int32})(internal_pointer + 2460)
    f === :tex_width && return (Ptr{Int32})(internal_pointer + 2468)
    f === :tex_adr && return (Ptr{Int32})(internal_pointer + 2476)
    f === :tex_rgb && return (Ptr{UInt8})(internal_pointer + 2484)
    f === :mat_texid && return (Ptr{Int32})(internal_pointer + 2492)
    f === :mat_texuniform && return (Ptr{UInt8})(internal_pointer + 2500)
    f === :mat_texrepeat && return (Ptr{Float32})(internal_pointer + 2508)
    f === :mat_emission && return (Ptr{Float32})(internal_pointer + 2516)
    f === :mat_specular && return (Ptr{Float32})(internal_pointer + 2524)
    f === :mat_shininess && return (Ptr{Float32})(internal_pointer + 2532)
    f === :mat_reflectance && return (Ptr{Float32})(internal_pointer + 2540)
    f === :mat_rgba && return (Ptr{Float32})(internal_pointer + 2548)
    f === :pair_dim && return (Ptr{Int32})(internal_pointer + 2556)
    f === :pair_geom1 && return (Ptr{Int32})(internal_pointer + 2564)
    f === :pair_geom2 && return (Ptr{Int32})(internal_pointer + 2572)
    f === :pair_signature && return (Ptr{Int32})(internal_pointer + 2580)
    f === :pair_solref && return (Ptr{Float64})(internal_pointer + 2588)
    f === :pair_solreffriction && return (Ptr{Float64})(internal_pointer + 2596)
    f === :pair_solimp && return (Ptr{Float64})(internal_pointer + 2604)
    f === :pair_margin && return (Ptr{Float64})(internal_pointer + 2612)
    f === :pair_gap && return (Ptr{Float64})(internal_pointer + 2620)
    f === :pair_friction && return (Ptr{Float64})(internal_pointer + 2628)
    f === :exclude_signature && return (Ptr{Int32})(internal_pointer + 2636)
    f === :eq_type && return (Ptr{Int32})(internal_pointer + 2644)
    f === :eq_obj1id && return (Ptr{Int32})(internal_pointer + 2652)
    f === :eq_obj2id && return (Ptr{Int32})(internal_pointer + 2660)
    f === :eq_active && return (Ptr{UInt8})(internal_pointer + 2668)
    f === :eq_solref && return (Ptr{Float64})(internal_pointer + 2676)
    f === :eq_solimp && return (Ptr{Float64})(internal_pointer + 2684)
    f === :eq_data && return (Ptr{Float64})(internal_pointer + 2692)
    f === :tendon_adr && return (Ptr{Int32})(internal_pointer + 2700)
    f === :tendon_num && return (Ptr{Int32})(internal_pointer + 2708)
    f === :tendon_matid && return (Ptr{Int32})(internal_pointer + 2716)
    f === :tendon_group && return (Ptr{Int32})(internal_pointer + 2724)
    f === :tendon_limited && return (Ptr{UInt8})(internal_pointer + 2732)
    f === :tendon_width && return (Ptr{Float64})(internal_pointer + 2740)
    f === :tendon_solref_lim && return (Ptr{Float64})(internal_pointer + 2748)
    f === :tendon_solimp_lim && return (Ptr{Float64})(internal_pointer + 2756)
    f === :tendon_solref_fri && return (Ptr{Float64})(internal_pointer + 2764)
    f === :tendon_solimp_fri && return (Ptr{Float64})(internal_pointer + 2772)
    f === :tendon_range && return (Ptr{Float64})(internal_pointer + 2780)
    f === :tendon_margin && return (Ptr{Float64})(internal_pointer + 2788)
    f === :tendon_stiffness && return (Ptr{Float64})(internal_pointer + 2796)
    f === :tendon_damping && return (Ptr{Float64})(internal_pointer + 2804)
    f === :tendon_frictionloss && return (Ptr{Float64})(internal_pointer + 2812)
    f === :tendon_lengthspring && return (Ptr{Float64})(internal_pointer + 2820)
    f === :tendon_length0 && return (Ptr{Float64})(internal_pointer + 2828)
    f === :tendon_invweight0 && return (Ptr{Float64})(internal_pointer + 2836)
    f === :tendon_user && return (Ptr{Float64})(internal_pointer + 2844)
    f === :tendon_rgba && return (Ptr{Float32})(internal_pointer + 2852)
    f === :wrap_type && return (Ptr{Int32})(internal_pointer + 2860)
    f === :wrap_objid && return (Ptr{Int32})(internal_pointer + 2868)
    f === :wrap_prm && return (Ptr{Float64})(internal_pointer + 2876)
    f === :actuator_trntype && return (Ptr{Int32})(internal_pointer + 2884)
    f === :actuator_dyntype && return (Ptr{Int32})(internal_pointer + 2892)
    f === :actuator_gaintype && return (Ptr{Int32})(internal_pointer + 2900)
    f === :actuator_biastype && return (Ptr{Int32})(internal_pointer + 2908)
    f === :actuator_trnid && return (Ptr{Int32})(internal_pointer + 2916)
    f === :actuator_actadr && return (Ptr{Int32})(internal_pointer + 2924)
    f === :actuator_actnum && return (Ptr{Int32})(internal_pointer + 2932)
    f === :actuator_group && return (Ptr{Int32})(internal_pointer + 2940)
    f === :actuator_ctrllimited && return (Ptr{UInt8})(internal_pointer + 2948)
    f === :actuator_forcelimited && return (Ptr{UInt8})(internal_pointer + 2956)
    f === :actuator_actlimited && return (Ptr{UInt8})(internal_pointer + 2964)
    f === :actuator_dynprm && return (Ptr{Float64})(internal_pointer + 2972)
    f === :actuator_gainprm && return (Ptr{Float64})(internal_pointer + 2980)
    f === :actuator_biasprm && return (Ptr{Float64})(internal_pointer + 2988)
    f === :actuator_ctrlrange && return (Ptr{Float64})(internal_pointer + 2996)
    f === :actuator_forcerange && return (Ptr{Float64})(internal_pointer + 3004)
    f === :actuator_actrange && return (Ptr{Float64})(internal_pointer + 3012)
    f === :actuator_gear && return (Ptr{Float64})(internal_pointer + 3020)
    f === :actuator_cranklength && return (Ptr{Float64})(internal_pointer + 3028)
    f === :actuator_acc0 && return (Ptr{Float64})(internal_pointer + 3036)
    f === :actuator_length0 && return (Ptr{Float64})(internal_pointer + 3044)
    f === :actuator_lengthrange && return (Ptr{Float64})(internal_pointer + 3052)
    f === :actuator_user && return (Ptr{Float64})(internal_pointer + 3060)
    f === :actuator_plugin && return (Ptr{Int32})(internal_pointer + 3068)
    f === :sensor_type && return (Ptr{Int32})(internal_pointer + 3076)
    f === :sensor_datatype && return (Ptr{Int32})(internal_pointer + 3084)
    f === :sensor_needstage && return (Ptr{Int32})(internal_pointer + 3092)
    f === :sensor_objtype && return (Ptr{Int32})(internal_pointer + 3100)
    f === :sensor_objid && return (Ptr{Int32})(internal_pointer + 3108)
    f === :sensor_reftype && return (Ptr{Int32})(internal_pointer + 3116)
    f === :sensor_refid && return (Ptr{Int32})(internal_pointer + 3124)
    f === :sensor_dim && return (Ptr{Int32})(internal_pointer + 3132)
    f === :sensor_adr && return (Ptr{Int32})(internal_pointer + 3140)
    f === :sensor_cutoff && return (Ptr{Float64})(internal_pointer + 3148)
    f === :sensor_noise && return (Ptr{Float64})(internal_pointer + 3156)
    f === :sensor_user && return (Ptr{Float64})(internal_pointer + 3164)
    f === :sensor_plugin && return (Ptr{Int32})(internal_pointer + 3172)
    f === :plugin && return (Ptr{Int32})(internal_pointer + 3180)
    f === :plugin_stateadr && return (Ptr{Int32})(internal_pointer + 3188)
    f === :plugin_statenum && return (Ptr{Int32})(internal_pointer + 3196)
    f === :plugin_attr && return (Ptr{Int8})(internal_pointer + 3204)
    f === :plugin_attradr && return (Ptr{Int32})(internal_pointer + 3212)
    f === :numeric_adr && return (Ptr{Int32})(internal_pointer + 3220)
    f === :numeric_size && return (Ptr{Int32})(internal_pointer + 3228)
    f === :numeric_data && return (Ptr{Float64})(internal_pointer + 3236)
    f === :text_adr && return (Ptr{Int32})(internal_pointer + 3244)
    f === :text_size && return (Ptr{Int32})(internal_pointer + 3252)
    f === :text_data && return (Ptr{Int8})(internal_pointer + 3260)
    f === :tuple_adr && return (Ptr{Int32})(internal_pointer + 3268)
    f === :tuple_size && return (Ptr{Int32})(internal_pointer + 3276)
    f === :tuple_objtype && return (Ptr{Int32})(internal_pointer + 3284)
    f === :tuple_objid && return (Ptr{Int32})(internal_pointer + 3292)
    f === :tuple_objprm && return (Ptr{Float64})(internal_pointer + 3300)
    f === :key_time && return (Ptr{Float64})(internal_pointer + 3308)
    f === :key_qpos && return (Ptr{Float64})(internal_pointer + 3316)
    f === :key_qvel && return (Ptr{Float64})(internal_pointer + 3324)
    f === :key_act && return (Ptr{Float64})(internal_pointer + 3332)
    f === :key_mpos && return (Ptr{Float64})(internal_pointer + 3340)
    f === :key_mquat && return (Ptr{Float64})(internal_pointer + 3348)
    f === :key_ctrl && return (Ptr{Float64})(internal_pointer + 3356)
    f === :name_bodyadr && return (Ptr{Int32})(internal_pointer + 3364)
    f === :name_jntadr && return (Ptr{Int32})(internal_pointer + 3372)
    f === :name_geomadr && return (Ptr{Int32})(internal_pointer + 3380)
    f === :name_siteadr && return (Ptr{Int32})(internal_pointer + 3388)
    f === :name_camadr && return (Ptr{Int32})(internal_pointer + 3396)
    f === :name_lightadr && return (Ptr{Int32})(internal_pointer + 3404)
    f === :name_meshadr && return (Ptr{Int32})(internal_pointer + 3412)
    f === :name_skinadr && return (Ptr{Int32})(internal_pointer + 3420)
    f === :name_hfieldadr && return (Ptr{Int32})(internal_pointer + 3428)
    f === :name_texadr && return (Ptr{Int32})(internal_pointer + 3436)
    f === :name_matadr && return (Ptr{Int32})(internal_pointer + 3444)
    f === :name_pairadr && return (Ptr{Int32})(internal_pointer + 3452)
    f === :name_excludeadr && return (Ptr{Int32})(internal_pointer + 3460)
    f === :name_eqadr && return (Ptr{Int32})(internal_pointer + 3468)
    f === :name_tendonadr && return (Ptr{Int32})(internal_pointer + 3476)
    f === :name_actuatoradr && return (Ptr{Int32})(internal_pointer + 3484)
    f === :name_sensoradr && return (Ptr{Int32})(internal_pointer + 3492)
    f === :name_numericadr && return (Ptr{Int32})(internal_pointer + 3500)
    f === :name_textadr && return (Ptr{Int32})(internal_pointer + 3508)
    f === :name_tupleadr && return (Ptr{Int32})(internal_pointer + 3516)
    f === :name_keyadr && return (Ptr{Int32})(internal_pointer + 3524)
    f === :name_pluginadr && return (Ptr{Int32})(internal_pointer + 3532)
    f === :names && return (Ptr{Int8})(internal_pointer + 3540)
    f === :names_map && return (Ptr{Int32})(internal_pointer + 3548)
    error("Could not find property $(f)")
end
function Base.setproperty!(x::Model, f::Symbol, value)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && error("Cannot set the internal pointer, create a new struct instead.")
    if f === :nq
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 0), cvalue)
        return cvalue
    end
    if f === :nv
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 4), cvalue)
        return cvalue
    end
    if f === :nu
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 8), cvalue)
        return cvalue
    end
    if f === :na
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 12), cvalue)
        return cvalue
    end
    if f === :nbody
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 16), cvalue)
        return cvalue
    end
    if f === :nbvh
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 20), cvalue)
        return cvalue
    end
    if f === :njnt
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 24), cvalue)
        return cvalue
    end
    if f === :ngeom
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 28), cvalue)
        return cvalue
    end
    if f === :nsite
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 32), cvalue)
        return cvalue
    end
    if f === :ncam
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 36), cvalue)
        return cvalue
    end
    if f === :nlight
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 40), cvalue)
        return cvalue
    end
    if f === :nmesh
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 44), cvalue)
        return cvalue
    end
    if f === :nmeshvert
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 48), cvalue)
        return cvalue
    end
    if f === :nmeshnormal
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 52), cvalue)
        return cvalue
    end
    if f === :nmeshtexcoord
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 56), cvalue)
        return cvalue
    end
    if f === :nmeshface
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 60), cvalue)
        return cvalue
    end
    if f === :nmeshgraph
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 64), cvalue)
        return cvalue
    end
    if f === :nskin
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 68), cvalue)
        return cvalue
    end
    if f === :nskinvert
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 72), cvalue)
        return cvalue
    end
    if f === :nskintexvert
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 76), cvalue)
        return cvalue
    end
    if f === :nskinface
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 80), cvalue)
        return cvalue
    end
    if f === :nskinbone
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 84), cvalue)
        return cvalue
    end
    if f === :nskinbonevert
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 88), cvalue)
        return cvalue
    end
    if f === :nhfield
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 92), cvalue)
        return cvalue
    end
    if f === :nhfielddata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 96), cvalue)
        return cvalue
    end
    if f === :ntex
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 100), cvalue)
        return cvalue
    end
    if f === :ntexdata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 104), cvalue)
        return cvalue
    end
    if f === :nmat
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 108), cvalue)
        return cvalue
    end
    if f === :npair
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 112), cvalue)
        return cvalue
    end
    if f === :nexclude
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 116), cvalue)
        return cvalue
    end
    if f === :neq
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 120), cvalue)
        return cvalue
    end
    if f === :ntendon
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 124), cvalue)
        return cvalue
    end
    if f === :nwrap
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 128), cvalue)
        return cvalue
    end
    if f === :nsensor
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 132), cvalue)
        return cvalue
    end
    if f === :nnumeric
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 136), cvalue)
        return cvalue
    end
    if f === :nnumericdata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 140), cvalue)
        return cvalue
    end
    if f === :ntext
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 144), cvalue)
        return cvalue
    end
    if f === :ntextdata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 148), cvalue)
        return cvalue
    end
    if f === :ntuple
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 152), cvalue)
        return cvalue
    end
    if f === :ntupledata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 156), cvalue)
        return cvalue
    end
    if f === :nkey
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 160), cvalue)
        return cvalue
    end
    if f === :nmocap
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 164), cvalue)
        return cvalue
    end
    if f === :nplugin
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 168), cvalue)
        return cvalue
    end
    if f === :npluginattr
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 172), cvalue)
        return cvalue
    end
    if f === :nuser_body
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 176), cvalue)
        return cvalue
    end
    if f === :nuser_jnt
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 180), cvalue)
        return cvalue
    end
    if f === :nuser_geom
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 184), cvalue)
        return cvalue
    end
    if f === :nuser_site
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 188), cvalue)
        return cvalue
    end
    if f === :nuser_cam
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 192), cvalue)
        return cvalue
    end
    if f === :nuser_tendon
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 196), cvalue)
        return cvalue
    end
    if f === :nuser_actuator
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 200), cvalue)
        return cvalue
    end
    if f === :nuser_sensor
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 204), cvalue)
        return cvalue
    end
    if f === :nnames
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 208), cvalue)
        return cvalue
    end
    if f === :nnames_map
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 212), cvalue)
        return cvalue
    end
    if f === :nM
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 216), cvalue)
        return cvalue
    end
    if f === :nD
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 220), cvalue)
        return cvalue
    end
    if f === :nB
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 224), cvalue)
        return cvalue
    end
    if f === :nemax
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 228), cvalue)
        return cvalue
    end
    if f === :njmax
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 232), cvalue)
        return cvalue
    end
    if f === :nconmax
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 236), cvalue)
        return cvalue
    end
    if f === :nstack
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 240), cvalue)
        return cvalue
    end
    if f === :nuserdata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 244), cvalue)
        return cvalue
    end
    if f === :nsensordata
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 248), cvalue)
        return cvalue
    end
    if f === :npluginstate
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 252), cvalue)
        return cvalue
    end
    if f === :nbuffer
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 256), cvalue)
        return cvalue
    end
    if f === :opt
        cvalue = convert(mjOption_, value)
        unsafe_store!(Ptr{mjOption_}(internal_pointer + 260), cvalue)
        return cvalue
    end
    if f === :vis
        cvalue = convert(mjVisual_, value)
        unsafe_store!(Ptr{mjVisual_}(internal_pointer + 500), cvalue)
        return cvalue
    end
    if f === :stat
        cvalue = convert(mjStatistic_, value)
        unsafe_store!(Ptr{mjStatistic_}(internal_pointer + 1068), cvalue)
        return cvalue
    end
    if f in (:buffer, :qpos0, :qpos_spring, :body_parentid, :body_rootid, :body_weldid, :body_mocapid, :body_jntnum, :body_jntadr, :body_dofnum, :body_dofadr, :body_geomnum, :body_geomadr, :body_simple, :body_sameframe, :body_pos, :body_quat, :body_ipos, :body_iquat, :body_mass, :body_subtreemass, :body_inertia, :body_invweight0, :body_gravcomp, :body_user, :body_plugin, :body_bvhadr, :body_bvhnum, :bvh_depth, :bvh_child, :bvh_geomid, :bvh_aabb, :jnt_type, :jnt_qposadr, :jnt_dofadr, :jnt_bodyid, :jnt_group, :jnt_limited, :jnt_actfrclimited, :jnt_solref, :jnt_solimp, :jnt_pos, :jnt_axis, :jnt_stiffness, :jnt_range, :jnt_actfrcrange, :jnt_margin, :jnt_user, :dof_bodyid, :dof_jntid, :dof_parentid, :dof_Madr, :dof_simplenum, :dof_solref, :dof_solimp, :dof_frictionloss, :dof_armature, :dof_damping, :dof_invweight0, :dof_M0, :geom_type, :geom_contype, :geom_conaffinity, :geom_condim, :geom_bodyid, :geom_dataid, :geom_matid, :geom_group, :geom_priority, :geom_sameframe, :geom_solmix, :geom_solref, :geom_solimp, :geom_size, :geom_aabb, :geom_rbound, :geom_pos, :geom_quat, :geom_friction, :geom_margin, :geom_gap, :geom_fluid, :geom_user, :geom_rgba, :site_type, :site_bodyid, :site_matid, :site_group, :site_sameframe, :site_size, :site_pos, :site_quat, :site_user, :site_rgba, :cam_mode, :cam_bodyid, :cam_targetbodyid, :cam_pos, :cam_quat, :cam_poscom0, :cam_pos0, :cam_mat0, :cam_fovy, :cam_ipd, :cam_user, :light_mode, :light_bodyid, :light_targetbodyid, :light_directional, :light_castshadow, :light_active, :light_pos, :light_dir, :light_poscom0, :light_pos0, :light_dir0, :light_attenuation, :light_cutoff, :light_exponent, :light_ambient, :light_diffuse, :light_specular, :mesh_vertadr, :mesh_vertnum, :mesh_faceadr, :mesh_facenum, :mesh_bvhadr, :mesh_bvhnum, :mesh_normaladr, :mesh_normalnum, :mesh_texcoordadr, :mesh_texcoordnum, :mesh_graphadr, :mesh_vert, :mesh_normal, :mesh_texcoord, :mesh_face, :mesh_facenormal, :mesh_facetexcoord, :mesh_graph, :skin_matid, :skin_group, :skin_rgba, :skin_inflate, :skin_vertadr, :skin_vertnum, :skin_texcoordadr, :skin_faceadr, :skin_facenum, :skin_boneadr, :skin_bonenum, :skin_vert, :skin_texcoord, :skin_face, :skin_bonevertadr, :skin_bonevertnum, :skin_bonebindpos, :skin_bonebindquat, :skin_bonebodyid, :skin_bonevertid, :skin_bonevertweight, :hfield_size, :hfield_nrow, :hfield_ncol, :hfield_adr, :hfield_data, :tex_type, :tex_height, :tex_width, :tex_adr, :tex_rgb, :mat_texid, :mat_texuniform, :mat_texrepeat, :mat_emission, :mat_specular, :mat_shininess, :mat_reflectance, :mat_rgba, :pair_dim, :pair_geom1, :pair_geom2, :pair_signature, :pair_solref, :pair_solreffriction, :pair_solimp, :pair_margin, :pair_gap, :pair_friction, :exclude_signature, :eq_type, :eq_obj1id, :eq_obj2id, :eq_active, :eq_solref, :eq_solimp, :eq_data, :tendon_adr, :tendon_num, :tendon_matid, :tendon_group, :tendon_limited, :tendon_width, :tendon_solref_lim, :tendon_solimp_lim, :tendon_solref_fri, :tendon_solimp_fri, :tendon_range, :tendon_margin, :tendon_stiffness, :tendon_damping, :tendon_frictionloss, :tendon_lengthspring, :tendon_length0, :tendon_invweight0, :tendon_user, :tendon_rgba, :wrap_type, :wrap_objid, :wrap_prm, :actuator_trntype, :actuator_dyntype, :actuator_gaintype, :actuator_biastype, :actuator_trnid, :actuator_actadr, :actuator_actnum, :actuator_group, :actuator_ctrllimited, :actuator_forcelimited, :actuator_actlimited, :actuator_dynprm, :actuator_gainprm, :actuator_biasprm, :actuator_ctrlrange, :actuator_forcerange, :actuator_actrange, :actuator_gear, :actuator_cranklength, :actuator_acc0, :actuator_length0, :actuator_lengthrange, :actuator_user, :actuator_plugin, :sensor_type, :sensor_datatype, :sensor_needstage, :sensor_objtype, :sensor_objid, :sensor_reftype, :sensor_refid, :sensor_dim, :sensor_adr, :sensor_cutoff, :sensor_noise, :sensor_user, :sensor_plugin, :plugin, :plugin_stateadr, :plugin_statenum, :plugin_attr, :plugin_attradr, :numeric_adr, :numeric_size, :numeric_data, :text_adr, :text_size, :text_data, :tuple_adr, :tuple_size, :tuple_objtype, :tuple_objid, :tuple_objprm, :key_time, :key_qpos, :key_qvel, :key_act, :key_mpos, :key_mquat, :key_ctrl, :name_bodyadr, :name_jntadr, :name_geomadr, :name_siteadr, :name_camadr, :name_lightadr, :name_meshadr, :name_skinadr, :name_hfieldadr, :name_texadr, :name_matadr, :name_pairadr, :name_excludeadr, :name_eqadr, :name_tendonadr, :name_actuatoradr, :name_sensoradr, :name_numericadr, :name_textadr, :name_tupleadr, :name_keyadr, :name_pluginadr, :names, :names_map)
        error("Cannot overwrite a pointer field.")
    end
    error("Could not find property $(f) to set.")
end
function Base.propertynames(x::Data)
    (:nstack, :nbuffer, :nplugin, :pstack, :parena, :maxuse_stack, :maxuse_arena, :maxuse_con, :maxuse_efc, :warning, :timer, :solver, :solver_iter, :solver_nnz, :solver_fwdinv, :nbodypair_broad, :nbodypair_narrow, :ngeompair_mid, :ngeompair_narrow, :ne, :nf, :nefc, :nnzJ, :ncon, :time, :energy, :buffer, :arena, :qpos, :qvel, :act, :qacc_warmstart, :plugin_state, :ctrl, :qfrc_applied, :xfrc_applied, :mocap_pos, :mocap_quat, :qacc, :act_dot, :userdata, :sensordata, :plugin, :plugin_data, :xpos, :xquat, :xmat, :xipos, :ximat, :xanchor, :xaxis, :geom_xpos, :geom_xmat, :site_xpos, :site_xmat, :cam_xpos, :cam_xmat, :light_xpos, :light_xdir, :subtree_com, :cdof, :cinert, :ten_wrapadr, :ten_wrapnum, :ten_J_rownnz, :ten_J_rowadr, :ten_J_colind, :ten_length, :ten_J, :wrap_obj, :wrap_xpos, :actuator_length, :actuator_moment, :crb, :qM, :qLD, :qLDiagInv, :qLDiagSqrtInv, :bvh_active, :ten_velocity, :actuator_velocity, :cvel, :cdof_dot, :qfrc_bias, :qfrc_passive, :efc_vel, :efc_aref, :subtree_linvel, :subtree_angmom, :qH, :qHDiagInv, :D_rownnz, :D_rowadr, :D_colind, :B_rownnz, :B_rowadr, :B_colind, :qDeriv, :qLU, :actuator_force, :qfrc_actuator, :qfrc_smooth, :qacc_smooth, :qfrc_constraint, :qfrc_inverse, :cacc, :cfrc_int, :cfrc_ext, :contact, :efc_type, :efc_id, :efc_J_rownnz, :efc_J_rowadr, :efc_J_rowsuper, :efc_J_colind, :efc_JT_rownnz, :efc_JT_rowadr, :efc_JT_rowsuper, :efc_JT_colind, :efc_J, :efc_JT, :efc_pos, :efc_margin, :efc_frictionloss, :efc_diagApprox, :efc_KBIP, :efc_D, :efc_R, :efc_b, :efc_force, :efc_state, :efc_AR_rownnz, :efc_AR_rowadr, :efc_AR_colind, :efc_AR)
end
function Base.getproperty(x::Data, f::Symbol)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && return internal_pointer
    f === :nstack && return unsafe_load(Ptr{Int32}(internal_pointer + 0))
    f === :nbuffer && return unsafe_load(Ptr{Int32}(internal_pointer + 4))
    f === :nplugin && return unsafe_load(Ptr{Int32}(internal_pointer + 8))
    f === :pstack && return unsafe_load(Ptr{UInt64}(internal_pointer + 12))
    f === :parena && return unsafe_load(Ptr{UInt64}(internal_pointer + 20))
    f === :maxuse_stack && return unsafe_load(Ptr{Int32}(internal_pointer + 28))
    f === :maxuse_arena && return unsafe_load(Ptr{UInt64}(internal_pointer + 32))
    f === :maxuse_con && return unsafe_load(Ptr{Int32}(internal_pointer + 40))
    f === :maxuse_efc && return unsafe_load(Ptr{Int32}(internal_pointer + 44))
    f === :warning && return UnsafeArray(Ptr{mjWarningStat_}(internal_pointer + 48), (8,))
    f === :timer && return UnsafeArray(Ptr{mjTimerStat_}(internal_pointer + 112), (13,))
    f === :solver && return UnsafeArray(Ptr{mjSolverStat_}(internal_pointer + 320), (1000,))
    f === :solver_iter && return unsafe_load(Ptr{Int32}(internal_pointer + 40320))
    f === :solver_nnz && return unsafe_load(Ptr{Int32}(internal_pointer + 40324))
    f === :solver_fwdinv && return UnsafeArray(Ptr{Float64}(internal_pointer + 40328), (2,))
    f === :nbodypair_broad && return unsafe_load(Ptr{Int32}(internal_pointer + 40344))
    f === :nbodypair_narrow && return unsafe_load(Ptr{Int32}(internal_pointer + 40348))
    f === :ngeompair_mid && return unsafe_load(Ptr{Int32}(internal_pointer + 40352))
    f === :ngeompair_narrow && return unsafe_load(Ptr{Int32}(internal_pointer + 40356))
    f === :ne && return unsafe_load(Ptr{Int32}(internal_pointer + 40360))
    f === :nf && return unsafe_load(Ptr{Int32}(internal_pointer + 40364))
    f === :nefc && return unsafe_load(Ptr{Int32}(internal_pointer + 40368))
    f === :nnzJ && return unsafe_load(Ptr{Int32}(internal_pointer + 40372))
    f === :ncon && return unsafe_load(Ptr{Int32}(internal_pointer + 40376))
    f === :time && return unsafe_load(Ptr{Float64}(internal_pointer + 40380))
    f === :energy && return UnsafeArray(Ptr{Float64}(internal_pointer + 40388), (2,))
    f === :buffer && return (Ptr{Nothing})(internal_pointer + 40404)
    f === :arena && return (Ptr{Nothing})(internal_pointer + 40412)
    f === :qpos && return (Ptr{Float64})(internal_pointer + 40420)
    f === :qvel && return (Ptr{Float64})(internal_pointer + 40428)
    f === :act && return (Ptr{Float64})(internal_pointer + 40436)
    f === :qacc_warmstart && return (Ptr{Float64})(internal_pointer + 40444)
    f === :plugin_state && return (Ptr{Float64})(internal_pointer + 40452)
    f === :ctrl && return (Ptr{Float64})(internal_pointer + 40460)
    f === :qfrc_applied && return (Ptr{Float64})(internal_pointer + 40468)
    f === :xfrc_applied && return (Ptr{Float64})(internal_pointer + 40476)
    f === :mocap_pos && return (Ptr{Float64})(internal_pointer + 40484)
    f === :mocap_quat && return (Ptr{Float64})(internal_pointer + 40492)
    f === :qacc && return (Ptr{Float64})(internal_pointer + 40500)
    f === :act_dot && return (Ptr{Float64})(internal_pointer + 40508)
    f === :userdata && return (Ptr{Float64})(internal_pointer + 40516)
    f === :sensordata && return (Ptr{Float64})(internal_pointer + 40524)
    f === :plugin && return (Ptr{Int32})(internal_pointer + 40532)
    f === :plugin_data && return (Ptr{UInt64})(internal_pointer + 40540)
    f === :xpos && return (Ptr{Float64})(internal_pointer + 40548)
    f === :xquat && return (Ptr{Float64})(internal_pointer + 40556)
    f === :xmat && return (Ptr{Float64})(internal_pointer + 40564)
    f === :xipos && return (Ptr{Float64})(internal_pointer + 40572)
    f === :ximat && return (Ptr{Float64})(internal_pointer + 40580)
    f === :xanchor && return (Ptr{Float64})(internal_pointer + 40588)
    f === :xaxis && return (Ptr{Float64})(internal_pointer + 40596)
    f === :geom_xpos && return (Ptr{Float64})(internal_pointer + 40604)
    f === :geom_xmat && return (Ptr{Float64})(internal_pointer + 40612)
    f === :site_xpos && return (Ptr{Float64})(internal_pointer + 40620)
    f === :site_xmat && return (Ptr{Float64})(internal_pointer + 40628)
    f === :cam_xpos && return (Ptr{Float64})(internal_pointer + 40636)
    f === :cam_xmat && return (Ptr{Float64})(internal_pointer + 40644)
    f === :light_xpos && return (Ptr{Float64})(internal_pointer + 40652)
    f === :light_xdir && return (Ptr{Float64})(internal_pointer + 40660)
    f === :subtree_com && return (Ptr{Float64})(internal_pointer + 40668)
    f === :cdof && return (Ptr{Float64})(internal_pointer + 40676)
    f === :cinert && return (Ptr{Float64})(internal_pointer + 40684)
    f === :ten_wrapadr && return (Ptr{Int32})(internal_pointer + 40692)
    f === :ten_wrapnum && return (Ptr{Int32})(internal_pointer + 40700)
    f === :ten_J_rownnz && return (Ptr{Int32})(internal_pointer + 40708)
    f === :ten_J_rowadr && return (Ptr{Int32})(internal_pointer + 40716)
    f === :ten_J_colind && return (Ptr{Int32})(internal_pointer + 40724)
    f === :ten_length && return (Ptr{Float64})(internal_pointer + 40732)
    f === :ten_J && return (Ptr{Float64})(internal_pointer + 40740)
    f === :wrap_obj && return (Ptr{Int32})(internal_pointer + 40748)
    f === :wrap_xpos && return (Ptr{Float64})(internal_pointer + 40756)
    f === :actuator_length && return (Ptr{Float64})(internal_pointer + 40764)
    f === :actuator_moment && return (Ptr{Float64})(internal_pointer + 40772)
    f === :crb && return (Ptr{Float64})(internal_pointer + 40780)
    f === :qM && return (Ptr{Float64})(internal_pointer + 40788)
    f === :qLD && return (Ptr{Float64})(internal_pointer + 40796)
    f === :qLDiagInv && return (Ptr{Float64})(internal_pointer + 40804)
    f === :qLDiagSqrtInv && return (Ptr{Float64})(internal_pointer + 40812)
    f === :bvh_active && return (Ptr{UInt8})(internal_pointer + 40820)
    f === :ten_velocity && return (Ptr{Float64})(internal_pointer + 40828)
    f === :actuator_velocity && return (Ptr{Float64})(internal_pointer + 40836)
    f === :cvel && return (Ptr{Float64})(internal_pointer + 40844)
    f === :cdof_dot && return (Ptr{Float64})(internal_pointer + 40852)
    f === :qfrc_bias && return (Ptr{Float64})(internal_pointer + 40860)
    f === :qfrc_passive && return (Ptr{Float64})(internal_pointer + 40868)
    f === :efc_vel && return (Ptr{Float64})(internal_pointer + 40876)
    f === :efc_aref && return (Ptr{Float64})(internal_pointer + 40884)
    f === :subtree_linvel && return (Ptr{Float64})(internal_pointer + 40892)
    f === :subtree_angmom && return (Ptr{Float64})(internal_pointer + 40900)
    f === :qH && return (Ptr{Float64})(internal_pointer + 40908)
    f === :qHDiagInv && return (Ptr{Float64})(internal_pointer + 40916)
    f === :D_rownnz && return (Ptr{Int32})(internal_pointer + 40924)
    f === :D_rowadr && return (Ptr{Int32})(internal_pointer + 40932)
    f === :D_colind && return (Ptr{Int32})(internal_pointer + 40940)
    f === :B_rownnz && return (Ptr{Int32})(internal_pointer + 40948)
    f === :B_rowadr && return (Ptr{Int32})(internal_pointer + 40956)
    f === :B_colind && return (Ptr{Int32})(internal_pointer + 40964)
    f === :qDeriv && return (Ptr{Float64})(internal_pointer + 40972)
    f === :qLU && return (Ptr{Float64})(internal_pointer + 40980)
    f === :actuator_force && return (Ptr{Float64})(internal_pointer + 40988)
    f === :qfrc_actuator && return (Ptr{Float64})(internal_pointer + 40996)
    f === :qfrc_smooth && return (Ptr{Float64})(internal_pointer + 41004)
    f === :qacc_smooth && return (Ptr{Float64})(internal_pointer + 41012)
    f === :qfrc_constraint && return (Ptr{Float64})(internal_pointer + 41020)
    f === :qfrc_inverse && return (Ptr{Float64})(internal_pointer + 41028)
    f === :cacc && return (Ptr{Float64})(internal_pointer + 41036)
    f === :cfrc_int && return (Ptr{Float64})(internal_pointer + 41044)
    f === :cfrc_ext && return (Ptr{Float64})(internal_pointer + 41052)
    f === :contact && return (Ptr{mjContact_})(internal_pointer + 41060)
    f === :efc_type && return (Ptr{Int32})(internal_pointer + 41068)
    f === :efc_id && return (Ptr{Int32})(internal_pointer + 41076)
    f === :efc_J_rownnz && return (Ptr{Int32})(internal_pointer + 41084)
    f === :efc_J_rowadr && return (Ptr{Int32})(internal_pointer + 41092)
    f === :efc_J_rowsuper && return (Ptr{Int32})(internal_pointer + 41100)
    f === :efc_J_colind && return (Ptr{Int32})(internal_pointer + 41108)
    f === :efc_JT_rownnz && return (Ptr{Int32})(internal_pointer + 41116)
    f === :efc_JT_rowadr && return (Ptr{Int32})(internal_pointer + 41124)
    f === :efc_JT_rowsuper && return (Ptr{Int32})(internal_pointer + 41132)
    f === :efc_JT_colind && return (Ptr{Int32})(internal_pointer + 41140)
    f === :efc_J && return (Ptr{Float64})(internal_pointer + 41148)
    f === :efc_JT && return (Ptr{Float64})(internal_pointer + 41156)
    f === :efc_pos && return (Ptr{Float64})(internal_pointer + 41164)
    f === :efc_margin && return (Ptr{Float64})(internal_pointer + 41172)
    f === :efc_frictionloss && return (Ptr{Float64})(internal_pointer + 41180)
    f === :efc_diagApprox && return (Ptr{Float64})(internal_pointer + 41188)
    f === :efc_KBIP && return (Ptr{Float64})(internal_pointer + 41196)
    f === :efc_D && return (Ptr{Float64})(internal_pointer + 41204)
    f === :efc_R && return (Ptr{Float64})(internal_pointer + 41212)
    f === :efc_b && return (Ptr{Float64})(internal_pointer + 41220)
    f === :efc_force && return (Ptr{Float64})(internal_pointer + 41228)
    f === :efc_state && return (Ptr{Int32})(internal_pointer + 41236)
    f === :efc_AR_rownnz && return (Ptr{Int32})(internal_pointer + 41244)
    f === :efc_AR_rowadr && return (Ptr{Int32})(internal_pointer + 41252)
    f === :efc_AR_colind && return (Ptr{Int32})(internal_pointer + 41260)
    f === :efc_AR && return (Ptr{Float64})(internal_pointer + 41268)
    error("Could not find property $(f)")
end
function Base.setproperty!(x::Data, f::Symbol, value)
    internal_pointer = getfield(x, :internal_pointer)
    f === :internal_pointer && error("Cannot set the internal pointer, create a new struct instead.")
    if f === :nstack
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 0), cvalue)
        return cvalue
    end
    if f === :nbuffer
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 4), cvalue)
        return cvalue
    end
    if f === :nplugin
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 8), cvalue)
        return cvalue
    end
    if f === :pstack
        cvalue = convert(UInt64, value)
        unsafe_store!(Ptr{UInt64}(internal_pointer + 12), cvalue)
        return cvalue
    end
    if f === :parena
        cvalue = convert(UInt64, value)
        unsafe_store!(Ptr{UInt64}(internal_pointer + 20), cvalue)
        return cvalue
    end
    if f === :maxuse_stack
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 28), cvalue)
        return cvalue
    end
    if f === :maxuse_arena
        cvalue = convert(UInt64, value)
        unsafe_store!(Ptr{UInt64}(internal_pointer + 32), cvalue)
        return cvalue
    end
    if f === :maxuse_con
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 40), cvalue)
        return cvalue
    end
    if f === :maxuse_efc
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 44), cvalue)
        return cvalue
    end
    if f === :solver_iter
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 48), cvalue)
        return cvalue
    end
    if f === :solver_nnz
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 52), cvalue)
        return cvalue
    end
    if f === :nbodypair_broad
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 56), cvalue)
        return cvalue
    end
    if f === :nbodypair_narrow
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 60), cvalue)
        return cvalue
    end
    if f === :ngeompair_mid
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 64), cvalue)
        return cvalue
    end
    if f === :ngeompair_narrow
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 68), cvalue)
        return cvalue
    end
    if f === :ne
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 72), cvalue)
        return cvalue
    end
    if f === :nf
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 76), cvalue)
        return cvalue
    end
    if f === :nefc
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 80), cvalue)
        return cvalue
    end
    if f === :nnzJ
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 84), cvalue)
        return cvalue
    end
    if f === :ncon
        cvalue = convert(Int32, value)
        unsafe_store!(Ptr{Int32}(internal_pointer + 88), cvalue)
        return cvalue
    end
    if f === :time
        cvalue = convert(Float64, value)
        unsafe_store!(Ptr{Float64}(internal_pointer + 92), cvalue)
        return cvalue
    end
    if f in (:warning, :timer, :solver, :solver_fwdinv, :energy)
        error("Cannot overwrite array field. Mutate the array instead.")
    end
    if f in (:buffer, :arena, :qpos, :qvel, :act, :qacc_warmstart, :plugin_state, :ctrl, :qfrc_applied, :xfrc_applied, :mocap_pos, :mocap_quat, :qacc, :act_dot, :userdata, :sensordata, :plugin, :plugin_data, :xpos, :xquat, :xmat, :xipos, :ximat, :xanchor, :xaxis, :geom_xpos, :geom_xmat, :site_xpos, :site_xmat, :cam_xpos, :cam_xmat, :light_xpos, :light_xdir, :subtree_com, :cdof, :cinert, :ten_wrapadr, :ten_wrapnum, :ten_J_rownnz, :ten_J_rowadr, :ten_J_colind, :ten_length, :ten_J, :wrap_obj, :wrap_xpos, :actuator_length, :actuator_moment, :crb, :qM, :qLD, :qLDiagInv, :qLDiagSqrtInv, :bvh_active, :ten_velocity, :actuator_velocity, :cvel, :cdof_dot, :qfrc_bias, :qfrc_passive, :efc_vel, :efc_aref, :subtree_linvel, :subtree_angmom, :qH, :qHDiagInv, :D_rownnz, :D_rowadr, :D_colind, :B_rownnz, :B_rowadr, :B_colind, :qDeriv, :qLU, :actuator_force, :qfrc_actuator, :qfrc_smooth, :qacc_smooth, :qfrc_constraint, :qfrc_inverse, :cacc, :cfrc_int, :cfrc_ext, :contact, :efc_type, :efc_id, :efc_J_rownnz, :efc_J_rowadr, :efc_J_rowsuper, :efc_J_colind, :efc_JT_rownnz, :efc_JT_rowadr, :efc_JT_rowsuper, :efc_JT_colind, :efc_J, :efc_JT, :efc_pos, :efc_margin, :efc_frictionloss, :efc_diagApprox, :efc_KBIP, :efc_D, :efc_R, :efc_b, :efc_force, :efc_state, :efc_AR_rownnz, :efc_AR_rowadr, :efc_AR_colind, :efc_AR)
        error("Cannot overwrite a pointer field.")
    end
    error("Could not find property $(f) to set.")
end
