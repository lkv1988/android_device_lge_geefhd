## Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/geefhd/geefhd-vendor.mk)
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd_hk/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd-common/overlay

PRODUCT_PACKAGES := \
	lights.msm8960

# Inherit from geefhd-common
$(call inherit-product, device/lge/geefhd-common/geefhd-common.mk)

LOCAL_PATH := device/lge/geefhd_hk
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.ril.def.preferred.network=9

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
# CameraHAL
PRODUCT_PACKAGES += \
   camera.geefhd_att_us
