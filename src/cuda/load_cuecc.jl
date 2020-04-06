#=*
* Load libcuecc library
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

using Libdl

if (Sys.WORD_SIZE == 32)
    const libcuecc = Libdl.find_library(["libcuecc", "cuecc"], ["/lib/"])
elseif (Sys.WORD_SIZE == 64)
    const libcuecc = Libdl.find_library(["libcuecc", "cuecc"], ["/lib64/"])
end
