#Author：Issac Lin
#Ext: 7536
#version:1.1
#different_storage_copy-compare_test
#log_location:/data/ca7_PGandCG_stress.log
#

sd_stat=$1
usb_stat=$2
#USB flash disk to emmc
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
if test -d /sdcard/CPFILE
then 
	rm -r /sdcard/CPFILE
	echo "delete /sdcard/CPFILE"
	echo "delete /sdcard/CPFILE" >> different_storage_copy-compare_test.log
fi
echo "start USB flash disk to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard"
echo "start USB flash disk to emmc test|copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
(time cp -rf /storage/usbdisk1/CPFILE /sdcard) 2>> different_storage_copy-compare_test.log

if test $? -eq 0
then
	echo "finish copy /storage/usbdisk1/CPFILE to /sdcard"
	echo "finish copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
else
	echo "error when copy /storage/usbdisk1/CPFILE to /sdcard"
	echo "error when copy /storage/usbdisk1/CPFILE to /sdcard" >> different_storage_copy-compare_test.log
fi
date
date >> different_storage_copy-compare_test.log
echo "start compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE"
echo "start compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
(time diff -qr /storage/usbdisk1/CPFILE /sdcard/CPFILE) 2>> different_storage_copy-compare_test.log
if test $? -eq 0
then
	echo "pass:compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE"
	echo "pass:compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE" >> different_storage_copy-compare_test.log
else
	echo "fail:compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE"
	echo "fail:compare /storage/usbdisk1/CPFILE and /sdcard/CPFILE" >> different_storage_copy-compare_test.log
fi
date
date >> different_storage_copy-compare_test.log
#wait user to play video
date
date >> different_storage_copy-compare_test.log
echo "***Please make sure that video at /sdcard/CPFILE can play normally***"
echo "***Please make sure that video at /sdcard/CPFILE can play normally***" >> different_storage_copy-compare_test.log
echo "***wait for check video play at /sdcard/CPFILE ,press any key to continue***"
echo "***wait for check video play at /sdcard/CPFILE ,press any key to continue***" >> different_storage_copy-compare_test.log
read -n 1
echo "***continue test***"
echo "***continue test***" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
echo "finish USB flash disk to emmc test"
echo "finish USB flash disk to emmc test" >> different_storage_copy-compare_test.log
#USB flash disk to SD
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
if test sd_stat -eq 1
then
		if test -d /storage/extsdcard/CPFILE
	then 
		rm -r /storage/extsdcard/CPFILE
		echo "delete /storage/extsdcard/CPFILE"
		echo "delete /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	fi
	echo "start USB flash disk to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE"
	echo "start USB flash disk to SD test|copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	(time cp -rf /storage/usbdisk1/CPFILE /storage/extsdcard/CPFILE) 2>> different_storage_copy-compare_test.log

	if test $? -eq 0
	then
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE"
		echo "finish copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	else
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE"
		echo "error when copy /storage/usbdisk1/CPFILE to /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	fi
	date
	date >> different_storage_copy-compare_test.log
	echo "start compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE"
	echo "start compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	(time diff -qr /storage/usbdisk1/CPFILE /storage/extsdcard/CPFILE) 2>> different_storage_copy-compare_test.log
	if test $? -eq 0
	then
		echo "pass:compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE"
		echo "pass:compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	else
		echo "fail:compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE"
		echo "fail:compare /storage/usbdisk1/CPFILE and /storage/extsdcard/CPFILE" >> different_storage_copy-compare_test.log
	fi
	date
	date >> different_storage_copy-compare_test.log
	#wait user to play video
	date
	date >> different_storage_copy-compare_test.log
	echo "***Please make sure that video at /storage/extsdcard/CPFILE can play normally***"
	echo "***Please make sure that video at /storage/extsdcard/CPFILE can play normally***" >> different_storage_copy-compare_test.log
	echo "***wait for check video play at /storage/extsdcard/CPFILE ,press any key to continue***"
	echo "***wait for check video play at /storage/extsdcard/CPFILE ,press any key to continue***" >> different_storage_copy-compare_test.log
	read -n 1
	echo "***continue test***"
	echo "***continue test***" >> different_storage_copy-compare_test.log
	date
	date >> different_storage_copy-compare_test.log
	echo "finish USB flash disk to SD test"
	echo "finish USB flash disk to SD test" >> different_storage_copy-compare_test.log
else 
	echo "skip USB flash disk to SD test"
	echo "skip USB flash disk to SD test" >> different_storage_copy-compare_test.log
fi
#USB flash disk to USB flash disk
echo "////////////////////////////////"
echo "////////////////////////////////" >> different_storage_copy-compare_test.log
echo "start USB flash disk to USB flash disk test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP"
echo "start USB flash disk to USB flash disk test|copy /storage/extsdcard/CPFILE folder to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
(time cp -rf /storage/usbdisk1/CPFILE /storage/usbdisk1/CPTEMP) 2>> different_storage_copy-compare_test.log

if test $? -eq 0
then
	echo "finish copy /storage/usbdisk1/CPFILE folder to /storage/usbdisk1/CPTEMP"
	echo "finish copy /storage/usbdisk1/CPFILE folder to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
else
	echo "error when copy /storage/usbdisk1/CPFILE folder to /storage/usbdisk1/CPTEMP"
	echo "error when copy /storage/usbdisk1/CPFILE folder to /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
fi
date
date >> different_storage_copy-compare_test.log
echo "start compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP"
echo "start compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
(time diff -qr /storage/usbdisk1/CPFILE /storage/usbdisk1/CPTEMP) 2>> different_storage_copy-compare_test.log
if test $? -eq 0
then
	echo "pass:compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP"
	echo "pass:compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
else
	echo "fail:compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP"
	echo "fail:compare /storage/usbdisk1/CPFILE and /storage/usbdisk1/CPTEMP" >> different_storage_copy-compare_test.log
fi
date
date >> different_storage_copy-compare_test.log
#wait user to play video
date
date >> different_storage_copy-compare_test.log
echo "***Please make sure that video at /storage/usbdisk1/CPTEMP can play normally***"
echo "***Please make sure that video at /storage/usbdisk1/CPTEMP can play normally***" >> different_storage_copy-compare_test.log
echo "***wait for check video play at /storage/usbdisk1/CPTEMP ,press any key to continue***"
echo "***wait for check video play at /storage/usbdisk1/CPTEMP ,press any key to continue***" >> different_storage_copy-compare_test.log
read -n 1
echo "***continue test***"
echo "***continue test***" >> different_storage_copy-compare_test.log
date
date >> different_storage_copy-compare_test.log
echo "finish USB flash disk to USB flash disk test"
echo "finish USB flash disk to USB flash disk test" >> different_storage_copy-compare_test.log