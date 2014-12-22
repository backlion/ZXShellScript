if test ! -d /sdcard/Android;then mkdir /sdcard/Android;fi
if test ! -d /sdcard/Android/data;then mkdir /sdcard/Android/data;fi
if test ! -d /sdcard/Android/obb;then mkdir /sdcard/Android/obb;fi
cd Android/data
cp -R -f * /sdcard/Android/data
if test $? -eq 0;then echo "success to copy data files";fi
cd ../obb
cp -R -f * /sdcard/Android/obb
if test $? -eq 0;then echo "success to copy obb files";fi
cd ../..
for apk in *.apk;do adb install "$apk";echo "$apk" install;done