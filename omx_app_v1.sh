function monkeyTest(){
	monkey -p $1 --pct-majornav 0 --pct-syskeys 0 --pct-anyevent 0 --throttle 500 500
    #monkey -p $app --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes --pct-majornav 0 --pct-syskeys 0 --pct-anyevent 0 --throttle 100 20
}
echo "***********************************************" >> /sdcard/test_app.log
echo "                     Begin                     " >> /sdcard/test_app.log
echo "***********************************************" >> /sdcard/test_app.log
echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
echo "               App_Install Begin               " >> /sdcard/test_app.log
echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
for apk in *.apk;do adb install "$apk";echo "$apk" installed;echo "$apk" installed >> /sdcard/test_app.log;done
#安装app
echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
echo "              App_Install Success              " >> /sdcard/test_app.log
echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
LOOP=0
while true 
do
	let LOOP++
	echo "///////////////////////////////////////////////"
	echo "               App_Loop $LOOP times            "
	echo "///////////////////////////////////////////////"
	echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
	echo "               App_Loop $LOOP times            " >> /sdcard/test_app.log
	echo "///////////////////////////////////////////////" >> /sdcard/test_app.log
	for app in $(ls /data/data | grep -v "com.android")
	do 
		echo "launch $app-Loop: $LOOP"
		echo "launch $app-Loop: $LOOP" >> /sdcard/test_app.log
		monkeyTest $app
		bool=$?
		echo $bool
		if test $bool -gt 0 && test $bool -ne 252
		then
			echo "fail $app-Loop: $bool"
			echo "fail $app-Loop: $bool" >> /sdcard/test_app.log
			logcat | grep ".*$app" >> "/sdcard/$app.log" &
		else 
			echo "pass $app-Loop: $LOOP"
			echo "pass $app-Loop: $LOOP" >> /sdcard/test_app.log
		fi
	done
done
