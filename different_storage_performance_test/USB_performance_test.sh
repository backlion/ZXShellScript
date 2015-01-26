#Author：Issac Lin
#Ext: 7536
#version:1.1
#different_storage_performance_test
#log_location:/data/ca7_PGandCG_stress.log
#

sd_stat=$1
usb_stat=$2
copy_num=$3
cpfile_size=$4
#USB to emmc
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
echo "start USB to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard"
echo "start USB to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_performance_test.log
for i in $(seq $copy_num)
do
	if test -d /sdcard/CPFILE
	then
		rm -r /sdcard/CPFILE
		echo "delete /sdcard/CPFILE folder"
		echo "delete /sdcard/CPFILE folder" >> different_storage_performance_test.log
	fi
	echo "%%% USB to emmc test : $i time %%%"
	echo "%%% USB to emmc test : $i time %%%" >> different_storage_performance_test.log
	date
	date >> different_storage_performance_test.log
	#(time cp -rf /storage/usbdisk1/CPFILE /sdcard) 2>> different_storage_performance_test.log
	cp_time=$((time cp -rf /storage/usbdisk1/CPFILE /sdcard) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}')

	if test $? -eq 0
	then
		echo "finish copy /storage/usbdisk1/CPFILE to /sdcard"
		echo "finish copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_performance_test.log
	else
		echo "error when copy /storage/usbdisk1/CPFILE to /sdcard"
		echo "error when copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_performance_test.log
	fi
	speed=`expr $(expr $cpfile_size \* 1000) / $cp_time`
	let total+=speed
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_performance_test.log
done
speed=`expr $total / $copy_num`
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_performance_test.log
date
date >> different_storage_performance_test.log
echo "finish USB to emmc test"
echo "finish USB to emmc test" >> different_storage_performance_test.log
#USB to SD
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
if test sd_stat -eq 1
then
	echo "start USB to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE"
	echo "start USB to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE" >> different_storage_performance_test.log
	for i in $(seq $copy_num)
	do
		if test -d /storage/extsdcard/CPFILE
		then 
			rm -r /storage/extsdcard/CPFILE
			echo "delete /storage/extsdcard/CPFILE"
			echo "delete /storage/extsdcard/CPFILE" >> different_storage_performance_test.log
		fi
		echo "%%% USB to emmc test : $i time %%%"
		echo "%%% USB to emmc test : $i time %%%" >> different_storage_performance_test.log
		date
		date >> different_storage_performance_test.log
		#(time cp -rf /storage/usbdisk1/CPFILE /storage/extsdcard) 2>> different_storage_performance_test.log
		cp_time=$((time cp -rf /storage/usbdisk1/CPFILE /storage/extsdcard) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}')

		if test $? -eq 0
		then
			echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard"
			echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard" >> different_storage_performance_test.log
		else
			echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard"
			echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard" >> different_storage_performance_test.log
		fi
		speed=`expr $(expr $cpfile_size \* 1000) / $cp_time`
		let total+=speed
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_performance_test.log
	done
	speed=`expr $total / $copy_num`
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_performance_test.log
	date
	date >> different_storage_performance_test.log
	echo "finish USB to SD test"
	echo "finish USB to SD test" >> different_storage_performance_test.log
else 
	echo "skip USB to SD test"
	echo "skip USB to SD test" >> different_storage_performance_test.log
fi
#USB to USB
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
echo "start USB to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP"
echo "start USB to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP" >> different_storage_performance_test.log
for i in $(seq $copy_num)
do
	if test -d /storage/usbdisk1/CPTEMP
	then 
		rm -r /storage/usbdisk1/CPTEMP
		echo "delete /storage/usbdisk1/CPTEMP"
		echo "delete /storage/usbdisk1/CPTEMP" >> different_storage_performance_test.log
	fi
	echo "%%% USB to emmc test : $i time %%%"
	echo "%%% USB to emmc test : $i time %%%" >> different_storage_performance_test.log
	date
	date >> different_storage_performance_test.log
	#(time cp -rf /storage/usbdisk1/CPFILE /storage/usbdisk1/CPTEMP) 2>> different_storage_performance_test.log
	cp_time=$((time cp -rf /storage/usbdisk1/CPFILE /storage/usbdisk1/CPTEMP) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}')

	if test $? -eq 0
	then
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP"
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP" >> different_storage_performance_test.log
	else
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP"
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/usbdisk1/CPTEMP" >> different_storage_performance_test.log
	fi
	speed=`expr $(expr $cpfile_size \* 1000) / $cp_time`
	let total+=speed
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_performance_test.log
done
speed=`expr $total / $copy_num`
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_performance_test.log
date
date >> different_storage_performance_test.log
echo "finish USB to USB test"
echo "finish USB to USB test" >> different_storage_performance_test.log