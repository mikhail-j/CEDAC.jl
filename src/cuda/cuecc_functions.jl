#=*
* libcuecc library functions
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

function cuECCLockEDACMutex(handle::cudaECCHandle_t)::Cint
    return ccall((:cuECCLockEDACMutex, libcuecc), Cint, (cudaECCHandle_t,), handle)
end

function cuECCUnlockEDACMutex(handle::cudaECCHandle_t)::Cint
    return ccall((:cuECCUnlockEDACMutex, libcuecc), Cint, (cudaECCHandle_t,), handle)
end

function cuECCSetPreferredHsiao_77_22_Version(handle::cudaECCHandle_t, version::UInt8)::Cint
    return ccall((:cuECCSetPreferredHsiao_77_22_Version, libcuecc), Cint, (cudaECCHandle_t, UInt8,), handle, version)
end

function cuECCGetPreferredHsiao_77_22_Version(handle::cudaECCHandle_t, version::Array{UInt8, 1})::Cint
    return ccall((:cuECCGetPreferredHsiao_77_22_Version, libcuecc), Cint, (cudaECCHandle_t, Ref{UInt8},), handle, Base.cconvert(Ref{UInt8}, version))
end

function cuECCGetPreferredHsiao_77_22_Version(handle::Ptr{cudaECCHandle_t}, version::Ptr{UInt8})::Cint
    return ccall((:cuECCGetPreferredHsiao_77_22_Version, libcuecc), Cint, (cudaECCHandle_t, Ptr{UInt8},), handle, version)
end

function cuECCSetMemoryScrubbingInterval(handle::cudaECCHandle_t, seconds::Culonglong)::Cint
    return ccall((:cuECCSetMemoryScrubbingInterval, libcuecc), Cint, (cudaECCHandle_t, Culonglong,), handle, seconds)
end

function cuECCGetMemoryScrubbingInterval(handle::cudaECCHandle_t, seconds::Array{Culonglong, 1})::Cint
    return ccall((:cuECCGetMemoryScrubbingInterval, libcuecc), Cint, (cudaECCHandle_t, Ref{Culonglong},), handle, Base.cconvert(Ref{Culonglong}, seconds))
end

function cuECCGetMemoryScrubbingInterval(handle::cudaECCHandle_t, seconds::Ptr{UInt8})::Cint
    return ccall((:cuECCGetMemoryScrubbingInterval, libcuecc), Cint, (cudaECCHandle_t, Ptr{UInt8},), handle, seconds)
end

function cuECCInit(handle::Array{cudaECCHandle_t, 1})::Cint
    return ccall((:cuECCInit, libcuecc), Cint, (Ref{cudaECCHandle_t},), Base.cconvert(Ref{cudaECCHandle_t}, handle))
end

function cuECCInit(handle::Ptr{cudaECCHandle_t})::Cint
    return ccall((:cuECCInit, libcuecc), Cint, (Ptr{cudaECCHandle_t},), handle)
end

function cuECCDestroy(handle::cudaECCHandle_t)::Nothing
    return ccall((:cuECCDestroy, libcuecc), Nothing, (cudaECCHandle_t,), handle)
end

function cuECCAddMemoryObject(handle::cudaECCHandle_t, device_memory::CUdeviceptr, memory_object::Array{cudaECCMemoryObject_t, 1})::Cint
    return ccall((:cuECCAddMemoryObject, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ref{cudaECCMemoryObject_t},), handle, device_memory, Base.cconvert(Ref{cudaECCMemoryObject_t}, memory_object))
end

function cuECCAddMemoryObject(handle::cudaECCHandle_t, device_memory::CUdeviceptr, memory_object::Ptr{cudaECCMemoryObject_t})::Cint
    return ccall((:cuECCAddMemoryObject, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ptr{cudaECCMemoryObject_t},), handle, device_memory, memory_object)
end

function cuECCRemoveMemoryObject(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t)::Cint
    return ccall((:cuECCRemoveMemoryObject, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t,), handle, memory_object)
end

function cuECCRemoveMemoryObjectWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr)::Cint
    return ccall((:cuECCRemoveMemoryObjectWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr,), handle, device_memory)
end

function cuECCUpdateMemoryObject(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t)::Cint
    return ccall((:cuECCUpdateMemoryObject, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t,), handle, memory_object)
end

function cuECCUpdateMemoryObjectWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr)::Cint
    return ccall((:cuECCUpdateMemoryObjectWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr,), handle, device_memory)
end

function cuECCGetMemoryObjectParityBits(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t, parity_memory::Array{CUdeviceptr, 1})::Cint
    return ccall((:cuECCGetMemoryObjectParityBits, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t, Ref{CUdeviceptr},), handle, memory_object, Base.cconvert(Ref{CUdeviceptr}, parity_memory))
end

function cuECCGetMemoryObjectParityBits(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t, parity_memory::Ptr{CUdeviceptr})::Cint
    return ccall((:cuECCGetMemoryObjectParityBits, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t, Ptr{CUdeviceptr},), handle, memory_object, parity_memory)
end

function cuECCGetMemoryObjectParityBitsWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, parity_memory::Array{CUdeviceptr, 1})::Cint
    return ccall((:cuECCGetMemoryObjectParityBitsWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ref{CUdeviceptr},), handle, device_memory, Base.cconvert(Ref{CUdeviceptr}, parity_memory))
end

function cuECCGetMemoryObjectParityBitsWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, parity_memory::Ptr{CUdeviceptr})::Cint
    return ccall((:cuECCGetMemoryObjectParityBitsWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ptr{CUdeviceptr},), handle, device_memory, parity_memory)
end

function cuECCGetTotalErrors(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t, errors::Array{UInt64, 1}, error_size::Csize_t)::Cint
    return ccall((:cuECCGetTotalErrors, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t, Ref{UInt64}, Csize_t,), handle, memory_object, Base.cconvert(Ref{UInt64}, errors), error_size)
end

function cuECCGetTotalErrors(handle::cudaECCHandle_t, memory_object::cudaECCMemoryObject_t, errors::Ptr{UInt64}, error_size::Csize_t)::Cint
    return ccall((:cuECCGetTotalErrors, libcuecc), Cint, (cudaECCHandle_t, cudaECCMemoryObject_t, Ptr{UInt64}, Csize_t,), handle, memory_object, errors, error_size)
end

function cuECCGetTotalErrorsWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, errors::Array{UInt64, 1}, error_size::Csize_t)::Cint
    return ccall((:cuECCGetTotalErrorsWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ref{UInt64}, Csize_t,), handle, device_memory, Base.cconvert(Ref{UInt64}, errors), error_size)
end

function cuECCGetTotalErrorsWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, errors::Ptr{UInt64}, error_size::Csize_t)::Cint
    return ccall((:cuECCGetTotalErrorsWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ptr{UInt64}, Csize_t,), handle, device_memory, errors, error_size)
end

function cuECCGetTotalErrorsSize(memory_object::cudaECCMemoryObject_t, errors_size::Array{Csize_t, 1})::Cint
    return ccall((:cuECCGetTotalErrorsSize, libcuecc), Cint, (cudaECCMemoryObject_t, Ref{Csize_t},), memory_object, Base.cconvert(Ref{Csize_t}, errors_size))
end

function cuECCGetTotalErrorsSize(memory_object::cudaECCMemoryObject_t, errors_size::Ptr{Csize_t})::Cint
    return ccall((:cuECCGetTotalErrorsSize, libcuecc), Cint, (cudaECCMemoryObject_t, Ptr{Csize_t},), memory_object, errors_size)
end

function cuECCGetTotalErrorsSizeWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, errors_size::Array{Csize_t, 1})::Cint
    return ccall((:cuECCGetTotalErrorsSizeWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ref{Csize_t},), handle, device_memory, Base.cconvert(Ref{Csize_t}, errors_size))
end

function cuECCGetTotalErrorsSizeWithDevicePointer(handle::cudaECCHandle_t, device_memory::CUdeviceptr, errors_size::Ptr{Csize_t})::Cint
    return ccall((:cuECCGetTotalErrorsSizeWithDevicePointer, libcuecc), Cint, (cudaECCHandle_t, CUdeviceptr, Ptr{Csize_t},), handle, device_memory, errors_size)
end
