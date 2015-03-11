#Author：Issac Lin
#Ext: 7536
#version:1.0
#memory_leak
#log_filename:memory_leak.log
#

LOOP=0
echo "memory_leak version: 1.0"
if test -e memory_leak.log
then
	rm memory_leak.log
fi
while true
do
	let LOOP++
	echo "////////////////////////////////////////////////////////" >> memory_leak.log
	echo "echo memory_leak_info $LOOP times" >> memory_leak.log
	procrank >> memory_leak.log
	echo "----------------------------------------" >> memory_leak.log
	cat /proc/driver/s3g >> memory_leak.log
	#ouput in dmesg can't save as file
	sleep 300
done
