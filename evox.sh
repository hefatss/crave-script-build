#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=arch
export USE_CCACHE=1

rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/hefatss/manifest_evox -b udc-bengal-5.15 --git-lfs
#Local manifests
git clone https://github.com/hefatss/local_manifests -b evox .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_topaz-userdebug
export INLINE_KERNEL_BUILDING=true
export ALLOW_MISSING_DEPENDENCIES=true
m evolution
