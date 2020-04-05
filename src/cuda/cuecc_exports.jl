#=*
* Export libcuecc library definitions and functions
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

export
    # constants
    CUDA_EDAC_SUCCESS,
    CUDA_EDAC_INVALID_ARGUMENT,
    CUDA_EDAC_OUT_OF_MEMORY,
    CUDA_EDAC_PTHREAD_ERROR,
    CUDA_EDAC_MEMORY_OBJECT_ALREADY_IN_USE,
    CUDA_EDAC_MEMORY_OBJECT_NOT_FOUND,
    CUDA_EDAC_INVALID_HSIAO_72_64_VERSION,
    cudaECCMemoryObject_t,
    cudaECCHandle_t,

    # functions
    cuECCLockEDACMutex,
    cuECCUnlockEDACMutex,
    cuECCSetPreferredHsiao_77_22_Version,
    cuECCGetPreferredHsiao_77_22_Version,
    cuECCSetMemoryScrubbingInterval,
    cuECCGetMemoryScrubbingInterval,
    cuECCInit,
    cuECCDestroy,
    cuECCAddMemoryObject,
    cuECCRemoveMemoryObject,
    cuECCRemoveMemoryObjectWithDevicePointer,
    cuECCUpdateMemoryObject,
    cuECCUpdateMemoryObjectWithDevicePointer,
    cuECCGetMemoryObjectParityBits,
    cuECCGetMemoryObjectParityBitsWithDevicePointer,
    cuECCGetTotalErrors,
    cuECCGetTotalErrorsWithDevicePointer,
    cuECCGetTotalErrorsSize,
    cuECCGetTotalErrorsSizeWithDevicePointer,

    # high level OpenCL functions
    cuECCGetErrorName,
    cuECCGetTotalErrors!,
    cuECCGetTotalErrorsWithDevicePointer!
