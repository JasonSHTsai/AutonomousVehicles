#include "__cf_PassVeh14DOF.h"
#include <stddef.h>
#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "PassVeh14DOF_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "PassVeh14DOF.h"
#include "PassVeh14DOF_capi.h"
#include "PassVeh14DOF_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) ,
0 , 0 , 0 , 0 , 0 } } ; static rtwCAPI_States rtBlockStates [ ] = { { 0 , 28
, TARGET_STRING ( "PassVeh14DOF/Wheels and Tires/Cont LPF/Integrator1" ) ,
TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 , 1 , - 1 , 0
} , { 1 , 32 , TARGET_STRING (
"PassVeh14DOF/Wheels and Tires/Cont LPF1/Integrator1" ) , TARGET_STRING ( ""
) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 , 0 , 1 , - 1 , 0 } , { 2 , 14 ,
TARGET_STRING (
 "PassVeh14DOF/Vehicle/Variant Subsystem/6DOF/Vehicle Body 6DOF/6DOF (Euler Angles)/p,q,r "
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 , 1 , - 1
, 0 } , { 3 , 17 , TARGET_STRING (
 "PassVeh14DOF/Vehicle/Variant Subsystem/6DOF/Vehicle Body 6DOF/6DOF (Euler Angles)/ub,vb,wb"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 , 1 , - 1
, 0 } , { 4 , 0 , TARGET_STRING (
 "PassVeh14DOF/Vehicle/Variant Subsystem/6DOF/Vehicle Body 6DOF/6DOF (Euler Angles)/xe,ye,ze"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 , 1 , - 1
, 0 } , { 5 , 48 , TARGET_STRING (
 "PassVeh14DOF/Vehicle/Variant Subsystem/6DOF/Vehicle Body 6DOF/SignalCollection/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 , 1 , - 1
, 0 } , { 6 , 6 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF1/Vertical Wheel and Unsprung Mass Response/Integrator,\nSecond-Order"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 , 1 , - 1
, 0 } , { 7 , 8 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF2/Vertical Wheel and Unsprung Mass Response/Integrator,\nSecond-Order"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 , 1 , - 1
, 0 } , { 8 , 10 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF3/Vertical Wheel and Unsprung Mass Response/Integrator,\nSecond-Order"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 , 1 , - 1
, 0 } , { 9 , 12 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF4/Vertical Wheel and Unsprung Mass Response/Integrator,\nSecond-Order"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 3 , 0 , 0 , 1 , - 1
, 0 } , { 10 , 3 , TARGET_STRING (
 "PassVeh14DOF/Vehicle/Variant Subsystem/6DOF/Vehicle Body 6DOF/6DOF (Euler Angles)/Calculate DCM &\nEuler Angles/phi\ntheta\npsi"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 , 1 , - 1
, 0 } , { 11 , 20 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF1/Magic Tire Const Input/Fx Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 12 , 24 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF1/Magic Tire Const Input/Fy Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 13 , 44 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF1/Magic Tire Const Input/My Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 14 , 54 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF1/Wheel Module/Unlocked/Output\nIntegrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 15 , 21 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF2/Magic Tire Const Input/Fx Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 16 , 25 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF2/Magic Tire Const Input/Fy Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 17 , 45 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF2/Magic Tire Const Input/My Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 18 , 53 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF2/Wheel Module/Unlocked/Output\nIntegrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 19 , 22 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF3/Magic Tire Const Input/Fx Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 20 , 26 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF3/Magic Tire Const Input/Fy Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 21 , 46 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF3/Magic Tire Const Input/My Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 22 , 52 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF3/Wheel Module/Unlocked/Output\nIntegrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 23 , 23 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF4/Magic Tire Const Input/Fx Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 24 , 27 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF4/Magic Tire Const Input/Fy Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 25 , 47 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF4/Magic Tire Const Input/My Relaxation/Integrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 26 , 51 , TARGET_STRING (
 "PassVeh14DOF/Wheels and Tires/VDBS/Tires/Combined Slip Wheel 2DOF4/Wheel Module/Unlocked/Output\nIntegrator"
) , TARGET_STRING ( "" ) , TARGET_STRING ( "" ) , 0 , 0 , 4 , 0 , 0 , 1 , - 1
, 0 } , { 0 , - 1 , ( NULL ) , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 , 0 ,
- 1 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void PassVeh14DOF_InitializeDataAddr ( void * dataAddr [ ] ,
jb251fek03 * localDW , h21fsrthfa * localX ) { dataAddr [ 0 ] = ( void * ) (
& localX -> kfwl4vh4ya [ 0 ] ) ; dataAddr [ 1 ] = ( void * ) ( & localX ->
gzfff0ykvc [ 0 ] ) ; dataAddr [ 2 ] = ( void * ) ( & localX -> c41i2vew3d [ 0
] ) ; dataAddr [ 3 ] = ( void * ) ( & localX -> kcxe1zwvej [ 0 ] ) ; dataAddr
[ 4 ] = ( void * ) ( & localX -> no333vrjos [ 0 ] ) ; dataAddr [ 5 ] = ( void
* ) ( & localX -> l1fffzdicr [ 0 ] ) ; dataAddr [ 6 ] = ( void * ) ( & localX
-> eufwglziep [ 0 ] ) ; dataAddr [ 7 ] = ( void * ) ( & localX -> ihe4sxxlvc
[ 0 ] ) ; dataAddr [ 8 ] = ( void * ) ( & localX -> l0lqq4gtqn [ 0 ] ) ;
dataAddr [ 9 ] = ( void * ) ( & localX -> m0fpsxn2xn [ 0 ] ) ; dataAddr [ 10
] = ( void * ) ( & localX -> ldcvdrnh2h [ 0 ] ) ; dataAddr [ 11 ] = ( void *
) ( & localX -> idqz3tjuw4 ) ; dataAddr [ 12 ] = ( void * ) ( & localX ->
lh3obehys4 ) ; dataAddr [ 13 ] = ( void * ) ( & localX -> ipvx2wbgju ) ;
dataAddr [ 14 ] = ( void * ) ( & localX -> m1wmcftuob ) ; dataAddr [ 15 ] = (
void * ) ( & localX -> mcmrehmbkw ) ; dataAddr [ 16 ] = ( void * ) ( & localX
-> eeirdplhld ) ; dataAddr [ 17 ] = ( void * ) ( & localX -> jmexnvimnu ) ;
dataAddr [ 18 ] = ( void * ) ( & localX -> o1gbxchpnp ) ; dataAddr [ 19 ] = (
void * ) ( & localX -> ed1gn011qn ) ; dataAddr [ 20 ] = ( void * ) ( & localX
-> kjcr23sin3 ) ; dataAddr [ 21 ] = ( void * ) ( & localX -> je0khsfm20 ) ;
dataAddr [ 22 ] = ( void * ) ( & localX -> n0nlciaulx ) ; dataAddr [ 23 ] = (
void * ) ( & localX -> p4a4un11lb ) ; dataAddr [ 24 ] = ( void * ) ( & localX
-> k4uvvxny25 ) ; dataAddr [ 25 ] = ( void * ) ( & localX -> lv5ani3vex ) ;
dataAddr [ 26 ] = ( void * ) ( & localX -> meykvzuaix ) ; }
#endif
#ifndef HOST_CAPI_BUILD
static void PassVeh14DOF_InitializeVarDimsAddr ( int32_T * vardimsAddr [ ] )
{ vardimsAddr [ 0 ] = ( NULL ) ; }
#endif
#ifndef HOST_CAPI_BUILD
static void PassVeh14DOF_InitializeLoggingFunctions ( RTWLoggingFcnPtr
loggingPtrs [ ] ) { loggingPtrs [ 0 ] = ( NULL ) ; loggingPtrs [ 1 ] = ( NULL
) ; loggingPtrs [ 2 ] = ( NULL ) ; loggingPtrs [ 3 ] = ( NULL ) ; loggingPtrs
[ 4 ] = ( NULL ) ; loggingPtrs [ 5 ] = ( NULL ) ; loggingPtrs [ 6 ] = ( NULL
) ; loggingPtrs [ 7 ] = ( NULL ) ; loggingPtrs [ 8 ] = ( NULL ) ; loggingPtrs
[ 9 ] = ( NULL ) ; loggingPtrs [ 10 ] = ( NULL ) ; loggingPtrs [ 11 ] = (
NULL ) ; loggingPtrs [ 12 ] = ( NULL ) ; loggingPtrs [ 13 ] = ( NULL ) ;
loggingPtrs [ 14 ] = ( NULL ) ; loggingPtrs [ 15 ] = ( NULL ) ; loggingPtrs [
16 ] = ( NULL ) ; loggingPtrs [ 17 ] = ( NULL ) ; loggingPtrs [ 18 ] = ( NULL
) ; loggingPtrs [ 19 ] = ( NULL ) ; loggingPtrs [ 20 ] = ( NULL ) ;
loggingPtrs [ 21 ] = ( NULL ) ; loggingPtrs [ 22 ] = ( NULL ) ; loggingPtrs [
23 ] = ( NULL ) ; loggingPtrs [ 24 ] = ( NULL ) ; loggingPtrs [ 25 ] = ( NULL
) ; loggingPtrs [ 26 ] = ( NULL ) ; }
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_VECTOR , 4 , 2 , 0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , {
rtwCAPI_SCALAR , 8 , 2 , 0 } } ; static uint_T rtDimensionArray [ ] = { 4 , 1
, 12 , 1 , 3 , 1 , 2 , 1 , 1 , 1 } ; static const real_T rtcapiStoredFloats [
] = { 0.0 } ; static rtwCAPI_FixPtMap rtFixPtMap [ ] = { { ( NULL ) , ( NULL
) , rtwCAPI_FIX_RESERVED , 0 , 0 , 0 } , } ; static rtwCAPI_SampleTimeMap
rtSampleTimeMap [ ] = { { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , 0 , 0 } } ; static int_T
rtContextSystems [ 27 ] ; static rtwCAPI_LoggingMetaInfo loggingMetaInfo [ ]
= { { 0 , 0 , "" , 0 } } ; static rtwCAPI_ModelMapLoggingStaticInfo
mmiStaticInfoLogging = { 27 , rtContextSystems , loggingMetaInfo , 0 , NULL ,
{ 0 , NULL , NULL } , 0 , ( NULL ) } ; static rtwCAPI_ModelMappingStaticInfo
mmiStatic = { { rtBlockSignals , 0 , ( NULL ) , 0 , ( NULL ) , 0 } , { ( NULL
) , 0 , ( NULL ) , 0 } , { rtBlockStates , 27 } , { rtDataTypeMap ,
rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap ,
rtDimensionArray } , "float" , { 559083395U , 1772204156U , 1505529493U ,
2750294466U } , & mmiStaticInfoLogging , 0 , 0 } ; const
rtwCAPI_ModelMappingStaticInfo * PassVeh14DOF_GetCAPIStaticMap ( void ) {
return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
static void PassVeh14DOF_InitializeSystemRan ( gwlxzditat * const ke3gqsjzkb
, sysRanDType * systemRan [ ] , jb251fek03 * localDW , int_T systemTid [ ] ,
void * rootSysRanPtr , int rootTid ) { UNUSED_PARAMETER ( ke3gqsjzkb ) ;
UNUSED_PARAMETER ( localDW ) ; systemRan [ 0 ] = ( sysRanDType * )
rootSysRanPtr ; systemRan [ 1 ] = ( NULL ) ; systemRan [ 2 ] = ( NULL ) ;
systemRan [ 3 ] = ( NULL ) ; systemRan [ 4 ] = ( NULL ) ; systemRan [ 5 ] = (
NULL ) ; systemRan [ 6 ] = ( NULL ) ; systemRan [ 7 ] = ( NULL ) ; systemRan
[ 8 ] = ( NULL ) ; systemRan [ 9 ] = ( NULL ) ; systemRan [ 10 ] = ( NULL ) ;
systemRan [ 11 ] = ( NULL ) ; systemRan [ 12 ] = ( NULL ) ; systemRan [ 13 ]
= ( sysRanDType * ) & localDW -> j1v2vr3ni02 . l4d4azv51v ; systemRan [ 14 ]
= ( sysRanDType * ) & localDW -> dkbssg2uao ; systemRan [ 15 ] = ( NULL ) ;
systemRan [ 16 ] = ( sysRanDType * ) & localDW -> fjwdrhn2a0 . l4d4azv51v ;
systemRan [ 17 ] = ( sysRanDType * ) & localDW -> bfdxd303bq ; systemRan [ 18
] = ( NULL ) ; systemRan [ 19 ] = ( sysRanDType * ) & localDW -> ixiqzrysul .
l4d4azv51v ; systemRan [ 20 ] = ( sysRanDType * ) & localDW -> btizuzq5ex ;
systemRan [ 21 ] = ( NULL ) ; systemRan [ 22 ] = ( sysRanDType * ) & localDW
-> kqrxum2gnp . l4d4azv51v ; systemRan [ 23 ] = ( sysRanDType * ) & localDW
-> ibvcioeyvl ; systemRan [ 24 ] = ( NULL ) ; systemRan [ 25 ] = ( NULL ) ;
systemRan [ 26 ] = ( NULL ) ; systemTid [ 1 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 2 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 3 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 4 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 5 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 6 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 7 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 8 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 9 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 10 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 11 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 12 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 15 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 18 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 21 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 13 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 16 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 19 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 22 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 14 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 17 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 20 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 23 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 24 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 25 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 26 ] = ke3gqsjzkb -> Timing .
mdlref_GlobalTID [ 0 ] ; systemTid [ 0 ] = rootTid ; rtContextSystems [ 0 ] =
0 ; rtContextSystems [ 1 ] = 0 ; rtContextSystems [ 2 ] = 0 ;
rtContextSystems [ 3 ] = 0 ; rtContextSystems [ 4 ] = 0 ; rtContextSystems [
5 ] = 0 ; rtContextSystems [ 6 ] = 0 ; rtContextSystems [ 7 ] = 0 ;
rtContextSystems [ 8 ] = 0 ; rtContextSystems [ 9 ] = 0 ; rtContextSystems [
10 ] = 0 ; rtContextSystems [ 11 ] = 0 ; rtContextSystems [ 12 ] = 0 ;
rtContextSystems [ 13 ] = 13 ; rtContextSystems [ 14 ] = 14 ;
rtContextSystems [ 15 ] = 0 ; rtContextSystems [ 16 ] = 16 ; rtContextSystems
[ 17 ] = 17 ; rtContextSystems [ 18 ] = 0 ; rtContextSystems [ 19 ] = 19 ;
rtContextSystems [ 20 ] = 20 ; rtContextSystems [ 21 ] = 0 ; rtContextSystems
[ 22 ] = 22 ; rtContextSystems [ 23 ] = 23 ; rtContextSystems [ 24 ] = 0 ;
rtContextSystems [ 25 ] = 0 ; rtContextSystems [ 26 ] = 0 ; }
#endif
#ifndef HOST_CAPI_BUILD
void PassVeh14DOF_InitializeDataMapInfo ( gwlxzditat * const ke3gqsjzkb ,
jb251fek03 * localDW , h21fsrthfa * localX , void * sysRanPtr , int
contextTid ) { rtwCAPI_SetVersion ( ke3gqsjzkb -> DataMapInfo . mmi , 1 ) ;
rtwCAPI_SetStaticMap ( ke3gqsjzkb -> DataMapInfo . mmi , & mmiStatic ) ;
rtwCAPI_SetLoggingStaticMap ( ke3gqsjzkb -> DataMapInfo . mmi , &
mmiStaticInfoLogging ) ; PassVeh14DOF_InitializeDataAddr ( ke3gqsjzkb ->
DataMapInfo . dataAddress , localDW , localX ) ; rtwCAPI_SetDataAddressMap (
ke3gqsjzkb -> DataMapInfo . mmi , ke3gqsjzkb -> DataMapInfo . dataAddress ) ;
PassVeh14DOF_InitializeVarDimsAddr ( ke3gqsjzkb -> DataMapInfo .
vardimsAddress ) ; rtwCAPI_SetVarDimsAddressMap ( ke3gqsjzkb -> DataMapInfo .
mmi , ke3gqsjzkb -> DataMapInfo . vardimsAddress ) ; rtwCAPI_SetPath (
ke3gqsjzkb -> DataMapInfo . mmi , ( NULL ) ) ; rtwCAPI_SetFullPath (
ke3gqsjzkb -> DataMapInfo . mmi , ( NULL ) ) ;
PassVeh14DOF_InitializeLoggingFunctions ( ke3gqsjzkb -> DataMapInfo .
loggingPtrs ) ; rtwCAPI_SetLoggingPtrs ( ke3gqsjzkb -> DataMapInfo . mmi ,
ke3gqsjzkb -> DataMapInfo . loggingPtrs ) ; rtwCAPI_SetInstanceLoggingInfo (
ke3gqsjzkb -> DataMapInfo . mmi , & ke3gqsjzkb -> DataMapInfo .
mmiLogInstanceInfo ) ; rtwCAPI_SetChildMMIArray ( ke3gqsjzkb -> DataMapInfo .
mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( ke3gqsjzkb -> DataMapInfo .
mmi , 0 ) ; PassVeh14DOF_InitializeSystemRan ( ke3gqsjzkb , ke3gqsjzkb ->
DataMapInfo . systemRan , localDW , ke3gqsjzkb -> DataMapInfo . systemTid ,
sysRanPtr , contextTid ) ; rtwCAPI_SetSystemRan ( ke3gqsjzkb -> DataMapInfo .
mmi , ke3gqsjzkb -> DataMapInfo . systemRan ) ; rtwCAPI_SetSystemTid (
ke3gqsjzkb -> DataMapInfo . mmi , ke3gqsjzkb -> DataMapInfo . systemTid ) ;
rtwCAPI_SetGlobalTIDMap ( ke3gqsjzkb -> DataMapInfo . mmi , & ke3gqsjzkb ->
Timing . mdlref_GlobalTID [ 0 ] ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void PassVeh14DOF_host_InitializeDataMapInfo (
PassVeh14DOF_host_DataMapInfo_T * dataMap , const char * path ) {
rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap ->
mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
