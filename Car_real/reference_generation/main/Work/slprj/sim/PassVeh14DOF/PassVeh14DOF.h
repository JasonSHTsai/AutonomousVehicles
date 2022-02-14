#include "__cf_PassVeh14DOF.h"
#ifndef RTW_HEADER_PassVeh14DOF_h_
#define RTW_HEADER_PassVeh14DOF_h_
#include <string.h>
#include <stddef.h>
#include "rtw_modelmap.h"
#ifndef PassVeh14DOF_COMMON_INCLUDES_
#define PassVeh14DOF_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "zero_crossing_types.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "sf_runtime/sfc_sdi.h"
#endif
#include "PassVeh14DOF_types.h"
#include "multiword_types.h"
#include "model_reference_types.h"
#include "rt_zcfcn.h"
#include "mwmathutil.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
typedef struct { real_T khlpfqk2jg ; real_T nspwvhpzh3 ; real_T apvbhtn4wk ;
real_T dfvv0jsoi5 ; real_T dtftqw0qvd [ 4 ] ; real_T lqtkv1ipti ; real_T
nui5bvb4c3 ; real_T fnljuzdawj ; real_T ibb0jsbmw0 [ 3 ] ; real_T hdcbnxpqoe
; } exdiphdhku ; typedef struct { real_T ecekd2bskk [ 5 ] ; real_T eqv04ynwza
[ 4 ] ; real_T gzivnhba1z [ 4 ] ; uint32_T f4cv2j3wms [ 20 ] ; uint32_T
p4rcvvphuj [ 12 ] ; uint32_T cqtudz4kfo [ 4 ] ; } muiqahmjfe ; typedef struct
{ real_T lhj000rtkx ; real_T fmwdo2zd0u [ 3 ] ; real_T idcmfgriae [ 3 ] ;
real_T ndde25tvma [ 3 ] ; } ki42lj4r0x ; typedef struct { real_T pzmjtz3z0x [
3 ] ; real_T bzc14ug5sn ; real_T kokvxrvgy1 ; real_T dlobtdfs1t [ 3 ] ;
real_T b2qxfnkich ; real_T phakuyk2s1 [ 2 ] ; real_T cu1cqdhpsa [ 2 ] ;
real_T etorqi4lnq [ 2 ] ; real_T attzqdwunf ; real_T ps2hhfu00k ; real_T
lvg4y5grnk ; real_T lztexopt0s ; real_T hxfcxkefhi [ 2 ] ; real_T ic51xjj3q3
[ 2 ] ; real_T c2bk3hh5z4 [ 2 ] ; real_T d4rljg5beb [ 2 ] ; real_T oy2v2j4gzf
[ 2 ] ; real_T c2cdrw2ib3 ; real_T fliroow0qd ; real_T hd12bdkc3g ; real_T
eopyb04xw2 ; } etke2ydk1y ; typedef struct { int_T ddlgd3zdsx ; int_T
psjjosm3xq ; } fboxqfegt3 ; typedef struct { real_T pos4xcljri ; real_T
hoow03ouop [ 3 ] ; real_T fdalzibzu1 ; real_T nvuaxut2ed ; real_T gneh0il150
; } gxtyyin5vv ; typedef struct { real_T pos4xcljri ; real_T hoow03ouop [ 3 ]
; real_T fdalzibzu1 ; real_T nvuaxut2ed ; real_T gneh0il150 ; } ozwado25sx ;
typedef struct { boolean_T pos4xcljri ; boolean_T hoow03ouop [ 3 ] ;
boolean_T fdalzibzu1 ; boolean_T nvuaxut2ed ; boolean_T gneh0il150 ; }
dyurqxmext ; typedef struct { real_T pos4xcljri ; real_T hoow03ouop [ 3 ] ;
real_T fdalzibzu1 ; real_T nvuaxut2ed ; real_T gneh0il150 ; } pslmckgi5r ;
typedef struct { real_T p3yghxczds ; real_T dflgyzq55z ; real_T bfjnpwszxf ;
real_T o5fxrlkjgq ; real_T djyoncg10q ; real_T aumo1zp5fh ; } f0x0pnopzb ;
typedef struct { real_T e0n1lwsrt3 ; real_T mnbzodcojv ; real_T ix5pfkaoqj ;
real_T bxchzoguun [ 4 ] ; real_T m4sbb00thk ; real_T erelfflxhn ; real_T
mbebfjdycm ; real_T cp1wbw3mbn [ 3 ] ; real_T g1r4rwnwko ; } grzc5h25wp ;
typedef struct { real_T ccockztjhw [ 5 ] ; real_T ngpcpzv5be [ 4 ] ; real_T
ioltbmloy2 [ 4 ] ; uint32_T bpcy1j4es5 [ 20 ] ; uint32_T pflcanhhty [ 12 ] ;
uint32_T oklwkkkbij [ 4 ] ; } deiedt3qzb ; typedef struct { real_T buk3pxok13
; real_T htrdmarbpl ; real_T j4djv3ezpm ; real_T dtpyb2kwmz ; real_T
o1r0lsfaz1 ; real_T jtzecmthd5 ; real_T egitefevxi ; } fkagotctmb ; typedef
struct { real_T hxpvc5s312 ; } fkschrmm5b ; typedef struct { int8_T
l4d4azv51v ; } d133cyc3uj ; typedef struct { real_T csvp2uqutm [ 3 ] ; real_T
flapp52v51 [ 3 ] ; real_T dopey0jcya [ 3 ] ; real_T jhclbwrd1y [ 3 ] ; real_T
axnczp2woh [ 12 ] ; real_T evus4tqoqe [ 3 ] ; real_T g3ssyebcmw [ 4 ] ;
real_T jkfzj43gcr ; real_T g3xbmvm5ne [ 4 ] ; real_T mdj1algbqf [ 4 ] ;
real_T fu51mwe1yw ; real_T knqraypmkj ; real_T am1545q1xi ; real_T hqk5fjtzdb
; real_T d1yoqencx4 ; real_T leczo5c4ny ; real_T fga2zpcuds ; real_T
jf5ej2nepk ; real_T k10x1uys2h [ 2 ] ; real_T oxvjzn1n4p ; real_T cvgzttc5bc
[ 4 ] ; real_T pwjvykq145 [ 4 ] ; real_T oq5z3i24ch [ 12 ] ; real_T
no3naicxwm [ 4 ] ; real_T drsrfk4yrb [ 4 ] ; real_T lapgnqnpo1 [ 4 ] ; real_T
msxnx1rxyl [ 96 ] ; real_T nn3qe1cgua ; real_T ej4h3qftlk ; real_T o3sdgl5uvn
; real_T d4uhylr3qj ; real_T ekoyxczd41 ; real_T aso3crjtzu ; real_T
otjmmiyqdk ; real_T fau4seoka2 ; real_T nzx05e5tya ; real_T crl3sqq1pm ;
real_T cnh5nrspat ; real_T jnfsb3st2w ; real_T jmyxwkozy1 ; real_T drkmnry2a2
; real_T maqmzuohyy ; real_T cpuaid5y20 ; real_T msrshsqqn5 ; real_T
kiqcosgfid ; real_T ltmq4jyju1 ; real_T budg5mw1ex ; real_T eqixaagv53 ;
real_T a4hyzr34pd ; real_T fsspgs5zll ; real_T e1iag04ui1 ; real_T iifdbwtoab
[ 4 ] ; real_T c2l1wizjnd [ 4 ] ; real_T flw3y2kwx4 [ 6 ] ; real_T njyiuh0nd1
; real_T iarhj231fw [ 2 ] ; real_T ixkej2t4jk [ 3 ] ; real_T bhfe0aulpy [ 3 ]
; real_T mhejf1laqv [ 3 ] ; real_T l4x2v4y22j [ 3 ] ; real_T czp0euuw1x [ 3 ]
; real_T do2afh3dk0 ; real_T f3iuo3heoy [ 6 ] ; real_T kzjhcok0s0 ; real_T
emrscwetgm [ 3 ] ; real_T dnfw0z1po0 [ 3 ] ; real_T en3pfi2zda ; real_T
cupzfhrfkv ; real_T gmdrvx3n0m ; real_T l2440bik14 [ 9 ] ; real_T db4hxovsve
[ 9 ] ; real_T gcvk1h4ctz ; real_T l3kc4yztlu ; real_T oajqf54kkf [ 9 ] ;
real_T mllcy2rex1 [ 3 ] ; real_T l3ty1ff3aa ; real_T kqp3e12vdc [ 4 ] ;
real_T cgrfmifeom ; real_T dnzxcedfqm [ 12 ] ; real_T abl4csdhwt ; real_T
ij1kpfvn2e ; real_T cwa2ohvta5 ; real_T bvnbtqkokw ; real_T nhgh55f4de ;
real_T alaoirxfvn ; real_T gou5ilrf0f ; real_T cdawaiktul ; real_T acrsk01ygz
; real_T ewos21todq ; real_T hoxxvrg3dh ; real_T mxnkjof4t5 ; real_T
n00f4u5rcm ; real_T efgfvqyphj ; real_T f5kjr5n2yd ; real_T adlifxmpm4 ;
real_T nhkj4pnafr ; real_T lkskbplrw0 ; real_T labyihuhw3 ; real_T cwcq2k12hn
; real_T f0tfa2w5xs ; real_T pexhwf3ywa ; real_T hyu3l3fynk ; real_T
i5v535gi0h ; real_T d5hcj4huaz [ 4 ] ; real_T elxol4mooo [ 4 ] ; real_T
dnxodpg1vk ; real_T jg32qzeqca ; real_T fgikbgxt3s ; real_T o30whmbe1q ;
real_T lxl4nfrwib [ 4 ] ; real_T bkwfb5jdpg [ 4 ] ; real_T nxjbew1wwk [ 6 ] ;
real_T cdi2pibu5w [ 6 ] ; real_T drmt2ojpxz [ 2 ] ; real_T fjkuaee023 [ 3 ] ;
real_T cfxvkdjvqp [ 3 ] ; real_T nvbgs1wmdw [ 9 ] ; real_T psky2ribkk [ 6 ] ;
real_T hrdwlbur3u [ 6 ] ; real_T iawgisugjf [ 6 ] ; real_T cznzp5uome [ 2 ] ;
real_T oitmrlieuq [ 6 ] ; real_T dv2lxdtk0g [ 6 ] ; real_T pqfxvtw253 [ 2 ] ;
boolean_T dvn3c4mg2w ; boolean_T no35hre2m4 ; boolean_T l20lel4ud0 ;
boolean_T coyo23epj3 ; boolean_T fjgfwgygj4 ; boolean_T f5ktezcv34 ;
boolean_T pm4zm1veab ; boolean_T iopsmmtm0o ; boolean_T ci4r0ggs0m ;
boolean_T ab1ihsw042 ; boolean_T b0kf3ioomh ; boolean_T gydco5nvig ;
fkschrmm5b kqrxum2gnp ; fkagotctmb jhtwnlt1ie ; fkschrmm5b ixiqzrysul ;
fkagotctmb kyvwiklsk5 ; fkschrmm5b fjwdrhn2a0 ; fkagotctmb lb0iwxvl0i ;
fkschrmm5b j1v2vr3ni02 ; fkagotctmb du4idj3r2n ; grzc5h25wp e5txhvyaxi [ 2 ]
; etke2ydk1y g1gkz1z5tw [ 1 ] ; ki42lj4r0x pgolrrskid [ 2 ] ; exdiphdhku
dif5k2yfnn [ 2 ] ; } k0r514zhkn ; typedef struct { real_T e0pxtyglc2 [ 9 ] ;
int_T mutib5qz5l ; int_T hyrkpl0xyz ; int_T htxrd3mf4i ; int_T ljo1yyhyse ;
int_T j5ppk4511u ; int_T m1qiukcd5e ; int_T kt0dfc3wjv ; int_T lxpljvgpzk ;
int_T adej5c1j1a ; int_T hym2jyf0ut ; int_T atpnbjxwe3 ; int_T goerml3zcp ;
int_T bg14ovzpgb ; int_T hzzqkmagaw ; int_T ogcn1oziml ; int_T lhnbrzycc5 ;
int8_T koqfqldm3o ; int8_T d23wknetoy ; int8_T pxrv1psgdx ; int8_T eozgvlzknz
; int8_T aiq32d50za ; int8_T ibvcioeyvl ; int8_T btizuzq5ex ; int8_T
bfdxd303bq ; int8_T dkbssg2uao ; boolean_T pdp3boye41 ; boolean_T kbbdmrrxay
; boolean_T jboq3cxrvt ; boolean_T ea3pljkb52 ; boolean_T evfmdqoro0 ;
boolean_T ienan433un ; boolean_T dk3a43g2ib ; boolean_T p1bo0wo5is ;
boolean_T atv5tjtt5d ; boolean_T owayzmvelu ; boolean_T fejihhdva1 ;
boolean_T eezfozm4i1 ; d133cyc3uj kqrxum2gnp ; d133cyc3uj ixiqzrysul ;
d133cyc3uj fjwdrhn2a0 ; d133cyc3uj j1v2vr3ni02 ; deiedt3qzb e5txhvyaxi [ 2 ]
; fboxqfegt3 g1gkz1z5tw [ 1 ] ; muiqahmjfe dif5k2yfnn [ 2 ] ; } jb251fek03 ;
typedef struct { real_T no333vrjos [ 3 ] ; real_T ldcvdrnh2h [ 3 ] ; real_T
eufwglziep [ 2 ] ; real_T ihe4sxxlvc [ 2 ] ; real_T l0lqq4gtqn [ 2 ] ; real_T
m0fpsxn2xn [ 2 ] ; real_T c41i2vew3d [ 3 ] ; real_T kcxe1zwvej [ 3 ] ; real_T
idqz3tjuw4 ; real_T mcmrehmbkw ; real_T ed1gn011qn ; real_T p4a4un11lb ;
real_T lh3obehys4 ; real_T eeirdplhld ; real_T kjcr23sin3 ; real_T k4uvvxny25
; real_T kfwl4vh4ya [ 4 ] ; real_T gzfff0ykvc [ 12 ] ; real_T ipvx2wbgju ;
real_T jmexnvimnu ; real_T je0khsfm20 ; real_T lv5ani3vex ; real_T l1fffzdicr
[ 3 ] ; real_T meykvzuaix ; real_T n0nlciaulx ; real_T o1gbxchpnp ; real_T
m1wmcftuob ; gxtyyin5vv g1gkz1z5tw [ 1 ] ; } h21fsrthfa ; typedef int_T
hn13clrkfo [ 3 ] ; typedef real_T ja0rmqcfdg [ 6 ] ; typedef struct { real_T
no333vrjos [ 3 ] ; real_T ldcvdrnh2h [ 3 ] ; real_T eufwglziep [ 2 ] ; real_T
ihe4sxxlvc [ 2 ] ; real_T l0lqq4gtqn [ 2 ] ; real_T m0fpsxn2xn [ 2 ] ; real_T
c41i2vew3d [ 3 ] ; real_T kcxe1zwvej [ 3 ] ; real_T idqz3tjuw4 ; real_T
mcmrehmbkw ; real_T ed1gn011qn ; real_T p4a4un11lb ; real_T lh3obehys4 ;
real_T eeirdplhld ; real_T kjcr23sin3 ; real_T k4uvvxny25 ; real_T kfwl4vh4ya
[ 4 ] ; real_T gzfff0ykvc [ 12 ] ; real_T ipvx2wbgju ; real_T jmexnvimnu ;
real_T je0khsfm20 ; real_T lv5ani3vex ; real_T l1fffzdicr [ 3 ] ; real_T
meykvzuaix ; real_T n0nlciaulx ; real_T o1gbxchpnp ; real_T m1wmcftuob ;
ozwado25sx g1gkz1z5tw [ 1 ] ; } ectmdkaxud ; typedef struct { boolean_T
no333vrjos [ 3 ] ; boolean_T ldcvdrnh2h [ 3 ] ; boolean_T eufwglziep [ 2 ] ;
boolean_T ihe4sxxlvc [ 2 ] ; boolean_T l0lqq4gtqn [ 2 ] ; boolean_T
m0fpsxn2xn [ 2 ] ; boolean_T c41i2vew3d [ 3 ] ; boolean_T kcxe1zwvej [ 3 ] ;
boolean_T idqz3tjuw4 ; boolean_T mcmrehmbkw ; boolean_T ed1gn011qn ;
boolean_T p4a4un11lb ; boolean_T lh3obehys4 ; boolean_T eeirdplhld ;
boolean_T kjcr23sin3 ; boolean_T k4uvvxny25 ; boolean_T kfwl4vh4ya [ 4 ] ;
boolean_T gzfff0ykvc [ 12 ] ; boolean_T ipvx2wbgju ; boolean_T jmexnvimnu ;
boolean_T je0khsfm20 ; boolean_T lv5ani3vex ; boolean_T l1fffzdicr [ 3 ] ;
boolean_T meykvzuaix ; boolean_T n0nlciaulx ; boolean_T o1gbxchpnp ;
boolean_T m1wmcftuob ; dyurqxmext g1gkz1z5tw [ 1 ] ; } gy0s4k0fxb ; typedef
struct { real_T no333vrjos [ 3 ] ; real_T ldcvdrnh2h [ 3 ] ; real_T
eufwglziep [ 2 ] ; real_T ihe4sxxlvc [ 2 ] ; real_T l0lqq4gtqn [ 2 ] ; real_T
m0fpsxn2xn [ 2 ] ; real_T c41i2vew3d [ 3 ] ; real_T kcxe1zwvej [ 3 ] ; real_T
idqz3tjuw4 ; real_T mcmrehmbkw ; real_T ed1gn011qn ; real_T p4a4un11lb ;
real_T lh3obehys4 ; real_T eeirdplhld ; real_T kjcr23sin3 ; real_T k4uvvxny25
; real_T kfwl4vh4ya [ 4 ] ; real_T gzfff0ykvc [ 12 ] ; real_T ipvx2wbgju ;
real_T jmexnvimnu ; real_T je0khsfm20 ; real_T lv5ani3vex ; real_T l1fffzdicr
[ 3 ] ; real_T meykvzuaix ; real_T n0nlciaulx ; real_T o1gbxchpnp ; real_T
m1wmcftuob ; pslmckgi5r g1gkz1z5tw [ 1 ] ; } mq10j5tdpd ; typedef struct {
real_T ijcavszuta ; real_T k55kyvkfqh ; real_T pieucidukw ; real_T kn0tdkxhx5
; real_T iw3ddxlz31 ; real_T p3hjixxfis ; real_T khnfwmo1pb ; real_T
pfyfsrsvfe ; real_T lqlhdmkeoq ; real_T itv03dtqiz ; real_T k13ctkucdy ;
real_T nim0ulnh3c ; f0x0pnopzb g1gkz1z5tw [ 1 ] ; } beahf2xhqn ; typedef
struct { ZCSigState aqk2hvz0wg ; ZCSigState e0qd4rih2m ; ZCSigState
p1b4jcz4mq ; ZCSigState du2pst34cf ; } hgp0bjgtdb ; struct oe5a2grwh3_ {
real_T P_0 [ 2 ] ; real_T P_1 ; real_T P_2 ; real_T P_3 [ 4 ] ; real_T P_4 [
4 ] ; real_T P_5 ; real_T P_6 ; real_T P_7 ; real_T P_8 ; real_T P_9 ; real_T
P_10 ; real_T P_11 [ 3 ] ; real_T P_12 [ 3 ] ; real_T P_13 ; real_T P_14 ;
real_T P_15 ; real_T P_16 [ 3 ] ; uint32_T P_17 [ 5 ] ; uint32_T P_18 [ 5 ] ;
uint32_T P_19 [ 4 ] ; uint32_T P_20 [ 4 ] ; uint32_T P_21 [ 4 ] ; uint32_T
P_22 [ 4 ] ; } ; struct h3cjktwas0_ { real_T P_0 ; real_T P_1 ; real_T P_2 ;
real_T P_3 ; } ; struct k51ujc0tc4_ { real_T P_0 ; real_T P_1 ; real_T P_2 ;
real_T P_3 ; real_T P_4 ; real_T P_5 ; real_T P_6 [ 3 ] ; real_T P_7 ; real_T
P_8 ; real_T P_9 ; real_T P_10 ; real_T P_11 ; real_T P_12 ; real_T P_13 ;
real_T P_14 ; real_T P_15 ; real_T P_16 ; real_T P_17 ; real_T P_18 ; real_T
P_19 ; real_T P_20 ; } ; struct ob1e1skp0y_ { real_T P_0 [ 2 ] ; real_T P_1 ;
real_T P_2 ; real_T P_3 [ 4 ] ; real_T P_4 [ 4 ] ; real_T P_5 ; real_T P_6 ;
real_T P_7 ; real_T P_8 ; real_T P_9 ; real_T P_10 ; real_T P_11 [ 3 ] ;
real_T P_12 [ 3 ] ; real_T P_13 ; real_T P_14 ; real_T P_15 ; real_T P_16 [ 3
] ; uint32_T P_17 [ 5 ] ; uint32_T P_18 [ 5 ] ; uint32_T P_19 [ 4 ] ;
uint32_T P_20 [ 4 ] ; uint32_T P_21 [ 4 ] ; uint32_T P_22 [ 4 ] ; } ; struct
ne2r23ah24_ { real_T P_0 ; real_T P_1 ; } ; struct l0o1fxj1vpq_ { real_T P_0
; real_T P_1 ; real_T P_2 ; real_T P_3 ; real_T P_4 ; real_T P_5 ; real_T P_6
; real_T P_7 ; real_T P_8 ; real_T P_9 ; real_T P_10 ; real_T P_11 [ 2 ] ;
real_T P_12 [ 2 ] ; real_T P_13 ; real_T P_14 ; real_T P_15 ; real_T P_16 ;
real_T P_17 ; real_T P_18 ; real_T P_19 ; real_T P_20 ; real_T P_21 ; real_T
P_22 ; real_T P_23 ; real_T P_24 ; real_T P_25 ; real_T P_26 ; real_T P_27 ;
real_T P_28 [ 31 ] ; real_T P_29 [ 31 ] ; real_T P_30 ; real_T P_31 ; real_T
P_32 ; real_T P_33 ; real_T P_34 ; real_T P_35 ; real_T P_36 ; real_T P_37 ;
real_T P_38 ; real_T P_39 ; real_T P_40 ; real_T P_41 ; real_T P_42 ; real_T
P_43 ; real_T P_44 ; real_T P_45 ; real_T P_46 ; real_T P_47 ; real_T P_48 ;
real_T P_49 ; real_T P_50 ; real_T P_51 ; real_T P_52 ; real_T P_53 ; real_T
P_54 ; real_T P_55 ; real_T P_56 ; real_T P_57 ; real_T P_58 ; real_T P_59 ;
real_T P_60 [ 9 ] ; real_T P_61 ; real_T P_62 ; real_T P_63 ; real_T P_64 ;
real_T P_65 ; real_T P_66 ; real_T P_67 ; real_T P_68 ; real_T P_69 ; real_T
P_70 ; real_T P_71 ; real_T P_72 ; real_T P_73 ; real_T P_74 ; real_T P_75 ;
real_T P_76 ; real_T P_77 ; real_T P_78 ; real_T P_79 ; real_T P_80 ; real_T
P_81 ; real_T P_82 ; real_T P_83 ; real_T P_84 ; real_T P_85 ; real_T P_86 ;
real_T P_87 ; real_T P_88 ; real_T P_89 ; real_T P_90 ; real_T P_91 ; real_T
P_92 ; real_T P_93 ; real_T P_94 ; real_T P_95 ; real_T P_96 ; real_T P_97 ;
real_T P_98 ; real_T P_99 ; real_T P_100 ; real_T P_101 ; real_T P_102 ;
real_T P_103 ; real_T P_104 ; real_T P_105 ; real_T P_106 ; real_T P_107 ;
real_T P_108 ; real_T P_109 ; real_T P_110 ; real_T P_111 ; real_T P_112 ;
real_T P_113 ; real_T P_114 ; real_T P_115 ; real_T P_116 ; real_T P_117 ;
real_T P_118 ; real_T P_119 ; real_T P_120 ; real_T P_121 ; real_T P_122 ;
real_T P_123 ; real_T P_124 ; real_T P_125 ; real_T P_126 ; real_T P_127 ;
real_T P_128 ; real_T P_129 ; real_T P_130 ; real_T P_131 ; real_T P_132 ;
real_T P_133 ; real_T P_134 ; real_T P_135 ; real_T P_136 ; real_T P_137 ;
real_T P_138 ; real_T P_139 ; real_T P_140 ; real_T P_141 ; real_T P_142 ;
real_T P_143 ; real_T P_144 ; real_T P_145 ; real_T P_146 ; real_T P_147 ;
real_T P_148 ; real_T P_149 ; real_T P_150 ; real_T P_151 ; real_T P_152 ;
real_T P_153 ; real_T P_154 ; real_T P_155 ; real_T P_156 ; real_T P_157 ;
real_T P_158 ; real_T P_159 ; real_T P_160 ; real_T P_161 ; real_T P_162 ;
real_T P_163 ; real_T P_164 ; real_T P_165 ; real_T P_166 ; real_T P_167 ;
real_T P_168 ; real_T P_169 ; real_T P_170 ; real_T P_171 ; real_T P_172 ;
real_T P_173 ; real_T P_174 ; real_T P_175 ; real_T P_176 ; real_T P_177 ;
real_T P_178 ; real_T P_179 ; real_T P_180 ; real_T P_181 ; real_T P_182 ;
real_T P_183 ; real_T P_184 ; real_T P_185 ; real_T P_186 ; real_T P_187 ;
real_T P_188 ; real_T P_189 ; real_T P_190 ; real_T P_191 ; real_T P_192 ;
real_T P_193 ; real_T P_194 ; real_T P_195 ; real_T P_196 ; real_T P_197 ;
real_T P_198 ; real_T P_199 ; real_T P_200 ; real_T P_201 ; real_T P_202 ;
real_T P_203 ; real_T P_204 ; real_T P_205 ; real_T P_206 ; real_T P_207 ;
real_T P_208 ; real_T P_209 ; real_T P_210 ; real_T P_211 ; real_T P_212 ;
real_T P_213 ; real_T P_214 ; real_T P_215 ; real_T P_216 ; real_T P_217 ;
real_T P_218 ; real_T P_219 ; real_T P_220 ; real_T P_221 ; real_T P_222 ;
real_T P_223 ; real_T P_224 ; real_T P_225 ; real_T P_226 ; real_T P_227 ;
real_T P_228 ; real_T P_229 ; real_T P_230 ; real_T P_231 ; real_T P_232 ;
real_T P_233 ; real_T P_234 ; real_T P_235 ; real_T P_236 ; real_T P_237 ;
real_T P_238 ; real_T P_239 ; real_T P_240 ; real_T P_241 ; real_T P_242 ;
real_T P_243 ; real_T P_244 ; real_T P_245 ; real_T P_246 ; real_T P_247 ;
real_T P_248 ; real_T P_249 ; real_T P_250 ; real_T P_251 ; real_T P_252 ;
real_T P_253 ; real_T P_254 ; real_T P_255 ; real_T P_256 ; real_T P_257 ;
real_T P_258 ; real_T P_259 ; real_T P_260 ; real_T P_261 ; real_T P_262 ;
real_T P_263 ; real_T P_264 ; real_T P_265 ; real_T P_266 ; real_T P_267 ;
real_T P_268 ; real_T P_269 ; real_T P_270 ; real_T P_271 ; real_T P_272 ;
real_T P_273 ; real_T P_274 ; real_T P_275 ; real_T P_276 ; real_T P_277 ;
real_T P_278 ; real_T P_279 ; real_T P_280 ; real_T P_281 ; real_T P_282 ;
real_T P_283 ; real_T P_284 ; real_T P_285 ; real_T P_286 ; real_T P_287 ;
real_T P_288 ; real_T P_289 ; real_T P_290 ; real_T P_291 ; real_T P_292 ;
real_T P_293 ; real_T P_294 ; real_T P_295 ; real_T P_296 ; real_T P_297 ;
real_T P_298 ; real_T P_299 ; real_T P_300 ; real_T P_301 ; real_T P_302 ;
real_T P_303 ; real_T P_304 ; real_T P_305 ; real_T P_306 ; real_T P_307 ;
real_T P_308 ; real_T P_309 ; real_T P_310 ; real_T P_311 ; real_T P_312 ;
real_T P_313 ; real_T P_314 ; real_T P_315 ; real_T P_316 ; real_T P_317 ;
real_T P_318 ; real_T P_319 ; real_T P_320 ; real_T P_321 ; real_T P_322 ;
real_T P_323 ; real_T P_324 ; real_T P_325 ; real_T P_326 ; real_T P_327 ;
real_T P_328 ; real_T P_329 ; real_T P_330 ; real_T P_331 ; real_T P_332 ;
real_T P_333 ; real_T P_334 ; real_T P_335 ; real_T P_336 ; real_T P_337 ;
real_T P_338 ; real_T P_339 ; real_T P_340 ; real_T P_341 ; real_T P_342 ;
real_T P_343 ; real_T P_344 ; real_T P_345 ; real_T P_346 ; real_T P_347 ;
real_T P_348 ; real_T P_349 ; real_T P_350 ; real_T P_351 ; real_T P_352 ;
real_T P_353 ; real_T P_354 ; real_T P_355 ; real_T P_356 ; real_T P_357 ;
real_T P_358 ; real_T P_359 ; real_T P_360 ; real_T P_361 ; real_T P_362 ;
real_T P_363 ; real_T P_364 ; real_T P_365 ; real_T P_366 ; real_T P_367 ;
real_T P_368 ; real_T P_369 ; real_T P_370 ; real_T P_371 ; real_T P_372 ;
real_T P_373 ; real_T P_374 ; real_T P_375 ; real_T P_376 ; real_T P_377 ;
real_T P_378 ; real_T P_379 ; real_T P_380 ; real_T P_381 ; real_T P_382 ;
real_T P_383 ; real_T P_384 ; real_T P_385 ; real_T P_386 ; real_T P_387 ;
real_T P_388 ; real_T P_389 ; real_T P_390 ; real_T P_391 ; real_T P_392 ;
real_T P_393 ; real_T P_394 ; real_T P_395 ; real_T P_396 ; real_T P_397 ;
real_T P_398 ; real_T P_399 ; real_T P_400 ; real_T P_401 ; real_T P_402 ;
real_T P_403 ; real_T P_404 ; real_T P_405 ; real_T P_406 ; real_T P_407 ;
real_T P_408 ; real_T P_409 ; real_T P_410 ; real_T P_411 ; real_T P_412 ;
real_T P_413 ; real_T P_414 ; real_T P_415 ; real_T P_416 ; real_T P_417 ;
real_T P_418 ; real_T P_419 ; real_T P_420 ; real_T P_421 ; real_T P_422 ;
real_T P_423 ; real_T P_424 ; real_T P_425 ; real_T P_426 ; real_T P_427 ;
real_T P_428 ; real_T P_429 ; real_T P_430 ; real_T P_431 ; real_T P_432 ;
real_T P_433 ; real_T P_434 ; real_T P_435 ; real_T P_436 ; real_T P_437 ;
real_T P_438 ; real_T P_439 ; real_T P_440 ; real_T P_441 ; real_T P_442 ;
real_T P_443 ; real_T P_444 ; real_T P_445 ; real_T P_446 ; real_T P_447 ;
real_T P_448 ; real_T P_449 ; real_T P_450 ; real_T P_451 ; real_T P_452 ;
real_T P_453 ; real_T P_454 ; real_T P_455 ; real_T P_456 ; real_T P_457 ;
real_T P_458 ; real_T P_459 ; real_T P_460 ; real_T P_461 ; real_T P_462 ;
real_T P_463 ; real_T P_464 ; real_T P_465 ; real_T P_466 ; real_T P_467 ;
real_T P_468 ; real_T P_469 ; real_T P_470 ; real_T P_471 ; real_T P_472 ;
real_T P_473 ; real_T P_474 ; real_T P_475 ; real_T P_476 ; real_T P_477 ;
real_T P_478 ; real_T P_479 ; real_T P_480 ; real_T P_481 ; real_T P_482 ;
real_T P_483 ; real_T P_484 ; real_T P_485 ; real_T P_486 ; real_T P_487 ;
real_T P_488 ; real_T P_489 ; real_T P_490 ; real_T P_491 ; real_T P_492 ;
real_T P_493 ; real_T P_494 ; real_T P_495 ; real_T P_496 ; real_T P_497 ;
real_T P_498 ; real_T P_499 ; real_T P_500 ; real_T P_501 ; real_T P_502 ;
real_T P_503 ; real_T P_504 ; real_T P_505 ; real_T P_506 ; real_T P_507 ;
real_T P_508 ; real_T P_509 ; real_T P_510 ; real_T P_511 ; real_T P_512 ;
real_T P_513 ; real_T P_514 ; real_T P_515 ; real_T P_516 ; real_T P_517 ;
real_T P_518 ; real_T P_519 ; real_T P_520 ; real_T P_521 ; real_T P_522 ;
real_T P_523 ; real_T P_524 ; real_T P_525 ; real_T P_526 ; real_T P_527 ;
real_T P_528 ; real_T P_529 ; real_T P_530 ; real_T P_531 ; real_T P_532 ;
real_T P_533 ; real_T P_534 ; real_T P_535 ; real_T P_536 ; real_T P_537 ;
real_T P_538 ; real_T P_539 ; real_T P_540 ; real_T P_541 ; real_T P_542 ;
real_T P_543 ; real_T P_544 ; real_T P_545 ; real_T P_546 ; real_T P_547 ;
real_T P_548 ; real_T P_549 ; real_T P_550 ; real_T P_551 ; real_T P_552 ;
real_T P_553 ; real_T P_554 ; real_T P_555 ; real_T P_556 ; real_T P_557 ;
real_T P_558 ; real_T P_559 ; real_T P_560 ; real_T P_561 ; real_T P_562 ;
real_T P_563 ; real_T P_564 ; real_T P_565 ; real_T P_566 ; real_T P_567 ;
real_T P_568 ; real_T P_569 ; real_T P_570 ; real_T P_571 ; real_T P_572 ;
real_T P_573 ; real_T P_574 ; real_T P_575 ; real_T P_576 ; real_T P_577 ;
real_T P_578 ; real_T P_579 ; real_T P_580 ; real_T P_581 ; real_T P_582 ;
real_T P_583 ; real_T P_584 ; real_T P_585 ; real_T P_586 ; real_T P_587 ;
real_T P_588 ; real_T P_589 ; real_T P_590 ; real_T P_591 ; real_T P_592 ;
real_T P_593 ; real_T P_594 ; real_T P_595 ; real_T P_596 ; real_T P_597 ;
real_T P_598 ; real_T P_599 ; real_T P_600 ; real_T P_601 ; real_T P_602 ;
real_T P_603 ; real_T P_604 ; real_T P_605 ; real_T P_606 ; real_T P_607 ;
real_T P_608 ; real_T P_609 ; real_T P_610 ; real_T P_611 ; real_T P_612 ;
real_T P_613 ; real_T P_614 ; real_T P_615 ; real_T P_616 ; real_T P_617 ;
real_T P_618 ; real_T P_619 ; real_T P_620 ; real_T P_621 ; real_T P_622 ;
real_T P_623 ; real_T P_624 ; real_T P_625 ; real_T P_626 ; real_T P_627 ;
real_T P_628 ; real_T P_629 ; real_T P_630 ; real_T P_631 ; real_T P_632 ;
real_T P_633 ; real_T P_634 ; real_T P_635 ; real_T P_636 ; real_T P_637 ;
real_T P_638 ; real_T P_639 ; real_T P_640 ; real_T P_641 ; real_T P_642 ;
real_T P_643 ; real_T P_644 ; real_T P_645 ; real_T P_646 ; real_T P_647 ;
real_T P_648 ; real_T P_649 ; real_T P_650 ; real_T P_651 ; real_T P_652 ;
real_T P_653 ; real_T P_654 ; real_T P_655 ; real_T P_656 ; real_T P_657 ;
real_T P_658 ; real_T P_659 ; real_T P_660 ; real_T P_661 ; real_T P_662 ;
real_T P_663 ; real_T P_664 ; real_T P_665 ; real_T P_666 ; real_T P_667 ;
real_T P_668 ; real_T P_669 ; real_T P_670 ; real_T P_671 ; real_T P_672 ;
real_T P_673 ; real_T P_674 ; real_T P_675 ; real_T P_676 ; real_T P_677 ;
real_T P_678 ; real_T P_679 ; real_T P_680 ; real_T P_681 ; real_T P_682 ;
real_T P_683 ; real_T P_684 ; real_T P_685 ; real_T P_686 ; real_T P_687 ;
real_T P_688 ; real_T P_689 ; real_T P_690 ; real_T P_691 ; real_T P_692 ;
real_T P_693 ; real_T P_694 ; real_T P_695 ; real_T P_696 ; real_T P_697 ;
real_T P_698 ; real_T P_699 ; real_T P_700 ; real_T P_701 ; real_T P_702 ;
real_T P_703 ; real_T P_704 ; real_T P_705 ; real_T P_706 ; real_T P_707 ;
real_T P_708 ; real_T P_709 ; real_T P_710 ; real_T P_711 ; real_T P_712 ;
real_T P_713 ; real_T P_714 ; real_T P_715 ; real_T P_716 ; real_T P_717 ;
real_T P_718 ; real_T P_719 ; real_T P_720 ; real_T P_721 ; real_T P_722 ;
real_T P_723 ; real_T P_724 ; real_T P_725 ; real_T P_726 ; real_T P_727 ;
real_T P_728 ; real_T P_729 ; real_T P_730 ; real_T P_731 ; real_T P_732 ;
real_T P_733 ; real_T P_734 ; real_T P_735 ; real_T P_736 ; real_T P_737 ;
real_T P_738 ; real_T P_739 ; real_T P_740 ; real_T P_741 ; real_T P_742 ;
real_T P_743 ; real_T P_744 ; real_T P_745 ; real_T P_746 ; real_T P_747 ;
real_T P_748 ; real_T P_749 ; real_T P_750 ; real_T P_751 ; real_T P_752 ;
real_T P_753 ; real_T P_754 ; real_T P_755 ; real_T P_756 ; real_T P_757 ;
real_T P_758 ; real_T P_759 ; real_T P_760 ; real_T P_761 ; real_T P_762 ;
real_T P_763 ; real_T P_764 ; real_T P_765 ; real_T P_766 [ 6 ] ; real_T
P_767 ; real_T P_768 [ 6 ] ; real_T P_769 [ 2 ] ; real_T P_770 [ 2 ] ; real_T
P_771 ; real_T P_772 ; real_T P_773 ; real_T P_774 ; real_T P_775 ; real_T
P_776 ; real_T P_777 ; real_T P_778 ; real_T P_779 ; real_T P_780 ; real_T
P_781 ; real_T P_782 ; real_T P_783 ; real_T P_784 ; real_T P_785 ; real_T
P_786 ; real_T P_787 ; real_T P_788 ; real_T P_789 ; real_T P_790 ; real_T
P_791 [ 3 ] ; real_T P_792 ; real_T P_793 ; real_T P_794 [ 31 ] ; real_T
P_795 ; real_T P_796 ; real_T P_797 ; real_T P_798 ; real_T P_799 ; real_T
P_800 ; real_T P_801 ; real_T P_802 ; real_T P_803 ; real_T P_804 [ 3 ] ;
real_T P_805 [ 2 ] ; real_T P_806 [ 2 ] ; real_T P_807 [ 10 ] ; real_T P_808
[ 10 ] ; real_T P_809 [ 9 ] ; real_T P_810 [ 9 ] ; real_T P_811 [ 43920 ] ;
real_T P_812 [ 43920 ] ; real_T P_813 [ 3660 ] ; real_T P_814 [ 3660 ] ;
real_T P_815 [ 61 ] ; real_T P_816 [ 61 ] ; real_T P_817 ; real_T P_818 ;
real_T P_819 ; real_T P_820 ; real_T P_821 ; real_T P_822 ; real_T P_823 ;
real_T P_824 ; real_T P_825 ; real_T P_826 ; real_T P_827 ; real_T P_828 ;
real_T P_829 ; real_T P_830 ; real_T P_831 ; real_T P_832 ; real_T P_833 ;
real_T P_834 ; real_T P_835 [ 3 ] ; real_T P_836 [ 2 ] ; real_T P_837 ;
real_T P_838 ; real_T P_839 [ 3 ] ; real_T P_840 ; real_T P_841 ; real_T
P_842 ; real_T P_843 ; real_T P_844 ; real_T P_845 ; real_T P_846 ; real_T
P_847 ; real_T P_848 ; real_T P_849 ; real_T P_850 ; real_T P_851 ; real_T
P_852 ; real_T P_853 ; real_T P_854 ; real_T P_855 ; real_T P_856 ; real_T
P_857 ; real_T P_858 ; real_T P_859 ; real_T P_860 ; real_T P_861 ; real_T
P_862 [ 12 ] ; real_T P_863 ; real_T P_864 ; real_T P_865 ; real_T P_866 ;
real_T P_867 ; real_T P_868 ; real_T P_869 ; real_T P_870 ; real_T P_871 ;
real_T P_872 ; real_T P_873 ; real_T P_874 ; real_T P_875 ; real_T P_876 ;
real_T P_877 ; real_T P_878 ; real_T P_879 ; real_T P_880 ; real_T P_881 ;
real_T P_882 ; real_T P_883 ; real_T P_884 ; real_T P_885 ; real_T P_886 [ 4
] ; real_T P_887 ; real_T P_888 ; real_T P_889 [ 4 ] ; real_T P_890 [ 4 ] ;
real_T P_891 ; real_T P_892 [ 4 ] ; real_T P_893 ; real_T P_894 ; real_T
P_895 ; real_T P_896 ; real_T P_897 ; real_T P_898 ; real_T P_899 ; real_T
P_900 ; real_T P_901 ; real_T P_902 ; real_T P_903 ; real_T P_904 [ 2 ] ;
real_T P_905 [ 2 ] ; real_T P_906 ; real_T P_907 [ 4 ] ; real_T P_908 [ 4 ] ;
real_T P_909 [ 4 ] ; real_T P_910 [ 4 ] ; real_T P_911 [ 4 ] ; real_T P_912 [
96 ] ; real_T P_913 ; real_T P_914 ; real_T P_915 ; real_T P_916 ; real_T
P_917 ; real_T P_918 ; real_T P_919 ; real_T P_920 ; real_T P_921 ; real_T
P_922 ; real_T P_923 ; real_T P_924 ; real_T P_925 ; real_T P_926 ; real_T
P_927 ; real_T P_928 ; real_T P_929 ; real_T P_930 ; real_T P_931 ; real_T
P_932 ; real_T P_933 ; real_T P_934 ; real_T P_935 ; real_T P_936 ; real_T
P_937 ; real_T P_938 ; real_T P_939 ; real_T P_940 ; real_T P_941 ; real_T
P_942 ; real_T P_943 ; real_T P_944 ; real_T P_945 ; real_T P_946 ; real_T
P_947 ; real_T P_948 ; real_T P_949 ; real_T P_950 ; real_T P_951 [ 3 ] ;
real_T P_952 [ 3 ] ; real_T P_953 [ 3 ] ; real_T P_954 ; real_T P_955 [ 2 ] ;
real_T P_956 [ 2 ] ; real_T P_957 [ 3 ] ; real_T P_958 [ 9 ] ; real_T P_959 [
4 ] ; real_T P_960 [ 4 ] ; real_T P_961 ; real_T P_962 ; real_T P_963 ;
real_T P_964 ; real_T P_965 ; real_T P_966 ; real_T P_967 ; real_T P_968 ;
real_T P_969 ; real_T P_970 ; real_T P_971 ; real_T P_972 ; real_T P_973 ;
real_T P_974 ; real_T P_975 ; real_T P_976 ; real_T P_977 ; real_T P_978 ;
real_T P_979 ; real_T P_980 ; real_T P_981 ; real_T P_982 ; real_T P_983 ;
real_T P_984 ; real_T P_985 ; real_T P_986 ; real_T P_987 ; real_T P_988 ;
real_T P_989 ; real_T P_990 ; real_T P_991 ; real_T P_992 ; real_T P_993 ;
real_T P_994 ; real_T P_995 ; real_T P_996 ; real_T P_997 ; real_T P_998 ;
real_T P_999 ; real_T P_1000 ; real_T P_1001 ; real_T P_1002 ; real_T P_1003
; real_T P_1004 ; real_T P_1005 ; real_T P_1006 ; real_T P_1007 ; real_T
P_1008 ; real_T P_1009 ; real_T P_1010 ; real_T P_1011 ; real_T P_1012 ;
real_T P_1013 ; real_T P_1014 ; real_T P_1015 ; real_T P_1016 ; real_T P_1017
; real_T P_1018 ; real_T P_1019 ; real_T P_1020 ; real_T P_1021 ; real_T
P_1022 ; real_T P_1023 ; real_T P_1024 ; real_T P_1025 ; real_T P_1026 ;
real_T P_1027 ; real_T P_1028 ; real_T P_1029 ; boolean_T P_1030 ; boolean_T
P_1031 [ 8 ] ; boolean_T P_1032 ; boolean_T P_1033 [ 8 ] ; boolean_T P_1034 ;
boolean_T P_1035 [ 8 ] ; boolean_T P_1036 ; boolean_T P_1037 [ 8 ] ; uint8_T
P_1038 ; ne2r23ah24 kqrxum2gnp ; ne2r23ah24 ixiqzrysul ; ne2r23ah24
fjwdrhn2a0 ; ne2r23ah24 j1v2vr3ni02 ; ob1e1skp0y e5txhvyaxi ; k51ujc0tc4
g1gkz1z5tw ; h3cjktwas0 pgolrrskid ; oe5a2grwh3 dif5k2yfnn ; } ; struct
mmo2vwjqw3 { struct SimStruct_tag * _mdlRefSfcnS ; struct { real_T
mr_nonContSig0 [ 9 ] ; real_T mr_nonContSig1 [ 9 ] ; real_T mr_nonContSig2 [
9 ] ; real_T mr_nonContSig3 [ 3 ] ; real_T mr_nonContSig4 [ 3 ] ; real_T
mr_nonContSig5 [ 1 ] ; real_T mr_nonContSig6 [ 1 ] ; real_T mr_nonContSig7 [
1 ] ; real_T mr_nonContSig8 [ 12 ] ; real_T mr_nonContSig9 [ 1 ] ; real_T
mr_nonContSig10 [ 3 ] ; real_T mr_nonContSig11 [ 3 ] ; real_T mr_nonContSig12
[ 3 ] ; real_T mr_nonContSig13 [ 3 ] ; real_T mr_nonContSig14 [ 1 ] ; real_T
mr_nonContSig15 [ 1 ] ; real_T mr_nonContSig16 [ 1 ] ; real_T mr_nonContSig17
[ 1 ] ; real_T mr_nonContSig18 [ 1 ] ; real_T mr_nonContSig19 [ 1 ] ; real_T
mr_nonContSig20 [ 1 ] ; real_T mr_nonContSig21 [ 1 ] ; real_T mr_nonContSig22
[ 1 ] ; real_T mr_nonContSig23 [ 1 ] ; real_T mr_nonContSig24 [ 1 ] ; real_T
mr_nonContSig25 [ 1 ] ; real_T mr_nonContSig26 [ 2 ] ; real_T mr_nonContSig27
[ 2 ] ; real_T mr_nonContSig28 [ 2 ] ; real_T mr_nonContSig29 [ 2 ] ; real_T
mr_nonContSig30 [ 2 ] ; real_T mr_nonContSig31 [ 1 ] ; real_T mr_nonContSig32
[ 3 ] ; real_T mr_nonContSig33 [ 1 ] ; real_T mr_nonContSig34 [ 1 ] ; real_T
mr_nonContSig35 [ 3 ] ; real_T mr_nonContSig36 [ 1 ] ; real_T mr_nonContSig37
[ 1 ] ; real_T mr_nonContSig38 [ 1 ] ; real_T mr_nonContSig39 [ 1 ] ; real_T
mr_nonContSig40 [ 1 ] ; real_T mr_nonContSig41 [ 1 ] ; real_T mr_nonContSig42
[ 1 ] ; real_T mr_nonContSig43 [ 1 ] ; real_T mr_nonContSig44 [ 1 ] ; real_T
mr_nonContSig45 [ 1 ] ; real_T mr_nonContSig46 [ 1 ] ; } NonContDerivMemory ;
ssNonContDerivSigInfo nonContDerivSignal [ 47 ] ; const rtTimingBridge *
timingBridge ; struct { rtwCAPI_ModelMappingInfo mmi ;
rtwCAPI_ModelMapLoggingInstanceInfo mmiLogInstanceInfo ; void * dataAddress [
27 ] ; int32_T * vardimsAddress [ 27 ] ; RTWLoggingFcnPtr loggingPtrs [ 27 ]
; sysRanDType * systemRan [ 27 ] ; int_T systemTid [ 27 ] ; } DataMapInfo ;
struct { int_T mdlref_GlobalTID [ 2 ] ; } Timing ; } ; typedef struct {
k0r514zhkn rtb ; jb251fek03 rtdw ; gwlxzditat rtm ; hgp0bjgtdb rtzce ; }
egcgcay4tuh ; extern void klg3zs3vu4 ( SimStruct * _mdlRefSfcnS ,
ssNonContDerivSigFeedingOutports * * mr_nonContOutputArray , int_T
mdlref_TID0 , int_T mdlref_TID1 , gwlxzditat * const ke3gqsjzkb , k0r514zhkn
* localB , jb251fek03 * localDW , h21fsrthfa * localX , hgp0bjgtdb * localZCE
, void * sysRanPtr , int contextTid , rtwCAPI_ModelMappingInfo * rt_ParentMMI
, const char_T * rt_ChildPath , int_T rt_ChildMMIIdx , int_T rt_CSTATEIdx ) ;
extern void mr_PassVeh14DOF_MdlInfoRegFcn ( SimStruct * mdlRefSfcnS , char_T
* modelName , int_T * retVal ) ; extern mxArray * mr_PassVeh14DOF_GetDWork (
const egcgcay4tuh * mdlrefDW ) ; extern void mr_PassVeh14DOF_SetDWork (
egcgcay4tuh * mdlrefDW , const mxArray * ssDW ) ; extern void
mr_PassVeh14DOF_RegisterSimStateChecksum ( SimStruct * S ) ; extern mxArray *
mr_PassVeh14DOF_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * PassVeh14DOF_GetCAPIStaticMap ( void ) ;
extern void nwszq34qg0 ( real_T iitetpod41 , real_T j0dz4gci1a , real_T
l1rsllgcdg , real_T juqxwvu1sv , real_T mev1l01gc1 , real_T ecxia3gdmh ,
const real_T ec0mkhgauj [ 27 ] , real_T ha31tpv0cj , real_T jhcdfmg05q ,
real_T ndu1sss1xt , real_T * byo0b1k3g2 , real_T * bpxfntm0jy , real_T *
hadbai2stv , fkagotctmb * localB , real_T rtp_ALPMAX , real_T rtp_ALPMIN ,
real_T rtp_BREFF , real_T rtp_CAMMAX , real_T rtp_CAMMIN , real_T rtp_DREFF ,
real_T rtp_FNOMIN , real_T rtp_FREFF , real_T rtp_FZMAX , real_T rtp_FZMIN ,
real_T rtp_KPUMAX , real_T rtp_KPUMIN , real_T rtp_LATERAL_STIFFNESS , real_T
rtp_LONGITUDINAL_STIFFNESS , real_T rtp_LONGVL , real_T rtp_NOMPRES , real_T
rtp_PCFX1 , real_T rtp_PCFX2 , real_T rtp_PCFX3 , real_T rtp_PCFY1 , real_T
rtp_PCFY2 , real_T rtp_PCFY3 , real_T rtp_PCX1 , real_T rtp_PCY1 , real_T
rtp_PDX1 , real_T rtp_PDX2 , real_T rtp_PDX3 , real_T rtp_PDXP1 , real_T
rtp_PDXP2 , real_T rtp_PDXP3 , real_T rtp_PDY1 , real_T rtp_PDY2 , real_T
rtp_PDY3 , real_T rtp_PDYP1 , real_T rtp_PDYP2 , real_T rtp_PDYP3 , real_T
rtp_PDYP4 , real_T rtp_PECP1 , real_T rtp_PECP2 , real_T rtp_PEX1 , real_T
rtp_PEX2 , real_T rtp_PEX3 , real_T rtp_PEX4 , real_T rtp_PEY1 , real_T
rtp_PEY2 , real_T rtp_PEY4 , real_T rtp_PEY5 , real_T rtp_PFZ1 , real_T
rtp_PHX1 , real_T rtp_PHX2 , real_T rtp_PHYP1 , real_T rtp_PHYP2 , real_T
rtp_PHYP3 , real_T rtp_PHYP4 , real_T rtp_PKX1 , real_T rtp_PKX2 , real_T
rtp_PKX3 , real_T rtp_PKY1 , real_T rtp_PKY2 , real_T rtp_PKY3 , real_T
rtp_PKY4 , real_T rtp_PKY5 , real_T rtp_PKY6 , real_T rtp_PKY7 , real_T
rtp_PKYP1 , real_T rtp_PPMX1 , real_T rtp_PPX1 , real_T rtp_PPX2 , real_T
rtp_PPX3 , real_T rtp_PPX4 , real_T rtp_PPY1 , real_T rtp_PPY2 , real_T
rtp_PPY3 , real_T rtp_PPY4 , real_T rtp_PPY5 , real_T rtp_PPZ1 , real_T
rtp_PPZ2 , real_T rtp_PRESMAX , real_T rtp_PRESMIN , real_T rtp_PVX1 , real_T
rtp_PVX2 , real_T rtp_PVY3 , real_T rtp_PVY4 , real_T rtp_QBRP1 , real_T
rtp_QBZ1 , real_T rtp_QBZ10 , real_T rtp_QBZ2 , real_T rtp_QBZ3 , real_T
rtp_QBZ5 , real_T rtp_QBZ6 , real_T rtp_QBZ9 , real_T rtp_QCRP1 , real_T
rtp_QCRP2 , real_T rtp_QCZ1 , real_T rtp_QDRP1 , real_T rtp_QDRP2 , real_T
rtp_QDTP1 , real_T rtp_QDZ1 , real_T rtp_QDZ10 , real_T rtp_QDZ11 , real_T
rtp_QDZ2 , real_T rtp_QDZ4 , real_T rtp_QDZ8 , real_T rtp_QDZ9 , real_T
rtp_QEZ1 , real_T rtp_QEZ2 , real_T rtp_QEZ3 , real_T rtp_QEZ5 , real_T
rtp_QHZ3 , real_T rtp_QHZ4 , real_T rtp_QSX10 , real_T rtp_QSX11 , real_T
rtp_QSX12 , real_T rtp_QSX13 , real_T rtp_QSX14 , real_T rtp_QSX2 , real_T
rtp_QSX3 , real_T rtp_QSX4 , real_T rtp_QSX5 , real_T rtp_QSX6 , real_T
rtp_QSX7 , real_T rtp_QSX8 , real_T rtp_QSX9 , real_T rtp_QSY1 , real_T
rtp_QSY2 , real_T rtp_QSY3 , real_T rtp_QSY4 , real_T rtp_QSY5 , real_T
rtp_QSY6 , real_T rtp_QSY7 , real_T rtp_QSY8 , real_T rtp_Q_FCX , real_T
rtp_Q_FCY , real_T rtp_Q_FCY2 , real_T rtp_Q_FZ1 , real_T rtp_Q_FZ2 , real_T
rtp_Q_FZ3 , real_T rtp_Q_RE0 , real_T rtp_Q_V1 , real_T rtp_Q_V2 , real_T
rtp_RBX1 , real_T rtp_RBX2 , real_T rtp_RBX3 , real_T rtp_RBY1 , real_T
rtp_RBY2 , real_T rtp_RBY4 , real_T rtp_RCX1 , real_T rtp_RCY1 , real_T
rtp_REX1 , real_T rtp_REX2 , real_T rtp_REY1 , real_T rtp_REY2 , real_T
rtp_RHY1 , real_T rtp_RHY2 , real_T rtp_RVY3 , real_T rtp_RVY4 , real_T
rtp_RVY5 , real_T rtp_RVY6 , real_T rtp_SSZ2 , real_T rtp_SSZ3 , real_T
rtp_SSZ4 , real_T rtp_UNLOADED_RADIUS , real_T rtp_VERTICAL_STIFFNESS ,
real_T rtp_VXLOW ) ; extern void ols1bxyj35 ( gwlxzditat * const ke3gqsjzkb )
; extern void hfxpr3ekm3 ( gwlxzditat * const ke3gqsjzkb ) ; extern void
j1v2vr3ni0 ( gwlxzditat * const ke3gqsjzkb , real_T * jzyix1cfly , fkschrmm5b
* localB , ne2r23ah24 * localP ) ; extern void m3kvjvuvj4 ( gwlxzditat *
const ke3gqsjzkb , jb251fek03 * localDW , h21fsrthfa * localX ) ; extern void
nqasp5wza1 ( jb251fek03 * localDW , h21fsrthfa * localX ) ; extern void
g53loesncj ( k0r514zhkn * localB , jb251fek03 * localDW ) ; extern void
kpl5p5meuz ( gwlxzditat * const ke3gqsjzkb , k0r514zhkn * localB , jb251fek03
* localDW , h21fsrthfa * localX , gy0s4k0fxb * localXdis , ectmdkaxud *
localXdot ) ; extern void gahgwqe10m ( gwlxzditat * const ke3gqsjzkb ,
k0r514zhkn * localB , jb251fek03 * localDW , h21fsrthfa * localX , beahf2xhqn
* localZCSV ) ; extern void l2qaz5g1su ( gwlxzditat * const ke3gqsjzkb ,
jb251fek03 * localDW , gy0s4k0fxb * localXdis ) ; extern void jpl1qt0btr (
gwlxzditat * const ke3gqsjzkb , k0r514zhkn * localB , jb251fek03 * localDW ,
h21fsrthfa * localX , mq10j5tdpd * localXAbsTol ) ; extern void PassVeh14DOF
( gwlxzditat * const ke3gqsjzkb , const real_T gqwlp2auej [ 4 ] , const
real_T l5ziqbrmsl [ 4 ] , const real_T c3zd4dk1uf [ 4 ] , const real_T
ezwtynlaay [ 3 ] , const real_T miqwpmctiu [ 4 ] , const real_T jwz44h4qyo [
4 ] , real_T * gtl3b1j01b , real_T * pwoh2xb5vj , real_T * i42mxictom ,
real_T * lyj3f52ff4 , real_T * i3kyrlwjnw , real_T * bhzsj4j234 , real_T
lhyuzs0fut [ 4 ] , real_T lln2ljuc34 [ 4 ] , real_T * ku5rvpwvqq , real_T *
attk5wiqvp , real_T * phwb4o0wn0 , real_T * amhdvpnm50 , real_T * f2oeigmoab
, real_T * llmtx1452n , real_T * jmlrx4caiz , real_T * dormnsq41w , real_T
dy3w1gskym [ 4 ] , real_T ozvmbyv53f [ 4 ] , real_T iqhp0vpzu3 [ 4 ] , real_T
nkyjqmpy0c [ 4 ] , k0r514zhkn * localB , jb251fek03 * localDW , h21fsrthfa *
localX , hgp0bjgtdb * localZCE , gy0s4k0fxb * localXdis ) ; extern void
apei0jh2jv ( gwlxzditat * const ke3gqsjzkb ) ;
#endif
