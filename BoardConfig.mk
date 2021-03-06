#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from Lenovo common
-include device/lenovo/common/BoardConfigCommon.mk

#Include path
TARGET_SPECIFIC_HEADER_PATH += device/lenovo/kingdom_row/include

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_kingdom_row_defconfig

-include vendor/lenovo/kingdom_row/BoardConfigVendor.mk
