#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=ubuntu

rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/hefatss/manifest_evox -b bengal_515 --git-lfs
#Local manifests
git clone https://github.com/hefatss/local_manifests -b evox .repo/local_manifests

#build
/opt/crave/resync.sh
git clone https://github.com/hefatss/vendor_sign-priv -b evox vendor/evolution-priv
. build/envsetup.sh
lunch lineage_topaz-userdebug
export INLINE_KERNEL_BUILDING=true
export ALLOW_MISSING_DEPENDENCIES=true
m evolution
