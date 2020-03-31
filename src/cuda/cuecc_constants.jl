#=*
* libcuecc library definitions
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

const CUDA_EDAC_SUCCESS                      = Cint(0)
const CUDA_EDAC_INVALID_ARGUMENT             = Cint(-1)
const CUDA_EDAC_OUT_OF_MEMORY                = Cint(-2)
const CUDA_EDAC_PTHREAD_ERROR                = Cint(-3)
const CUDA_EDAC_MEMORY_OBJECT_ALREADY_IN_USE = Cint(-4)
const CUDA_EDAC_MEMORY_OBJECT_NOT_FOUND      = Cint(-5)
const CUDA_EDAC_INVALID_HSIAO_72_64_VERSION  = Cint(-6)

const cudaECCMemoryObject_t = Ptr{Nothing}

const cudaECCHandle_t = Ptr{Nothing}
