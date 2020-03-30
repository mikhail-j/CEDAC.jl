#=*
* High Level OpenCL functions
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

function clGetErrorName(e::cl_int)::String
    if (e == CL_SUCCESS)
        return "CL_SUCCESS"
    elseif (e == CL_DEVICE_NOT_FOUND)
        return "CL_DEVICE_NOT_FOUND"
    elseif (e == CL_DEVICE_NOT_AVAILABLE)
        return "CL_DEVICE_NOT_AVAILABLE"
    elseif (e == CL_COMPILER_NOT_AVAILABLE)
        return "CL_COMPILER_NOT_AVAILABLE"
    elseif (e == CL_MEM_OBJECT_ALLOCATION_FAILURE)
        return "CL_MEM_OBJECT_ALLOCATION_FAILURE"
    elseif (e == CL_OUT_OF_RESOURCES)
        return "CL_OUT_OF_RESOURCES"
    elseif (e == CL_OUT_OF_HOST_MEMORY)
        return "CL_OUT_OF_HOST_MEMORY"
    elseif (e == CL_PROFILING_INFO_NOT_AVAILABLE)
        return "CL_PROFILING_INFO_NOT_AVAILABLE"
    elseif (e == CL_MEM_COPY_OVERLAP)
        return "CL_MEM_COPY_OVERLAP"
    elseif (e == CL_IMAGE_FORMAT_MISMATCH)
        return "CL_IMAGE_FORMAT_MISMATCH"
    elseif (e == CL_IMAGE_FORMAT_NOT_SUPPORTED)
        return "CL_IMAGE_FORMAT_NOT_SUPPORTED"
    elseif (e == CL_BUILD_PROGRAM_FAILURE)
        return "CL_BUILD_PROGRAM_FAILURE"
    elseif (e == CL_MAP_FAILURE)
        return "CL_MAP_FAILURE"
    elseif (e == CL_MISALIGNED_SUB_BUFFER_OFFSET)
        return "CL_MISALIGNED_SUB_BUFFER_OFFSET"
    elseif (e == CL_EXEC_STATUS_e_FOR_EVENTS_IN_WAIT_LIST)
        return "CL_EXEC_STATUS_e_FOR_EVENTS_IN_WAIT_LIST"
    elseif (e == CL_COMPILE_PROGRAM_FAILURE)
        return "CL_COMPILE_PROGRAM_FAILURE"
    elseif (e == CL_LINKER_NOT_AVAILABLE)
        return "CL_LINKER_NOT_AVAILABLE"
    elseif (e == CL_LINK_PROGRAM_FAILURE)
        return "CL_LINK_PROGRAM_FAILURE"
    elseif (e == CL_DEVICE_PARTITION_FAILED)
        return "CL_DEVICE_PARTITION_FAILED"
    elseif (e == CL_KERNEL_ARG_INFO_NOT_AVAILABLE)
        return "CL_KERNEL_ARG_INFO_NOT_AVAILABLE"
    elseif (e == CL_INVALID_VALUE)
        return "CL_INVALID_VALUE"
    elseif (e == CL_INVALID_DEVICE_TYPE)
        return "CL_INVALID_DEVICE_TYPE"
    elseif (e == CL_INVALID_PLATFORM)
        return "CL_INVALID_PLATFORM"
    elseif (e == CL_INVALID_DEVICE)
        return "CL_INVALID_DEVICE"
    elseif (e == CL_INVALID_CONTEXT)
        return "CL_INVALID_CONTEXT"
    elseif (e == CL_INVALID_QUEUE_PROPERTIES)
        return "CL_INVALID_QUEUE_PROPERTIES"
    elseif (e == CL_INVALID_COMMAND_QUEUE)
        return "CL_INVALID_COMMAND_QUEUE"
    elseif (e == CL_INVALID_HOST_PTR)
        return "CL_INVALID_HOST_PTR"
    elseif (e == CL_INVALID_MEM_OBJECT)
        return "CL_INVALID_MEM_OBJECT"
    elseif (e == CL_INVALID_IMAGE_FORMAT_DESCRIPTOR)
        return "CL_INVALID_IMAGE_FORMAT_DESCRIPTOR"
    elseif (e == CL_INVALID_IMAGE_SIZE)
        return "CL_INVALID_IMAGE_SIZE"
    elseif (e == CL_INVALID_SAMPLER)
        return "CL_INVALID_SAMPLER"
    elseif (e == CL_INVALID_BINARY)
        return "CL_INVALID_BINARY"
    elseif (e == CL_INVALID_BUILD_OPTIONS)
        return "CL_INVALID_BUILD_OPTIONS"
    elseif (e == CL_INVALID_PROGRAM)
        return "CL_INVALID_PROGRAM"
    elseif (e == CL_INVALID_PROGRAM_EXECUTABLE)
        return "CL_INVALID_PROGRAM_EXECUTABLE"
    elseif (e == CL_INVALID_KERNEL_NAME)
        return "CL_INVALID_KERNEL_NAME"
    elseif (e == CL_INVALID_KERNEL_DEFINITION)
        return "CL_INVALID_KERNEL_DEFINITION"
    elseif (e == CL_INVALID_KERNEL)
        return "CL_INVALID_KERNEL"
    elseif (e == CL_INVALID_ARG_INDEX)
        return "CL_INVALID_ARG_INDEX"
    elseif (e == CL_INVALID_ARG_VALUE)
        return "CL_INVALID_ARG_VALUE"
    elseif (e == CL_INVALID_ARG_SIZE)
        return "CL_INVALID_ARG_SIZE"
    elseif (e == CL_INVALID_KERNEL_ARGS)
        return "CL_INVALID_KERNEL_ARGS"
    elseif (e == CL_INVALID_WORK_DIMENSION)
        return "CL_INVALID_WORK_DIMENSION"
    elseif (e == CL_INVALID_WORK_GROUP_SIZE)
        return "CL_INVALID_WORK_GROUP_SIZE"
    elseif (e == CL_INVALID_WORK_ITEM_SIZE)
        return "CL_INVALID_WORK_ITEM_SIZE"
    elseif (e == CL_INVALID_GLOBAL_OFFSET)
        return "CL_INVALID_GLOBAL_OFFSET"
    elseif (e == CL_INVALID_EVENT_WAIT_LIST)
        return "CL_INVALID_EVENT_WAIT_LIST"
    elseif (e == CL_INVALID_EVENT)
        return "CL_INVALID_EVENT"
    elseif (e == CL_INVALID_OPERATION)
        return "CL_INVALID_OPERATION"
    elseif (e == CL_INVALID_GL_OBJECT)
        return "CL_INVALID_GL_OBJECT"
    elseif (e == CL_INVALID_BUFFER_SIZE)
        return "CL_INVALID_BUFFER_SIZE"
    elseif (e == CL_INVALID_MIP_LEVEL)
        return "CL_INVALID_MIP_LEVEL"
    elseif (e == CL_INVALID_GLOBAL_WORK_SIZE)
        return "CL_INVALID_GLOBAL_WORK_SIZE"
    elseif (e == CL_INVALID_PROPERTY)
        return "CL_INVALID_PROPERTY"
    elseif (e == CL_INVALID_IMAGE_DESCRIPTOR)
        return "CL_INVALID_IMAGE_DESCRIPTOR"
    elseif (e == CL_INVALID_COMPILER_OPTIONS)
        return "CL_INVALID_COMPILER_OPTIONS"
    elseif (e == CL_INVALID_LINKER_OPTIONS)
        return "CL_INVALID_LINKER_OPTIONS"
    elseif (e == CL_INVALID_DEVICE_PARTITION_COUNT)
        return "CL_INVALID_DEVICE_PARTITION_COUNT"
    elseif (e == CL_INVALID_PIPE_SIZE)
        return "CL_INVALID_PIPE_SIZE"
    elseif (e == CL_INVALID_DEVICE_QUEUE)
        return "CL_INVALID_DEVICE_QUEUE"
    elseif (e == CL_INVALID_SPEC_ID)
        return "CL_INVALID_SPEC_ID"
    elseif (e == CL_MAX_SIZE_RESTRICTION_EXCEEDED)
        return "CL_MAX_SIZE_RESTRICTION_EXCEEDED"
    else
        return "found unknown error, " * repr(e) * "!"
    end
end

function clGetPlatformIDs(num_entries::T)::Array{cl_platform_id, 1} where {T <: Integer}
    local platforms::Array{cl_platform_id, 1} = fill(C_NULL, num_entries)
    local opencl_error::cl_int = clGetPlatformIDs(cl_uint(num_entries), Base.unsafe_convert(Ptr{cl_platform_id}, platforms), Ptr{cl_uint}(C_NULL))
    @assert (opencl_error == CL_SUCCESS) ("clGetPlatformIDs() error: " * clGetErrorName(opencl_error))
    return platforms
end

function clGetPlatformIDs()::Array{cl_platform_id, 1} where {T <: Integer}
    local num_entries::Array{cl_uint, 1} = zeros(cl_uint, 1)

    # get number of OpenCL platforms
    local opencl_error::cl_int = clGetPlatformIDs(cl_uint(0), Ptr{cl_platform_id}(C_NULL), num_entries)
    @assert (opencl_error == CL_SUCCESS) ("clGetPlatformIDs() error: " * clGetErrorName(opencl_error))

    # initialize Array{cl_platform_id} and return resulting Array
    local platforms::Array{cl_platform_id, 1} = fill(C_NULL, num_entries[1])
    opencl_error = clGetPlatformIDs(pop!(num_entries), Base.unsafe_convert(Ptr{cl_platform_id}, platforms), Ptr{cl_uint}(C_NULL))
    @assert (opencl_error == CL_SUCCESS) ("clGetPlatformIDs() error: " * clGetErrorName(opencl_error))

    return platforms
end

function clGetDeviceIDs(platform::cl_platform_id, device_type::cl_device_type, num_entries::T)::Array{cl_device_id, 1} where {T <: Integer}
    local devices::Array{cl_device_id, 1} = fill(C_NULL, num_entries)
    local opencl_error::cl_int = clGetDeviceIDs(platform, device_type, cl_uint(num_entries), Base.unsafe_convert(Ptr{cl_device_id}, devices), Ptr{cl_uint}(C_NULL))
    @assert (opencl_error == CL_SUCCESS) ("clGetDeviceIDs() error: " * clGetErrorName(opencl_error))
    return devices
end

function clGetDeviceIDs(platform::cl_platform_id, device_type::cl_device_type)::Array{cl_device_id, 1} where {T <: Integer}
    local num_entries::Array{cl_uint, 1} = zeros(cl_uint, 1)
    
    # get number of OpenCL devices in the given OpenCL platform
    local opencl_error::cl_int = clGetDeviceIDs(platform, device_type, cl_uint(0), Ptr{cl_device_id}(C_NULL), Base.unsafe_convert(Ptr{cl_uint}, num_entries))
    @assert (opencl_error == CL_SUCCESS) ("clGetDeviceIDs() error: " * clGetErrorName(opencl_error))

    # initialize Array{cl_device_id} and return resulting Array
    local devices::Array{cl_device_id, 1} = fill(C_NULL, num_entries[1])
    opencl_error = clGetDeviceIDs(platform, device_type, pop!(num_entries), Base.unsafe_convert(Ptr{cl_device_id}, devices), Ptr{cl_uint}(C_NULL))
    @assert (opencl_error == CL_SUCCESS) ("clGetDeviceIDs() error: " * clGetErrorName(opencl_error))
    
    return devices
end

function clCreateContext(properties::Ptr{cl_context_properties}, num_devices::T, devices::Array{cl_device_id, 1})::cl_context where {T <: Integer}
    local opencl_error::Array{cl_int, 1} = zeros(cl_int, 1)

    local context::cl_context = clCreateContext(properties, cl_uint(num_devices), devices, C_NULL, C_NULL, opencl_error)
    @assert (opencl_error[1] == CL_SUCCESS) ("clCreateContext() error: " * clGetErrorName(opencl_error[1]))
    
    return context
end

function clCreateBuffer(context::cl_context, flags::cl_mem_flags, size::T, host_ptr::Ptr{Nothing})::cl_mem where {T <: Integer}
    local opencl_error::Array{cl_int, 1} = zeros(cl_int, 1)

    local mem::cl_mem = clCreateBuffer(context, flags, Csize_t(size), host_ptr, opencl_error)
    @assert (opencl_error[1] == CL_SUCCESS) ("clCreateBuffer() error: " * clGetErrorName(opencl_error[1]))

    return mem
end

function clCreateCommandQueueWithProperties(context::cl_context, device::cl_device_id, properties::Ptr{cl_queue_properties})::cl_command_queue
    local opencl_error::Array{cl_int, 1} = zeros(cl_int, 1)

    local queue::cl_command_queue = clCreateCommandQueueWithProperties(context, device, properties, Base.unsafe_convert(Ptr{cl_int}, opencl_error))
    @assert (opencl_error[1] == CL_SUCCESS) ("clCreateCommandQueueWithProperties() error: " * clGetErrorName(opencl_error[1]))

    return queue
end

function clCreateCommandQueue(context::cl_context, device::cl_device_id, properties::T)::cl_command_queue where {T <: Integer}
    local opencl_error::Array{cl_int, 1} = zeros(cl_int, 1)

    local queue::cl_command_queue = clCreateCommandQueue(context, device, cl_command_queue_properties(properties), opencl_error)
    @assert (opencl_error[1] == CL_SUCCESS) ("clCreateCommandQueue() error: " * clGetErrorName(opencl_error[1]))

    return queue
end

function clEnqueueReadBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_read::cl_bool, offset::Integer, size::Integer, ptr::Array{T, 1})::cl_event where {T <: Number}
    local event::Array{cl_event, 1} = fill(cl_event(C_NULL), 1)

    local opencl_error::cl_int = clEnqueueReadBuffer(command_queue, buffer, blocking_read, Csize_t(offset), Csize_t(size), Base.unsafe_convert(Ptr{Nothing}, ptr), cl_uint(0), Ptr{cl_event}(C_NULL), Base.unsafe_convert(Ptr{cl_event}, event))
    @assert (opencl_error == CL_SUCCESS) ("clEnqueueReadBuffer() error: " * clGetErrorName(opencl_error))
    
    return pop!(event)
end

function clEnqueueWriteBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_write::cl_bool, offset::Integer, size::Integer, ptr::Array{T, 1})::cl_event where {T <: Number}
    local event::Array{cl_event, 1} = fill(cl_event(C_NULL), 1)

    local opencl_error::cl_int = clEnqueueWriteBuffer(command_queue, buffer, blocking_write, Csize_t(offset), Csize_t(size), Base.unsafe_convert(Ptr{Nothing}, ptr), cl_uint(0), Ptr{cl_event}(C_NULL), Base.unsafe_convert(Ptr{cl_event}, event))
    @assert (opencl_error == CL_SUCCESS) ("clEnqueueWriteBuffer() error: " * clGetErrorName(opencl_error))
    
    return pop!(event)
end

function clWaitForEvents(num_events::T, event_list::Array{cl_event, 1})::Nothing where {T <: Integer}
    local opencl_error::cl_int = clWaitForEvents(cl_uint(num_events), event_list)
    @assert (opencl_error == CL_SUCCESS) ("clWaitForEvents() error: " * clGetErrorName(opencl_error))
    return nothing
end
