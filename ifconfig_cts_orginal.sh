echo "--------------------------------reboot_stress: started, now sleep for 180 seconds--------------------------------"
#sleep 60
#logcat &
#sleep 30
echo "--------------------------------reboot_stress: now reboot--------------------------------"
if test -e /data/reboot_stress.log
then
	LOOP =`tail -n 1 /data/reboot_stress.log | awk '{print $2}'`
	let LOOP++
	echo $LOOP
	echo "reboot $LOOP times" >> /data/reboot_stress.log
else
	echo "reboot 1 times" >> /data/reboot_stress.log
fi
#reboot
