#!/usr/bin/env bash
cd $OUT
rm $OUT/APP/install-files.zip
rm $OUT/install-files/etc/safestrap/2nd-init.zip
zip -9rj install-files/etc/safestrap/2nd-init 2nd-init-files/*
cd $OUT/recovery/root
# clean up for 2nd-init
rm -rf data
rm -rf dev
rm -rf proc
rm -rf sys
rm -rf system
rm -rf tmp
touch init.mmi.usb.rc
touch init.qcom.rc
touch init.target.rc
touch init.vzw.rc
cp $ANDROID_BUILD_TOP/device/generic/safestrap/default.prop default.prop
cp $OUT/system/bin/updater $OUT/recovery/root/sbin/update-binary
rm $OUT/install-files/etc/safestrap/recovery.zip
zip -9r $OUT/install-files/etc/safestrap/recovery .
cd $OUT
zip -9r APP/install-files install-files
