@echo off
set "VSCMD_START_DIR=%CD%"
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\VCVARSALL.BAT " amd64

cd .
nmake -f PassVeh7DOF.mk  GENERATE_ASAP2=0 EXTMODE_STATIC_ALLOC=0 EXTMODE_STATIC_ALLOC_SIZE=1000000 EXTMODE_TRANSPORT=0 TMW_EXTMODE_TESTING=0 OPTS="-DSLMSG_ALLOW_SYSTEM_ALLOC -DMATLAB_MEX_FILE -DTID01EQ=1"
@if errorlevel 1 goto error_exit
exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
An_error_occurred_during_the_call_to_make
