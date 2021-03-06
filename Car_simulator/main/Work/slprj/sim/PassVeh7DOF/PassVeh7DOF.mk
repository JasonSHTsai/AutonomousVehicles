# Copyright 1994-2018 The MathWorks, Inc.
#
#
# Abstract:
#       Template makefile for building a Windows-based stand-alone embedded
#       real-time version of Simulink model using generated C code and the
#          Microsoft Visual C/C++ compiler for x64.
#
#       Note that this template is automatically customized by the build 
#       procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#       build:
#         OPT_OPTS       - Optimization option. See DEFAULT_OPT_OPTS in
#                          vctools.mak for default.
#         OPTS           - User specific options.
#         CPP_OPTS       - C++ compiler options.
#         USER_SRCS      - Additional user sources, such as files needed by
#                          S-functions.
#         USER_INCLUDES  - Additional include paths
#                          (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#       To enable debugging:
#         set DEBUG_BUILD = 1, which will trigger OPTS=-Zi (may vary with
#                               compiler version, see compiler doc) 
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see ert.tlc


#------------------------ Macros read by make_rtw -----------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = nmake
HOST            = PC
BUILD           = yes
SYS_TARGET_FILE = any
BUILD_SUCCESS	= ^#^#^# Created
COMPILER_TOOL_CHAIN = vcx64

# Opt in to simplified format by specifying compatible Toolchain
TOOLCHAIN_NAME = [\
    "Microsoft Visual C++ 2017 v15.0 | nmake (64-bit Windows)", \
    "Microsoft Visual C++ 2015 v14.0 | nmake (64-bit Windows)", \
    "Microsoft Visual C++ 2013 v12.0 | nmake (64-bit Windows)"]

#---------------------- Tokens expanded by make_rtw ---------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to where MATLAB is installed.
#  MATLAB_BIN          - Path to MATLAB executable.
#  S_FUNCTIONS         - List of additional S-function modules.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link.
#  NUMST               - Number of sample times
#  NCSTATES            - Number of continuous states
#  BUILDARGS           - Options passed in at the command line.
#  MULTITASKING        - yes (1) or no (0): Is solver mode multitasking
#  INTEGER_CODE        - yes (1) or no (0): Is generated code purely integer
#  MAT_FILE            - yes (1) or no (0): Should mat file logging be done,
#                        if 0, the generated code runs indefinitely
#  MULTI_INSTANCE_CODE - Is the generated code multi instantiable (1/0)?
#  MODELREFS           - List of referenced models
#  SHRLIBTARGET        - Is this build intended for generation of a shared library instead 
#                        of executable (1/0)?
#  MAKEFILEBUILDER_TGT - Is this build performed by the MakefileBuilder class
#                        e.g. to create a PIL executable?
#  STANDALONE_SUPPRESS_EXE - Build the standalone target but only create object code modules 
#                            and do not build an executable

MODEL                   = PassVeh7DOF
MODULES                 = PassVeh7DOF.c PassVeh7DOF_capi.c
MAKEFILE                = PassVeh7DOF.mk
MATLAB_ROOT             = C:\Program Files\MATLAB\R2018a
ALT_MATLAB_ROOT         = C:\PROGRA~1\MATLAB\R2018a
MATLAB_BIN              = C:\Program Files\MATLAB\R2018a\bin
ALT_MATLAB_BIN          = C:\PROGRA~1\MATLAB\R2018a\bin
MASTER_ANCHOR_DIR       = 
START_DIR               = E:\Mpc_Ctrl_3mdchange_p2p_Np_upd_ex_2_3_0814\main\Work
S_FUNCTIONS             = 
S_FUNCTIONS_LIB         = 
NUMST                   = 2
NCSTATES                = 20
BUILDARGS               =  GENERATE_ASAP2=0 EXTMODE_STATIC_ALLOC=0 EXTMODE_STATIC_ALLOC_SIZE=1000000 EXTMODE_TRANSPORT=0 TMW_EXTMODE_TESTING=0 OPTS="-DSLMSG_ALLOW_SYSTEM_ALLOC -DMATLAB_MEX_FILE -DTID01EQ=1"
MULTITASKING            = 0
INTEGER_CODE            = 0
MAT_FILE                = 0
ALLOCATIONFCN           = 0
ONESTEPFCN              = 0
TERMFCN                 = 1
B_ERTSFCN               = 0
MEXEXT                  = mexw64
ENABLE_SLEXEC_SSBRIDGE  = 1
MULTI_INSTANCE_CODE     = 0
CLASSIC_INTERFACE       = 0
MODELREFS               = 
SHARED_SRC              = ..\..\..\slprj\sim\_sharedutils\*.c*
SHARED_SRC_DIR          = $(START_DIR)\slprj\sim\_sharedutils
SHARED_BIN_DIR          = ..\..\..\slprj\sim\_sharedutils
SHARED_LIB              = ..\..\..\slprj\sim\_sharedutils\rtwshared.lib
GEN_SAMPLE_MAIN         = 0
TARGET_LANG_EXT         = c
MEX_OPT_FILE            = -f "C:\Program Files\MATLAB\R2018a\bin\win64\mexopts\msvc2017.xml"
COMPUTER                = PCWIN64
SHRLIBTARGET            = 0
MAKEFILEBUILDER_TGT     = 0
STANDALONE_SUPPRESS_EXE = 0
VISUAL_VER              = 15.0
OPTIMIZATION_FLAGS      = /Od /Oy- /DNDEBUG
ADDITIONAL_LDFLAGS      = 
INTERLEAVED_COMPLEX_FLAGS = -R2018a
DEFINES_CUSTOM          = 
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0

# To enable debugging:
# set DEBUG_BUILD = 1
DEBUG_BUILD             = 0

#--------------------------- Model and reference models -----------------------
MODELLIB                  = PassVeh7DOFlib.lib
MODELREF_LINK_LIBS        = 
MODELREF_LINK_RSPFILE     = PassVeh7DOF_ref.rsp
MODELREF_INC_PATH         = 
RELATIVE_PATH_TO_ANCHOR   = ..\..\..
MODELREF_TARGET_TYPE      = SIM
MODELREF_SFCN_SUFFIX      = _msf
ISPROTECTINGMODEL          = NOTPROTECTING
PROT_CAPIC_SUFFIX          = _capi.c
PROT_CAPIO_SUFFIX          = _capi_host.obj

!if "$(MATLAB_ROOT)" != "$(ALT_MATLAB_ROOT)"
MATLAB_ROOT = $(ALT_MATLAB_ROOT)
!endif
!if "$(MATLAB_BIN)" != "$(ALT_MATLAB_BIN)"
MATLAB_BIN = $(ALT_MATLAB_BIN)
!endif
MATLAB_ARCH_BIN = $(MATLAB_BIN)\win64

#--------------------------- Tool Specifications ------------------------------

CPU = AMD64
!include $(MATLAB_ROOT)\rtw\c\tools\vctools.mak
APPVER = 5.02

# Determine if we are generating an s-function
SFCN = 0
!if "$(MODELREF_TARGET_TYPE)" == "SIM"
SFCN = 1
!endif
!if $(B_ERTSFCN)==1
SFCN = 1
!endif

CMD_FILE             = $(MODEL).rsp

#------------------------------ Include/Lib Path ------------------------------

MATLAB_INCLUDES =                    $(MATLAB_ROOT)\extern\include
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(MATLAB_ROOT)\simulink\include
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(MATLAB_ROOT)\rtw\c\src
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(MATLAB_ROOT)\rtw\c\src\ext_mode\common

# Additional includes

MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(START_DIR)
MATLAB_INCLUDES = $(MATLAB_INCLUDES);$(START_DIR)\slprj\sim\PassVeh7DOF
MATLAB_INCLUDES = $(MATLAB_INCLUDES);E:\Mpc_Ctrl_3mdchange_p2p_Np_upd_ex_2_3_0814\refs\PassVeh7DOF\Plant

INCLUDE = .;$(RELATIVE_PATH_TO_ANCHOR);$(MATLAB_INCLUDES);$(INCLUDE)

!if "$(SHARED_SRC_DIR)" != ""
INCLUDE = $(INCLUDE);$(SHARED_SRC_DIR)
!endif


#----------------- Compiler and Linker Options --------------------------------

# Optimization Options
OPT_OPTS = $(DEFAULT_OPT_OPTS)

# General User Options
!if "$(DEBUG_BUILD)" == "0"
DBG_FLAG =
MEX_DEBUG_FLAG = 
!else
#   Set OPT_OPTS=-Zi and any additional flags for debugging
DBG_FLAG = -Zi
MEX_DEBUG_FLAG = -g
!endif

!if "$(MODELREF_TARGET_TYPE)" == "SIM"
MDLREF_FLAG = -DMDL_REF_SIM_TGT=1 
!if "$(ENABLE_SLEXEC_SSBRIDGE)" != "0"
MDLREF_FLAG = $(MDLREF_FLAG) -DENABLE_SLEXEC_SSBRIDGE=$(ENABLE_SLEXEC_SSBRIDGE)
!endif
!else
MDLREF_FLAG =
!endif

!if "$(OPTIMIZATION_FLAGS)" != ""
CC_OPTS = $(OPTS) $(OPTIMIZATION_FLAGS)
MEX_OPTS = OPTIMFLAGS="$(OPTIMIZATION_FLAGS)" $(MDLREF_FLAG)
!else
CC_OPTS = $(OPT_OPTS) $(OPTS) 
MEX_OPTS = OPTIMFLAGS="$(OPT_OPTS)" $(MDLREF_FLAG)
!endif

CPP_REQ_DEFINES = -DMODEL=$(MODEL) -DNUMST=$(NUMST) -DNCSTATES=$(NCSTATES) \
		  -DMAT_FILE=$(MAT_FILE) -DINTEGER_CODE=$(INTEGER_CODE) \
		  -DONESTEPFCN=$(ONESTEPFCN) -DTERMFCN=$(TERMFCN) \
		  -DHAVESTDIO -DMULTI_INSTANCE_CODE=$(MULTI_INSTANCE_CODE) \
		  -DCLASSIC_INTERFACE=$(CLASSIC_INTERFACE) \
		  -DALLOCATIONFCN=$(ALLOCATIONFCN) \
		  $(DEFINES_CUSTOM)

!if "$(MODELREF_TARGET_TYPE)" == "SIM"
CPP_REQ_DEFINES = $(CPP_REQ_DEFINES) $(MDLREF_FLAG)
!else
CPP_REQ_DEFINES = $(CPP_REQ_DEFINES) -DMT=$(MULTITASKING)
!endif


CPP_REQ_DEFINES = $(CPP_REQ_DEFINES) -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=$(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS)

# Uncomment this line to move warning level to W4
# cflags = $(cflags:W3=W4)
!if "$(MODELREF_TARGET_TYPE)" == "SIM"	 
CVARSFLAG = $(cvarsdll)	 
!else	 
CVARSFLAG = $(cvarsmt)
!endif	 

CFLAGS = $(MODELREF_INC_PATH)  $(cflags) $(CVARSFLAG) \
	 -D_CRT_SECURE_NO_WARNINGS $(DBG_FLAG) $(CC_OPTS) $(CPP_REQ_DEFINES) \
	 $(USER_INCLUDES)

CPPFLAGS = $(MODELREF_INC_PATH) $(cflags) $(CVARSFLAG) \
	   -EHs -D_CRT_SECURE_NO_WARNINGS $(DBG_FLAG) $(CPP_OPTS) $(CC_OPTS) \
	   $(CPP_REQ_DEFINES) $(USER_INCLUDES)

LDFLAGS = $(ldebug) $(conflags) $(conlibs) $(ADDITIONAL_LDFLAGS)

#----------------------------- Source Files -----------------------------------

ADD_SRCS =

!if $(SFCN) == 0
!if "$(MODELREF_TARGET_TYPE)" == "NONE"
!if $(SHRLIBTARGET) == 1
PRODUCT   = $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL)_win64.dll
REQ_SRCS  = $(MODULES)
!else
!if $(MAKEFILEBUILDER_TGT) == 1
PRODUCT   = $(MODEL).exe
PREBUILT_SRCS  = $(MODULES)
PREBUILT_OBJS_CPP_UPPER = $(PREBUILT_SRCS:.CPP=.obj)
PREBUILT_OBJS_CPP_LOWER = $(PREBUILT_OBJS_CPP_UPPER:.cpp=.obj)
PREBUILT_OBJS_C_UPPER = $(PREBUILT_OBJS_CPP_LOWER:.C=.obj)
PREBUILT_OBJS = $(PREBUILT_OBJS_C_UPPER:.c=.obj)
!else
REQ_SRCS  = $(MODULES)
!if $(STANDALONE_SUPPRESS_EXE) == 1
#  Build object code only for top level model
PRODUCT            = "ObjectModulesOnly"
!else
PRODUCT   = $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL).exe
!endif
!endif
!endif
!else
PRODUCT   = $(MODELLIB)
REQ_SRCS  = $(MODULES)
!endif
SRCS = $(REQ_SRCS) $(USER_SRCS) $(ADD_SRCS) $(S_FUNCTIONS)
!else
MEX          = $(MATLAB_ARCH_BIN)\mex
!if "$(MODELREF_TARGET_TYPE)" == "SIM"
PRODUCT      = $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL)$(MODELREF_SFCN_SUFFIX).$(MEXEXT)
!else
PRODUCT      = $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL)_sf.$(MEXEXT)
!endif
REQ_SRCS  = $(MODULES) 
!if "$(MODELREF_TARGET_TYPE)" == "SIM"
RTW_SFUN_SRC = $(MODEL)$(MODELREF_SFCN_SUFFIX).$(TARGET_LANG_EXT)
SRCS = $(REQ_SRCS) $(USER_SRCS) $(ADD_SRCS)
!else
RTW_SFUN_SRC = $(MODEL)_sf.$(TARGET_LANG_EXT)
SRCS = $(REQ_SRCS) $(USER_SRCS) $(ADD_SRCS) $(S_FUNCTIONS)
!endif
!endif

USER_SRCS =


OBJS_CPP_UPPER = $(SRCS:.CPP=.obj)
OBJS_CPP_LOWER = $(OBJS_CPP_UPPER:.cpp=.obj)
OBJS_C_UPPER = $(OBJS_CPP_LOWER:.C=.obj)
OBJS = $(OBJS_C_UPPER:.c=.obj)
PROT_CAPIC  = $(MODEL)$(PROT_CAPIC_SUFFIX)
PROT_CAPIO  = $(MODEL)$(PROT_CAPIO_SUFFIX)
SHARED_OBJS = $(SHARED_BIN_DIR)\*.obj

#-------------------------- Additional Libraries -------------------------------

LIBS = 


LIBS = $(LIBS) $(S_FUNCTIONS_LIB)

!if $(SFCN) == 1
LIBFIXPT = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libfixedpoint.lib
LIBS     = $(LIBS) $(LIBFIXPT)
!endif

!if "$(MODELREF_TARGET_TYPE)" == "SIM"
LIBMWIPP = $(MATLAB_ROOT)\lib\win64\libmwipp.lib
LIBS     = $(LIBS) $(LIBMWIPP)
!if "$(ENABLE_SLEXEC_SSBRIDGE)" != "0"
LIBMWSLEXEC_SIMBRIDGE = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwslexec_simbridge.lib
LIBS     = $(LIBS) $(LIBMWSLEXEC_SIMBRIDGE)
!endif
!if "$(MODEL_HAS_DYNAMICALLY_LOADED_SFCNS)" != "0"
LIBMWSL_SFCN_LOADER = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsl_sfcn_loader.lib
LIBS     = $(LIBS) $(LIBMWSL_SFCN_LOADER)
!endif
!endif

LIBMWSLEXEC_SIMLOG = $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwslexec_simlog.lib
LIBS     = $(LIBS) $(LIBMWSLEXEC_SIMLOG)

LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwmathutil.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsl_fileio.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsl_simtarget_instrumentation.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsl_simtarget_core.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwcoder_ToAsyncQueueTgtAppSvc.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsl_AsyncioQueue.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\sf_runtime.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwslio_core.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwslio_clients.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwsimulink.lib
LIBS = $(LIBS) $(MATLAB_ROOT)\extern\lib\win64\microsoft\libmwstringutil.lib


#--------------------------------- Rules --------------------------------------
!if "$(ISPROTECTINGMODEL)" == "PROTECTING"
!if "$(MODELREF_TARGET_TYPE)" == "SIM"
all: set_environment_variables $(PRODUCT) $(PROT_CAPIO)
!else
all: set_environment_variables $(PRODUCT)
!endif
!else
all: set_environment_variables $(PRODUCT)
!endif

!if $(SFCN) == 0
!if "$(MODELREF_TARGET_TYPE)" == "NONE"
#--- Shared library target (.dll) ---
!if $(SHRLIBTARGET)==1
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(MODELREF_LINK_LIBS)
	@cmd /C "echo ### Linking ..."
	$(LD) $(LDFLAGS) $(SHARED_LIB) $(LIBS) \
    @$(CMD_FILE) @$(MODELREF_LINK_RSPFILE) -dll -def:$(MODEL).def -out:$@
#--- Comment out the next line to retain .lib and .exp files ---
	@del $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL)_win64.lib $(RELATIVE_PATH_TO_ANCHOR)\$(MODEL)_win64.exp
	@cmd /C "echo $(BUILD_SUCCESS) dynamically linked library  $(MODEL)_win64.dll"
!else
!if $(MAKEFILEBUILDER_TGT)==1
$(PRODUCT) : $(PREBUILT_OBJS) $(OBJS) $(MODELLIB) $(SHARED_LIB) $(LIBS) $(MODELREF_LINK_LIBS)
	@cmd /C "echo ### Linking ..."
	$(LD) $(LDFLAGS) $(MODELLIB) $(SHARED_LIB) $(LIBS) $(PREBUILT_OBJS) @$(CMD_FILE) @$(MODELREF_LINK_RSPFILE) -out:$@
	@cmd /C "echo $(BUILD_SUCCESS) executable $(MODEL).exe"
!else
!if $(STANDALONE_SUPPRESS_EXE)==1
.PHONY: $(PRODUCT)
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(MODELREF_LINK_LIBS)
	@cmd /C "echo $(BUILD_SUCCESS) executable $(PRODUCT)"
!else
#--- Stand-alone model (.exe) ---
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(MODELREF_LINK_LIBS)
	@cmd /C "echo ### Linking ..."
	$(LD) $(LDFLAGS) $(SHARED_LIB) $(LIBS) @$(CMD_FILE) @$(MODELREF_LINK_RSPFILE) -out:$@
	@cmd /C "echo $(BUILD_SUCCESS) executable $(MODEL).exe"
!endif
!endif
!endif
!else
#--- Model reference Coder Target ---
$(PRODUCT) : $(OBJS) $(SHARED_LIB)
	@cmd /C "echo ### Linking ..."
	$(LD) -lib /OUT:$(MODELLIB) @$(CMD_FILE) $(S_FUNCTIONS_LIB)
	@cmd /C "echo $(BUILD_SUCCESS) static library $(MODELLIB)"
!endif	
!else
#--- Model reference SIM Target ---
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(RTW_SFUN_SRC) $(MODELREF_LINK_LIBS)
	$(LD) -lib /OUT:$(MODELLIB) @$(CMD_FILE) $(S_FUNCTIONS_LIB)
	@cmd /C "echo  Created static library $(MODELLIB)"
	$(MEX) $(INTERLEAVED_COMPLEX_FLAGS) $(MEX_ARCH) $(MEX_DEBUG_FLAG) $(MEX_OPTS) $(MEX_OPT_FILE) $(MODELREF_INC_PATH) $(RTW_SFUN_SRC) $(MODELLIB) @$(MODELREF_LINK_RSPFILE) $(SHARED_LIB) $(LIBS) -outdir $(RELATIVE_PATH_TO_ANCHOR)
	@cmd /C "echo  $(BUILD_SUCCESS) mex file: $(PRODUCT) $(PROT_CAPIC) $(PROT_CAPIO)"
!if "$(ISPROTECTINGMODEL)" == "PROTECTING"
$(PROT_CAPIO) : $(PROT_CAPIC)
	$(CC) $(CFLAGS) -DHOST_CAPI_BUILD $(PROT_CAPIC) /Fo$(PROT_CAPIO)
!endif
!endif



#-------------------------- Support for building modules ----------------------


!if $(GEN_SAMPLE_MAIN) == 0
!if "$(TARGET_LANG_EXT)" ==  "cpp"
{$(MATLAB_ROOT)\rtw\c\src\common}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) /TP $(CPPFLAGS) $<

{$(MATLAB_ROOT)\rtw\c\src\common}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) /TP $(CPPFLAGS) $<
!else
{$(MATLAB_ROOT)\rtw\c\src\common}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<
!endif
!endif


{$(MATLAB_ROOT)\rtw\c\src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<

# Additional sources

{$(MATLAB_ROOT)\rtw\c\src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<

{$(MATLAB_ROOT)\simulink\src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<



{$(MATLAB_ROOT)\rtw\c\src}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CPPFLAGS) $<

{$(MATLAB_ROOT)\simulink\src}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CPPFLAGS) $<




# Put these rules last, otherwise nmake will check toolboxes first

{$(MATLAB_ROOT)/simulink/src}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<

{$(MATLAB_ROOT)/simulink/src}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CPPFLAGS) $<

{$(RELATIVE_PATH_TO_ANCHOR)}.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<

{$(RELATIVE_PATH_TO_ANCHOR)}.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CPPFLAGS) $<

.c.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CFLAGS) $<

.cpp.obj :
	@cmd /C "echo ### Compiling $<"
	$(CC) $(CPPFLAGS) $<

!if "$(SHARED_LIB)" != ""
$(SHARED_LIB) : $(SHARED_SRC)
	@cmd /C "echo ### Creating $@"
	@$(CC) $(CFLAGS) -Fo$(SHARED_BIN_DIR)\ @<<
$?
<<
	@$(LIBCMD) /nologo /out:$@ $(SHARED_OBJS)
	@cmd /C "echo ### $@ Created"
!endif

set_environment_variables:
	@set INCLUDE=$(INCLUDE)
	@set LIB=$(LIB)

# Libraries:






#----------------------------- Dependencies -----------------------------------

$(OBJS) : $(MAKEFILE) rtw_proj.tmw
