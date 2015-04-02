input swipe 500 1000 500 500
sleep 1
input tap 1800 1000
sleep 1
input tap 1750 567
sleep 1
input tap 1800 1000
sleep 1
am start -n com.android.settings/.DisplaySettings
sleep 1
input tap 500 600
sleep 1
input tap 600 835
sleep 1
am start -n com.android.settings/.SecuritySettings
sleep 1
input tap 500 300
sleep 1
input tap 500 200
sleep 1
input keyevent 3