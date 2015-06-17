$(call inherit-product, device/lenovo/kingdom_row/full_kingdom_row.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

PRODUCT_NAME := cm_kingdom_row

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=“kingdom_row” \
    PRODUCT_NAME=“cm_kingdom_row” \
    BUILD_FINGERPRINT="Lenovo/kingdom_row/kingdom_row:5.0.2/LRX22G/K920_S246_150520_ROW:user/release-keys" \
    PRIVATE_BUILD_DESC="kingdom_row/kingdom_row-user 5.0.2 LRX22G/K920_S246_150520_ROW release-keys"
