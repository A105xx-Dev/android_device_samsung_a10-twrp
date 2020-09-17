# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := exynos7885
TARGET_BOOTLOADER_BOARD_NAME := universal7885
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

# Kernel                                      
TARGET_PREBUILT_KERNEL := device/samsung/a10/prebuilt/Image
TARGET_PREBUILT_RECOVERY_DTBO := device/samsung/a10/prebuilt/recoverydtbo

# Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos7885 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --board SRPSA10A003
BOARD_MKBOOTIMG_ARGS += --recovery_dtbo $(TARGET_PREBUILT_RECOVERY_DTBO) --header_version 1
#BOARD_CUSTOM_BOOTIMG_MK :=  device/samsung/a10/bootimg.mk
BOARD_CUSTOM_MKBOOTIMG := device/samsung/a10/mkbootimg

# max partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE     := 37748736
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55574528
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3556769792
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25565310976 # 25565331456 - 20480 (footer)
BOARD_CACHEIMAGE_PARTITION_SIZE    := 389021696
BOARD_FLASH_BLOCK_SIZE := 131072

# Platform
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-g71

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP specific build flags
RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_USE_NEW_MINADBD := true
TW_NO_LEGACY_PROPS := true
#TW_USE_TOOLBOX := true

# if busybox doesn't compile, apply this patch:
# open external/busybox/busybox-full.config, and change "CONFIG_TELNETD=y" to "# CONFIG_TELNETD is not set"

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

ALLOW_MISSING_DEPENDENCIES := true
#
