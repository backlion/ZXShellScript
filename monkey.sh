logcat -v time &
logcat -v time -b events > events_log &
monkey -v --pkg-blacklist-file /sdcard/mblacklist.txt --throttle 1000 10000000 &