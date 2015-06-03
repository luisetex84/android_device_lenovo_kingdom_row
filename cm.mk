## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := kingdom_row

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/kingdom_row/device_kingdom_row.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kingdom_row
PRODUCT_NAME := cm_kingdom_row
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := kingdom_row
PRODUCT_MANUFACTURER := lenovo
