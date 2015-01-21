#Author：Issac Lin
#Ext: 7536
#version:1.1
#different_storage_copy-compare_test
#log_filename:different_storage_copy-compare_test.log
#

#remove temp files
if test -e different_storage_copy-compare_test.log
then
	rm different_storage_copy-compare_test.log
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

echo "different_storage_copy-compare_test version: 1.1"
echo "different_storage_copy-compare_test version: 1.1"  >> different_storage_copy-compare_test.log
echo "remove temp files"
echo "remove temp files" >> different_storage_copy-compare_test.log
#install busybox
mount -o remount,rw /system
cp busybox /system/xbin
chmod 777 /system/xbin/busybox
/system/xbin/busybox --install /system/xbin
echo "finish install busybox"
echo "finish install busybox" >> different_storage_copy-compare_test.log
#detect storage
if test -z $(ls /storage/extsdcard)
then
	sd_stat=0
	echo "undetected SD card"
	echo "undetected SD card" >> different_storage_copy-compare_test.log
else
	sd_stat=1
	echo "detected SD card"
	echo "detected SD card" >> different_storage_copy-compare_test.log
fi
if test -z $(ls /storage/usbdisk1)
then
	usb_stat=0
	echo "undetected USB flash disk"
	echo "undetected USB flash disk" >> different_storage_copy-compare_test.log
else
	usb_stat=1
	echo "detected USB flash disk"
	echo "detected USB flash disk" >> different_storage_copy-compare_test.log
fi
#wait for HDD ready
if test -z $1
then
#default mode auto detect
echo "### Detect Mode ###"
echo "### Detect Mode ###" >> different_storage_copy-compare_test.log
	#emmc part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
	echo "emmc part"
	echo "emmc part" >> different_storage_copy-compare_test.log
		sh EMMC_copy-compare_test $sd_stat $usb_stat
	#SD part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
	echo "SD part"
	echo "SD part" >> different_storage_copy-compare_test.log
	if test sd_stat -eq 1
	then
		sh SD_copy-compare_test $sd_stat $usb_stat
	else
		echo "skip SD part"
		echo "skip SD part" >> different_storage_copy-compare_test.log
	fi
	#USB flash disk part
	echo "----------------------------------------------------"
	echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
	echo "USB flash disk part"
	echo "USB flash disk part" >> different_storage_copy-compare_test.log
	if test usb_stat -eq 1
	then
		sh USB_copy-compare_test $sd_stat $usb_stat
	else
		echo "skip USB flash disk part"
		echo "skip USB flash disk part" >> different_storage_copy-compare_test.log
	fi
else
#select mode
echo "### Select Mode ###"
echo "### Select Mode ###" >> different_storage_copy-compare_test.log
	case $1 in 
	0 ) echo "0 print this massage"
		echo "1 Emmc Test"
		echo "2 SD Card Test"
		echo "3 USB Flash Disk Test"
		echo "4 Emmc and SD Card Test"
		echo "5 Emmc and USB Flash Disk Test"
		echo "6 SD Card and USB Flash Disk Test"
		echo "7 Emmc,SD Card and USB Flash Disk Test";; 
	1 ) echo "select 1 Emmc Test"
		echo "select 1 Emmc Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_copy-compare_test.log
			sh EMMC_copy-compare_test $sd_stat $usb_stat;; 
	2 ) echo "select 2 SD Card Test"
		echo "select 2 SD Card Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "SD part"
		echo "SD part" >> different_storage_copy-compare_test.log
		if test sd_stat -eq 1
		then
			sh SD_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_copy-compare_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_copy-compare_test.log
		fi;; 
	3 ) echo "select 3 USB Flash Disk Test"
		echo "select 3 USB Flash Disk Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "USB flash disk part"
		echo "USB flash disk part" >> different_storage_copy-compare_test.log
		if test usb_stat -eq 1
		then
			sh USB_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find USB flash disk"
			echo "error:can't find USB flash disk" >> different_storage_copy-compare_test.log
			echo "skip USB flash disk part"
			echo "skip USB flash disk part" >> different_storage_copy-compare_test.log
		fi;; 
	4 ) echo "select 4 Emmc and SD Card Test"
		echo "select 4 Emmc and SD Card Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_copy-compare_test.log
			sh EMMC_copy-compare_test $sd_stat $usb_stat
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "SD part"
		echo "SD part" >> different_storage_copy-compare_test.log
		if test sd_stat -eq 1
		then
			sh SD_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_copy-compare_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_copy-compare_test.log
		fi;; 
	5 ) echo "select 5 Emmc and USB Flash Disk Test"
		echo "select 5 Emmc and USB Flash Disk Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_copy-compare_test.log
			sh EMMC_copy-compare_test $sd_stat $usb_stat
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "USB flash disk part"
		echo "USB flash disk part" >> different_storage_copy-compare_test.log
		if test usb_stat -eq 1
		then
			sh USB_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find USB flash disk"
			echo "error:can't find USB flash disk" >> different_storage_copy-compare_test.log
			echo "skip USB flash disk part"
			echo "skip USB flash disk part" >> different_storage_copy-compare_test.log
		fi;; 
	6 ) echo "select 6 SD Card and USB Flash Disk Test"
		echo "select 6 SD Card and USB Flash Disk Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "SD part"
		echo "SD part" >> different_storage_copy-compare_test.log
		if test sd_stat -eq 1
		then
			sh SD_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_copy-compare_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_copy-compare_test.log
		fi
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "USB flash disk part"
		echo "USB flash disk part" >> different_storage_copy-compare_test.log
		if test usb_stat -eq 1
		then
			sh USB_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find USB flash disk"
			echo "error:can't find USB flash disk" >> different_storage_copy-compare_test.log
			echo "skip USB flash disk part"
			echo "skip USB flash disk part" >> different_storage_copy-compare_test.log
		fi;; 
	7 ) echo "select 7 Emmc,SD Card and USB Flash Disk Test"
		echo "select 7 Emmc,SD Card and USB Flash Disk Test" >> different_storage_copy-compare_test.log
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "emmc part"
		echo "emmc part" >> different_storage_copy-compare_test.log
			sh EMMC_copy-compare_test $sd_stat $usb_stat
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "SD part"
		echo "SD part" >> different_storage_copy-compare_test.log
		if test sd_stat -eq 1
		then
			sh SD_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find SD card"
			echo "error:can't find SD card" >> different_storage_copy-compare_test.log
			echo "skip SD part"
			echo "skip SD part" >> different_storage_copy-compare_test.log
		fi
		echo "----------------------------------------------------"
		echo "----------------------------------------------------" >> different_storage_copy-compare_test.log
		echo "USB flash disk part"
		echo "USB flash disk part" >> different_storage_copy-compare_test.log
		if test usb_stat -eq 1
		then
			sh USB_copy-compare_test $sd_stat $usb_stat
		else
			echo "error:can't find USB flash disk"
			echo "error:can't find USB flash disk" >> different_storage_copy-compare_test.log
			echo "skip USB flash disk part"
			echo "skip USB flash disk part" >> different_storage_copy-compare_test.log
		fi;; 
	* ) echo "wrong parameter:you can use parameter 0 to get help";; 
esac 
fi
#output result
echo "finish different_storage_copy-compare_test"
echo "finish different_storage_copy-compare_test" >> different_storage_copy-compare_test.log
echo "////////////////////////////////////////////////////////////////"
echo "result:"
cat different_storage_copy-compare_test.log
echo "you can open different_storage_copy-compare_test.log to check test result"