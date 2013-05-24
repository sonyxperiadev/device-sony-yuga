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

$(call inherit-product, device/sony/lagan/device_phone.mk)
$(call inherit-product, vendor/sony/c6603/c6603-vendor.mk)

PRODUCT_NAME := full_c6603
PRODUCT_DEVICE := c6603
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Full Android on C6603
PRODUCT_MANUFACTURER := Sony
PRODUCT_LOCALES += xxhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_PREBUILT_KERNEL ?= kernel
PRODUCT_COPY_FILES += $(LOCAL_PATH)/$(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/logo.rle:root/logo.rle \
    $(LOCAL_PATH)/rootdir/system/etc/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg \
    $(LOCAL_PATH)/rootdir/system/etc/sensors.conf:system/etc/sensors.conf \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

SOMC_CFG_SENSORS_LIGHT_LM3533 := yes
SOMC_CFG_SENSORS_LIGHT_MAXRANGE := 1000
SOMC_CFG_SENSORS_LIGHT_LM3533_PATH := /sys/bus/i2c/devices/0-0036

SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes

SOMC_CFG_SENSORS_ACCEL_BMA250_INPUT := yes

$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
