## Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/geefhd/geefhd-vendor.mk)
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd_hk/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd-common/overlay

PRODUCT_COPY_FILES += \
    device/lge/geefhd_hk/kernel:kernel

PRODUCT_COPY_FILES += \
	device/lge/geefhd_hk/ramdisk/init.geefhd_hk.rc:root/init.geefhd_hk.rc \
	device/lge/geefhd_hk/ramdisk/ueventd.geefhd_hk.rc:root/ueventd.geefhd_hk.rc \
	device/lge/geefhd_hk/ramdisk/fstab.geefhd_hk:root/fstab.geefhd_hk

PRODUCT_COPY_FILES += \
	device/lge/geefhd_hk/config/01brightness:system/etc/init.d/01brightness \
    device/lge/geefhd_hk/config/gps.conf:system/etc/gps.conf \
    device/lge/geefhd_hk/config/BCM4334B0_002.001.013.0271.0333.hcd:system/etc/firmware/BCM4334B0_002.001.013.0271.0333.hcd \
    device/lge/geefhd_hk/config/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	device/lge/geefhd_hk/prebuilt/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

PRODUCT_PACKAGES += \
	lights.msm8960 \
	libbt-vendor

PRODUCT_PACKAGES += \
    loki.sh \
	loki_flash \
	loki_patch

# Inherit from geefhd-common
$(call inherit-product, device/lge/geefhd-common/geefhd-common.mk)

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=true

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
