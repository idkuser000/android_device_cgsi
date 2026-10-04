#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

CGSI_CUSTOM_ROM_NAME := Infinity-X
CGSI_CUSTOM_ROM_BRANCH := 17

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

# Inherit some common Infinity-X stuff.
ifeq ($(CGSI_DEVICE_TYPE),phone)
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)
else
$(call inherit-product, vendor/infinity/config/common_full_tablet_wifionly.mk)
endif

# Infinity-X Flags
WITH_GAPPS := false
INFINITY_MAINTAINER := cgik

# Product properties
include device/cgsi/common_product_properties.mk
