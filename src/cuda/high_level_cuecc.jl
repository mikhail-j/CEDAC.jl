#=*
* High Level libcuecc functions
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

function cuECCGetErrorName(e::Cint)::String
    if (e === CUDA_EDAC_SUCCESS)
        return "CUDA_EDAC_SUCCESS"
    elseif (e === CUDA_EDAC_INVALID_ARGUMENT)
        return "CUDA_EDAC_INVALID_ARGUMENT"
    elseif (e === CUDA_EDAC_OUT_OF_MEMORY)
        return "CUDA_EDAC_OUT_OF_MEMORY"
    elseif (e === CUDA_EDAC_PTHREAD_ERROR)
        return "CUDA_EDAC_PTHREAD_ERROR"
    elseif (e === CUDA_EDAC_MEMORY_OBJECT_ALREADY_IN_USE)
        return "CUDA_EDAC_MEMORY_OBJECT_ALREADY_IN_USE"
    elseif (e === CUDA_EDAC_MEMORY_OBJECT_NOT_FOUND)
        return "CUDA_EDAC_MEMORY_OBJECT_NOT_FOUND"
    elseif (e === CUDA_EDAC_INVALID_HSIAO_72_64_VERSION)
        return "CUDA_EDAC_INVALID_HSIAO_72_64_VERSION"
    else
        return "found unknown error, " * repr(e) * "!"
    end
end

cuECCSetPreferredHsiao_77_22_Version(handle::cudaECCHandle_t, version::Integer) = cuECCSetPreferredHsiao_77_22_Version(handle, UInt8(version))

function cuECCGetPreferredHsiao_77_22_Version(handle::cudaECCHandle_t)::UInt8
    local version::Array{UInt8, 1} = zeros(UInt8, 1)

    local result::Cint = cuECCGetPreferredHsiao_77_22_Version(handle, version)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetPreferredHsiao_77_22_Version() error: " * cuECCGetErrorName(result))

    return pop!(version)
end

cuECCSetMemoryScrubbingInterval(handle::cudaECCHandle_t, seconds::Integer) = cuECCSetMemoryScrubbingInterval(handle, Culonglong(seconds))

function cuECCGetMemoryScrubbingInterval(handle::cudaECCHandle_t)::Culonglong
    local seconds::Array{Culonglong, 1} = zeros(Culonglong, 1)

    local result::Cint = cuECCGetMemoryScrubbingInterval(handle, seconds)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetMemoryScrubbingInterval() error: " * cuECCGetErrorName(result))

    return pop!(seconds)
end

function cuECCInit()::cudaECCHandle_t
    local handle::Array{cudaECCHandle_t, 1} = fill(cudaECCHandle_t(C_NULL), 1)

    local result::Cint = cuECCInit(handle)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCInit() error: " * cuECCGetErrorName(result))

    return pop!(handle)
end

function cuECCAddMemoryObject(handle::cudaECCHandle_t, device_memory::CUdeviceptr)::cudaECCMemoryObject_t
    local memory_object::Array{cudaECCMemoryObject_t, 1} = fill(cudaECCMemoryObject_t(C_NULL), 1)

    local result::Cint = cuECCAddMemoryObject(handle, device_memory, memory_object)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCAddMemoryObject() error: " * cuECCGetErrorName(result))

    return pop!(memory_object)
end

function cuECCGetTotalErrors!(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t, errors::Array{UInt64, 1})::Array{UInt64, 1}
    local result::Cint = cuECCGetTotalErrors(handle, memory_object, errors, Csize_t(sizeof(errors)))
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetTotalErrors() error: " * cuECCGetErrorName(result))
    return errors
end


function cuECCGetTotalErrorsWithDevicePointer!(handle::cudaECCHandle_t, device_memory::CUdeviceptr, errors::Array{UInt64, 1})::Array{UInt64, 1}
    local result::Cint = cuECCGetTotalErrorsWithDevicePointer(handle, device_memory, errors, Csize_t(sizeof(errors)))
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetTotalErrorsWithDevicePointer() error: " * cuECCGetErrorName(result))
    return errors
end

function cuECCGetMemoryObjectParityBits(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t)::CUdeviceptr
    local parity_memory::Array{CUdeviceptr, 1} = fill(CUdeviceptr(C_NULL), 1)

    local result::Cint = cuECCGetMemoryObjectParityBits(handle, memory_object, parity_memory)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetMemoryObjectParityBits() error: " * cuECCGetErrorName(result))

    return pop!(parity_memory)
end

function cuECCGetMemoryObjectParityBitsWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr)::CUdeviceptr
    local parity_memory::Array{CUdeviceptr, 1} = fill(CUdeviceptr(C_NULL), 1)

    local result::Cint = cuECCGetMemoryObjectParityBitsWithDevicePointer(handle, device_memory, parity_memory)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetMemoryObjectParityBitsWithDevicePointer() error: " * cuECCGetErrorName(result))

    return pop!(parity_memory)
end

function cuECCGetTotalErrorsSize(memory_object::cudaECCMemoryObject_t)::Csize_t
    local total_errors_size::Array{Csize_t, 1} = zeros(Csize_t, 1)

    local result::Cint = cuECCGetTotalErrorsSize(memory_object, total_errors_size)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetTotalErrorsSize() error: " * cuECCGetErrorName(result))

    return pop!(total_errors_size)
end

function cuECCGetTotalErrorsSizeWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr)::Csize_t
    local total_errors_size::Array{Csize_t, 1} = zeros(Csize_t, 1)

    local result::Cint = cuECCGetTotalErrorsSizeWithDevicePointer(handle, device_memory, total_errors_size)
    @assert (result == CUDA_EDAC_SUCCESS) ("cuECCGetTotalErrorsSizeWithDevicePointer() error: " * cuECCGetErrorName(result))

    return pop!(total_errors_size)
end
