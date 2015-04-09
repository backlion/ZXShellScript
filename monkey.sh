#Author：Issac Lin
#Ext: 756706
#version:1.3
#monkey
#
# if test -z $1
# then
	# echo "args list:"
	# echo "0 setup monkey environment"
	# echo "1 monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &"
	# echo "2 monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &"
	# echo "h show this message"
# else
	# case $1 in 
		# 0 ) mount -o remount,rw /system
			# rm /system/app/Gallery2/Gallery2.apk
			# rm /system/app/QuickSearchBox/QuickSearchBox.apk
			# rm /system/priv-app/Settings/Settings.apk
			# cp Gallery2.apk /system/app/Gallery2/
			# cp QuickSearchBox.apk /system/app/QuickSearchBox/
			# cp Settings.apk /system/priv-app/Settings/
			# chmod 644 /system/app/Gallery2/Gallery2.apk
			# chmod 644 /system/app/QuickSearchBox/QuickSearchBox.apk
			# chmod 644 /system/priv-app/Settings/Settings.apk
			# cp PowerAlwaysOn.apk /sdcard/
			# pm install /sdcard/PowerAlwaysOn.apk
			# am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			# sleep 2
			# reboot;;
		# 1 ) am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			# monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &
			# logcat -v time &
			# logcat -v time -b events > events_log &;;
		# 2 ) am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			# monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &
			# logcat -v time &
			# logcat -v time -b events > events_log &;;
		# * ) echo "args list:"
			# echo "0 setup monkey environment"
			# echo "1 monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &"
			# echo "2 monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &"
			# echo "h show this message";;
	# esac
	echo 1 > /sys/cpu_power_info/hardirq_trace
	cat /sys/cpu_power_info/hardirq_trace
	mount -o remount,rw /system
	rm /system/app/Gallery2/Gallery2.apk
	echo "remove Gallery2"
	rm /system/app/QuickSearchBox/QuickSearchBox.apk
	echo "remove QuickSearchBox"
	rm /system/priv-app/Settings/Settings.apk
	echo "remove Settings"
	if test ! -d /sdcard/Android;then mkdir /sdcard/Android;fi
	if test ! -d /sdcard/Android/data;then mkdir /sdcard/Android/data;fi
	if test ! -d /sdcard/Android/obb;then mkdir /sdcard/Android/obb;fi
	if test ! -d /sdcard/3DMark;then mkdir /sdcard/Android/3DMark;fi
	#if test ! -d /sdcard/3DMark/packages;then mkdir /sdcard/Android/3DMark/packages;fi
	if test -d Android/data
	then
		cp -R -f Android/data/* /sdcard/Android/data
		if test $? -eq 0;then echo "success to copy data files";fi
	else
		echo "undetected data files"
	fi
	if test -d Android/obb
	then
		cp -R -f Android/obb/* /sdcard/Android/obb
		if test $? -eq 0;then echo "success to copy obb files";fi
	else
		echo "undetected obb files"
	fi
	if test -d 3DMark
	then
		cp -R -f 3DMark/* /sdcard/3DMark
		if test $? -eq 0;then echo "success to copy 3DMark files";fi
	else
		echo "undetected 3DMark files"
	fi
	for apk in *.apk;do pm install -r "/sdcard/monkey/$apk";echo "$apk" install;done
	am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
	monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &
	logcat -v time &
	logcat -v time -b events > events_log &
#fi
