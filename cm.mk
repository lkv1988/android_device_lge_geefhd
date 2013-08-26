## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/geefhd_hk/full_geefhd_hk.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := geefhd_hk
PRODUCT_NAME := cm_geefhd_hk
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-E988
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=LGE/geefhd_open_hk/geefhd:4.2.2/JDQ39/E98810B.1370153677:user/release-keys PRIVATE_BUILD_DESC="geefhd_open_hk-user 4.2.2 JDQ39 E98810b.1370153677 release-keys"
