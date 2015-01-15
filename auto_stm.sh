echo "Elite Resume Test Start"


c=0
#su
echo 1 > /sys/cpu_power_info/sectimer_wakeup
while [ 1 ]
do 
	echo "#################test time is "$c
	
	input keyevent 26

	c=$(($c+1))

	sleep 20
done 

echo "resume test end"

