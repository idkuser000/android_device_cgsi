CGSI_CUSTOM_ROM_NAME := Evolution-X
CGSI_CUSTOM_ROM_BRANCH := cnb

# disable incompatible dependencies on x86_64
ifneq ($(CGSI_ARCH),arm64)
PRODUCT_PACKAGES += \
    FaceUnlock \
    TurboAdapter
endif

# GMS
ifneq ($(CGSI_ARCH),arm64)
WITH_GMS ?= false
endif
