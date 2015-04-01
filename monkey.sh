#Author：Issac Lin
#Ext: 756706
#version:1.1
#monkey
#
if test -z $1
then
	echo "args list:"
	echo "0 setup monkey environment"
	echo "1 monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &"
	echo "2 monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &"
	echo "h show this message"
else
	case $1 in 
		0 ) mount -o remount,rw /system
			#rm /system/app/Gallery2/Gallery2.apk
			#rm /system/app/QuickSearchBox/QuickSearchBox.apk
			rm /system/priv-app/Settings/Settings.apk
			#cp Gallery2.apk /system/app/Gallery2/
			#cp QuickSearchBox.apk /system/app/QuickSearchBox/
			cp Settings.apk /system/priv-app/Settings/
			#chmod 644 /system/app/Gallery2/Gallery2.apk
			#chmod 644 /system/app/QuickSearchBox/QuickSearchBox.apk
			chmod 644 /system/priv-app/Settings/Settings.apk
			cp PowerAlwaysOn.apk /sdcard/
			pm install /sdcard/PowerAlwaysOn.apk
			am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			sleep 2
			reboot;;
		1 ) am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &
			logcat -v time &
			logcat -v time -b events > events_log &;;
		2 ) am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
			monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &
			logcat -v time &
			logcat -v time -b events > events_log &;;
		* ) echo "args list:"
			echo "0 setup monkey environment"
			echo "1 monkey -v --pkg-blacklist-file mblacklist.txt --throttle 1000 10000000 &"
			echo "2 monkey -v --ignore-crashes --ignore-timeouts --ignore-native-crashes --pkg-blacklist-file mblacklist.txt --throttle 1000 1000000 &"
			echo "h show this message";;
	esac
fi
