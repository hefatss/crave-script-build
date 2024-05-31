#!/bin/bash

export BUILD_USERNAME=hefatss
export BUILD_HOSTNAME=ubuntu

#repo init rom
repo init -u https://github.com/AOSPA/manifest -b uvite

#build
/opt/crave/resync.sh
rm -rf vendor/aospa
git clone https://github.com/topazfucker/vendor_aospa.git -b uvite vendor/aospa
./rom-build.sh topaz
