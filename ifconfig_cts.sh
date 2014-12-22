echo "--------------------------------reboot_stress: started, now sleep for 180 seconds--------------------------------"
sleep 180
logcat &
sleep 30
echo "--------------------------------reboot_stress: now reboot--------------------------------"
if test -e /data/reboot_stress.log
then
	LOOP=$(cat /data/reboot_stress.log | grep -c "reboot")
	let LOOP++
	echo "reboot $LOOP times"
	echo "reboot $LOOP times" >> /data/reboot_stress.log
else
	echo "reboot 1 times"
	echo "reboot 1 times" >> /data/reboot_stress.log
fi
reboot
