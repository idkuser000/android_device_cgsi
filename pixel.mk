#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

CGSI_CUSTOM_ROM_NAME := PixelOS-AOSP
CGSI_CUSTOM_ROM_BRANCH := seventeen

# Import cgsi product variables
include device/cgsi/import_product_vars.mk

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
else
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
endif

# Inherit from the device configuration.
$(call inherit-product, device/cgsi/device.mk)

# Inherit some common PixelOS stuff.
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, vendor/custom/config/common_full_phone.mk)
else
$(call inherit-product, vendor/custom/config/common_full_tablet_wifionly.mk)
endif

CGSI_CUSTOM_ROM_NAME := Evolution-X
CGSI_CUSTOM_ROM_BRANCH := cnb

# disable incompatible dependencies on x86_64
ifneq ($(CGSI_ARCH),arm64)
PRODUCT_PACKAGES += \
    FaceUnlock \
    TurboAdapter
endif

# Product properties
include device/cgsi/common_product_properties.mk
