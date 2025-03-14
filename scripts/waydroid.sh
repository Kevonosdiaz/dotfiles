#!/bin/bash

sudo pacman -S --noconfirm waydroid
git clone https://github.com/casualsnek/waydroid_script
# yay -S --noconfirm waydroid-helper

# Simulate touch with cursor, enabled on per game/category basis
# waydroid prop set persist.waydroid.fake_touch "com.HoYo*"
# waydroid prop set persist.waydroid.fake_touch "*"

# Note, following /var/lib/waydroid/waydroid_base.prop file used:
# sys.use_memfd=true
# debug.stagefright.ccodec=0
# ro.hardware.gralloc=minigbm_gbm_mesa
# ro.hardware.egl=mesa
# ro.hardware.camera=v4l2
# ro.opengles.version=196609
# waydroid.system_ota=https://ota.waydro.id/system/lineage/waydroid_x86_64/GAPPS.json
# waydroid.vendor_ota=https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json
# waydroid.tools_version=1.5.0
# ro.vndk.lite=true
# ro.product.cpu.abilist=x86_64,x86,armeabi-v7a,armeabi,arm64-v8a
# ro.product.cpu.abilist32=x86,armeabi-v7a,armeabi
# ro.product.cpu.abilist64=x86_64,arm64-v8a
# ro.dalvik.vm.native.bridge=libndk_translation.so
# ro.enable.native.bridge.exec=1
# ro.vendor.enable.native.bridge.exec=1
# ro.vendor.enable.native.bridge.exec64=1
# ro.ndk_translation.version=0.2.3
# ro.dalvik.vm.isa.arm=x86
# ro.dalvik.vm.isa.arm64=x86_64
