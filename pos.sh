#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=ubuntu

rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/hefatss/PixelOS-Manifest -b bengal_515 --git-lfs
#Local manifests
git clone https://github.com/hefatss/local_manifests -b pos-topaz .repo/local_manifests

#build
/opt/crave/resync.sh
rm -rf vendor/aosp/signing/keys
git clone https://github.com/hefatss/vendor_sign-priv -b pos vendor/aosp/signing/keys
. build/envsetup.sh
lunch aosp_topaz-ap1a-userdebug
export INLINE_KERNEL_BUILDING=true
export ALLOW_MISSING_DEPENDENCIES=true
make bacon
