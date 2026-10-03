#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

CGSI_CUSTOM_ROM_NAME := PixelOS
CGSI_CUSTOM_ROM_BRANCH := 17.0

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

# Fallback to AOSP setup because i deleted pixel's setupwizard
PRODUCT_PACKAGES += Provision

# Product properties
include device/cgsi/common_product_properties.mk
