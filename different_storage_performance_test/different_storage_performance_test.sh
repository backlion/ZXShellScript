#Author：Issac Lin
#Ext: 7536
#version:1.1
#different_storage_performance_test
#log_filename:different_storage_performance_test.log
#

path=$(pwd)
#remove temp files
if test -e different_storage_performance_test.log
then
	rm different_storage_performance_test.log
fi
if test -d /sdcard/CPFILE
then
	rm -r /sdcard/CPFILE
fi
if test -d /storage/extsdcard/CPFILE
then
	rm -r /storage/extsdcard/CPFILE
fi
if test -d /storage/extsdcard/CPTEMP
then
	rm -r /storage/extsdcard/CPTEMP
fi
if test -d /storage/usbdisk1/CPFILE
then
	rm -r /storage/usbdisk1/CPFILE
fi
if test -d /storage/usbdisk1/CPTEMP
then
	rm -r /storage/usbdisk1/CPTEMP
fi

echo "different_storage_performance_test version: 1.1"
echo "different_storage_performance_test version: 1.1"  >> different_storage_performance_test.log
echo "remove temp files"
echo "remove temp files" >> different_storage_performance_test.log
#install busybox
mount -o remount,rw /system
cp busybox /system/xbin
chmod 777 /system/xbin/busybox
/system/xbin/busybox --install /system/xbin
echo "finish install busybox"
echo "finish install busybox" >> different_storage_performance_test.log
#detect storage
if test -z $(ls /storage/extsdcard)
then
	sd_stat=0
	echo "undetected SD card"
	echo "undetected SD card" >> different_storage_performance_test.log
else
	sd_stat=1
	echo "detected SD card"
	echo "detected SD card" >> different_storage_performance_test.log
fi
if test -z $(ls /storage/usbdisk1)
then
	usb_stat=0
	echo "undetected USB"
	echo "undetected USB" >> different_storage_performance_test.log
else
	usb_stat=1
	echo "detected USB"
	echo "detected USB" >> different_storage_performance_test.log
fi
if test -z $2
then
	copy_num=3
else
	copy_num=$2
fi
cpfile_size=`ls -l CPFILE | awk '{total+=$4} END {print total}'`
echo "CPFILE folder size is $cpfile_size byte = `expr $cpfile_size / 1024` KB = `expr $cpfile_size / 1048576` MB"
echo "CPFILE folder size is $cpfile_size byte = `expr $cpfile_size / 1024` KB = `expr $cpfile_size / 1048576` MB" >> different_storage_performance_test.log
#wait for HDD ready
if test -z $1
then
#default mode auto detect
echo "### Detect Mode ###"
echo "### Detect Mode ###" >> different_storage_performance_test.log
	#emmc part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_performance_test.log
	echo "emmc part"
	echo "emmc part" >> different_storage_performance_test.log
		sh EMMC_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
	#SD part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_performance_test.log
	echo "SD part"
	echo "SD part" >> different_storage_performance_test.log
	if test sd_stat -eq 1
	then
		sh SD_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
	else
		echo "skip SD part"
		echo "skip SD part" >> different_storage_performance_test.log
	fi
	#USB part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_performance_test.log
	echo "USB part"
	echo "USB part" >> different_storage_performance_test.log
	if test usb_stat -eq 1
	then
		sh USB_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
	else
		echo "skip USB part"
		echo "skip USB part" >> different_storage_performance_test.log
	fi
else
#select mode
echo "### Select Mode ###"
echo "### Select Mode ###" >> different_storage_performance_test.log
	case $1 in 
	0 ) echo "0 print this massage"
		echo "1 Emmc Test"
		echo "2 SD Card Test"
		echo "3 USB Test"
		echo "4 Emmc and SD Card Test"
		echo "5 Emmc and USB Test"
		echo "6 SD Card and USB Test"
		echo "7 Emmc,SD Card and USB Test";; 
	1 ) echo "select 1 Emmc Test"
		echo "select 1 Emmc Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_performance_test.log
			sh EMMC_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size;; 
	2 ) echo "select 2 SD Card Test"
		echo "select 2 SD Card Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "SD part"
		echo "SD part" >> different_storage_performance_test.log
		if test sd_stat -eq 1
		then
			if test ! -d /storage/extsdcard/CPFILE
			then
				cp -rf CPFILE /storage/extsdcard
				echo "init /storage/extsdcard/CPFILE folder"
				echo "init /storage/extsdcard/CPFILE folder" >> different_storage_performance_test.log
			fi
			sh SD_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_performance_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_performance_test.log
		fi;; 
	3 ) echo "select 3 USB Test"
		echo "select 3 USB Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "USB part"
		echo "USB part" >> different_storage_performance_test.log
		if test usb_stat -eq 1
		then
			if test ! -d /storage/usbdisk1/CPFILE
			then
				cp -rf CPFILE /storage/usbdisk1
				echo "init /storage/usbdisk1/CPFILE folder"
				echo "init /storage/usbdisk1/CPFILE folder" >> different_storage_performance_test.log
			fi
			sh USB_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find USB"
			echo "error:can't find USB" >> different_storage_performance_test.log
			echo "skip USB part"
			echo "skip USB part" >> different_storage_performance_test.log
		fi;; 
	4 ) echo "select 4 Emmc and SD Card Test"
		echo "select 4 Emmc and SD Card Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_performance_test.log
			sh EMMC_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "SD part"
		echo "SD part" >> different_storage_performance_test.log
		if test sd_stat -eq 1
		then
			sh SD_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_performance_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_performance_test.log
		fi;; 
	5 ) echo "select 5 Emmc and USB Test"
		echo "select 5 Emmc and USB Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_performance_test.log
			sh EMMC_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "USB part"
		echo "USB part" >> different_storage_performance_test.log
		if test usb_stat -eq 1
		then
			sh USB_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find USB"
			echo "error:can't find USB" >> different_storage_performance_test.log
			echo "skip USB part"
			echo "skip USB part" >> different_storage_performance_test.log
		fi;; 
	6 ) echo "select 6 SD Card and USB Test"
		echo "select 6 SD Card and USB Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		if test ! -d /storage/extsdcard/CPFILE
		then
			cp -rf CPFILE /storage/extsdcard
			echo "init /storage/extsdcard/CPFILE folder"
			echo "init /storage/extsdcard/CPFILE folder" >> different_storage_performance_test.log
		fi
		echo "SD part"
		echo "SD part" >> different_storage_performance_test.log
		if test sd_stat -eq 1
		then
			sh SD_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_performance_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_performance_test.log
		fi
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "USB part"
		echo "USB part" >> different_storage_performance_test.log
		if test usb_stat -eq 1
		then
			sh USB_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find USB"
			echo "error:can't find USB" >> different_storage_performance_test.log
			echo "skip USB part"
			echo "skip USB part" >> different_storage_performance_test.log
		fi;; 
	7 ) echo "select 7 Emmc,SD Card and USB Test"
		echo "select 7 Emmc,SD Card and USB Test" >> different_storage_performance_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_performance_test.log
			sh EMMC_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "SD part"
		echo "SD part" >> different_storage_performance_test.log
		if test sd_stat -eq 1
		then
			sh SD_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_performance_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_performance_test.log
		fi
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_performance_test.log
		echo "USB part"
		echo "USB part" >> different_storage_performance_test.log
		if test usb_stat -eq 1
		then
			sh USB_performance_test.sh $sd_stat $usb_stat $copy_num $cpfile_size
		else
			echo "error:can't find USB"
			echo "error:can't find USB" >> different_storage_performance_test.log
			echo "skip USB part"
			echo "skip USB part" >> different_storage_performance_test.log
		fi;; 
	* ) echo "wrong parameter:you can use parameter 0 to get help";; 
esac 
fi
#output result
echo "finish different_storage_performance_test"
echo "finish different_storage_performance_test" >> different_storage_performance_test.log
echo "////////////////////////////////////////////////////////////////"
#echo "result:"
#cat different_storage_performance_test.log
echo "you can open different_storage_performance_test.log to check test result"