$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/kingdom_row/kingdom_row-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/kingdom_row/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lenovo/kingdom_row/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kingdom_row
PRODUCT_DEVICE := kingdom_row

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    device/lenovo/kingdom_row/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/lenovo/kingdom_row/rootdir/init.qcom.sh:root/init.qcom.sh \
    device/lenovo/kingdom_row/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/lenovo/kingdom_row/rootdir/fstab.qcom:root/fstab.qcom

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

# Inherit from msm8974-common
$(call inherit-product, device/oppo/msm8974-common/msm8974.mk)
