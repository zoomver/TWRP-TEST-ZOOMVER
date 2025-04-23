#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/zte/P963F70

PRODUCT_PLATFORM := sp9863a

# Dynamic Partitions stuff
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

OVERRIDE_TARGET_FLATTEN_APEX := true
PRODUCT_PROPERTY_OVERRIDES += ro.apex.updatable=true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    cache \
    dtb \
    dtbo \
    fbootlogo \
    gpsbd \
    gpsgl \
    l_deltanv \
    l_fixnv1 \
    l_fixnv2 \
    l_gdsp \
    l_ldsp \
    l_modem \
    logo \
    l_runtimenv1 \
    l_runtimenv2 \
    metadata \
    miscdata \
    misc \
    mmcblk0boot0 \
    mmcblk0boot1 \
    odmko \
    persist \
    pm_sys \
    prodnv \
    sml \
    socko \
    super \
    sysdumpdb \
    teecfg \
    trustos \
    uboot \
    uboot_log \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vbmeta_product \
    vbmeta_system_ext \
    vendor_boot\
    warmboot \
    wcnmodem \
    ztecfg \
    ztepersist \
    product \
    system \
    system_ext \
    vendor

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery
    
PRODUCT_PACKAGES += \
    bootctrl.sp9863a \
    bootctrl.sp9863a.recovery

# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sp9863a \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# PRODUCT_PACKAGES += \
    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery

# MODULES
TARGET_RECOVERY_DEVICE_MODULES += \
    libpuresoftkeymasterdevice \
    ashmemd_aidl_interface-cpp \
    libashmemd_client

# LIBRARIES
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Fastbootd
# PRODUCT_PACKAGES += fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client
