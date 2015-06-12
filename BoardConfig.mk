USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/lenovo/kingdom_row/BoardConfigVendor.mk
-include device/oppo/msm8974-common/BoardConfigCommon.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := kingdom_row

PRODUCT_PREBUILT_WEBVIEWCHROMIUM := no

BOARD_KERNEL_CMDLINE := console=tty60,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 vmalloc=480M androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE          := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE      := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE        := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE         := 131072000
BOARD_USERDATAIMAGE_PARTITION_SIZE      := 27439087000
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 29957396480
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 32G
BOARD_FLASH_BLOCK_SIZE                  := 131072

TARGET_KERNEL_SOURCE := kernel/lenovo/msm8974
TARGET_KERNEL_CONFIG := kingdom_row_defconfig
TARGET_PREBUILT_KERNEL := device/lenovo/kingdom_row/kernel

BOARD_HAS_NO_SELECT_BUTTON := true




