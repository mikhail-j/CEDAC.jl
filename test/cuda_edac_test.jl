#=*
* libcuecc function tests
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

using CEDAC.CUECC

using NVIDIALibraries
@using_nvidialib_settings()

@test (cuInit(0) == CUDA_SUCCESS)

println("CUDA driver version: ", cuDriverGetVersion())

dev = cuDeviceGet(0)

ctx = cuDevicePrimaryCtxRetain(dev)

#set current context
@assert (cuCtxSetCurrent(ctx) == CUDA_SUCCESS)

A = collect(UInt64(i) for i in 0:31)
B = zeros(UInt32, 31)
C = zeros(UInt16, 31)

d_A = cuda_allocate(A)
d_B = cuda_allocate(B)
d_C = cuda_allocate(C)

handle = cuECCInit()

@test (cuECCSetPreferredHsiao_77_22_Version(handle, 2) == CUDA_EDAC_SUCCESS) 

# default memory scrubbing interval is 300 seconds
@test (cuECCGetMemoryScrubbingInterval(handle) == 300) 

@test (cuECCSetMemoryScrubbingInterval(handle, 5) == 0) 

@test (cuECCGetMemoryScrubbingInterval(handle) == 5) 

mem_A = cuECCAddMemoryObject(handle, d_A.ptr)
cuECCAddMemoryObject(handle, d_B.ptr)
cuECCAddMemoryObject(handle, d_C.ptr)

# lock EDAC mutex
@test (cuECCLockEDACMutex(handle) == CUDA_EDAC_SUCCESS)

@test (cuECCUpdateMemoryObject(handle, mem_A) == CUDA_EDAC_SUCCESS)

parity_A = cuECCGetMemoryObjectParityBits(handle, mem_A)

@test (cuECCUpdateMemoryObjectWithDevicePointer(handle, d_B.ptr) == CUDA_EDAC_SUCCESS)

parity_B = cuECCGetMemoryObjectParityBitsWithDevicePointer(handle, d_B.ptr)

@test (cuECCEDAC(handle, mem_A) == CUDA_EDAC_SUCCESS)

# unlock EDAC mutex
@test (cuECCUnlockEDACMutex(handle) == CUDA_EDAC_SUCCESS)

@test (cuECCEDAC(handle, mem_A) == CUDA_EDAC_SUCCESS)

@test (cuECCGetTotalErrorsSizeWithDevicePointer(handle, d_A.ptr) === Csize_t(2 * sizeof(UInt64)))

total_errors = zeros(UInt64, 2)
cuECCGetTotalErrorsWithDevicePointer!(handle, d_B.ptr, total_errors)

@test (cuECCGetTotalErrorsSize(mem_A) === Csize_t(2 * sizeof(UInt64)))

cuECCGetTotalErrors!(handle, mem_A, total_errors)

cuECCDestroy(handle)

deallocate!(d_C)
deallocate!(d_B)
deallocate!(d_A)

@test (cuDevicePrimaryCtxRelease(dev) == CUDA_SUCCESS)
