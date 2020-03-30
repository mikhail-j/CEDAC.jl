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
@assert (clGetPlatformInfo(platform, CL_PLATFORM_VERSION, 0, C_NULL, driver_version_length_array) == CL_SUCCESS) "clGetPlatformInfo() error: unable to obtain CL_PLATFORM_VERSION information!"

driver_version_length = pop!(driver_version_length_array)

driver_version_array = zeros(UInt8, driver_version_length)
@assert (clGetPlatformInfo(platform, CL_PLATFORM_VERSION, driver_version_length, driver_version_array, Ptr{Csize_t}(C_NULL)) == CL_SUCCESS) "clGetPlatformInfo() error: unable to obtain CL_PLATFORM_VERSION information!"

driver_version = unsafe_string(Base.unsafe_convert(Ptr{UInt8}, driver_version_array))

println("OpenCL driver version: ", driver_version)

devices = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1)

A = collect(UInt64(i) for i in 0:31)

ctx = clCreateContext(Ptr{cl_context_properties}(C_NULL), 1, devices)

d_A = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt64), C_NULL)
d_B = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt32), C_NULL)
d_C = clCreateBuffer(ctx, CL_MEM_READ_WRITE, 31 * sizeof(UInt16), C_NULL)

opencl_queue = clCreateCommandQueueWithProperties(ctx, devices[1], Ptr{cl_queue_properties}(C_NULL))
opencl_error = clReleaseCommandQueue(opencl_queue)
@assert (opencl_error == CL_SUCCESS) ("clReleaseCommandQueue() error: " * clGetErrorName(opencl_error))

opencl_queue = clCreateCommandQueue(ctx, devices[1], cl_queue_properties(0))

events = Array{cl_event, 1}()
push!(events, clEnqueueWriteBuffer(opencl_queue, d_A, CL_TRUE, 0, 31 * sizeof(UInt64), A))
clWaitForEvents(1, events)

handle_array = Array{clECCHandle_t, 1}([C_NULL])
@assert (clECCInit(handle_array) == OPENCL_EDAC_SUCCESS) "clECCInit() failed!"
handle = pop!(handle_array)

@assert (clECCSetPreferredHsiao_77_22_Version(handle, 2) == OPENCL_EDAC_SUCCESS) "clECCSetPreferredHsiao_77_22_Version() failed!"

# default memory scrubbing interval is 300 seconds
delay = clECCGetMemoryScrubbingInterval(handle)
@assert (delay == 300) "clECCGetMemoryScrubbingInterval() error: wrong delay value!"

@assert (clECCSetMemoryScrubbingInterval(handle, 5) == 0) "clECCSetMemoryScrubbingInterval() failed!"

delay = clECCGetMemoryScrubbingInterval(handle)
@assert (delay == 5) "clECCGetMemoryScrubbingInterval() error: wrong delay value!"

mem_A = clECCAddMemObject(handle, d_A, opencl_queue)
clECCAddMemObject(handle, d_B, opencl_queue)
clECCAddMemObject(handle, d_C, opencl_queue)

# lock EDAC mutex
opencl_error = clECCLockEDACMutex(handle)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCLockEDACMutex() error: " * clECCGetErrorName(opencl_error))

opencl_error = clECCUpdateMemObject(handle, mem_A)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCUpdateMemObject() error: " * clECCGetErrorName(opencl_error))

parity_A = clECCGetMemObjectParityBits(handle, mem_A)

opencl_error = clECCUpdateMemObjectWithCLMem(handle, d_B)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCUpdateMemObjectWithCLMem() error: " * clECCGetErrorName(opencl_error))

parity_B = clECCGetMemObjectParityBitsWithCLMem(handle, d_B)

# unlock EDAC mutex
opencl_error = clECCUnlockEDACMutex(handle)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCUnlockEDACMutex() error: " * clECCGetErrorName(opencl_error))

total_errors = zeros(UInt64, 2)
clECCGetTotalErrorsWithCLMem!(handle, d_B, total_errors)
clECCGetTotalErrors!(handle, mem_A, total_errors)

opencl_error = clECCRemoveMemObjectWithCLMem(handle, d_C)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCRemoveMemObjectWithCLMem() error: " * clECCGetErrorName(opencl_error))
opencl_error = clECCRemoveMemObject(handle, mem_A)
@assert (opencl_error == OPENCL_EDAC_SUCCESS) ("clECCRemoveMemObject() error: " * clECCGetErrorName(opencl_error))

@assert (clECCDestroy(handle) == OPENCL_EDAC_SUCCESS) "clECCDestroy() failed!"

opencl_error = clReleaseCommandQueue(opencl_queue)
@assert (opencl_error == CL_SUCCESS) ("clReleaseCommandQueue() error: " * clGetErrorName(opencl_error))
opencl_error = clReleaseMemObject(d_C)
@assert (opencl_error == CL_SUCCESS) ("clReleaseMemObject() error: " * clGetErrorName(opencl_error))
opencl_error = clReleaseMemObject(d_B)
@assert (opencl_error == CL_SUCCESS) ("clReleaseMemObject() error: " * clGetErrorName(opencl_error))
opencl_error = clReleaseMemObject(d_A)
@assert (opencl_error == CL_SUCCESS) ("clReleaseMemObject() error: " * clGetErrorName(opencl_error))
opencl_error = clReleaseContext(ctx)
@assert (opencl_error == CL_SUCCESS) ("clReleaseContext() error: " * clGetErrorName(opencl_error))

