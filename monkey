cmd /c adb push C:\Users\issaclin\Desktop\monkey /sdcard/monkey
//cmd /c adb root
cmd /c adb shell sh /sdcard/monkey/monkey.sh 0
//cmd /c pause
cmd /c ping -n 45 127.1>nul
//cmd /c adb shell am start -n com.example.poweralwayson/.PowerAlwaysOnActivity
//cmd /c adb shell sh /sdcard/monkey/monkey.sh 2