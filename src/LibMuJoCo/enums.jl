@cenum mjtState_::UInt32 begin
        mjSTATE_TIME = 1
        mjSTATE_QPOS = 2
        mjSTATE_QVEL = 4
        mjSTATE_ACT = 8
        mjSTATE_WARMSTART = 16
        mjSTATE_CTRL = 32
        mjSTATE_QFRC_APPLIED = 64
        mjSTATE_XFRC_APPLIED = 128
        mjSTATE_MOCAP_POS = 256
        mjSTATE_MOCAP_QUAT = 512
        mjSTATE_USERDATA = 1024
        mjSTATE_PLUGIN = 2048
        mjNSTATE = 12
        mjSTATE_PHYSICS = 14
        mjSTATE_FULLPHYSICS = 2063
        mjSTATE_USER = 2016
        mjSTATE_INTEGRATION = 4095
    end
@cenum mjtWarning_::UInt32 begin
        mjWARN_INERTIA = 0
        mjWARN_CONTACTFULL = 1
        mjWARN_CNSTRFULL = 2
        mjWARN_VGEOMFULL = 3
        mjWARN_BADQPOS = 4
        mjWARN_BADQVEL = 5
        mjWARN_BADQACC = 6
        mjWARN_BADCTRL = 7
        mjNWARNING = 8
    end
@cenum mjtTimer_::UInt32 begin
        mjTIMER_STEP = 0
        mjTIMER_FORWARD = 1
        mjTIMER_INVERSE = 2
        mjTIMER_POSITION = 3
        mjTIMER_VELOCITY = 4
        mjTIMER_ACTUATION = 5
        mjTIMER_ACCELERATION = 6
        mjTIMER_CONSTRAINT = 7
        mjTIMER_POS_KINEMATICS = 8
        mjTIMER_POS_INERTIA = 9
        mjTIMER_POS_COLLISION = 10
        mjTIMER_POS_MAKE = 11
        mjTIMER_POS_PROJECT = 12
        mjNTIMER = 13
    end
@cenum mjtDisableBit_::UInt32 begin
        mjDSBL_CONSTRAINT = 1
        mjDSBL_EQUALITY = 2
        mjDSBL_FRICTIONLOSS = 4
        mjDSBL_LIMIT = 8
        mjDSBL_CONTACT = 16
        mjDSBL_PASSIVE = 32
        mjDSBL_GRAVITY = 64
        mjDSBL_CLAMPCTRL = 128
        mjDSBL_WARMSTART = 256
        mjDSBL_FILTERPARENT = 512
        mjDSBL_ACTUATION = 1024
        mjDSBL_REFSAFE = 2048
        mjDSBL_SENSOR = 4096
        mjDSBL_MIDPHASE = 8192
        mjNDISABLE = 14
    end
@cenum mjtEnableBit_::UInt32 begin
        mjENBL_OVERRIDE = 1
        mjENBL_ENERGY = 2
        mjENBL_FWDINV = 4
        mjENBL_SENSORNOISE = 8
        mjENBL_MULTICCD = 16
        mjNENABLE = 5
    end
@cenum mjtJoint_::UInt32 begin
        mjJNT_FREE = 0
        mjJNT_BALL = 1
        mjJNT_SLIDE = 2
        mjJNT_HINGE = 3
    end
@cenum mjtGeom_::UInt32 begin
        mjGEOM_PLANE = 0
        mjGEOM_HFIELD = 1
        mjGEOM_SPHERE = 2
        mjGEOM_CAPSULE = 3
        mjGEOM_ELLIPSOID = 4
        mjGEOM_CYLINDER = 5
        mjGEOM_BOX = 6
        mjGEOM_MESH = 7
        mjNGEOMTYPES = 8
        mjGEOM_ARROW = 100
        mjGEOM_ARROW1 = 101
        mjGEOM_ARROW2 = 102
        mjGEOM_LINE = 103
        mjGEOM_SKIN = 104
        mjGEOM_LABEL = 105
        mjGEOM_NONE = 1001
    end
@cenum mjtCamLight_::UInt32 begin
        mjCAMLIGHT_FIXED = 0
        mjCAMLIGHT_TRACK = 1
        mjCAMLIGHT_TRACKCOM = 2
        mjCAMLIGHT_TARGETBODY = 3
        mjCAMLIGHT_TARGETBODYCOM = 4
    end
@cenum mjtTexture_::UInt32 begin
        mjTEXTURE_2D = 0
        mjTEXTURE_CUBE = 1
        mjTEXTURE_SKYBOX = 2
    end
@cenum mjtIntegrator_::UInt32 begin
        mjINT_EULER = 0
        mjINT_RK4 = 1
        mjINT_IMPLICIT = 2
        mjINT_IMPLICITFAST = 3
    end
@cenum mjtCollision_::UInt32 begin
        mjCOL_ALL = 0
        mjCOL_PAIR = 1
        mjCOL_DYNAMIC = 2
    end
@cenum mjtCone_::UInt32 begin
        mjCONE_PYRAMIDAL = 0
        mjCONE_ELLIPTIC = 1
    end
@cenum mjtJacobian_::UInt32 begin
        mjJAC_DENSE = 0
        mjJAC_SPARSE = 1
        mjJAC_AUTO = 2
    end
@cenum mjtSolver_::UInt32 begin
        mjSOL_PGS = 0
        mjSOL_CG = 1
        mjSOL_NEWTON = 2
    end
@cenum mjtEq_::UInt32 begin
        mjEQ_CONNECT = 0
        mjEQ_WELD = 1
        mjEQ_JOINT = 2
        mjEQ_TENDON = 3
        mjEQ_DISTANCE = 4
    end
@cenum mjtWrap_::UInt32 begin
        mjWRAP_NONE = 0
        mjWRAP_JOINT = 1
        mjWRAP_PULLEY = 2
        mjWRAP_SITE = 3
        mjWRAP_SPHERE = 4
        mjWRAP_CYLINDER = 5
    end
@cenum mjtTrn_::UInt32 begin
        mjTRN_JOINT = 0
        mjTRN_JOINTINPARENT = 1
        mjTRN_SLIDERCRANK = 2
        mjTRN_TENDON = 3
        mjTRN_SITE = 4
        mjTRN_BODY = 5
        mjTRN_UNDEFINED = 1000
    end
@cenum mjtDyn_::UInt32 begin
        mjDYN_NONE = 0
        mjDYN_INTEGRATOR = 1
        mjDYN_FILTER = 2
        mjDYN_MUSCLE = 3
        mjDYN_USER = 4
    end
@cenum mjtGain_::UInt32 begin
        mjGAIN_FIXED = 0
        mjGAIN_AFFINE = 1
        mjGAIN_MUSCLE = 2
        mjGAIN_USER = 3
    end
@cenum mjtBias_::UInt32 begin
        mjBIAS_NONE = 0
        mjBIAS_AFFINE = 1
        mjBIAS_MUSCLE = 2
        mjBIAS_USER = 3
    end
@cenum mjtObj_::UInt32 begin
        mjOBJ_UNKNOWN = 0
        mjOBJ_BODY = 1
        mjOBJ_XBODY = 2
        mjOBJ_JOINT = 3
        mjOBJ_DOF = 4
        mjOBJ_GEOM = 5
        mjOBJ_SITE = 6
        mjOBJ_CAMERA = 7
        mjOBJ_LIGHT = 8
        mjOBJ_MESH = 9
        mjOBJ_SKIN = 10
        mjOBJ_HFIELD = 11
        mjOBJ_TEXTURE = 12
        mjOBJ_MATERIAL = 13
        mjOBJ_PAIR = 14
        mjOBJ_EXCLUDE = 15
        mjOBJ_EQUALITY = 16
        mjOBJ_TENDON = 17
        mjOBJ_ACTUATOR = 18
        mjOBJ_SENSOR = 19
        mjOBJ_NUMERIC = 20
        mjOBJ_TEXT = 21
        mjOBJ_TUPLE = 22
        mjOBJ_KEY = 23
        mjOBJ_PLUGIN = 24
    end
@cenum mjtConstraint_::UInt32 begin
        mjCNSTR_EQUALITY = 0
        mjCNSTR_FRICTION_DOF = 1
        mjCNSTR_FRICTION_TENDON = 2
        mjCNSTR_LIMIT_JOINT = 3
        mjCNSTR_LIMIT_TENDON = 4
        mjCNSTR_CONTACT_FRICTIONLESS = 5
        mjCNSTR_CONTACT_PYRAMIDAL = 6
        mjCNSTR_CONTACT_ELLIPTIC = 7
    end
@cenum mjtConstraintState_::UInt32 begin
        mjCNSTRSTATE_SATISFIED = 0
        mjCNSTRSTATE_QUADRATIC = 1
        mjCNSTRSTATE_LINEARNEG = 2
        mjCNSTRSTATE_LINEARPOS = 3
        mjCNSTRSTATE_CONE = 4
    end
@cenum mjtSensor_::UInt32 begin
        mjSENS_TOUCH = 0
        mjSENS_ACCELEROMETER = 1
        mjSENS_VELOCIMETER = 2
        mjSENS_GYRO = 3
        mjSENS_FORCE = 4
        mjSENS_TORQUE = 5
        mjSENS_MAGNETOMETER = 6
        mjSENS_RANGEFINDER = 7
        mjSENS_JOINTPOS = 8
        mjSENS_JOINTVEL = 9
        mjSENS_TENDONPOS = 10
        mjSENS_TENDONVEL = 11
        mjSENS_ACTUATORPOS = 12
        mjSENS_ACTUATORVEL = 13
        mjSENS_ACTUATORFRC = 14
        mjSENS_JOINTACTFRC = 15
        mjSENS_BALLQUAT = 16
        mjSENS_BALLANGVEL = 17
        mjSENS_JOINTLIMITPOS = 18
        mjSENS_JOINTLIMITVEL = 19
        mjSENS_JOINTLIMITFRC = 20
        mjSENS_TENDONLIMITPOS = 21
        mjSENS_TENDONLIMITVEL = 22
        mjSENS_TENDONLIMITFRC = 23
        mjSENS_FRAMEPOS = 24
        mjSENS_FRAMEQUAT = 25
        mjSENS_FRAMEXAXIS = 26
        mjSENS_FRAMEYAXIS = 27
        mjSENS_FRAMEZAXIS = 28
        mjSENS_FRAMELINVEL = 29
        mjSENS_FRAMEANGVEL = 30
        mjSENS_FRAMELINACC = 31
        mjSENS_FRAMEANGACC = 32
        mjSENS_SUBTREECOM = 33
        mjSENS_SUBTREELINVEL = 34
        mjSENS_SUBTREEANGMOM = 35
        mjSENS_CLOCK = 36
        mjSENS_PLUGIN = 37
        mjSENS_USER = 38
    end
@cenum mjtStage_::UInt32 begin
        mjSTAGE_NONE = 0
        mjSTAGE_POS = 1
        mjSTAGE_VEL = 2
        mjSTAGE_ACC = 3
    end
@cenum mjtDataType_::UInt32 begin
        mjDATATYPE_REAL = 0
        mjDATATYPE_POSITIVE = 1
        mjDATATYPE_AXIS = 2
        mjDATATYPE_QUATERNION = 3
    end
@cenum mjtLRMode_::UInt32 begin
        mjLRMODE_NONE = 0
        mjLRMODE_MUSCLE = 1
        mjLRMODE_MUSCLEUSER = 2
        mjLRMODE_ALL = 3
    end
@cenum mjtPluginCapabilityBit_::UInt32 begin
        mjPLUGIN_ACTUATOR = 1
        mjPLUGIN_SENSOR = 2
        mjPLUGIN_PASSIVE = 4
    end
@cenum mjtGridPos_::UInt32 begin
        mjGRID_TOPLEFT = 0
        mjGRID_TOPRIGHT = 1
        mjGRID_BOTTOMLEFT = 2
        mjGRID_BOTTOMRIGHT = 3
    end
@cenum mjtFramebuffer_::UInt32 begin
        mjFB_WINDOW = 0
        mjFB_OFFSCREEN = 1
    end
@cenum mjtFontScale_::UInt32 begin
        mjFONTSCALE_50 = 50
        mjFONTSCALE_100 = 100
        mjFONTSCALE_150 = 150
        mjFONTSCALE_200 = 200
        mjFONTSCALE_250 = 250
        mjFONTSCALE_300 = 300
    end
@cenum mjtFont_::UInt32 begin
        mjFONT_NORMAL = 0
        mjFONT_SHADOW = 1
        mjFONT_BIG = 2
    end
@cenum mjtButton_::UInt32 begin
        mjBUTTON_NONE = 0
        mjBUTTON_LEFT = 1
        mjBUTTON_RIGHT = 2
        mjBUTTON_MIDDLE = 3
    end
@cenum mjtEvent_::UInt32 begin
        mjEVENT_NONE = 0
        mjEVENT_MOVE = 1
        mjEVENT_PRESS = 2
        mjEVENT_RELEASE = 3
        mjEVENT_SCROLL = 4
        mjEVENT_KEY = 5
        mjEVENT_RESIZE = 6
        mjEVENT_REDRAW = 7
        mjEVENT_FILESDROP = 8
    end
@cenum mjtItem_::Int32 begin
        mjITEM_END = -2
        mjITEM_SECTION = -1
        mjITEM_SEPARATOR = 0
        mjITEM_STATIC = 1
        mjITEM_BUTTON = 2
        mjITEM_CHECKINT = 3
        mjITEM_CHECKBYTE = 4
        mjITEM_RADIO = 5
        mjITEM_RADIOLINE = 6
        mjITEM_SELECT = 7
        mjITEM_SLIDERINT = 8
        mjITEM_SLIDERNUM = 9
        mjITEM_EDITINT = 10
        mjITEM_EDITNUM = 11
        mjITEM_EDITFLOAT = 12
        mjITEM_EDITTXT = 13
        mjNITEM = 14
    end
@cenum mjtCatBit_::UInt32 begin
        mjCAT_STATIC = 1
        mjCAT_DYNAMIC = 2
        mjCAT_DECOR = 4
        mjCAT_ALL = 7
    end
@cenum mjtMouse_::UInt32 begin
        mjMOUSE_NONE = 0
        mjMOUSE_ROTATE_V = 1
        mjMOUSE_ROTATE_H = 2
        mjMOUSE_MOVE_V = 3
        mjMOUSE_MOVE_H = 4
        mjMOUSE_ZOOM = 5
        mjMOUSE_SELECT = 6
    end
@cenum mjtPertBit_::UInt32 begin
        mjPERT_TRANSLATE = 1
        mjPERT_ROTATE = 2
    end
@cenum mjtCamera_::UInt32 begin
        mjCAMERA_FREE = 0
        mjCAMERA_TRACKING = 1
        mjCAMERA_FIXED = 2
        mjCAMERA_USER = 3
    end
@cenum mjtLabel_::UInt32 begin
        mjLABEL_NONE = 0
        mjLABEL_BODY = 1
        mjLABEL_JOINT = 2
        mjLABEL_GEOM = 3
        mjLABEL_SITE = 4
        mjLABEL_CAMERA = 5
        mjLABEL_LIGHT = 6
        mjLABEL_TENDON = 7
        mjLABEL_ACTUATOR = 8
        mjLABEL_CONSTRAINT = 9
        mjLABEL_SKIN = 10
        mjLABEL_SELECTION = 11
        mjLABEL_SELPNT = 12
        mjLABEL_CONTACTPOINT = 13
        mjLABEL_CONTACTFORCE = 14
        mjNLABEL = 15
    end
@cenum mjtFrame_::UInt32 begin
        mjFRAME_NONE = 0
        mjFRAME_BODY = 1
        mjFRAME_GEOM = 2
        mjFRAME_SITE = 3
        mjFRAME_CAMERA = 4
        mjFRAME_LIGHT = 5
        mjFRAME_CONTACT = 6
        mjFRAME_WORLD = 7
        mjNFRAME = 8
    end
@cenum mjtVisFlag_::UInt32 begin
        mjVIS_CONVEXHULL = 0
        mjVIS_TEXTURE = 1
        mjVIS_JOINT = 2
        mjVIS_CAMERA = 3
        mjVIS_ACTUATOR = 4
        mjVIS_ACTIVATION = 5
        mjVIS_LIGHT = 6
        mjVIS_TENDON = 7
        mjVIS_RANGEFINDER = 8
        mjVIS_CONSTRAINT = 9
        mjVIS_INERTIA = 10
        mjVIS_SCLINERTIA = 11
        mjVIS_PERTFORCE = 12
        mjVIS_PERTOBJ = 13
        mjVIS_CONTACTPOINT = 14
        mjVIS_CONTACTFORCE = 15
        mjVIS_CONTACTSPLIT = 16
        mjVIS_TRANSPARENT = 17
        mjVIS_AUTOCONNECT = 18
        mjVIS_COM = 19
        mjVIS_SELECT = 20
        mjVIS_STATIC = 21
        mjVIS_SKIN = 22
        mjVIS_MIDPHASE = 23
        mjVIS_MESHBVH = 24
        mjNVISFLAG = 25
    end
@cenum mjtRndFlag_::UInt32 begin
        mjRND_SHADOW = 0
        mjRND_WIREFRAME = 1
        mjRND_REFLECTION = 2
        mjRND_ADDITIVE = 3
        mjRND_SKYBOX = 4
        mjRND_FOG = 5
        mjRND_HAZE = 6
        mjRND_SEGMENT = 7
        mjRND_IDCOLOR = 8
        mjRND_CULL_FACE = 9
        mjNRNDFLAG = 10
    end
@cenum mjtStereo_::UInt32 begin
        mjSTEREO_NONE = 0
        mjSTEREO_QUADBUFFERED = 1
        mjSTEREO_SIDEBYSIDE = 2
    end
