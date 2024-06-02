#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=ubuntu

# Removal
rm -rf .repo/local_manifests/

# Sync
repo init -u https://github.com/hefatss/PixelOS-Manifest -b bengal_515 --git-lfs --depth=1
git clone https://github.com/hefatss/local_manifests -b pos-topaz .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
fi

# Custom
rm -rf vendor/extra
git clone https://github.com/shravansayz/vendor_extra -b master vendor/extra

# Run Build
. build/envsetup.sh
lunch aosp_topaz-ap1a-userdebug
export INLINE_KERNEL_BUILDING=true
export ALLOW_MISSING_DEPENDENCIES=true
m installclean
make bacon