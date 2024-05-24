#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=arch
export USE_CCACHE=1

rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/hefatss/manifest_aospa -b uvite-bengal-5.15

#build
/opt/crave/resync.sh
#export INLINE_KERNEL_BUILDING=true
./rom-build.sh topaz
