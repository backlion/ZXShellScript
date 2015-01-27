#Author：Issac Lin
#Ext: 7536
#version:1.1
#SD_performance_test
#part of different_storage_performance_test
#

sd_stat=$1
usb_stat=$2
copy_num=$3
cpfile_size=$4
#SD to emmc
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
echo "start SD to emmc test|copy /storage/extsdcard/CPFILE to /sdcard"
echo "start SD to emmc test|copy /storage/extsdcard/CPFILE to /sdcard" >> different_storage_performance_test.log
for i in $(seq $copy_num)
do
	if test -d /sdcard/CPFILE
	then 
		rm -r /sdcard/CPFILE
		echo "delete /sdcard/CPFILE"
		echo "delete /sdcard/CPFILE" >> different_storage_performance_test.log
	fi
	echo "%%% SD to emmc test : $i time %%%"
	echo "%%% SD to emmc test : $i time %%%" >> different_storage_performance_test.log
	date
	date >> different_storage_performance_test.log
	#(time cp -rf /storage/extsdcard/CPFILE /sdcard) 2>> different_storage_performance_test.log
	cp_time=$((time cp -rf /storage/extsdcard/CPFILE /sdcard) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3*10}')

	if test $? -eq 0
	then
		echo "finish copy /storage/extsdcard/CPFILE to /sdcard"
		echo "finish copy /storage/extsdcard/CPFILE to /sdcard" >> different_storage_performance_test.log
	else
		echo "error when copy /storage/extsdcard/CPFILE to /sdcard"
		echo "error when copy /storage/extsdcard/CPFILE to /sdcard" >> different_storage_performance_test.log
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
echo "finish SD to emmc test"
echo "finish SD to emmc test" >> different_storage_performance_test.log
#SD to SD
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
echo "start SD to SD test|copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP"
echo "start SD to SD test|copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP" >> different_storage_performance_test.log
for i in $(seq $copy_num)
do
	if test -d /storage/extsdcard/CPTEMP
	then
		rm -r /storage/extsdcard/CPTEMP
		echo "delete /storage/extsdcard/CPTEMP folder"
		echo "delete /storage/extsdcard/CPTEMP folder" >> different_storage_performance_test.log
	fi
	echo "%%% SD to SD test : $i time %%%"
	echo "%%% SD to SD test : $i time %%%" >> different_storage_performance_test.log
	date
	date >> different_storage_performance_test.log
	#(time cp -rf /storage/extsdcard/CPFILE /storage/extsdcard/CPTEMP) 2>> different_storage_performance_test.log
	cp_time=$((time cp -rf /storage/extsdcard/CPFILE /storage/extsdcard/CPTEMP) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3*10}')

	if test $? -eq 0
	then
		echo "finish copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP"
		echo "finish copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP" >> different_storage_performance_test.log
	else
		echo "error when copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP"
		echo "error when copy /storage/extsdcard/CPFILE to /storage/extsdcard/CPTEMP" >> different_storage_performance_test.log
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
echo "finish SD to SD test"
echo "finish SD to SD test" >> different_storage_performance_test.log
#SD to USB
total=0
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_performance_test.log
if test usb_stat -eq 1
then
	echo "start SD to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1"
	echo "start SD to USB test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1" >> different_storage_performance_test.log
	for i in $(seq $copy_num)
	do
		if test -d /storage/usbdisk1/CPFILE
		then
			rm -r /storage/usbdisk1/CPFILE
			echo "delete /storage/usbdisk1/CPFILE folder"
			echo "delete /storage/usbdisk1/CPFILE folder" >> different_storage_performance_test.log
		fi
		echo "%%% SD to USB test : $i time %%%"
		echo "%%% SD to USB test : $i time %%%" >> different_storage_performance_test.log
		date
		date >> different_storage_performance_test.log
		#(time cp -rf /storage/extsdcard/CPFILE /storage/usbdisk1) 2>> different_storage_performance_test.log
		cp_time=$((time cp -rf /storage/extsdcard/CPFILE /storage/usbdisk1) 2>&1 | tee -a different_storage_performance_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3*10}')

		if test $? -eq 0
		then
			echo "finish copy /storage/extsdcard/CPFILE to /storage/usbdisk1"
			echo "finish copy /storage/extsdcard/CPFILE to /storage/usbdisk1" >> different_storage_performance_test.log
		else
			echo "error when copy /storage/extsdcard/CPFILE to /storage/usbdisk1"
			echo "error when copy /storage/extsdcard/CPFILE to /storage/usbdisk1" >> different_storage_performance_test.log
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
	echo "finish SD to USB test"
	echo "finish SD to USB test" >> different_storage_performance_test.log
else
	echo "skip SD to USB test"
fi
