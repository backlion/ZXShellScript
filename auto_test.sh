for app in $(ls /data/data); do 
echo $app
echo $app >> /sdcard/test_app.log
logcat | grep -E "E/.*$app" > "/sdcard/$app.log" & monkey -p $app --ignore-crashes --ignore-timeouts --ignore-security-exceptions --monitor-native-crashes --pct-majornav 0 --pct-syskeys 0 --pct-anyevent 0 --throttle 100 20; 
done
