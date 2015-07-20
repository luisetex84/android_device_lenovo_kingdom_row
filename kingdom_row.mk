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

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay vendor/extra/overlays/phone-1080p

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 2560

# Haters gonna hate..
PRODUCT_CHARACTERISTICS := nosdcard

# Ramdisk
PRODUCT_PACKAGES += \
    busybox \
    healthd \
    security_boot_check \
    testmode \
    init.testmode.rc \
    init.lenovo.log.rc \
    init.lenovo.crash.rc \
    libinit_bacon \
    recovery.fstab \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.sh \
    init.target.rc \
    init.bacon.rc \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.qcom.factory.sh \
    init.qcom.ssr.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.early_boot.sh \
    init.qcom.class_core.sh \
    init.mdm.sh \
    init.class_main.sh \
    ueventd.rc \
    ueventd.bacon.rc

PRODUCT_COPY_FILES += \
    device/lenovo/kingdom_row/rootdir/etc/init.rc:root/init.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths_auxpcm.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/xtwifi.conf:system/etc/xtwifi.conf \
    $(LOCAL_PATH)/wifi/xtwifi.conf:system/etc/lowi.conf

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    nfc_nci.pn54x.default \
    com.android.nfc_extras

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# Recovery
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(LOCAL_PATH)/bacon

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9

# Fuuuuu
PRODUCT_PACKAGES += camera.bacon

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/lenovo/kingdom_row/kingdom_row-vendor.mk)

ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/prebuilt_HY11/target/product/msm8974/prebuilt.mk)
endif

# Inherit from msm8974
$(call inherit-product, device/lenovo/kingdom_row/msm8974.mk)
