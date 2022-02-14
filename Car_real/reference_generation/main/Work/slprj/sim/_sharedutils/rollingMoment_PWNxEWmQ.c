#include "rtwtypes.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rollingMoment_PWNxEWmQ.h"

real_T rollingMoment_PWNxEWmQ(real_T Fx, real_T Vcx, real_T Fz, real_T press,
  real_T b_gamma, real_T Vo, real_T Ro, real_T Fzo, real_T pio, real_T b_QSY1,
  real_T b_QSY2, real_T b_QSY3, real_T b_QSY4, real_T b_QSY5, real_T b_QSY6,
  real_T b_QSY7, real_T b_QSY8, real_T lam_My)
{
  real_T My_tmp;
  real_T My_tmp_p;
  My_tmp = Vcx / Vo;
  My_tmp_p = Fz / Fzo;
  return ((((Fx / Fzo * b_QSY2 + b_QSY1) + muDoubleScalarAbs(My_tmp) * b_QSY3) +
           muDoubleScalarPower(My_tmp, 4.0) * b_QSY4) + (My_tmp_p * b_QSY6 +
           b_QSY5) * (b_gamma * b_gamma)) * (-Ro * Fzo * lam_My) *
    (muDoubleScalarPower(My_tmp_p, b_QSY7) * muDoubleScalarPower(press / pio,
      b_QSY8));
}
