LOOP=0
while true
do 
	let LOOP++
	am start -n com.example.suspend/.MainActivity
	sleep 5
	echo "suspend $LOOP times"
	killall com.example.suspend
	echo mem > /sys/power/state
	#sleep 35
	sleep 5
done
