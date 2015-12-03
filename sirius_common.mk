# Copyright (C) 2013 The Android Open Source Project
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

PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia Z2 (MAINLINE)
PRODUCT_DEVICE := sirius
PRODUCT_NAME := full_sirius

# add all configurations
PRODUCT_AAPT_CONFIG := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480 \
    dalvik.vm.heapsize=48m
#    ro.usb.pid_suffix=1AF

# en_US only
PRODUCT_LOCALES := en_US

PRODUCT_PACKAGES += \
    Bluetooth \
    FusedLocation \
    InputDevices \
    Keyguard \
    LatinIME \
    Phone \
    PrintSpooler \
    Provision \
    Settings \
    SystemUI \
    TeleService \
    TestingCamera \
    WAPPushManager \
    audio \
    audio_policy.default \
    audio.primary.default \
    com.android.future.usb.accessory \
    hostapd \
    librs_jni \
    libvideoeditor_core \
    libvideoeditor_jni \
    libvideoeditor_osal \
    libvideoeditorplayer \
    libvideoeditor_videofilters \
    lint \
    local_time.default \
    network \
    pand \
    power.default \
    sdptool \
    vibrator.default \
    wpa_supplicant.conf

# This is not necessary for mini, but is for mini-emulator as it should
# be included in platform.zip
PRODUCT_PACKAGES += camera.goldfish.jpeg

PRODUCT_PACKAGES += Trebuchet

PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_PATH)/root/*),$(f):$(subst $(LOCAL_PATH)/,,$(f))) \
    frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \

# Adreno firmwares
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/adreno/a300_pfp.fw:root/lib/firmware/a300_pfp.fw \
    $(LOCAL_PATH)/adreno/a300_pm4.fw:root/lib/firmware/a300_pm4.fw \
    $(LOCAL_PATH)/adreno/a300_pfp.fw:root/lib/firmware/a330_pfp.fw \
    $(LOCAL_PATH)/adreno/a300_pm4.fw:root/lib/firmware/a330_pm4.fw \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=unknown \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.config.notification_sound=pixiedust.ogg

PRODUCT_PACKAGES += \
    gralloc.drm     \
    libGLES_mesa

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    hal.gralloc=drm \
    debug.egl.hw=1 \
    ro.opengles.version=196608

$(call inherit-product, build/target/product/core_base.mk)
$(call inherit-product-if-exists, frameworks/webview/chromium/chromium.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage5.mk)

