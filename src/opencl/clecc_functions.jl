#=*
* libclecc library functions
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

# clGetErrorName() returns 'nothing' if corresponding OpenCL error could not be found
function clGetErrorName(error::cl_int)::Union{String, Nothing}
    local ptr::Ptr{Cchar} = ccall((:clGetErrorName, libclecc), Ptr{Cchar}, (cl_int,), error)
    if (ptr === Ptr{Cchar}(C_NULL))
        return nothing
    else
        return unsafe_string(ptr)
    end
end

clGetErrorName(error::T) where {T <: Integer} = clGetErrorName(cl_int(error))

function clECCLockEDACMutex(handle::clECCHandle_t)::Cint
    return ccall((:clECCLockEDACMutex, libclecc), Cint, (clECCHandle_t,), handle)
end

function clECCUnlockEDACMutex(handle::clECCHandle_t)::Cint
    return ccall((:clECCUnlockEDACMutex, libclecc), Cint, (clECCHandle_t,), handle)
end

function clECCSetPreferredHsiao_77_22_Version(handle::clECCHandle_t, version::UInt8)::Cint
    return ccall((:clECCSetPreferredHsiao_77_22_Version, libclecc), Cint, (clECCHandle_t, UInt8,), handle, version)
end

function clECCGetPreferredHsiao_77_22_Version(handle::clECCHandle_t, version::Array{UInt8, 1})::Cint
    return ccall((:clECCGetPreferredHsiao_77_22_Version, libclecc), Cint, (clECCHandle_t, Ref{UInt8},), handle, Base.cconvert(Ref{UInt8}, version))
end

function clECCGetPreferredHsiao_77_22_Version(handle::Ptr{clECCHandle_t}, version::Ptr{UInt8})::Cint
    return ccall((:clECCGetPreferredHsiao_77_22_Version, libclecc), Cint, (clECCHandle_t, Ptr{UInt8},), handle, version)
end

function clECCSetMemoryScrubbingInterval(handle::clECCHandle_t, seconds::Culonglong)::Cint
    return ccall((:clECCSetMemoryScrubbingInterval, libclecc), Cint, (clECCHandle_t, Culonglong,), handle, seconds)
end

function clECCGetMemoryScrubbingInterval(handle::clECCHandle_t, seconds::Array{Culonglong, 1})::Cint
    return ccall((:clECCGetMemoryScrubbingInterval, libclecc), Cint, (clECCHandle_t, Ref{Culonglong},), handle, Base.cconvert(Ref{Culonglong}, seconds))
end

function clECCGetMemoryScrubbingInterval(handle::clECCHandle_t, seconds::Ptr{UInt8})::Cint
    return ccall((:clECCGetMemoryScrubbingInterval, libclecc), Cint, (clECCHandle_t, Ptr{UInt8},), handle, seconds)
end

function clECCInit(handle::Array{clECCHandle_t, 1})::Cint
    return ccall((:clECCInit, libclecc), Cint, (Ref{clECCHandle_t},), Base.cconvert(Ref{clECCHandle_t}, handle))
end

function clECCInit(handle::Ptr{clECCHandle_t})::Cint
    return ccall((:clECCInit, libclecc), Cint, (Ptr{clECCHandle_t},), handle)
end

function clECCDestroy(handle::clECCHandle_t)::Nothing
    return ccall((:clECCDestroy, libclecc), Nothing, (clECCHandle_t,), handle)
end

function clECCAddMemObject(handle::clECCHandle_t, device_memory::cl_mem, device_queue::cl_command_queue, memory_object::Array{clECCMemObject_t, 1})::Cint
    return ccall((:clECCAddMemObject, libclecc), Cint, (clECCHandle_t, cl_mem, cl_command_queue, Ref{clECCMemObject_t},), handle, device_memory, device_queue, Base.cconvert(Ref{clECCMemObject_t}, memory_object))
end

function clECCAddMemObject(handle::clECCHandle_t, device_memory::cl_mem, device_queue::cl_command_queue, memory_object::Ptr{clECCMemObject_t})::Cint
    return ccall((:clECCAddMemObject, libclecc), Cint, (clECCHandle_t, cl_mem, cl_command_queue, Ptr{clECCMemObject_t},), handle, device_memory, device_queue, memory_object)
end

function clECCRemoveMemObject(handle::clECCHandle_t, memory_object::clECCMemObject_t)::Cint
    return ccall((:clECCRemoveMemObject, libclecc), Cint, (clECCHandle_t, clECCMemObject_t,), handle, memory_object)
end

function clECCRemoveMemObjectWithCLMem(handle::clECCHandle_t, device_memory::cl_mem)::Cint
    return ccall((:clECCRemoveMemObjectWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem,), handle, device_memory)
end

function clECCUpdateMemObject(handle::clECCHandle_t, memory_object::clECCMemObject_t)::Cint
    return ccall((:clECCUpdateMemObject, libclecc), Cint, (clECCHandle_t, clECCMemObject_t,), handle, memory_object)
end

function clECCUpdateMemObjectWithCLMem(handle::clECCHandle_t, device_memory::cl_mem)::Cint
    return ccall((:clECCUpdateMemObjectWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem,), handle, device_memory)
end

function clECCGetMemObjectParityBits(handle::clECCHandle_t, memory_object::clECCMemObject_t, parity_memory::Array{cl_mem, 1})::Cint
    return ccall((:clECCGetMemObjectParityBits, libclecc), Cint, (clECCHandle_t, clECCMemObject_t, Ref{cl_mem},), handle, memory_object, Base.cconvert(Ref{cl_mem}, parity_memory))
end

function clECCGetMemObjectParityBits(handle::clECCHandle_t, memory_object::clECCMemObject_t, parity_memory::Ptr{cl_mem})::Cint
    return ccall((:clECCGetMemObjectParityBits, libclecc), Cint, (clECCHandle_t, clECCMemObject_t, Ptr{cl_mem},), handle, memory_object, parity_memory)
end

function clECCGetMemObjectParityBitsWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, parity_memory::Array{cl_mem, 1})::Cint
    return ccall((:clECCGetMemObjectParityBitsWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ref{cl_mem},), handle, device_memory, Base.cconvert(Ref{cl_mem}, parity_memory))
end

function clECCGetMemObjectParityBitsWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, parity_memory::Ptr{cl_mem})::Cint
    return ccall((:clECCGetMemObjectParityBitsWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ptr{cl_mem},), handle, device_memory, parity_memory)
end

function clECCGetTotalErrors(handle::clECCHandle_t, memory_object::clECCMemObject_t, errors::Array{UInt64, 1}, error_size::Csize_t)::Cint
    return ccall((:clECCGetTotalErrors, libclecc), Cint, (clECCHandle_t, clECCMemObject_t, Ref{UInt64}, Csize_t,), handle, memory_object, Base.cconvert(Ref{UInt64}, errors), error_size)
end

function clECCGetTotalErrors(handle::clECCHandle_t, memory_object::clECCMemObject_t, errors::Ptr{UInt64}, error_size::Csize_t)::Cint
    return ccall((:clECCGetTotalErrors, libclecc), Cint, (clECCHandle_t, clECCMemObject_t, Ptr{UInt64}, Csize_t,), handle, memory_object, errors, error_size)
end

function clECCGetTotalErrorsWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, errors::Array{UInt64, 1}, error_size::Csize_t)::Cint
    return ccall((:clECCGetTotalErrorsWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ref{UInt64}, Csize_t,), handle, device_memory, Base.cconvert(Ref{UInt64}, errors), error_size)
end

function clECCGetTotalErrorsWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, errors::Ptr{UInt64}, error_size::Csize_t)::Cint
    return ccall((:clECCGetTotalErrorsWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ptr{UInt64}, Csize_t,), handle, device_memory, errors, error_size)
end

function clECCGetTotalErrorsSize(memory_object::clECCMemObject_t, errors_size::Array{Csize_t, 1})::Cint
    return ccall((:clECCGetTotalErrorsSize, libclecc), Cint, (clECCMemObject_t, Ref{Csize_t},), memory_object, Base.cconvert(Ref{Csize_t}, errors_size))
end

function clECCGetTotalErrorsSize(memory_object::clECCMemObject_t, errors_size::Ptr{Csize_t})::Cint
    return ccall((:clECCGetTotalErrorsSize, libclecc), Cint, (clECCMemObject_t, Ptr{Csize_t},), memory_object, errors_size)
end

function clECCGetTotalErrorsSizeWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, errors_size::Array{Csize_t, 1})::Cint
    return ccall((:clECCGetTotalErrorsSizeWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ref{Csize_t},), handle, device_memory, Base.cconvert(Ref{Csize_t}, errors_size))
end

function clECCGetTotalErrorsSizeWithCLMem(handle::clECCHandle_t, device_memory::cl_mem, errors_size::Ptr{Csize_t})::Cint
    return ccall((:clECCGetTotalErrorsSizeWithCLMem, libclecc), Cint, (clECCHandle_t, cl_mem, Ptr{Csize_t},), handle, device_memory, errors_size)
end

function clECCEDAC(handle::clECCHandle_t, memory_object::clECCMemObject_t)::Cint
    return ccall((:clECCEDAC, libclecc), Cint, (clECCHandle_t, clECCMemObject_t,), handle, memory_object)
end
