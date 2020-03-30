#=*
* OpenCL platform library definitions (based on CL/cl_platform.h)
*
* Copyright (C) 2020 Qijia (Michael) Jin
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*=#

# scalar types
const cl_char = Int8
const cl_uchar = UInt8
const cl_short = Int16
const cl_ushort = UInt16
const cl_int = Int32
const cl_uint = UInt32
const cl_long = Int64
const cl_ulong = UInt64

const cl_half = Float16
const cl_float = Float32
const cl_double = Float64

# Macro names and corresponding values defined by OpenCL
const CL_CHAR_BIT = 8
const CL_SCHAR_MAX = typemax(Int8)
const CL_SCHAR_MIN = typemin(Int8)
const CL_CHAR_MAX = CL_SCHAR_MAX
const CL_CHAR_MIN = CL_SCHAR_MIN
const CL_UCHAR_MAX = typemax(UInt8)
const CL_SHRT_MAX = typemax(Int16)
const CL_SHRT_MIN = typemin(Int16)
const CL_USHRT_MAX = typemax(UInt16)
const CL_INT_MAX = typemax(Int32)
const CL_INT_MIN = typemin(Int32)
const CL_UINT_MAX = typemax(UInt32)
const CL_LONG_MAX = typemax(Int64)
const CL_LONG_MIN = typemin(Int64)
const CL_ULONG_MAX = typemax(UInt64)

const CL_FLT_DIG        = 6
const CL_FLT_MANT_DIG   = 24
const CL_FLT_MAX_10_EXP = +38
const CL_FLT_MAX_EXP    = +128
const CL_FLT_MIN_10_EXP = -37
const CL_FLT_MIN_EXP    = -125
const CL_FLT_RADIX      = 2
const CL_FLT_MAX        = 340282346638528859811704183484516925440.0f0
const CL_FLT_MIN        = 1.175494350822287507969f-38
const CL_FLT_EPSILON    = 1.1920928955078125f-7

const CL_HALF_DIG        = 3
const CL_HALF_MANT_DIG   = 11
const CL_HALF_MAX_10_EXP = +4
const CL_HALF_MAX_EXP    = +16
const CL_HALF_MIN_10_EXP = -4
const CL_HALF_MIN_EXP    = -13
const CL_HALF_RADIX      = 2
const CL_HALF_MAX        = Float16(65504.0)
const CL_HALF_MIN        = Float16(6.103515625e-05)
const CL_HALF_EPSILON    = Float16(9.765625e-04)

const CL_DBL_DIG        = 15
const CL_DBL_MANT_DIG   = 53
const CL_DBL_MAX_10_EXP = +308
const CL_DBL_MAX_EXP    = +1024
const CL_DBL_MIN_10_EXP = -307
const CL_DBL_MIN_EXP    = -1021
const CL_DBL_RADIX      = 2
const CL_DBL_MAX        = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0
const CL_DBL_MIN        = 2.225073858507201383090e-308
const CL_DBL_EPSILON    = 2.220446049250313080847e-16

const CL_M_E        = 2.7182818284590452354
const CL_M_LOG2E    = 1.4426950408889634074
const CL_M_LOG10E   = 0.43429448190325182765
const CL_M_LN2      = 0.69314718055994530942
const CL_M_LN10     = 2.30258509299404568402
const CL_M_PI       = 3.14159265358979323846
const CL_M_PI_2     = 1.57079632679489661923
const CL_M_PI_4     = 0.78539816339744830962
const CL_M_1_PI     = 0.31830988618379067154
const CL_M_2_PI     = 0.63661977236758134308
const CL_M_2_SQRTPI = 1.12837916709551257390
const CL_M_SQRT2    = 1.41421356237309504880
const CL_M_SQRT1_2  = 0.70710678118654752440

const CL_M_E_F        = 2.718281828f0
const CL_M_LOG2E_F    = 1.442695041f0
const CL_M_LOG10E_F   = 0.434294482f0
const CL_M_LN2_F      = 0.693147181f0
const CL_M_LN10_F     = 2.302585093f0
const CL_M_PI_F       = 3.141592654f0
const CL_M_PI_2_F     = 1.570796327f0
const CL_M_PI_4_F     = 0.785398163f0
const CL_M_1_PI_F     = 0.318309886f0
const CL_M_2_PI_F     = 0.636619772f0
const CL_M_2_SQRTPI_F = 1.128379167f0
const CL_M_SQRT2_F    = 1.414213562f0
const CL_M_SQRT1_2_F  = 0.707106781f0

const CL_HUGE_VALF = Inf32
const CL_HUGE_VAL  = Inf
const CL_NAN       = NaN
const CL_MAXFLOAT = CL_FLT_MAX
const CL_INFINITY = CL_HUGE_VALF

# Mirror types to GL types. Mirror types allow us to avoid deciding which 87s to load
# based on whether we are using GL or GLES here.
const cl_GLuint = Cuint
const cl_GLint  = Cint
const cl_GLenum = Cuint

# ----- cl_charn ----
mutable struct cl_char2
    s0::cl_char
    s1::cl_char
end

mutable struct cl_char4
    s0::cl_char
    s1::cl_char
    s2::cl_char
    s3::cl_char
end

# cl_char3 is identical in size, alignment and behavior to cl_char4. See section 6.1.5.
const cl_char3 = cl_char4

mutable struct cl_char8
    s0::cl_char
    s1::cl_char
    s2::cl_char
    s3::cl_char
    s4::cl_char
    s5::cl_char
    s6::cl_char
    s7::cl_char
end

mutable struct cl_char16
    s0::cl_char
    s1::cl_char
    s2::cl_char
    s3::cl_char
    s4::cl_char
    s5::cl_char
    s6::cl_char
    s7::cl_char
    s8::cl_char
    s9::cl_char
    sA::cl_char
    sB::cl_char
    sC::cl_char
    sD::cl_char
    sE::cl_char
    sF::cl_char
end

# ----- cl_ucharn ----
mutable struct cl_uchar2
    s0::cl_uchar
    s1::cl_uchar
end

mutable struct cl_uchar4
    s0::cl_uchar
    s1::cl_uchar
    s2::cl_uchar
    s3::cl_uchar
end

# cl_uchar3 is identical in size, alignment and behavior to cl_uchar4. See section 6.1.5.
const cl_uchar3 = cl_uchar4

mutable struct cl_uchar8
    s0::cl_uchar
    s1::cl_uchar
    s2::cl_uchar
    s3::cl_uchar
    s4::cl_uchar
    s5::cl_uchar
    s6::cl_uchar
    s7::cl_uchar
end

mutable struct cl_uchar16
    s0::cl_uchar
    s1::cl_uchar
    s2::cl_uchar
    s3::cl_uchar
    s4::cl_uchar
    s5::cl_uchar
    s6::cl_uchar
    s7::cl_uchar
    s8::cl_uchar
    s9::cl_uchar
    sA::cl_uchar
    sB::cl_uchar
    sC::cl_uchar
    sD::cl_uchar
    sE::cl_uchar
    sF::cl_uchar
end

# ----- cl_shortn ----
mutable struct cl_short2
    s0::cl_short
    s1::cl_short
end

mutable struct cl_short4
    s0::cl_short
    s1::cl_short
    s2::cl_short
    s3::cl_short
end

# cl_short3 is identical in size, alignment and behavior to cl_short4. See section 6.1.5.
const cl_short3 = cl_short4

mutable struct cl_short8
    s0::cl_short
    s1::cl_short
    s2::cl_short
    s3::cl_short
    s4::cl_short
    s5::cl_short
    s6::cl_short
    s7::cl_short
end

mutable struct cl_short16
    s0::cl_short
    s1::cl_short
    s2::cl_short
    s3::cl_short
    s4::cl_short
    s5::cl_short
    s6::cl_short
    s7::cl_short
    s8::cl_short
    s9::cl_short
    sA::cl_short
    sB::cl_short
    sC::cl_short
    sD::cl_short
    sE::cl_short
    sF::cl_short
end

# ----- cl_ushortn ----
mutable struct cl_ushort2
    s0::cl_ushort
    s1::cl_ushort
end

mutable struct cl_ushort4
    s0::cl_ushort
    s1::cl_ushort
    s2::cl_ushort
    s3::cl_ushort
end

# cl_ushort3 is identical in size, alignment and behavior to cl_ushort4. See section 6.1.5.
const cl_ushort3 = cl_ushort4

mutable struct cl_ushort8
    s0::cl_ushort
    s1::cl_ushort
    s2::cl_ushort
    s3::cl_ushort
    s4::cl_ushort
    s5::cl_ushort
    s6::cl_ushort
    s7::cl_ushort
end

mutable struct cl_ushort16
    s0::cl_ushort
    s1::cl_ushort
    s2::cl_ushort
    s3::cl_ushort
    s4::cl_ushort
    s5::cl_ushort
    s6::cl_ushort
    s7::cl_ushort
    s8::cl_ushort
    s9::cl_ushort
    sA::cl_ushort
    sB::cl_ushort
    sC::cl_ushort
    sD::cl_ushort
    sE::cl_ushort
    sF::cl_ushort
end

# ----- cl_halfn ----
mutable struct cl_half2
    s0::cl_half
    s1::cl_half
end

mutable struct cl_half4
    s0::cl_half
    s1::cl_half
    s2::cl_half
    s3::cl_half
end

# cl_half3 is identical in size, alignment and behavior to cl_half4. See section 6.1.5.
const cl_half3 = cl_half4

mutable struct cl_half8
    s0::cl_half
    s1::cl_half
    s2::cl_half
    s3::cl_half
    s4::cl_half
    s5::cl_half
    s6::cl_half
    s7::cl_half
end

mutable struct cl_half16
    s0::cl_half
    s1::cl_half
    s2::cl_half
    s3::cl_half
    s4::cl_half
    s5::cl_half
    s6::cl_half
    s7::cl_half
    s8::cl_half
    s9::cl_half
    sA::cl_half
    sB::cl_half
    sC::cl_half
    sD::cl_half
    sE::cl_half
    sF::cl_half
end

# ----- cl_intn ----
mutable struct cl_int2
    s0::cl_int
    s1::cl_int
end

mutable struct cl_int4
    s0::cl_int
    s1::cl_int
    s2::cl_int
    s3::cl_int
end

# cl_int3 is identical in size, alignment and behavior to cl_int4. See section 6.1.5.
const cl_int3 = cl_int4

mutable struct cl_int8
    s0::cl_int
    s1::cl_int
    s2::cl_int
    s3::cl_int
    s4::cl_int
    s5::cl_int
    s6::cl_int
    s7::cl_int
end

mutable struct cl_int16
    s0::cl_int
    s1::cl_int
    s2::cl_int
    s3::cl_int
    s4::cl_int
    s5::cl_int
    s6::cl_int
    s7::cl_int
    s8::cl_int
    s9::cl_int
    sA::cl_int
    sB::cl_int
    sC::cl_int
    sD::cl_int
    sE::cl_int
    sF::cl_int
end

# ----- cl_uintn ----
mutable struct cl_uint2
    s0::cl_uint
    s1::cl_uint
end

mutable struct cl_uint4
    s0::cl_uint
    s1::cl_uint
    s2::cl_uint
    s3::cl_uint
end

# cl_uint3 is identical in size, alignment and behavior to cl_uint4. See section 6.1.5.
const cl_uint3 = cl_uint4

mutable struct cl_uint8
    s0::cl_uint
    s1::cl_uint
    s2::cl_uint
    s3::cl_uint
    s4::cl_uint
    s5::cl_uint
    s6::cl_uint
    s7::cl_uint
end

mutable struct cl_uint16
    s0::cl_uint
    s1::cl_uint
    s2::cl_uint
    s3::cl_uint
    s4::cl_uint
    s5::cl_uint
    s6::cl_uint
    s7::cl_uint
    s8::cl_uint
    s9::cl_uint
    sA::cl_uint
    sB::cl_uint
    sC::cl_uint
    sD::cl_uint
    sE::cl_uint
    sF::cl_uint
end

# ----- cl_longn ----
mutable struct cl_long2
    s0::cl_long
    s1::cl_long
end

mutable struct cl_long4
    s0::cl_long
    s1::cl_long
    s2::cl_long
    s3::cl_long
end

# cl_long3 is identical in size, alignment and behavior to cl_long4. See section 6.1.5.
const cl_long3 = cl_long4

mutable struct cl_long8
    s0::cl_long
    s1::cl_long
    s2::cl_long
    s3::cl_long
    s4::cl_long
    s5::cl_long
    s6::cl_long
    s7::cl_long
end

mutable struct cl_long16
    s0::cl_long
    s1::cl_long
    s2::cl_long
    s3::cl_long
    s4::cl_long
    s5::cl_long
    s6::cl_long
    s7::cl_long
    s8::cl_long
    s9::cl_long
    sA::cl_long
    sB::cl_long
    sC::cl_long
    sD::cl_long
    sE::cl_long
    sF::cl_long
end

# ----- cl_ulongn ----
mutable struct cl_ulong2
    s0::cl_ulong
    s1::cl_ulong
end

mutable struct cl_ulong4
    s0::cl_ulong
    s1::cl_ulong
    s2::cl_ulong
    s3::cl_ulong
end

# cl_ulong3 is identical in size, alignment and behavior to cl_ulong4. See section 6.1.5.
const cl_ulong3 = cl_ulong4

mutable struct cl_ulong8
    s0::cl_ulong
    s1::cl_ulong
    s2::cl_ulong
    s3::cl_ulong
    s4::cl_ulong
    s5::cl_ulong
    s6::cl_ulong
    s7::cl_ulong
end

mutable struct cl_ulong16
    s0::cl_ulong
    s1::cl_ulong
    s2::cl_ulong
    s3::cl_ulong
    s4::cl_ulong
    s5::cl_ulong
    s6::cl_ulong
    s7::cl_ulong
    s8::cl_ulong
    s9::cl_ulong
    sA::cl_ulong
    sB::cl_ulong
    sC::cl_ulong
    sD::cl_ulong
    sE::cl_ulong
    sF::cl_ulong
end

# ----- cl_floatn ----
mutable struct cl_float2
    s0::cl_float
    s1::cl_float
end

mutable struct cl_float4
    s0::cl_float
    s1::cl_float
    s2::cl_float
    s3::cl_float
end

# cl_float3 is identical in size, alignment and behavior to cl_float4. See section 6.1.5.
const cl_float3 = cl_float4

mutable struct cl_float8
    s0::cl_float
    s1::cl_float
    s2::cl_float
    s3::cl_float
    s4::cl_float
    s5::cl_float
    s6::cl_float
    s7::cl_float
end

mutable struct cl_float16
    s0::cl_float
    s1::cl_float
    s2::cl_float
    s3::cl_float
    s4::cl_float
    s5::cl_float
    s6::cl_float
    s7::cl_float
    s8::cl_float
    s9::cl_float
    sA::cl_float
    sB::cl_float
    sC::cl_float
    sD::cl_float
    sE::cl_float
    sF::cl_float
end

# ----- cl_doublen ----
mutable struct cl_double2
    s0::cl_double
    s1::cl_double
end

mutable struct cl_double4
    s0::cl_double
    s1::cl_double
    s2::cl_double
    s3::cl_double
end

# cl_double3 is identical in size, alignment and behavior to cl_double4. See section 6.1.5.
const cl_double3 = cl_double4

mutable struct cl_double8
    s0::cl_double
    s1::cl_double
    s2::cl_double
    s3::cl_double
    s4::cl_double
    s5::cl_double
    s6::cl_double
    s7::cl_double
end

mutable struct cl_double16
    s0::cl_double
    s1::cl_double
    s2::cl_double
    s3::cl_double
    s4::cl_double
    s5::cl_double
    s6::cl_double
    s7::cl_double
    s8::cl_double
    s9::cl_double
    sA::cl_double
    sB::cl_double
    sC::cl_double
    sD::cl_double
    sE::cl_double
    sF::cl_double
end
