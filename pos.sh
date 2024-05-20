#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=arch
export USE_CCACHE=1

rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/hefatss/PixelOS-Manifest.git -b fourteen-Bengal_515 --git-lfs
#Local manifests
git clone https://github.com/hefatss/local_manifests -b pos-topaz .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch aosp_topaz-ap1a-userdebug
make installclean
export INLINE_KERNEL_BUILDING=true
make bacon
