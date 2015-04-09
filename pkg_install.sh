if test ! -d /sdcard/Android;then mkdir /sdcard/Android;fi
if test ! -d /sdcard/Android/data;then mkdir /sdcard/Android/data;fi
if test ! -d /sdcard/Android/obb;then mkdir /sdcard/Android/obb;fi
if test ! -d /sdcard/3DMark;then mkdir /sdcard/Android/3DMark;fi
if test ! -d /sdcard/3DMark/packages;then mkdir /sdcard/Android/3DMark/packages;fi
if test -d Android/data
then
	cp -R -f Android/data/* /sdcard/Android/data
	if test $? -eq 0;then echo "success to copy data files";fi
else
	echo "undetected data files"
fi
if test -d Android/data
then
	cp -R -f Android/obb/* /sdcard/Android/obb
	if test $? -eq 0;then echo "success to copy obb files";fi
else
	echo "undetected obb files"
fi
for apk in *.apk;do pm install "/sdcard/monkey/$apk";echo "$apk" install;done