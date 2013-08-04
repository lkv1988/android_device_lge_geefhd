
# inherit from the proprietary version
-include vendor/lge/geefhd_hk/BoardConfigVendor.mk

# inherit from geefhd-common
-include device/lge/geefhd-common/BoardConfigCommon.mk

#TARGET_BOOTLOADER_BOARD_NAME := geefhd_hk

BOARD_KERNEL_CMDLINE := vmalloc=600M console=ttyHSL0,115200,n8 lpj=67677 user_debug=31 msm_rtb.filter=0x0 ehci-hcd.park=3 coresight-etm.boot_enable=0 androidboot.hardware=geefhd_hk uart_console=disable lge.rev=rev_10 lcd_maker_id=primary lge.hreset=off, lge.reset=rst_etc gpt=enable logoentry=0x77665501+0+0 lge.batt_info=ds2704_l lge.crash=0x0 lge.crash_enable=0x0
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

TARGET_KERNEL_SOURCE := kernel/lge/geefhd
TARGET_KERNEL_CONFIG := geefhd_hk_defconfig
#TARGET_PREBUILT_KERNEL := device/lge/geefhd_hk/kernel

#BOARD_HAS_NO_SELECT_BUTTON := true
# assert
TARGET_OTA_ASSERT_DEVICE := geefhd,geefhd_hk,gkatt

# inherit from the proprietary version
-include vendor/lge/geefhd/BoardConfigVendor.mk
