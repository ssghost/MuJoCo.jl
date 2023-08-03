const mjtNum = Cdouble
const mjtByte = Cuchar
const mjfGeneric = Ptr{Cvoid}
const mjfConFilt = Ptr{Cvoid}
const mjfSensor = Ptr{Cvoid}
const mjfTime = Ptr{Cvoid}
const mjfAct = Ptr{Cvoid}
const mjfCollision = Ptr{Cvoid}
const mjfOpenResource = Ptr{Cvoid}
const mjfReadResource = Ptr{Cvoid}
const mjfCloseResource = Ptr{Cvoid}
const mjfGetResourceDir = Ptr{Cvoid}
const mjfPluginLibraryLoadCallback = Ptr{Cvoid}
const mjfItemEnable = Ptr{Cvoid}
const mjPI = 3.141592653589793
const mjMAXVAL = 1.0e10
const mjMINMU = 1.0e-5
const mjMINIMP = 0.0001
const mjMAXIMP = 0.9999
const mjMAXCONPAIR = 50
const mjMAXTREEDEPTH = 50
const mjMAXVFS = 2000
const mjMAXVFSNAME = 1000
const mjNEQDATA = 11
const mjNDYN = 10
const mjNGAIN = 10
const mjNBIAS = 10
const mjNFLUID = 12
const mjNREF = 2
const mjNIMP = 5
const mjNSOLVER = 1000
const mjVFS_PREFIX = "vfs"
const mjNAUX = 10
const mjMAXTEXTURE = 1000
const mjMINVAL = 1.0e-15
const mjMAXUISECT = 10
const mjMAXUIITEM = 100
const mjMAXUITEXT = 300
const mjMAXUINAME = 40
const mjMAXUIMULTI = 35
const mjMAXUIEDIT = 7
const mjMAXUIRECT = 25
const mjSEPCLOSED = 1000
const mjKEY_ESCAPE = 256
const mjKEY_ENTER = 257
const mjKEY_TAB = 258
const mjKEY_BACKSPACE = 259
const mjKEY_INSERT = 260
const mjKEY_DELETE = 261
const mjKEY_RIGHT = 262
const mjKEY_LEFT = 263
const mjKEY_DOWN = 264
const mjKEY_UP = 265
const mjKEY_PAGE_UP = 266
const mjKEY_PAGE_DOWN = 267
const mjKEY_HOME = 268
const mjKEY_END = 269
const mjKEY_F1 = 290
const mjKEY_F2 = 291
const mjKEY_F3 = 292
const mjKEY_F4 = 293
const mjKEY_F5 = 294
const mjKEY_F6 = 295
const mjKEY_F7 = 296
const mjKEY_F8 = 297
const mjKEY_F9 = 298
const mjKEY_F10 = 299
const mjKEY_F11 = 300
const mjKEY_F12 = 301
const mjKEY_NUMPAD_0 = 320
const mjKEY_NUMPAD_9 = 329
const mjNGROUP = 6
const mjMAXLIGHT = 100
const mjMAXOVERLAY = 500
const mjMAXLINE = 100
const mjMAXLINEPNT = 1000
const mjMAXPLANEGRID = 200
const mjVERSION_HEADER = 237
const mju_sqrt = sqrt
const mju_exp = exp
const mju_sin = sin
const mju_cos = cos
const mju_tan = tan
const mju_asin = asin
const mju_acos = acos
const mju_atan2 = atan
const mju_tanh = tanh
const mju_pow = (^)
const mju_abs = abs
const mju_log = log
const mju_log10 = log10
const mju_floor = floor
const mju_ceil = ceil
const PREFIXES = ["mj"]
