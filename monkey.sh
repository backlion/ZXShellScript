#Author：Issac Lin
#Ext: 756706
#version:1.2
#monkey
#
if test -z $1
then
	cp PowerAlwaysOn.apk /sdcard/
	pm install /sdcard/PowerAlwaysOn.apk
	am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
	if test ! -z $(ls /data/data | grep com.wandoujia.phoenix2.usbproxy)
	then
		pm uninstall com.wandoujia.phoenix2
		pm uninstall com.wandoujia.phoenix2.usbproxy
		echo "uninstall wandoujia successful"
	fi
	sleep 2
	monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &
	logcat -v time &
	logcat -v time -b events > events_log &
else	
	case $1 in 
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
			# if test ! -z $(ls /data/data | grep com.wandoujia.phoenix2.usbproxy)
			# then
				# pm uninstall com.wandoujia.phoenix2
				# pm uninstall com.wandoujia.phoenix2.usbproxy
				# echo "uninstall wandoujia successful"
			# fi
			# sleep 2
			# reboot;;
		1 ) cp PowerAlwaysOn.apk /sdcard/
			pm install /sdcard/PowerAlwaysOn.apk
			am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			if test ! -z $(ls /data/data | grep com.wandoujia.phoenix2.usbproxy)
			then
				pm uninstall com.wandoujia.phoenix2
				pm uninstall com.wandoujia.phoenix2.usbproxy
				echo "uninstall wandoujia successful"
			fi
			sleep 2
			monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &
			logcat -v time &
			logcat -v time -b events > events_log &;;
		* ) echo "args list:"
			echo "0 setup monkey environment(out of time)"
			echo "1 monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &"
			echo "h show this message";;
	esac
fi
