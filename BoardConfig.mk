#
# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from MSM8974 common
-include device/lenovo/msm8974-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := kingdom_row_defconfig
TARGET_KERNEL_SOURCE := kernel/lenovo/msm8974
BOARD_KERNEL_CMDLINE := console=tty60,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 vmalloc=480M androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/kingdom_row/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE          := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 20971520
BOARD_PERSISTIMAGE_PARTITION_SIZE       := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE         := 131072000
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 27439087000
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 29957396480
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G
BOARD_FLASH_BLOCK_SIZE                  := 131072

# Recovery
TARGET_RECOVERY_FSTAB := device/lenovo/kingdom_row/rootdir/etc/fstab.kingdom_row

TARGET_OTA_ASSERT_DEVICE := kingdom_row,K920

TARGET_INIT_VENDOR_LIB := libinit_bacon

TARGET_WCNSS_MAC_PREFIX := e8bba8

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

CONFIG_CTRL_IFACE := true

BOARD_NFC_CHIPSET := nfc-nci

AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true

# inherit from the proprietary version
-include vendor/lenovo/kingdom_row/BoardConfigVendor.mk
