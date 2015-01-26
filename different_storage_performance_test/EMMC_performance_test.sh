#Author：Issac Lin
#Ext: 7536
#version:1.1
#EMMC_performance_test
#part of different_storage_performance_test
#

path=$(pwd)
sd_stat=$1
usb_stat=$2
copy_num=$3
cpfile_size=$4
#emmc to emmc
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
echo "start emmc to emmc test|copy $path/CPFILE folder to /sdcard"
echo "start emmc to emmc test|copy $path/CPFILE folder to /sdcard" >> different_storage_copy-compare_test.log
for i in $(seq $copy_num)
do
	if test -d /sdcard/CPFILE
	then
		rm -r /sdcard/CPFILE
		echo "delete /sdcard/CPFILE folder"
		echo "delete /sdcard/CPFILE folder" >> different_storage_copy-compare_test.log
	fi
	echo "%%% emmc to emmc test : $i time %%%"
	echo "%%% emmc to emmc test : $i time %%%" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	#(time cp -rf CPFILE /sdcard) 2>> different_storage_copy-compare_test.log
	cp_time=`(time cp -rf CPFILE /sdcard) 2>&1 | tee -a different_storage_copy-compare_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}'`
	if test $? -eq 0
	then
		echo "finish copy $path/CPFILE folder to /sdcard"
		echo "finish copy $path/CPFILE folder to /sdcard" >> different_storage_copy-compare_test.log
	else
		echo "error when copy $path/CPFILE folder to /sdcard"
		echo "error when copy $path/CPFILE folder to /sdcard" >> different_storage_copy-compare_test.log
	fi
	speed=`expr $(expr $size /* 1000) / $cp_time`
	let total+=speed
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
	echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
done
speed=`expr $total / $copy_num`
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
echo "finish emmc to emmc test"
echo "finish emmc to emmc test" >> different_storage_copy-compare_test.log
#emmc to SD
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
if test sd_stat -eq 1
then
	echo "start emmc to SD test|copy $path/CPFILE folder to /storage/extsdcard"
	echo "start emmc to SD test|copy $path/CPFILE folder to /storage/extsdcard" >> different_storage_copy-compare_test.log
	for i in $(seq $copy_num)
	do
		if test -d /storage/extsdcard/CPFILE
		then
			rm -r /storage/extsdcard/CPFILE
			echo "delete /storage/extsdcard/CPFILE folder"
			echo "delete /storage/extsdcard/CPFILE folder" >> different_storage_copy-compare_test.log
		fi
		echo "%%% emmc to SD test : $i time %%%"
		echo "%%% emmc to SD test : $i time %%%" >> different_storage_copy-compare_test.log
		date
		date >> different_storage_copy-compare_test.log
		#(time cp -rf CPFILE /storage/extsdcard) 2>> different_storage_copy-compare_test.log
		cp_time=`(time cp -rf CPFILE /storage/extsdcard) 2>&1 | tee -a different_storage_copy-compare_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}'`

		if test $? -eq 0
		then
			echo "finish copy $path/CPFILE folder to /storage/extsdcard"
			echo "finish copy $path/CPFILE folder to /storage/extsdcard" >> different_storage_copy-compare_test.log
		else
			echo "error when copy $path/CPFILE folder to /storage/extsdcard"
			echo "error when copy $path/CPFILE folder to /storage/extsdcard" >> different_storage_copy-compare_test.log
		fi
		speed=`expr $(expr $size /* 1000) / $cp_time`
		let total+=speed
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
	done
	speed=`expr $total / $copy_num`
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	echo "finish emmc to SD test"
	echo "finish emmc to SD test" >> different_storage_copy-compare_test.log
else
	echo "skip emmc to SD test"
	echo "skip emmc to SD test" >> different_storage_copy-compare_test.log
fi
#emmc to USB
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
if test usb_stat -eq 1
then
	echo "start emmc to USB test|copy $path/CPFILE folder to /storage/usbdisk1"
	echo "start emmc to USB test|copy $path/CPFILE folder to /storage/usbdisk1" >> different_storage_copy-compare_test.log
	for i in $(seq $copy_num)
	do
		if test -d /storage/usbdisk1/CPFILE
		then
			rm -r /storage/usbdisk1/CPFILE
			echo "delete /storage/usbdisk1/CPFILE folder"
			echo "delete /storage/usbdisk1/CPFILE folder" >> different_storage_copy-compare_test.log
		fi
		echo "%%% emmc to USB test : $i time %%%"
		echo "%%% emmc to USB test : $i time %%%" >> different_storage_copy-compare_test.log
		date
		date >> different_storage_copy-compare_test.log
		(time cp -rf CPFILE /storage/usbdisk1) 2>> different_storage_copy-compare_test.log
		cp_time=`(time cp -rf CPFILE /storage/usbdisk1) 2>&1 | tee -a different_storage_copy-compare_test.log | awk 'BEGIN {FS="m|s|\\."}{print $1*60*1000+$2*1000+$3}'`
				
		if test $? -eq 0
		then
			echo "finish copy $path/CPFILE folder to /storage/usbdisk1"
			echo "finish copy $path/CPFILE folder to /storage/usbdisk1" >> different_storage_copy-compare_test.log
		else
			echo "error when copy $path/CPFILE folder to /storage/usbdisk1"
			echo "error when copy $path/CPFILE folder to /storage/usbdisk1" >> different_storage_copy-compare_test.log
		fi
		speed=`expr $(expr $size /* 1000) / $cp_time`
		let total+=speed
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s"
		echo "speed of $i time: $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s" >> different_storage_copy-compare_test.log
	done
	speed=`expr $total / $copy_num`
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***"
	echo "*** average speed : $speed byte/s = `expr $speed / 1024` KB/s = `expr $speed / 1048576` MB/s ***" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	echo "finish emmc to USB test"
	echo "finish emmc to USB test" >> different_storage_copy-compare_test.log
else
	echo "skip emmc to USB test"
	echo "skip emmc to USB test" >> different_storage_copy-compare_test.log
fi
