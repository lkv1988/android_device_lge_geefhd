## Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/geefhd/geefhd-vendor.mk)
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geefhd-common/overlay

PRODUCT_COPY_FILES += \
    device/lge/geefhd/kernel:kernel

PRODUCT_COPY_FILES += \
	device/lge/geefhd/ramdisk/init.geefhd.rc:root/init.geefhd.rc \
	device/lge/geefhd/ramdisk/ueventd.geefhd.rc:root/ueventd.geefhd.rc \
	device/lge/geefhd/ramdisk/fstab.geefhd:root/fstab.geefhd

PRODUCT_COPY_FILES += \
	device/lge/geefhd/config/01brightness:system/etc/init.d/01brightness \
    device/lge/geefhd/config/gps.conf:system/etc/gps.conf \
    device/lge/geefhd/config/BCM4334B0_002.001.013.0271.0333.hcd:system/etc/firmware/BCM4334B0_002.001.013.0271.0333.hcd \
    device/lge/geefhd/config/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	device/lge/geefhd/prebuilt/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

# Camera BINs
PRODUCT_COPY_FILES += \
    device/lge/geefhd/camera/CE170F00.bin:system/vendor/firmware/CE170F00.bin \
    device/lge/geefhd/camera/CE170F01.bin:system/vendor/firmware/CE170F01.bin \
    device/lge/geefhd/camera/CE170F02.bin:system/vendor/firmware/CE170F02.bin \
    device/lge/geefhd/camera/CE170F03.bin:system/vendor/firmware/CE170F03.bin

PRODUCT_PACKAGES += \
	libemoji \
	Launcher3

PRODUCT_PACKAGES += \
	lights.msm8960 \
	libbt-vendor \
	memtrack.msm8960 \
	rild \
	libril \
	nfc.msm8960

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
