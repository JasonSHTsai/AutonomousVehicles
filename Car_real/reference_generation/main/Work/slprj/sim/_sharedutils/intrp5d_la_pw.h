#ifndef SHARE_intrp5d_la_pw
#define SHARE_intrp5d_la_pw
#include "rtwtypes.h"
#include "multiword_types.h"

extern real_T intrp5d_la_pw(const uint32_T bpIndex[], const real_T frac[], const
  real_T table[], const uint32_T stride[], const uint32_T maxIndex[]);

#endif
