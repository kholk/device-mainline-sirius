# config.mk
#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
TARGET_BOOTLOADER_BOARD_NAME := D6503

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true
TARGET_NO_KERNEL := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE := androidboot.hardware=qualcomm androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += earlyprintk console=ttyMSM0,115200,n8 loglevel=10 console=tty0

SMALLER_FONT_FOOTPRINT := true
MINIMAL_FONT_FOOTPRINT := true
# Some framework code requires this to enable BT
#BOARD_HAVE_BLUETOOTH := true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

BOARD_HAVE_BLUETOOTH := false

BOARD_USES_GENERIC_AUDIO := true

USE_CAMERA_STUB := true

BOARD_GPU_DRIVERS := freedreno
BOARD_EGL_CFG := device/generic/sirius/egl_mesa.cfg
BUILD_EMULATOR_OPENGL := false
USE_OPENGL_RENDERER := true

BOARD_USE_LEGACY_UI := true
VSYNC_EVENT_PHASE_OFFSET_NS := 0

WITH_DEXPREOPT := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12656242688
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_SEPOLICY_DIRS += build/target/board/generic/sepolicy
BOARD_SEPOLICY_UNION += \
        bootanim.te \
        device.te \
        domain.te \
        file.te \
        file_contexts \
        qemud.te \
        rild.te \
        shell.te \
        surfaceflinger.te \
        system_server.te
