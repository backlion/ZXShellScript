if test -z $1
then
	echo "You must input a path"
else
	if test -z $1
	if test -d Android/data
	then
		if test ! -d /sdcard/Android;then mkdir /sdcard/Android;fi
		if test ! -d /sdcard/Android/data;then mkdir /sdcard/Android/data;fi
		cp -R -f Android/data /sdcard/Android/data
		if test $? -eq 0;then echo "success to copy data files";fi
	fi
	if test -d Android/obb
	then
		if test ! -d /sdcard/Android;then mkdir /sdcard/Android;fi
		if test ! -d /sdcard/Android/obb;then mkdir /sdcard/Android/obb;fi
		cp -R -f Android/obb /sdcard/Android/obb
		if test $? -eq 0;then echo "success to copy obb files";fi
	fi

	for apk in "$1/*.apk";do pm install "$apk";echo "$apk" install;done
fi
