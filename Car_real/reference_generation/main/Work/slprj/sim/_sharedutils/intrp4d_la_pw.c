#include "rtwtypes.h"
#include "multiword_types.h"
#include "intrp4d_la_pw.h"

real_T intrp4d_la_pw(const uint32_T bpIndex[], const real_T frac[], const real_T
                     table[], const uint32_T stride[], const uint32_T maxIndex[])
{
  real_T y;
  uint32_T offset_3d;
  real_T yR_1d;
  uint32_T offset_0d;
  real_T yL_1d;
  uint32_T offset_1d;
  real_T yL_1d_p;
  offset_3d = ((bpIndex[3U] * stride[3U] + bpIndex[2U] * stride[2U]) + bpIndex
               [1U] * stride[1U]) + bpIndex[0U];
  if (bpIndex[0U] == maxIndex[0U]) {
    y = table[offset_3d];
  } else {
    y = (table[offset_3d + 1U] - table[offset_3d]) * frac[0U] + table[offset_3d];
  }

  if (bpIndex[1U] == maxIndex[1U]) {
  } else {
    offset_0d = offset_3d + stride[1U];
    if (bpIndex[0U] == maxIndex[0U]) {
      yR_1d = table[offset_0d];
    } else {
      yR_1d = (table[offset_0d + 1U] - table[offset_0d]) * frac[0U] +
        table[offset_0d];
    }

    y += (yR_1d - y) * frac[1U];
  }

  if (bpIndex[2U] == maxIndex[2U]) {
  } else {
    offset_1d = offset_3d + stride[2U];
    if (bpIndex[0U] == maxIndex[0U]) {
      yL_1d = table[offset_1d];
    } else {
      yL_1d = (table[offset_1d + 1U] - table[offset_1d]) * frac[0U] +
        table[offset_1d];
    }

    if (bpIndex[1U] == maxIndex[1U]) {
    } else {
      offset_0d = offset_1d + stride[1U];
      if (bpIndex[0U] == maxIndex[0U]) {
        yR_1d = table[offset_0d];
      } else {
        yR_1d = (table[offset_0d + 1U] - table[offset_0d]) * frac[0U] +
          table[offset_0d];
      }

      yL_1d += (yR_1d - yL_1d) * frac[1U];
    }

    y += (yL_1d - y) * frac[2U];
  }

  if (bpIndex[3U] == maxIndex[3U]) {
  } else {
    offset_1d = offset_3d + stride[3U];
    if (bpIndex[0U] == maxIndex[0U]) {
      yL_1d = table[offset_1d];
    } else {
      yL_1d = (table[offset_1d + 1U] - table[offset_1d]) * frac[0U] +
        table[offset_1d];
    }

    if (bpIndex[1U] == maxIndex[1U]) {
    } else {
      offset_0d = offset_1d + stride[1U];
      if (bpIndex[0U] == maxIndex[0U]) {
        yR_1d = table[offset_0d];
      } else {
        yR_1d = (table[offset_0d + 1U] - table[offset_0d]) * frac[0U] +
          table[offset_0d];
      }

      yL_1d += (yR_1d - yL_1d) * frac[1U];
    }

    if (bpIndex[2U] == maxIndex[2U]) {
    } else {
      offset_1d += stride[2U];
      if (bpIndex[0U] == maxIndex[0U]) {
        yL_1d_p = table[offset_1d];
      } else {
        yL_1d_p = (table[offset_1d + 1U] - table[offset_1d]) * frac[0U] +
          table[offset_1d];
      }

      if (bpIndex[1U] == maxIndex[1U]) {
      } else {
        offset_0d = offset_1d + stride[1U];
        if (bpIndex[0U] == maxIndex[0U]) {
          yR_1d = table[offset_0d];
        } else {
          yR_1d = (table[offset_0d + 1U] - table[offset_0d]) * frac[0U] +
            table[offset_0d];
        }

        yL_1d_p += (yR_1d - yL_1d_p) * frac[1U];
      }

      yL_1d += (yL_1d_p - yL_1d) * frac[2U];
    }

    y += (yL_1d - y) * frac[3U];
  }

  return y;
}
