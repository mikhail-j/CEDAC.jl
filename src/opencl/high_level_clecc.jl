#=*
* High Level libclecc functions
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

function clECCGetErrorName(e::Cint)::String
    if (e === OPENCL_EDAC_SUCCESS)
        return "OPENCL_EDAC_SUCCESS"
    elseif (e === OPENCL_EDAC_INVALID_ARGUMENT)
        return "OPENCL_EDAC_INVALID_ARGUMENT"
    elseif (e === OPENCL_EDAC_OUT_OF_MEMORY)
        return "OPENCL_EDAC_OUT_OF_MEMORY"
    elseif (e === OPENCL_EDAC_INVALID_MEMORY_PERMISSIONS)
        return "OPENCL_EDAC_INVALID_MEMORY_PERMISSIONS"
    elseif (e === OPENCL_EDAC_PTHREAD_ERROR)
        return "OPENCL_EDAC_PTHREAD_ERROR"
    elseif (e === OPENCL_EDAC_MEM_OBJECT_ALREADY_IN_USE)
        return "OPENCL_EDAC_MEM_OBJECT_ALREADY_IN_USE"
    elseif (e === OPENCL_EDAC_MEM_OBJECT_NOT_FOUND)
        return "OPENCL_EDAC_MEM_OBJECT_NOT_FOUND"
    elseif (e === OPENCL_EDAC_INVALID_HSIAO_72_64_VERSION)
        return "OPENCL_EDAC_INVALID_HSIAO_72_64_VERSION"
    else
        return "found unknown error, " * repr(e) * "!"
    end
end

clECCSetPreferredHsiao_77_22_Version(handle::clECCHandle_t, version::Integer) = clECCSetPreferredHsiao_77_22_Version(handle, UInt8(version))

function clECCGetPreferredHsiao_77_22_Version(handle::clECCHandle_t)::UInt8
    local version::Array{UInt8, 1} = zeros(UInt8, 1)

    local result::Cint = clECCGetPreferredHsiao_77_22_Version(handle, version)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetPreferredHsiao_77_22_Version() error: " * clECCGetErrorName(result))

    return pop!(version)
end

clECCSetMemoryScrubbingInterval(handle::clECCHandle_t, seconds::Integer) = clECCSetMemoryScrubbingInterval(handle, Culonglong(seconds))

function clECCGetMemoryScrubbingInterval(handle::clECCHandle_t)::Culonglong
    local seconds::Array{Culonglong, 1} = zeros(Culonglong, 1)

    local result::Cint = clECCGetMemoryScrubbingInterval(handle, seconds)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetMemoryScrubbingInterval() error: " * clECCGetErrorName(result))

    return pop!(seconds)
end

function clECCInit()::clECCHandle_t
    local handle::Array{clECCHandle_t, 1} = fill(clECCHandle_t(C_NULL), 1)

    local result::Cint = clECCInit(handle)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCInit() error: " * clECCGetErrorName(result))

    return pop!(handle)
end

function clECCAddMemObject(handle::clECCHandle_t, device_memory::cl_mem, device_queue::cl_command_queue)::clECCMemObject_t
    local memory_object::Array{clECCMemObject_t, 1} = fill(clECCMemObject_t(C_NULL), 1)

    local result::Cint = clECCAddMemObject(handle, device_memory, device_queue, memory_object)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCAddMemObject() error: " * clECCGetErrorName(result))

    return pop!(memory_object)
end

function clECCGetTotalErrors!(handle::clECCHandle_t, memory_object::clECCMemObject_t, errors::Array{UInt64, 1})::Array{UInt64, 1}
    local result::Cint = clECCGetTotalErrors(handle, memory_object, errors, Csize_t(sizeof(errors)))
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetTotalErrors() error: " * clECCGetErrorName(result))
    return errors
end


function clECCGetTotalErrorsWithCLMem!(handle::clECCHandle_t, device_memory::cl_mem, errors::Array{UInt64, 1})::Array{UInt64, 1}
    local result::Cint = clECCGetTotalErrorsWithCLMem(handle, device_memory, errors, Csize_t(sizeof(errors)))
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetTotalErrorsWithCLMem() error: " * clECCGetErrorName(result))
    return errors
end

function clECCGetMemObjectParityBits(handle::clECCHandle_t, memory_object::clECCMemObject_t)::cl_mem
    local parity_memory::Array{cl_mem, 1} = fill(cl_mem(C_NULL), 1)

    local result::Cint = clECCGetMemObjectParityBits(handle, memory_object, parity_memory)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetMemObjectParityBits() error: " * clECCGetErrorName(result))

    return pop!(parity_memory)
end

function clECCGetMemObjectParityBitsWithCLMem(handle::clECCHandle_t, device_memory::cl_mem)::cl_mem
    local parity_memory::Array{cl_mem, 1} = fill(cl_mem(C_NULL), 1)

    local result::Cint = clECCGetMemObjectParityBitsWithCLMem(handle, device_memory, parity_memory)
    @assert (result == OPENCL_EDAC_SUCCESS) ("clECCGetMemObjectParityBitsWithCLMem() error: " * clECCGetErrorName(result))

    return pop!(parity_memory)
end
