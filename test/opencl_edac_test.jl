#=*
* libclecc function tests
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

using CEDAC.CLECC.OpenCL
using CEDAC.CLECC

platform = pop!(clGetPlatformIDs(1))

driver_version_length_array = zeros(Csize_t, 1)
@test (clGetPlatformInfo(platform, CL_PLATFORM_VERSION, 0, C_NULL, driver_version_length_array) == CL_SUCCESS)

driver_version_length = pop!(driver_version_length_array)

driver_version_array = zeros(UInt8, driver_version_length)
@test (clGetPlatformInfo(platform, CL_PLATFORM_VERSION, driver_version_length, driver_version_array, Ptr{Csize_t}(C_NULL)) == CL_SUCCESS)

driver_version = unsafe_string(Base.unsafe_convert(Ptr{UInt8}, driver_version_array))

println("OpenCL driver version: ", driver_version)

devices = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1)

A = collect(UInt64(i) for i in 0:31)

ctx = clCreateContext(Ptr{cl_context_properties}(C_NULL), 1, devices)

d_A = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt64), C_NULL)
d_B = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt32), C_NULL)
d_C = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt16), C_NULL)

opencl_queue = clCreateCommandQueueWithProperties(ctx, devices[1], Ptr{cl_queue_properties}(C_NULL))
@test (clReleaseCommandQueue(opencl_queue) == CL_SUCCESS)

opencl_queue = clCreateCommandQueue(ctx, devices[1], cl_queue_properties(0))

events = Array{cl_event, 1}()
push!(events, clEnqueueWriteBuffer(opencl_queue, d_A, CL_TRUE, 0, 31 * sizeof(UInt64), A))
clWaitForEvents(1, events)

handle_array = Array{clECCHandle_t, 1}([C_NULL])
@test (clECCInit(handle_array) == OPENCL_EDAC_SUCCESS) 
handle = pop!(handle_array)

@test (clECCSetPreferredHsiao_77_22_Version(handle, 2) == OPENCL_EDAC_SUCCESS) 

# default memory scrubbing interval is 300 seconds
@test (clECCGetMemoryScrubbingInterval(handle) == 300) 

@test (clECCSetMemoryScrubbingInterval(handle, 5) == 0) 

@test (clECCGetMemoryScrubbingInterval(handle) == 5) 

mem_A = clECCAddMemObject(handle, d_A, opencl_queue)
clECCAddMemObject(handle, d_B, opencl_queue)
clECCAddMemObject(handle, d_C, opencl_queue)

# lock EDAC mutex
@test (clECCLockEDACMutex(handle) == OPENCL_EDAC_SUCCESS)

@test (clECCUpdateMemObject(handle, mem_A) == OPENCL_EDAC_SUCCESS)

parity_A = clECCGetMemObjectParityBits(handle, mem_A)

@test (clECCUpdateMemObjectWithCLMem(handle, d_B) == OPENCL_EDAC_SUCCESS)

parity_B = clECCGetMemObjectParityBitsWithCLMem(handle, d_B)

# unlock EDAC mutex
@test (clECCUnlockEDACMutex(handle) == OPENCL_EDAC_SUCCESS)

@test (clECCGetTotalErrorsSizeWithCLMem(handle, d_A) === Csize_t(2 * sizeof(UInt64)))

total_errors = zeros(UInt64, 2)
clECCGetTotalErrorsWithCLMem!(handle, d_B, total_errors)

@test (clECCGetTotalErrorsSize(mem_A) === Csize_t(2 * sizeof(UInt64)))

clECCGetTotalErrors!(handle, mem_A, total_errors)

@test (clECCRemoveMemObjectWithCLMem(handle, d_C) == OPENCL_EDAC_SUCCESS)
@test (clECCRemoveMemObject(handle, mem_A) == OPENCL_EDAC_SUCCESS)

clECCDestroy(handle)

@test (clReleaseCommandQueue(opencl_queue) == CL_SUCCESS)
@test (clReleaseMemObject(d_C) == CL_SUCCESS)
@test (clReleaseMemObject(d_B) == CL_SUCCESS)
@test (clReleaseMemObject(d_A) == CL_SUCCESS)
@test (clReleaseContext(ctx) == CL_SUCCESS)

