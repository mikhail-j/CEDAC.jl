#=*
* Export libclecc library definitions and functions
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
    OPENCL_EDAC_SUCCESS,
    OPENCL_EDAC_INVALID_ARGUMENT,
    OPENCL_EDAC_OUT_OF_MEMORY,
    OPENCL_EDAC_INVALID_MEMORY_PERMISSIONS,
    OPENCL_EDAC_PTHREAD_ERROR,
    OPENCL_EDAC_MEM_OBJECT_ALREADY_IN_USE,
    OPENCL_EDAC_MEM_OBJECT_NOT_FOUND,
    OPENCL_EDAC_INVALID_HSIAO_72_64_VERSION,
    clECCMemObject_t,
    clECCHandle_t,

    # functions
    clGetErrorName,
    clECCLockEDACMutex,
    clECCUnlockEDACMutex,
    clECCSetPreferredHsiao_77_22_Version,
    clECCGetPreferredHsiao_77_22_Version,
    clECCSetMemoryScrubbingInterval,
    clECCGetMemoryScrubbingInterval,
    clECCInit,
    clECCDestroy,
    clECCAddMemObject,
    clECCRemoveMemObject,
    clECCRemoveMemObjectWithCLMem,
    clECCUpdateMemObject,
    clECCUpdateMemObjectWithCLMem,
    clECCGetMemObjectParityBits,
    clECCGetMemObjectParityBitsWithCLMem,
    clECCGetTotalErrors,
    clECCGetTotalErrorsWithCLMem,
    clECCGetTotalErrorsSize,
    clECCGetTotalErrorsSizeWithCLMem,

    # high level OpenCL functions
    clECCGetErrorName,
    clECCGetTotalErrors!,
    clECCGetTotalErrorsWithCLMem!
