#=*
* OpenCL library functions (based on CL/cl.h)
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

# Platform API
function clGetPlatformIDs(num_entries::cl_uint, platforms::Array{cl_platform_id, 1}, num_platforms::Array{cl_uint, 1})::cl_int
    return ccall((:clGetPlatformIDs, libopencl), cl_int, (cl_uint, Ref{cl_platform_id}, Ref{cl_uint},), num_entries, Base.cconvert(Ref{cl_platform_id}, platforms), Base.cconvert(Ref{cl_uint}, num_platforms))
end

function clGetPlatformIDs(num_entries::cl_uint, platforms::Ptr{cl_platform_id}, num_platforms::Ptr{cl_uint})::cl_int
    return ccall((:clGetPlatformIDs, libopencl), cl_int, (cl_uint, Ptr{cl_platform_id}, Ptr{cl_uint},), num_entries, platforms, num_platforms)
end

function clGetPlatformInfo(platform::cl_platform_id, param_name::cl_platform_info, param_value_size::Csize_t, param_value::Array{T, 1}, param_value_size_ret::Array{Csize_t, 1})::cl_int where {T <: Any}
    return ccall((:clGetPlatformInfo, libopencl), cl_int, (cl_platform_id, cl_platform_info, Csize_t, Ref{T}, Ref{Csize_t},), platform, param_name, param_value_size, Base.cconvert(Ref{T}, param_value), Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetPlatformInfo(platform::cl_platform_id, param_name::cl_platform_info, param_value_size::Csize_t, param_value::Array{T, 1}, param_value_size_ret::Ptr{Csize_t})::cl_int where {T <: Any}
    return ccall((:clGetPlatformInfo, libopencl), cl_int, (cl_platform_id, cl_platform_info, Csize_t, Ref{T}, Ptr{Csize_t},), platform, param_name, param_value_size, Base.cconvert(Ref{T}, param_value), param_value_size_ret)
end

function clGetPlatformInfo(platform::cl_platform_id, param_name::cl_platform_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetPlatformInfo, libopencl), cl_int, (cl_platform_id, cl_platform_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), platform, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

clGetPlatformInfo(platform::cl_platform_id, param_name::cl_platform_info, param_value_size::T, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1}) where {T <: Integer} = clGetPlatformInfo(platform, param_name, Csize_t(param_value_size), param_value, param_value_size_ret)

function clGetPlatformInfo(platform::cl_platform_id, param_name::cl_platform_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetPlatformInfo, libopencl), cl_int, (cl_platform_id, cl_platform_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), platform, param_name, param_value_size, param_value, param_value_size_ret)
end

# Device APIs
function clGetDeviceIDs(platform::cl_platform_id, device_type::cl_device_type, num_entries::cl_uint, devices::Array{cl_device_id, 1}, num_devices::Array{cl_uint, 1})::cl_int
    return ccall((:clGetDeviceIDs, libopencl), cl_int, (cl_platform_id, cl_device_type, cl_uint, Ref{cl_device_id}, Ref{cl_uint},), platform, device_type, num_entries, Base.cconvert(Ref{cl_device_id}, devices), Base.cconvert(Ref{cl_uint}, num_devices))
end

function clGetDeviceIDs(platform::cl_platform_id, device_type::cl_device_type, num_entries::cl_uint, devices::Ptr{cl_device_id}, num_devices::Ptr{cl_uint})::cl_int
    return ccall((:clGetDeviceIDs, libopencl), cl_int, (cl_platform_id, cl_device_type, cl_uint, Ptr{cl_device_id}, Ptr{cl_uint},), platform, device_type, num_entries, devices, num_devices)
end

function clGetDeviceInfo(device::cl_device_id, param_name::cl_device_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetDeviceInfo, libopencl), cl_int, (cl_device_id, cl_device_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), device, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetDeviceInfo(device::cl_device_id, param_name::cl_device_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetDeviceInfo, libopencl), cl_int, (cl_device_id, cl_device_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), device, param_name, param_value_size, param_value, param_value_size_ret)
end

function clCreateSubDevices(in_device::cl_device_id, properties::Array{cl_device_partition_property, 1}, num_devices::cl_uint, out_devices::Array{cl_device_id, 1}, num_devices_ret::Array{cl_uint, 1})::cl_int
    return ccall((:clCreateSubDevices, libopencl), cl_int, (cl_device_id, Ref{cl_device_partition_property}, cl_uint, Ref{cl_device_id}, Ref{cl_uint},), in_device, Base.cconvert(Ref{cl_device_partition_property}, properties), num_devices, Base.cconvert(Ref{cl_device_id}, out_devices), Base.cconvert(Ref{cl_uint}, num_devices_ret))
end

function clCreateSubDevices(in_device::cl_device_id, properties::Ptr{cl_device_partition_property}, num_devices::cl_uint, out_devices::Ptr{cl_device_id}, num_devices_ret::Ptr{cl_uint})::cl_int
    return ccall((:clCreateSubDevices, libopencl), cl_int, (cl_device_id, Ptr{cl_device_partition_property}, cl_uint, Ptr{cl_device_id}, Ptr{cl_uint},), in_device, properties, num_devices, out_devices, num_devices_ret)
end

function clRetainDevice(device::cl_device_id)::cl_int
    return ccall((:clRetainDevice, libopencl), cl_int, (cl_device_id,), device)
end

function clReleaseDevice(device::cl_device_id)::cl_int
    return ccall((:clReleaseDevice, libopencl), cl_int, (cl_device_id,), device)
end

function clSetDefaultDeviceCommandQueue(context::cl_context, device::cl_device_id, command_queue::cl_command_queue)::cl_int
    return ccall((:clSetDefaultDeviceCommandQueue, libopencl), cl_int, (cl_context, cl_device_id, cl_command_queue,), context, device, command_queue)
end

function clGetDeviceAndHostTimer(device::cl_device_id, device_timestamp::Array{cl_ulong, 1}, host_timestamp::Array{cl_ulong, 1})::cl_int
    return ccall((:clGetDeviceAndHostTimer, libopencl), cl_int, (cl_device_id, Ref{cl_ulong}, Ref{cl_ulong},), device, Base.cconvert(Ref{cl_ulong}, device_timestamp), Base.cconvert(Ref{cl_ulong}, host_timestamp))
end

function clGetDeviceAndHostTimer(device::cl_device_id, device_timestamp::Ptr{cl_ulong}, host_timestamp::Ptr{cl_ulong})::cl_int
    return ccall((:clGetDeviceAndHostTimer, libopencl), cl_int, (cl_device_id, Ptr{cl_ulong}, Ptr{cl_ulong},), device, device_timestamp, host_timestamp)
end

function clGetHostTimer(device::cl_device_id, host_timestamp::Array{cl_ulong, 1})::cl_int
    return ccall((:clGetHostTimer, libopencl), cl_int, (cl_device_id, Ref{cl_ulong},), device, Base.cconvert(Ref{cl_ulong}, host_timestamp))
end

function clGetHostTimer(device::cl_device_id, host_timestamp::Ptr{cl_ulong})::cl_int
    return ccall((:clGetHostTimer, libopencl), cl_int, (cl_device_id, Ptr{cl_ulong},), device, host_timestamp)
end


# Context APIs
function clCreateContext(properties::Array{cl_context_properties, 1}, num_devices::cl_uint, devices::Array{cl_device_id, 1}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_context
    return ccall((:clCreateContext, libopencl), cl_context, (Ref{cl_context_properties}, cl_uint, Ref{cl_device_id}, Ptr{Nothing}, Ptr{Nothing}, Ref{cl_int},), Base.cconvert(Ref{cl_context_properties}, properties), num_devices, Base.cconvert(Ref{cl_device_id}, devices), pfn_notify, user_data, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateContext(properties::Ptr{cl_context_properties}, num_devices::cl_uint, devices::Array{cl_device_id, 1}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_context
    return ccall((:clCreateContext, libopencl), cl_context, (Ptr{cl_context_properties}, cl_uint, Ref{cl_device_id}, Ptr{Nothing}, Ptr{Nothing}, Ref{cl_int},), properties, num_devices, Base.cconvert(Ref{cl_device_id}, devices), pfn_notify, user_data, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateContext(properties::Ptr{cl_context_properties}, num_devices::cl_uint, devices::Ptr{cl_device_id}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_context
    return ccall((:clCreateContext, libopencl), cl_context, (Ptr{cl_context_properties}, cl_uint, Ptr{cl_device_id}, Ptr{Nothing}, Ptr{Nothing}, Ptr{cl_int},), properties, num_devices, devices, pfn_notify, user_data, errcode_ret)
end

function clCreateContextFromType(properties::Array{cl_context_properties, 1}, device_type::cl_device_type, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_context
    return ccall((:clCreateContextFromType, libopencl), cl_context, (Ref{cl_context_properties}, cl_device_type, Ptr{Nothing}, Ptr{Nothing}, Ref{cl_int},), Base.cconvert(Ref{cl_context_properties}, properties), device_type, pfn_notify, user_data, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateContextFromType(properties::Ptr{cl_context_properties}, device_type::cl_device_type, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_context
    return ccall((:clCreateContextFromType, libopencl), cl_context, (Ptr{cl_context_properties}, cl_device_type, Ptr{Nothing}, Ptr{Nothing}, Ptr{cl_int},), properties, device_type, pfn_notify, user_data, errcode_ret)
end

function clRetainContext(context::cl_context)::cl_int
    return ccall((:clRetainContext, libopencl), cl_int, (cl_context,), context)
end

function clReleaseContext(context::cl_context)::cl_int
    return ccall((:clReleaseContext, libopencl), cl_int, (cl_context,), context)
end

function clGetContextInfo(context::cl_context, param_name::cl_context_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetContextInfo, libopencl), cl_int, (cl_context, cl_context_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), context, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetContextInfo(context::cl_context, param_name::cl_context_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetContextInfo, libopencl), cl_int, (cl_context, cl_context_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), context, param_name, param_value_size, param_value, param_value_size_ret)
end

# Command Queue APIs
function clCreateCommandQueueWithProperties(context::cl_context, device::cl_device_id, properties::Array{cl_queue_properties, 1}, errcode_ret::Array{cl_int, 1})::cl_command_queue
    return ccall((:clCreateCommandQueueWithProperties, libopencl), cl_command_queue, (cl_context, cl_device_id, Ref{cl_queue_properties}, Ref{cl_int},), context, device, Base.cconvert(Ref{cl_queue_properties}, properties), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateCommandQueueWithProperties(context::cl_context, device::cl_device_id, properties::Ptr{cl_queue_properties}, errcode_ret::Ptr{cl_int})::cl_command_queue
    return ccall((:clCreateCommandQueueWithProperties, libopencl), cl_command_queue, (cl_context, cl_device_id, Ptr{cl_queue_properties}, Ptr{cl_int},), context, device, properties, errcode_ret)
end

function clRetainCommandQueue(command_queue::cl_command_queue)::cl_int
    return ccall((:clRetainCommandQueue, libopencl), cl_int, (cl_command_queue,), command_queue)
end

function clReleaseCommandQueue(command_queue::cl_command_queue)::cl_int
    return ccall((:clReleaseCommandQueue, libopencl), cl_int, (cl_command_queue,), command_queue)
end

function clGetCommandQueueInfo(command_queue::cl_command_queue, param_name::cl_command_queue_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetCommandQueueInfo, libopencl), cl_int, (cl_command_queue, cl_command_queue_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), command_queue, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetCommandQueueInfo(command_queue::cl_command_queue, param_name::cl_command_queue_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetCommandQueueInfo, libopencl), cl_int, (cl_command_queue, cl_command_queue_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), command_queue, param_name, param_value_size, param_value, param_value_size_ret)
end

# Memory Object APIs
function clCreateBuffer(context::cl_context, flags::cl_mem_flags, size::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreateBuffer, libopencl), cl_mem, (cl_context, cl_mem_flags, Csize_t, Ptr{Nothing}, Ref{cl_int},), context, flags, size, host_ptr, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateBuffer(context::cl_context, flags::cl_mem_flags, size::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreateBuffer, libopencl), cl_mem, (cl_context, cl_mem_flags, Csize_t, Ptr{Nothing}, Ptr{cl_int},), context, flags, size, host_ptr, errcode_ret)
end

function clCreateSubBuffer(buffer::cl_mem, flags::cl_mem_flags, buffer_create_type::cl_buffer_create_type, buffer_create_info::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreateSubBuffer, libopencl), cl_mem, (cl_mem, cl_mem_flags, cl_buffer_create_type, Ptr{Nothing}, Ref{cl_int},), buffer, flags, buffer_create_type, buffer_create_info, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateSubBuffer(buffer::cl_mem, flags::cl_mem_flags, buffer_create_type::cl_buffer_create_type, buffer_create_info::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreateSubBuffer, libopencl), cl_mem, (cl_mem, cl_mem_flags, cl_buffer_create_type, Ptr{Nothing}, Ptr{cl_int},), buffer, flags, buffer_create_type, buffer_create_info, errcode_ret)
end

function clCreateImage(context::cl_context, flags::cl_mem_flags, image_format::Array{cl_image_format, 1}, image_desc::Array{cl_image_desc, 1}, host_ptr::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreateImage, libopencl), cl_mem, (cl_context, cl_mem_flags, Ref{cl_image_format}, Ref{cl_image_desc}, Ptr{Nothing}, Ref{cl_int},), context, flags, Base.cconvert(Ref{cl_image_format}, image_format), Base.cconvert(Ref{cl_image_desc}, image_desc), host_ptr, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateImage(context::cl_context, flags::cl_mem_flags, image_format::Ptr{cl_image_format}, image_desc::Ptr{cl_image_desc}, host_ptr::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreateImage, libopencl), cl_mem, (cl_context, cl_mem_flags, Ptr{cl_image_format}, Ptr{cl_image_desc}, Ptr{Nothing}, Ptr{cl_int},), context, flags, image_format, image_desc, host_ptr, errcode_ret)
end

function clCreatePipe(context::cl_context, flags::cl_mem_flags, pipe_packet_size::cl_uint, pipe_max_packets::cl_uint, properties::Array{cl_pipe_properties, 1}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreatePipe, libopencl), cl_mem, (cl_context, cl_mem_flags, cl_uint, cl_uint, Ref{cl_pipe_properties}, Ref{cl_int},), context, flags, pipe_packet_size, pipe_max_packets, Base.cconvert(Ref{cl_pipe_properties}, properties), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreatePipe(context::cl_context, flags::cl_mem_flags, pipe_packet_size::cl_uint, pipe_max_packets::cl_uint, properties::Ptr{cl_pipe_properties}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreatePipe, libopencl), cl_mem, (cl_context, cl_mem_flags, cl_uint, cl_uint, Ptr{cl_pipe_properties}, Ptr{cl_int},), context, flags, pipe_packet_size, pipe_max_packets, properties, errcode_ret)
end

function clRetainMemObject(memobj::cl_mem)::cl_int
    return ccall((:clRetainMemObject, libopencl), cl_int, (cl_mem,), memobj)
end

function clReleaseMemObject(memobj::cl_mem)::cl_int
    return ccall((:clReleaseMemObject, libopencl), cl_int, (cl_mem,), memobj)
end

function clGetSupportedImageFormats(context::cl_context, flags::cl_mem_flags, image_type::cl_mem_object_type, num_entries::cl_uint, image_formats::Array{cl_image_format, 1}, num_image_formats::Array{cl_uint, 1})::cl_int
    return ccall((:clGetSupportedImageFormats, libopencl), cl_int, (cl_context, cl_mem_flags, cl_mem_object_type, cl_uint, Ref{cl_image_format}, Ref{cl_uint},), context, flags, image_type, num_entries, Base.cconvert(Ref{cl_image_format}, image_formats), Base.cconvert(Ref{cl_uint}, num_image_formats))
end

function clGetSupportedImageFormats(context::cl_context, flags::cl_mem_flags, image_type::cl_mem_object_type, num_entries::cl_uint, image_formats::Ptr{cl_image_format}, num_image_formats::Ptr{cl_uint})::cl_int
    return ccall((:clGetSupportedImageFormats, libopencl), cl_int, (cl_context, cl_mem_flags, cl_mem_object_type, cl_uint, Ptr{cl_image_format}, Ptr{cl_uint},), context, flags, image_type, num_entries, image_formats, num_image_formats)
end

function clGetMemObjectInfo(memobj::cl_mem, param_name::cl_mem_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetMemObjectInfo, libopencl), cl_int, (cl_mem, cl_mem_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), memobj, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetMemObjectInfo(memobj::cl_mem, param_name::cl_mem_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetMemObjectInfo, libopencl), cl_int, (cl_mem, cl_mem_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), memobj, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetImageInfo(image::cl_mem, param_name::cl_image_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetImageInfo, libopencl), cl_int, (cl_mem, cl_image_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), image, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetImageInfo(image::cl_mem, param_name::cl_image_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetImageInfo, libopencl), cl_int, (cl_mem, cl_image_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), image, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetPipeInfo(pipe::cl_mem, param_name::cl_pipe_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetPipeInfo, libopencl), cl_int, (cl_mem, cl_pipe_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), pipe, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetPipeInfo(pipe::cl_mem, param_name::cl_pipe_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetPipeInfo, libopencl), cl_int, (cl_mem, cl_pipe_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), pipe, param_name, param_value_size, param_value, param_value_size_ret)
end

function clSetMemObjectDestructorCallback(pipe::cl_mem, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clSetMemObjectDestructorCallback, libopencl), cl_int, (cl_mem, Ptr{Nothing}, Ptr{Nothing},), pipe, pfn_notify, user_data)
end

# SVM Allocation APIs
function clSVMAlloc(context::cl_context, flags::cl_svm_mem_flags, size::Csize_t, alignment::cl_uint)::Ptr{Nothing}
    return ccall((:clSVMAlloc, libopencl), Ptr{Nothing}, (cl_context, cl_svm_mem_flags, Csize_t, cl_uint,), context, flags, size, alignment)
end

function clSVMFree(context::cl_context, svm_pointer::Ptr{Nothing})::Nothing
    return ccall((:clSVMFree, libopencl), Nothing, (cl_context, Ptr{Nothing},), context, svm_pointer)
end

# Sampler APIs
function clCreateSamplerWithProperties(context::cl_context, sampler_properties::Array{cl_sampler_properties, 1}, errcode_ret::Array{cl_int, 1})::cl_sampler
    return ccall((:clCreateSamplerWithProperties, libopencl), cl_sampler, (cl_context, Ref{cl_sampler_properties}, Ref{cl_int},), context, Base.cconvert(Ref{cl_sampler_properties}, sampler_properties), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateSamplerWithProperties(context::cl_context, sampler_properties::Ptr{cl_sampler_properties}, errcode_ret::Ptr{cl_int})::cl_sampler
    return ccall((:clCreateSamplerWithProperties, libopencl), cl_sampler, (cl_context, Ptr{cl_sampler_properties}, Ptr{cl_int},), context, sampler_properties, errcode_ret)
end

function clRetainSampler(sampler::cl_sampler)::cl_int
    return ccall((:clRetainSampler, libopencl), cl_int, (cl_sampler,), sampler)
end

function clReleaseSampler(sampler::cl_sampler)::cl_int
    return ccall((:clReleaseSampler, libopencl), cl_int, (cl_sampler,), sampler)
end

function clGetSamplerInfo(sampler::cl_sampler, param_name::cl_sampler_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetSamplerInfo, libopencl), cl_int, (cl_sampler, cl_sampler_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), sampler, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetSamplerInfo(sampler::cl_sampler, param_name::cl_sampler_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetSamplerInfo, libopencl), cl_int, (cl_sampler, cl_sampler_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), sampler, param_name, param_value_size, param_value, param_value_size_ret)
end

# Program Object APIs
function clCreateProgramWithSource(context::cl_context, count::cl_uint, strings::Array{Ptr{Cchar}, 1}, lengths::Array{Csize_t, 1}, errcode_ret::Array{cl_int, 1})::cl_program
    return ccall((:clCreateProgramWithSource, libopencl), cl_program, (cl_context, cl_uint, Ref{Ptr{Cchar}}, Ref{Csize_t}, Ref{cl_int},), context, count, Base.cconvert(Ref{Ptr{Cchar}}, strings), Base.cconvert(Ref{Csize_t}, lengths), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateProgramWithSource(context::cl_context, count::cl_uint, strings::Ptr{Ptr{Cchar}}, lengths::Ptr{Csize_t}, errcode_ret::Ptr{cl_int})::cl_program
    return ccall((:clCreateProgramWithSource, libopencl), cl_program, (cl_context, cl_uint, Ptr{Ptr{Cchar}}, Ptr{Csize_t}, Ptr{cl_int},), context, count, strings, lengths, errcode_ret)
end

function clCreateProgramWithBinary(context::cl_context, num_devices::cl_uint, device_list::Array{cl_device_id, 1}, lengths::Array{Csize_t, 1}, binaries::Array{Ptr{Cuchar}, 1}, binary_status::Array{cl_int, 1}, errcode_ret::Array{cl_int, 1})::cl_program
    return ccall((:clCreateProgramWithBinary, libopencl), cl_program, (cl_context, cl_uint, Ref{cl_device_id}, Ref{Csize_t}, Ref{Ptr{Cuchar}}, Ref{cl_int}, Ref{cl_int},), context, num_devices, Base.cconvert(Ref{cl_device_id}, device_list), Base.cconvert(Ref{Csize_t}, lengths), Base.cconvert(Ref{Ptr{Cuchar}}, binaries), Base.cconvert(Ref{cl_int}, binary_status), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateProgramWithBinary(context::cl_context, num_devices::cl_uint, device_list::Ptr{cl_device_id}, lengths::Ptr{Csize_t}, binaries::Ptr{Ptr{Cuchar}}, binary_status::Ptr{cl_int}, errcode_ret::Ptr{cl_int})::cl_program
    return ccall((:clCreateProgramWithBinary, libopencl), cl_program, (cl_context, cl_uint, Ptr{cl_device_id}, Ptr{Csize_t}, Ptr{Ptr{Cuchar}}, Ptr{cl_int}, Ptr{cl_int},), context, num_devices, device_list, lengths, binaries, binary_status, errcode_ret)
end

function clCreateProgramWithBuiltInKernels(context::cl_context, num_devices::cl_uint, device_list::Array{cl_device_id, 1}, kernel_names::Array{Cchar, 1}, errcode_ret::Array{cl_int, 1})::cl_program
    return ccall((:clCreateProgramWithBuiltInKernels, libopencl), cl_program, (cl_context, cl_uint, Ref{cl_device_id}, Ref{Cchar}, Ref{cl_int},), context, num_devices, Base.cconvert(Ref{cl_device_id}, device_list), Base.cconvert(Ref{Cchar}, kernel_names), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateProgramWithBuiltInKernels(context::cl_context, num_devices::cl_uint, device_list::Ptr{cl_device_id}, kernel_names::Ptr{Cchar}, errcode_ret::Ptr{cl_int})::cl_program
    return ccall((:clCreateProgramWithBuiltInKernels, libopencl), cl_program, (cl_context, cl_uint, Ptr{cl_device_id}, Ptr{Cchar}, Ptr{cl_int},), context, num_devices, device_list, kernel_names, errcode_ret)
end

function clCreateProgramWithIL(context::cl_context, il::Ptr{Nothing}, length::Csize_t, errcode_ret::Array{cl_int, 1})::cl_program
    return ccall((:clCreateProgramWithIL, libopencl), cl_program, (cl_context, Ptr{Nothing}, Csize_t, Ref{cl_int},), context, il, length, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateProgramWithIL(context::cl_context, il::Ptr{Nothing}, length::Csize_t, errcode_ret::Ptr{cl_int})::cl_program
    return ccall((:clCreateProgramWithIL, libopencl), cl_program, (cl_context, Ptr{Nothing}, Csize_t, Ptr{cl_int},), context, il, length, errcode_ret)
end

function clRetainProgram(program::cl_program)::cl_int
    return ccall((:clRetainProgram, libopencl), cl_int, (cl_program,), program)
end

function clReleaseProgram(program::cl_program)::cl_int
    return ccall((:clReleaseProgram, libopencl), cl_int, (cl_program,), program)
end

function clBuildProgram(program::cl_program, num_devices::cl_uint, device_list::Array{cl_device_id, 1}, options::Array{Cchar, 1}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clBuildProgram, libopencl), cl_int, (cl_program, cl_uint, Ref{cl_device_id}, Ref{Cchar}, Ptr{Nothing}, Ptr{Nothing},), program, num_devices, Base.cconvert(Ref{cl_device_id}, device_list), Base.cconvert(Ref{Cchar}, options), pfn_notify, user_data)
end

function clBuildProgram(program::cl_program, num_devices::cl_uint, device_list::Ptr{cl_device_id}, options::Ptr{Cchar}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clBuildProgram, libopencl), cl_int, (cl_program, cl_uint, Ptr{cl_device_id}, Ptr{Cchar}, Ptr{Nothing}, Ptr{Nothing},), program, num_devices, device_list, options, pfn_notify, user_data)
end

function clCompileProgram(program::cl_program, num_devices::cl_uint, device_list::Array{cl_device_id, 1}, options::Array{Cchar, 1}, num_input_headers::cl_uint, input_headers::Array{cl_program, 1}, header_include_names::Array{Ptr{Cchar}, 1}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clCompileProgram, libopencl), cl_int, (cl_program, cl_uint, Ref{cl_device_id}, Ref{Cchar}, cl_uint, Ref{cl_program}, Ref{Ptr{Cchar}}, Ptr{Nothing}, Ptr{Nothing},), program, num_devices, Base.cconvert(Ref{cl_device_id}, device_list), Base.cconvert(Ref{Cchar}, options), num_input_headers, Base.cconvert(Ref{cl_program}, input_headers), Base.cconvert(Ref{Ptr{Cchar}}, header_include_names), pfn_notify, user_data)
end

function clCompileProgram(program::cl_program, num_devices::cl_uint, device_list::Ptr{cl_device_id}, options::Ptr{Cchar}, num_input_headers::cl_uint, input_headers::Ptr{cl_program}, header_include_names::Ptr{Ptr{Cchar}}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clCompileProgram, libopencl), cl_int, (cl_program, cl_uint, Ptr{cl_device_id}, Ptr{Cchar}, cl_uint, Ptr{cl_program}, Ptr{Ptr{Cchar}}, Ptr{Nothing}, Ptr{Nothing},), program, num_devices, device_list, options, num_input_headers, input_headers, header_include_names, pfn_notify, user_data)
end

function clLinkProgram(context::cl_context, num_devices::cl_uint, device_list::Array{cl_device_id, 1}, options::Array{Cchar, 1}, num_input_programs::cl_uint, input_programs::Array{cl_program, 1}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_program
    return ccall((:clLinkProgram, libopencl), cl_program, (cl_context, cl_uint, Ref{cl_device_id}, Ref{Cchar}, cl_uint, Ref{cl_program}, Ptr{Nothing}, Ptr{Nothing}, Ref{cl_int},), context, num_devices, Base.cconvert(Ref{cl_device_id}, device_list), Base.cconvert(Ref{Cchar}, options), num_input_programs, Base.cconvert(Ref{cl_program}, input_programs), pfn_notify, user_data, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clLinkProgram(context::cl_context, num_devices::cl_uint, device_list::Ptr{cl_device_id}, options::Ptr{Cchar}, num_input_programs::cl_uint, input_programs::Ptr{cl_program}, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_program
    return ccall((:clLinkProgram, libopencl), cl_program, (cl_context, cl_uint, Ptr{cl_device_id}, Ptr{Cchar}, cl_uint, Ptr{cl_program}, Ptr{Nothing}, Ptr{Nothing}, Ptr{cl_int},), context, num_devices, device_list, options, num_input_programs, input_programs, pfn_notify, user_data, errcode_ret)
end

function clSetProgramReleaseCallback(program::cl_program, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clSetProgramReleaseCallback, libopencl), cl_int, (cl_program, Ptr{Nothing}, Ptr{Nothing},), program, pfn_notify, user_data)
end

function clSetProgramSpecializationConstant(program::cl_program, spec_id::cl_uint, spec_size::Csize_t, spec_value::Ptr{Nothing})::cl_int
    return ccall((:clSetProgramSpecializationConstant, libopencl), cl_int, (cl_program, cl_uint, Csize_t, Ptr{Nothing},), program, spec_id, spec_size, spec_value)
end

function clUnloadPlatformCompiler(platform::cl_platform_id)::cl_int
    return ccall((:clUnloadPlatformCompiler, libopencl), cl_int, (cl_platform_id,), platform)
end

function clGetProgramInfo(program::cl_program, param_name::cl_program_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetProgramInfo, libopencl), cl_int, (cl_program, cl_program_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), program, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetProgramInfo(program::cl_program, param_name::cl_program_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetProgramInfo, libopencl), cl_int, (cl_program, cl_program_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), program, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetProgramBuildInfo(program::cl_program, device::cl_device_id, param_name::cl_program_build_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetProgramBuildInfo, libopencl), cl_int, (cl_program, cl_device_id, cl_program_build_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), program, device, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetProgramBuildInfo(program::cl_program, device::cl_device_id, param_name::cl_program_build_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetProgramBuildInfo, libopencl), cl_int, (cl_program, cl_device_id, cl_program_build_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), program, device, param_name, param_value_size, param_value, param_value_size_ret)
end

# Kernel Object APIs
function clCreateKernel(program::cl_program, kernel_name::Array{Cchar, 1}, errcode_ret::Array{cl_int, 1})::cl_kernel
    return ccall((:clCreateKernel, libopencl), cl_kernel, (cl_program, Ref{Cchar}, Ref{cl_int},), program, Base.cconvert(Ref{Cchar}, kernel_name), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateKernel(program::cl_program, kernel_name::Ptr{Cchar}, errcode_ret::Ptr{cl_int})::cl_kernel
    return ccall((:clCreateKernel, libopencl), cl_kernel, (cl_program, Ptr{Cchar}, Ptr{cl_int},), program, kernel_name, errcode_ret)
end

function clCreateKernelsInProgram(program::cl_program, num_kernels::cl_uint, kernels::Array{cl_kernel, 1}, num_kernels_ret::Array{cl_uint, 1})::cl_int
    return ccall((:clCreateKernelsInProgram, libopencl), cl_int, (cl_program, cl_uint, Ref{cl_kernel}, Ref{cl_uint},), program, num_kernels, Base.cconvert(Ref{cl_kernel}, kernels), Base.cconvert(Ref{cl_uint}, num_kernels_ret))
end

function clCreateKernelsInProgram(program::cl_program, num_kernels::cl_uint, kernels::Ptr{cl_kernel}, num_kernels_ret::Ptr{cl_uint})::cl_int
    return ccall((:clCreateKernelsInProgram, libopencl), cl_int, (cl_program, cl_uint, Ptr{cl_kernel}, Ptr{cl_uint},), program, num_kernels, kernels, num_kernels_ret)
end

function clCloneKernel(source_kernel::cl_kernel, errcode_ret::Array{cl_int, 1})::cl_kernel
    return ccall((:clCloneKernel, libopencl), cl_kernel, (cl_kernel, Ref{cl_int},), source_kernel, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCloneKernel(source_kernel::cl_kernel, errcode_ret::Ptr{cl_int})::cl_kernel
    return ccall((:clCloneKernel, libopencl), cl_kernel, (cl_kernel, Ptr{cl_int},), source_kernel, errcode_ret)
end

function clRetainKernel(kernel::cl_kernel)::cl_int
    return ccall((:clRetainKernel, libopencl), cl_int, (cl_kernel,), kernel)
end

function clReleaseKernel(kernel::cl_kernel)::cl_int
    return ccall((:clReleaseKernel, libopencl), cl_int, (cl_kernel,), kernel)
end

function clSetKernelArg(kernel::cl_kernel, arg_index::cl_uint, arg_size::Csize_t, arg_value::Ptr{Nothing})::cl_int
    return ccall((:clSetKernelArg, libopencl), cl_int, (cl_kernel, cl_uint, Csize_t, Ptr{Nothing},), kernel, arg_index, arg_size, arg_value)
end

function clSetKernelArgSVMPointer(kernel::cl_kernel, arg_index::cl_uint, arg_value::Ptr{Nothing})::cl_int
    return ccall((:clSetKernelArgSVMPointer, libopencl), cl_int, (cl_kernel, cl_uint, Ptr{Nothing},), kernel, arg_index, arg_value)
end

function clSetKernelExecInfo(kernel::cl_kernel, param_name::cl_kernel_exec_info, param_value_size::Csize_t, param_value::Ptr{Nothing})::cl_int
    return ccall((:clSetKernelExecInfo, libopencl), cl_int, (cl_kernel, cl_kernel_exec_info, Csize_t, Ptr{Nothing},), kernel, param_name, param_value_size, param_value)
end

function clGetKernelInfo(kernel::cl_kernel, param_name::cl_kernel_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetKernelInfo, libopencl), cl_int, (cl_kernel, cl_kernel_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), kernel, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetKernelInfo(kernel::cl_kernel, param_name::cl_kernel_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetKernelInfo, libopencl), cl_int, (cl_kernel, cl_kernel_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), kernel, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetKernelArgInfo(kernel::cl_kernel, arg_indx::cl_uint, param_name::cl_kernel_arg_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetKernelArgInfo, libopencl), cl_int, (cl_kernel, cl_uint, cl_kernel_arg_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), kernel, arg_indx, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetKernelArgInfo(kernel::cl_kernel, arg_indx::cl_uint, param_name::cl_kernel_arg_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetKernelArgInfo, libopencl), cl_int, (cl_kernel, cl_uint, cl_kernel_arg_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), kernel, arg_indx, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetKernelWorkGroupInfo(kernel::cl_kernel, device::cl_device_id, param_name::cl_kernel_work_group_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetKernelWorkGroupInfo, libopencl), cl_int, (cl_kernel, cl_device_id, cl_kernel_work_group_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), kernel, device, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetKernelWorkGroupInfo(kernel::cl_kernel, device::cl_device_id, param_name::cl_kernel_work_group_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetKernelWorkGroupInfo, libopencl), cl_int, (cl_kernel, cl_device_id, cl_kernel_work_group_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), kernel, device, param_name, param_value_size, param_value, param_value_size_ret)
end

function clGetKernelSubGroupInfo(kernel::cl_kernel, device::cl_device_id, param_name::cl_kernel_sub_group_info, input_value_size::Csize_t, input_value::Ptr{Nothing}, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetKernelSubGroupInfo, libopencl), cl_int, (cl_kernel, cl_device_id, cl_kernel_sub_group_info, Csize_t, Ptr{Nothing}, Csize_t, Ptr{Nothing}, Ref{Csize_t},), kernel, device, param_name, input_value_size, input_value, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetKernelSubGroupInfo(kernel::cl_kernel, device::cl_device_id, param_name::cl_kernel_sub_group_info, input_value_size::Csize_t, input_value::Ptr{Nothing}, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetKernelSubGroupInfo, libopencl), cl_int, (cl_kernel, cl_device_id, cl_kernel_sub_group_info, Csize_t, Ptr{Nothing}, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), kernel, device, param_name, input_value_size, input_value, param_value_size, param_value, param_value_size_ret)
end

# Event Object APIs
function clWaitForEvents(num_events::cl_uint, event_list::Array{cl_event, 1})::cl_int
    return ccall((:clWaitForEvents, libopencl), cl_int, (cl_uint, Ref{cl_event},), num_events, Base.cconvert(Ref{cl_event}, event_list))
end

function clWaitForEvents(num_events::cl_uint, event_list::Ptr{cl_event})::cl_int
    return ccall((:clWaitForEvents, libopencl), cl_int, (cl_uint, Ptr{cl_event},), num_events, event_list)
end

function clGetEventInfo(event::cl_event, param_name::cl_event_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetEventInfo, libopencl), cl_int, (cl_event, cl_event_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), event, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetEventInfo(event::cl_event, param_name::cl_event_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetEventInfo, libopencl), cl_int, (cl_event, cl_event_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), event, param_name, param_value_size, param_value, param_value_size_ret)
end

function clCreateUserEvent(context::cl_context, errcode_ret::Array{cl_int, 1})::cl_event
    return ccall((:clCreateUserEvent, libopencl), cl_event, (cl_context, Ref{cl_int},), context, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateUserEvent(context::cl_context, errcode_ret::Ptr{cl_int})::cl_event
    return ccall((:clCreateUserEvent, libopencl), cl_event, (cl_context, Ptr{cl_int},), context, errcode_ret)
end

function clRetainEvent(event::cl_event)::cl_int
    return ccall((:clRetainEvent, libopencl), cl_int, (cl_event,), event)
end

function clReleaseEvent(event::cl_event)::cl_int
    return ccall((:clReleaseEvent, libopencl), cl_int, (cl_event,), event)
end

function clSetUserEventStatus(event::cl_event, execution_status::cl_int)::cl_int
    return ccall((:clSetUserEventStatus, libopencl), cl_int, (cl_event, cl_int,), event, execution_status)
end

function clSetEventCallback(event::cl_event, command_exec_callback_type::cl_int, pfn_notify::Ptr{Nothing}, user_data::Ptr{Nothing})::cl_int
    return ccall((:clSetEventCallback, libopencl), cl_int, (cl_event, cl_int, Ptr{Nothing}, Ptr{Nothing},), event, command_exec_callback_type, pfn_notify, user_data)
end

# Profiling APIs
function clGetEventProfilingInfo(event::cl_event, param_name::cl_profiling_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Array{Csize_t, 1})::cl_int
    return ccall((:clGetEventProfilingInfo, libopencl), cl_int, (cl_event, cl_profiling_info, Csize_t, Ptr{Nothing}, Ref{Csize_t},), event, param_name, param_value_size, param_value, Base.cconvert(Ref{Csize_t}, param_value_size_ret))
end

function clGetEventProfilingInfo(event::cl_event, param_name::cl_profiling_info, param_value_size::Csize_t, param_value::Ptr{Nothing}, param_value_size_ret::Ptr{Csize_t})::cl_int
    return ccall((:clGetEventProfilingInfo, libopencl), cl_int, (cl_event, cl_profiling_info, Csize_t, Ptr{Nothing}, Ptr{Csize_t},), event, param_name, param_value_size, param_value, param_value_size_ret)
end

# Flush and Finish APIs
function clFlush(command_queue::cl_command_queue)::cl_int
    return ccall((:clFlush, libopencl), cl_int, (cl_command_queue,), command_queue)
end

function clFinish(command_queue::cl_command_queue)::cl_int
    return ccall((:clFinish, libopencl), cl_int, (cl_command_queue,), command_queue)
end

# Enqueued Commands APIs
function clEnqueueReadBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_read::cl_bool, offset::Csize_t, size::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueReadBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, buffer, blocking_read, offset, size, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueReadBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_read::cl_bool, offset::Csize_t, size::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueReadBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, buffer, blocking_read, offset, size, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueReadBufferRect(command_queue::cl_command_queue, buffer::cl_mem, blocking_read::cl_bool, buffer_offset::Array{Csize_t, 1}, host_offset::Array{Csize_t, 1}, region::Array{Csize_t, 1}, buffer_row_pitch::Csize_t, buffer_slice_pitch::Csize_t, host_row_pitch::Csize_t, host_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueReadBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, buffer, blocking_read, Base.cconvert(Ref{Csize_t}, buffer_offset), Base.cconvert(Ref{Csize_t}, host_offset), Base.cconvert(Ref{Csize_t}, region), buffer_row_pitch, buffer_slice_pitch, host_row_pitch, host_slice_pitch, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueReadBufferRect(command_queue::cl_command_queue, buffer::cl_mem, blocking_read::cl_bool, buffer_offset::Ptr{Csize_t}, host_offset::Ptr{Csize_t}, region::Ptr{Csize_t}, buffer_row_pitch::Csize_t, buffer_slice_pitch::Csize_t, host_row_pitch::Csize_t, host_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueReadBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, buffer, blocking_read, buffer_offset, host_offset, region, buffer_row_pitch, buffer_slice_pitch, host_row_pitch, host_slice_pitch, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueWriteBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_write::cl_bool, offset::Csize_t, size::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueWriteBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, buffer, blocking_write, offset, size, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueWriteBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_write::cl_bool, offset::Csize_t, size::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueWriteBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, buffer, blocking_write, offset, size, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueWriteBufferRect(command_queue::cl_command_queue, buffer::cl_mem, blocking_write::cl_bool, buffer_offset::Array{Csize_t, 1}, host_offset::Array{Csize_t, 1}, region::Array{Csize_t, 1}, buffer_row_pitch::Csize_t, buffer_slice_pitch::Csize_t, host_row_pitch::Csize_t, host_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueWriteBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, buffer, blocking_write, Base.cconvert(Ref{Csize_t}, buffer_offset), Base.cconvert(Ref{Csize_t}, host_offset), Base.cconvert(Ref{Csize_t}, region), buffer_row_pitch, buffer_slice_pitch, host_row_pitch, host_slice_pitch, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueWriteBufferRect(command_queue::cl_command_queue, buffer::cl_mem, blocking_write::cl_bool, buffer_offset::Ptr{Csize_t}, host_offset::Ptr{Csize_t}, region::Ptr{Csize_t}, buffer_row_pitch::Csize_t, buffer_slice_pitch::Csize_t, host_row_pitch::Csize_t, host_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueWriteBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, buffer, blocking_write, buffer_offset, host_offset, region, buffer_row_pitch, buffer_slice_pitch, host_row_pitch, host_slice_pitch, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueFillBuffer(command_queue::cl_command_queue, buffer::cl_mem, pattern::Ptr{Nothing}, pattern_size::Csize_t, offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueFillBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, Csize_t, Csize_t, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, buffer, pattern, pattern_size, offset, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueFillBuffer(command_queue::cl_command_queue, buffer::cl_mem, pattern::Ptr{Nothing}, pattern_size::Csize_t, offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueFillBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, Csize_t, Csize_t, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, buffer, pattern, pattern_size, offset, size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueCopyBuffer(command_queue::cl_command_queue, src_buffer::cl_mem, dst_buffer::cl_mem, src_offset::Csize_t, dst_offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueCopyBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Csize_t, Csize_t, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, src_buffer, dst_buffer, src_offset, dst_offset, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueCopyBuffer(command_queue::cl_command_queue, src_buffer::cl_mem, dst_buffer::cl_mem, src_offset::Csize_t, dst_offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueCopyBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Csize_t, Csize_t, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, src_buffer, dst_buffer, src_offset, dst_offset, size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueCopyBufferRect(command_queue::cl_command_queue, src_buffer::cl_mem, dst_buffer::cl_mem, src_origin::Array{Csize_t, 1}, dst_origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, src_row_pitch::Csize_t, src_slice_pitch::Csize_t, dst_row_pitch::Csize_t, dst_slice_pitch::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueCopyBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, src_buffer, dst_buffer, Base.cconvert(Ref{Csize_t}, src_origin), Base.cconvert(Ref{Csize_t}, dst_origin), Base.cconvert(Ref{Csize_t}, region), src_row_pitch, src_slice_pitch, dst_row_pitch, dst_slice_pitch, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueCopyBufferRect(command_queue::cl_command_queue, src_buffer::cl_mem, dst_buffer::cl_mem, src_origin::Ptr{Csize_t}, dst_origin::Ptr{Csize_t}, region::Ptr{Csize_t}, src_row_pitch::Csize_t, src_slice_pitch::Csize_t, dst_row_pitch::Csize_t, dst_slice_pitch::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueCopyBufferRect, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, Csize_t, Csize_t, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, src_buffer, dst_buffer, src_origin, dst_origin, region, src_row_pitch, src_slice_pitch, dst_row_pitch, dst_slice_pitch, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueReadImage(command_queue::cl_command_queue, image::cl_mem, blocking_read::cl_bool, origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, row_pitch::Csize_t, slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueReadImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ref{Csize_t}, Ref{Csize_t}, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, image, blocking_read, Base.cconvert(Ref{Csize_t}, origin), Base.cconvert(Ref{Csize_t}, region), row_pitch, slice_pitch, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueReadImage(command_queue::cl_command_queue, image::cl_mem, blocking_read::cl_bool, origin::Ptr{Csize_t}, region::Ptr{Csize_t}, row_pitch::Csize_t, slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueReadImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, image, blocking_read, origin, region, row_pitch, slice_pitch, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueWriteImage(command_queue::cl_command_queue, image::cl_mem, blocking_write::cl_bool, origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, input_row_pitch::Csize_t, input_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueWriteImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ref{Csize_t}, Ref{Csize_t}, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, image, blocking_write, Base.cconvert(Ref{Csize_t}, origin), Base.cconvert(Ref{Csize_t}, region), input_row_pitch, input_slice_pitch, ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueWriteImage(command_queue::cl_command_queue, image::cl_mem, blocking_write::cl_bool, origin::Ptr{Csize_t}, region::Ptr{Csize_t}, input_row_pitch::Csize_t, input_slice_pitch::Csize_t, ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueWriteImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_bool, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, Csize_t, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, image, blocking_write, origin, region, input_row_pitch, input_slice_pitch, ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueFillImage(command_queue::cl_command_queue, image::cl_mem, fill_color::Ptr{Nothing}, origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueFillImage, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, Ref{Csize_t}, Ref{Csize_t}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, image, fill_color, Base.cconvert(Ref{Csize_t}, origin), Base.cconvert(Ref{Csize_t}, region), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueFillImage(command_queue::cl_command_queue, image::cl_mem, fill_color::Ptr{Nothing}, origin::Ptr{Csize_t}, region::Ptr{Csize_t}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueFillImage, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, Ptr{Csize_t}, Ptr{Csize_t}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, image, fill_color, origin, region, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueCopyImage(command_queue::cl_command_queue, src_image::cl_mem, dst_image::cl_mem, src_origin::Array{Csize_t, 1}, dst_origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueCopyImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, src_image, dst_image, Base.cconvert(Ref{Csize_t}, src_origin), Base.cconvert(Ref{Csize_t}, dst_origin), Base.cconvert(Ref{Csize_t}, region), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueCopyImage(command_queue::cl_command_queue, src_image::cl_mem, dst_image::cl_mem, src_origin::Ptr{Csize_t}, dst_origin::Ptr{Csize_t}, region::Ptr{Csize_t}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueCopyImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, src_image, dst_image, src_origin, dst_origin, region, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueCopyImageToBuffer(command_queue::cl_command_queue, src_image::cl_mem, dst_buffer::cl_mem, src_origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, dst_offset::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueCopyImageToBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ref{Csize_t}, Ref{Csize_t}, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, src_image, dst_buffer, Base.cconvert(Ref{Csize_t}, src_origin), Base.cconvert(Ref{Csize_t}, region), dst_offset, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueCopyImageToBuffer(command_queue::cl_command_queue, src_image::cl_mem, dst_buffer::cl_mem, src_origin::Ptr{Csize_t}, region::Ptr{Csize_t}, dst_offset::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueCopyImageToBuffer, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Ptr{Csize_t}, Ptr{Csize_t}, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, src_image, dst_buffer, src_origin, region, dst_offset, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueCopyBufferToImage(command_queue::cl_command_queue, src_buffer::cl_mem, dst_image::cl_mem, src_offset::Csize_t, dst_origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueCopyBufferToImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Csize_t, Ref{Csize_t}, Ref{Csize_t}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, src_buffer, dst_image, src_offset, Base.cconvert(Ref{Csize_t}, dst_origin), Base.cconvert(Ref{Csize_t}, region), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueCopyBufferToImage(command_queue::cl_command_queue, src_buffer::cl_mem, dst_image::cl_mem, src_offset::Csize_t, dst_origin::Ptr{Csize_t}, region::Ptr{Csize_t}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueCopyBufferToImage, libopencl), cl_int, (cl_command_queue, cl_mem, cl_mem, Csize_t, Ptr{Csize_t}, Ptr{Csize_t}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, src_buffer, dst_image, src_offset, dst_origin, region, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueMapBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_map::cl_bool, map_flags::cl_map_flags, offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1}, errcode_ret::Array{cl_int, 1})::Ptr{Nothing}
    return ccall((:clEnqueueMapBuffer, libopencl), Ptr{Nothing}, (cl_command_queue, cl_mem, cl_bool, cl_map_flags, Csize_t, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event}, Ref{cl_int},), command_queue, buffer, blocking_map, map_flags, offset, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clEnqueueMapBuffer(command_queue::cl_command_queue, buffer::cl_mem, blocking_map::cl_bool, map_flags::cl_map_flags, offset::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event}, errcode_ret::Ptr{cl_int})::Ptr{Nothing}
    return ccall((:clEnqueueMapBuffer, libopencl), Ptr{Nothing}, (cl_command_queue, cl_mem, cl_bool, cl_map_flags, Csize_t, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event}, Ptr{cl_int},), command_queue, buffer, blocking_map, map_flags, offset, size, num_events_in_wait_list, event_wait_list, event, errcode_ret)
end

function clEnqueueMapImage(command_queue::cl_command_queue, image::cl_mem, blocking_map::cl_bool, map_flags::cl_map_flags, origin::Array{Csize_t, 1}, region::Array{Csize_t, 1}, image_row_pitch::Array{Csize_t, 1}, image_slice_pitch::Array{Csize_t, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1}, errcode_ret::Array{cl_int, 1})::Ptr{Nothing}
    return ccall((:clEnqueueMapImage, libopencl), Ptr{Nothing}, (cl_command_queue, cl_mem, cl_bool, cl_map_flags, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, cl_uint, Ref{cl_event}, Ref{cl_event}, Ref{cl_int},), command_queue, image, blocking_map, map_flags, Base.cconvert(Ref{Csize_t}, origin), Base.cconvert(Ref{Csize_t}, region), Base.cconvert(Ref{Csize_t}, image_row_pitch), Base.cconvert(Ref{Csize_t}, image_slice_pitch), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event), Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clEnqueueMapImage(command_queue::cl_command_queue, image::cl_mem, blocking_map::cl_bool, map_flags::cl_map_flags, origin::Ptr{Csize_t}, region::Ptr{Csize_t}, image_row_pitch::Ptr{Csize_t}, image_slice_pitch::Ptr{Csize_t}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event}, errcode_ret::Ptr{cl_int})::Ptr{Nothing}
    return ccall((:clEnqueueMapImage, libopencl), Ptr{Nothing}, (cl_command_queue, cl_mem, cl_bool, cl_map_flags, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, cl_uint, Ptr{cl_event}, Ptr{cl_event}, Ptr{cl_int},), command_queue, image, blocking_map, map_flags, origin, region, image_row_pitch, image_slice_pitch, num_events_in_wait_list, event_wait_list, event, errcode_ret)
end

function clEnqueueUnmapMemObject(command_queue::cl_command_queue, memobj::cl_mem, mapped_ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueUnmapMemObject, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, memobj, mapped_ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueUnmapMemObject(command_queue::cl_command_queue, memobj::cl_mem, mapped_ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueUnmapMemObject, libopencl), cl_int, (cl_command_queue, cl_mem, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, memobj, mapped_ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueMigrateMemObjects(command_queue::cl_command_queue, num_mem_objects::cl_uint, mem_objects::Array{cl_mem, 1}, flags::cl_mem_migration_flags, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueMigrateMemObjects, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{cl_mem}, cl_mem_migration_flags, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, num_mem_objects, Base.cconvert(Ref{cl_mem}, mem_objects), flags, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueMigrateMemObjects(command_queue::cl_command_queue, num_mem_objects::cl_uint, mem_objects::Ptr{cl_mem}, flags::cl_mem_migration_flags, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueMigrateMemObjects, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{cl_mem}, cl_mem_migration_flags, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, num_mem_objects, mem_objects, flags, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueNDRangeKernel(command_queue::cl_command_queue, kernel::cl_kernel, work_dim::cl_uint, global_work_offset::Array{Csize_t, 1}, global_work_size::Array{Csize_t, 1}, local_work_size::Array{Csize_t, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueNDRangeKernel, libopencl), cl_int, (cl_command_queue, cl_kernel, cl_uint, Ref{Csize_t}, Ref{Csize_t}, Ref{Csize_t}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, kernel, work_dim, Base.cconvert(Ref{Csize_t}, global_work_offset), Base.cconvert(Ref{Csize_t}, global_work_size), Base.cconvert(Ref{Csize_t}, local_work_size), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueNDRangeKernel(command_queue::cl_command_queue, kernel::cl_kernel, work_dim::cl_uint, global_work_offset::Ptr{Csize_t}, global_work_size::Ptr{Csize_t}, local_work_size::Ptr{Csize_t}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueNDRangeKernel, libopencl), cl_int, (cl_command_queue, cl_kernel, cl_uint, Ptr{Csize_t}, Ptr{Csize_t}, Ptr{Csize_t}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, kernel, work_dim, global_work_offset, global_work_size, local_work_size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueNativeKernel(command_queue::cl_command_queue, user_func::Ptr{Nothing}, args::Ptr{Nothing}, cb_args::Csize_t, num_mem_objects::cl_uint, mem_list::Array{cl_mem, 1}, args_mem_loc::Array{Ptr{Nothing}, 1}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueNativeKernel, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, Ptr{Nothing}, Csize_t, cl_uint, Ref{cl_mem}, Ref{Ptr{Nothing}}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, user_func, args, cb_args, num_mem_objects, Base.cconvert(Ref{cl_mem}, mem_list), Base.cconvert(Ref{Ptr{Nothing}}, args_mem_loc), num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueNativeKernel(command_queue::cl_command_queue, user_func::Ptr{Nothing}, args::Ptr{Nothing}, cb_args::Csize_t, num_mem_objects::cl_uint, mem_list::Ptr{cl_mem}, args_mem_loc::Ptr{Ptr{Nothing}}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueNativeKernel, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, Ptr{Nothing}, Csize_t, cl_uint, Ptr{cl_mem}, Ptr{Ptr{Nothing}}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, user_func, args, cb_args, num_mem_objects, mem_list, args_mem_loc, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueMarkerWithWaitList(command_queue::cl_command_queue, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueMarkerWithWaitList, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueMarkerWithWaitList(command_queue::cl_command_queue, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueMarkerWithWaitList, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueBarrierWithWaitList(command_queue::cl_command_queue, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueBarrierWithWaitList, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueBarrierWithWaitList(command_queue::cl_command_queue, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueBarrierWithWaitList, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMFree(command_queue::cl_command_queue, num_svm_pointers::cl_uint, svm_pointers::Array{Ptr{Nothing}, 1}, pfn_free_func::Ptr{Nothing}, user_data::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMFree, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{Ptr{Nothing}}, Ptr{Nothing}, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, num_svm_pointers, Base.cconvert(Ref{Ptr{Nothing}}, svm_pointers), pfn_free_func, user_data, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMFree(command_queue::cl_command_queue, num_svm_pointers::cl_uint, svm_pointers::Ptr{Ptr{Nothing}}, pfn_free_func::Ptr{Nothing}, user_data::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMFree, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{Ptr{Nothing}}, Ptr{Nothing}, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, num_svm_pointers, svm_pointers, pfn_free_func, user_data, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMMemcpy(command_queue::cl_command_queue, blocking_copy::cl_bool, dst_ptr::Ptr{Nothing}, src_ptr::Ptr{Nothing}, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMMemcpy, libopencl), cl_int, (cl_command_queue, cl_bool, Ptr{Nothing}, Ptr{Nothing}, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, blocking_copy, dst_ptr, src_ptr, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMMemcpy(command_queue::cl_command_queue, blocking_copy::cl_bool, dst_ptr::Ptr{Nothing}, src_ptr::Ptr{Nothing}, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMMemcpy, libopencl), cl_int, (cl_command_queue, cl_bool, Ptr{Nothing}, Ptr{Nothing}, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, blocking_copy, dst_ptr, src_ptr, size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMMemFill(command_queue::cl_command_queue, svm_ptr::Ptr{Nothing}, pattern::Ptr{Nothing}, pattern_size::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMMemFill, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, Ptr{Nothing}, Csize_t, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, svm_ptr, pattern, pattern_size, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMMemFill(command_queue::cl_command_queue, svm_ptr::Ptr{Nothing}, pattern::Ptr{Nothing}, pattern_size::Csize_t, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMMemFill, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, Ptr{Nothing}, Csize_t, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, svm_ptr, pattern, pattern_size, size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMMap(command_queue::cl_command_queue, blocking_map::cl_bool, flags::cl_map_flags, svm_ptr::Ptr{Nothing}, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMMap, libopencl), cl_int, (cl_command_queue, cl_bool, cl_map_flags, Ptr{Nothing}, Csize_t, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, blocking_map, flags, svm_ptr, size, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMMap(command_queue::cl_command_queue, blocking_map::cl_bool, flags::cl_map_flags, svm_ptr::Ptr{Nothing}, size::Csize_t, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMMap, libopencl), cl_int, (cl_command_queue, cl_bool, cl_map_flags, Ptr{Nothing}, Csize_t, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, blocking_map, flags, svm_ptr, size, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMUnmap(command_queue::cl_command_queue, svm_ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMUnmap, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, svm_ptr, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMUnmap(command_queue::cl_command_queue, svm_ptr::Ptr{Nothing}, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMUnmap, libopencl), cl_int, (cl_command_queue, Ptr{Nothing}, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, svm_ptr, num_events_in_wait_list, event_wait_list, event)
end

function clEnqueueSVMMigrateMem(command_queue::cl_command_queue, num_svm_pointers::cl_uint, svm_pointers::Array{Ptr{Nothing}, 1}, sizes::Array{Csize_t, 1}, flags::cl_mem_migration_flags, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueSVMMigrateMem, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{Ptr{Nothing}}, Ref{Csize_t}, cl_mem_migration_flags, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, num_svm_pointers, Base.cconvert(Ref{Ptr{Nothing}}, svm_pointers), Base.cconvert(Ref{Csize_t}, sizes), flags, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueSVMMigrateMem(command_queue::cl_command_queue, num_svm_pointers::cl_uint, svm_pointers::Ptr{Ptr{Nothing}}, sizes::Ptr{Csize_t}, flags::cl_mem_migration_flags, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueSVMMigrateMem, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{Ptr{Nothing}}, Ptr{Csize_t}, cl_mem_migration_flags, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, num_svm_pointers, svm_pointers, sizes, flags, num_events_in_wait_list, event_wait_list, event)
end

function clGetExtensionFunctionAddressForPlatform(platform::cl_platform_id, func_name::Array{Cchar, 1})::Ptr{Nothing}
    return ccall((:clGetExtensionFunctionAddressForPlatform, libopencl), Ptr{Nothing}, (cl_platform_id, Ref{Cchar},), platform, Base.cconvert(Ref{Cchar}, func_name))
end

function clGetExtensionFunctionAddressForPlatform(platform::cl_platform_id, func_name::Ptr{Cchar})::Ptr{Nothing}
    return ccall((:clGetExtensionFunctionAddressForPlatform, libopencl), Ptr{Nothing}, (cl_platform_id, Ptr{Cchar},), platform, func_name)
end

function clSetCommandQueueProperty(command_queue::cl_command_queue, properties::cl_command_queue_properties, enable::cl_bool, old_properties::Array{cl_command_queue_properties, 1})::cl_int
    return ccall((:clSetCommandQueueProperty, libopencl), cl_int, (cl_command_queue, cl_command_queue_properties, cl_bool, Ref{cl_command_queue_properties},), command_queue, properties, enable, Base.cconvert(Ref{cl_command_queue_properties}, old_properties))
end

function clSetCommandQueueProperty(command_queue::cl_command_queue, properties::cl_command_queue_properties, enable::cl_bool, old_properties::Ptr{cl_command_queue_properties})::cl_int
    return ccall((:clSetCommandQueueProperty, libopencl), cl_int, (cl_command_queue, cl_command_queue_properties, cl_bool, Ptr{cl_command_queue_properties},), command_queue, properties, enable, old_properties)
end

function clCreateImage2D(context::cl_context, flags::cl_mem_flags, image_format::Array{cl_image_format, 1}, image_width::Csize_t, image_height::Csize_t, image_row_pitch::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreateImage2D, libopencl), cl_mem, (cl_context, cl_mem_flags, Ref{cl_image_format}, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, Ref{cl_int},), context, flags, Base.cconvert(Ref{cl_image_format}, image_format), image_width, image_height, image_row_pitch, host_ptr, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateImage2D(context::cl_context, flags::cl_mem_flags, image_format::Ptr{cl_image_format}, image_width::Csize_t, image_height::Csize_t, image_row_pitch::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreateImage2D, libopencl), cl_mem, (cl_context, cl_mem_flags, Ptr{cl_image_format}, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, Ptr{cl_int},), context, flags, image_format, image_width, image_height, image_row_pitch, host_ptr, errcode_ret)
end

function clCreateImage3D(context::cl_context, flags::cl_mem_flags, image_format::Array{cl_image_format, 1}, image_width::Csize_t, image_height::Csize_t, image_depth::Csize_t, image_row_pitch::Csize_t, image_slice_pitch::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Array{cl_int, 1})::cl_mem
    return ccall((:clCreateImage3D, libopencl), cl_mem, (cl_context, cl_mem_flags, Ref{cl_image_format}, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, Ref{cl_int},), context, flags, Base.cconvert(Ref{cl_image_format}, image_format), image_width, image_height, image_depth, image_row_pitch, image_slice_pitch, host_ptr, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateImage3D(context::cl_context, flags::cl_mem_flags, image_format::Ptr{cl_image_format}, image_width::Csize_t, image_height::Csize_t, image_depth::Csize_t, image_row_pitch::Csize_t, image_slice_pitch::Csize_t, host_ptr::Ptr{Nothing}, errcode_ret::Ptr{cl_int})::cl_mem
    return ccall((:clCreateImage3D, libopencl), cl_mem, (cl_context, cl_mem_flags, Ptr{cl_image_format}, Csize_t, Csize_t, Csize_t, Csize_t, Csize_t, Ptr{Nothing}, Ptr{cl_int},), context, flags, image_format, image_width, image_height, image_depth, image_row_pitch, image_slice_pitch, host_ptr, errcode_ret)
end

function clEnqueueMarker(command_queue::cl_command_queue, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueMarker, libopencl), cl_int, (cl_command_queue, Ref{cl_event},), command_queue, Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueMarker(command_queue::cl_command_queue, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueMarker, libopencl), cl_int, (cl_command_queue, Ptr{cl_event},), command_queue, event)
end

function clEnqueueWaitForEvents(command_queue::cl_command_queue, num_events::cl_uint, event_list::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueWaitForEvents, libopencl), cl_int, (cl_command_queue, cl_uint, Ref{cl_event},), command_queue, num_events, Base.cconvert(Ref{cl_event}, event_list))
end

function clEnqueueWaitForEvents(command_queue::cl_command_queue, num_events::cl_uint, event_list::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueWaitForEvents, libopencl), cl_int, (cl_command_queue, cl_uint, Ptr{cl_event},), command_queue, num_events, event_list)
end

function clEnqueueBarrier(command_queue::cl_command_queue)::cl_int
    return ccall((:clEnqueueBarrier, libopencl), cl_int, (cl_command_queue,), command_queue)
end

function clUnloadCompiler(void::Nothing)::cl_int
    return ccall((:clUnloadCompiler, libopencl), cl_int, (Nothing,), void)
end

function clGetExtensionFunctionAddress(func_name::Array{Cchar, 1})::Ptr{Nothing}
    return ccall((:clGetExtensionFunctionAddress, libopencl), Ptr{Nothing}, (Ref{Cchar},), Base.cconvert(Ref{Cchar}, func_name))
end

function clGetExtensionFunctionAddress(func_name::Ptr{Cchar})::Ptr{Nothing}
    return ccall((:clGetExtensionFunctionAddress, libopencl), Ptr{Nothing}, (Ptr{Cchar},), func_name)
end

function clCreateCommandQueue(context::cl_context, device::cl_device_id, properties::cl_command_queue_properties, errcode_ret::Array{cl_int, 1})::cl_command_queue
    return ccall((:clCreateCommandQueue, libopencl), cl_command_queue, (cl_context, cl_device_id, cl_command_queue_properties, Ref{cl_int},), context, device, properties, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateCommandQueue(context::cl_context, device::cl_device_id, properties::cl_command_queue_properties, errcode_ret::Ptr{cl_int})::cl_command_queue
    return ccall((:clCreateCommandQueue, libopencl), cl_command_queue, (cl_context, cl_device_id, cl_command_queue_properties, Ptr{cl_int},), context, device, properties, errcode_ret)
end

function clCreateSampler(context::cl_context, normalized_coords::cl_bool, addressing_mode::cl_addressing_mode, filter_mode::cl_filter_mode, errcode_ret::Array{cl_int, 1})::cl_sampler
    return ccall((:clCreateSampler, libopencl), cl_sampler, (cl_context, cl_bool, cl_addressing_mode, cl_filter_mode, Ref{cl_int},), context, normalized_coords, addressing_mode, filter_mode, Base.cconvert(Ref{cl_int}, errcode_ret))
end

function clCreateSampler(context::cl_context, normalized_coords::cl_bool, addressing_mode::cl_addressing_mode, filter_mode::cl_filter_mode, errcode_ret::Ptr{cl_int})::cl_sampler
    return ccall((:clCreateSampler, libopencl), cl_sampler, (cl_context, cl_bool, cl_addressing_mode, cl_filter_mode, Ptr{cl_int},), context, normalized_coords, addressing_mode, filter_mode, errcode_ret)
end

function clEnqueueTask(command_queue::cl_command_queue, kernel::cl_kernel, num_events_in_wait_list::cl_uint, event_wait_list::Array{cl_event, 1}, event::Array{cl_event, 1})::cl_int
    return ccall((:clEnqueueTask, libopencl), cl_int, (cl_command_queue, cl_kernel, cl_uint, Ref{cl_event}, Ref{cl_event},), command_queue, kernel, num_events_in_wait_list, Base.cconvert(Ref{cl_event}, event_wait_list), Base.cconvert(Ref{cl_event}, event))
end

function clEnqueueTask(command_queue::cl_command_queue, kernel::cl_kernel, num_events_in_wait_list::cl_uint, event_wait_list::Ptr{cl_event}, event::Ptr{cl_event})::cl_int
    return ccall((:clEnqueueTask, libopencl), cl_int, (cl_command_queue, cl_kernel, cl_uint, Ptr{cl_event}, Ptr{cl_event},), command_queue, kernel, num_events_in_wait_list, event_wait_list, event)
end


