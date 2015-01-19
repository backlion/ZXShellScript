#Author：Issac Lin
#Ext: 7536
#version:1.0
#different_storage_copy-compare_test
#log_location:/data/ca7_PGandCG_stress.log
#
echo "different_storage_copy-compare_test version: 1.0"
echo please ensure that you plug TF card and USB disk
if test ! -e different_storage_copy-compare_test.log
then
	rm different_storage_copy-compare_test.log
fi
mount -o remount,rw /
mount -o remount,rw /system
cp busybox /system/xbin
chmod 777 /system/xbin/busybox
/system/xbin/busybox --install /system/xbin
echo finish install busybox
echo finish install busybox >> different_storage_copy-compare_test.log

echo start copy CPFILE folder to /data
echo start copy CPFILE folder to /data >> different_storage_copy-compare_test.log
(time cp -rf CPFILE /data) 2>> different_storage_copy-compare_test.log

if test $? -eq 0
then
	echo finish CPFILE folder to /data
	echo finish CPFILE folder to /data >> different_storage_copy-compare_test.log
else
	echo error when copy CPFILE folder to /data
	echo error when copy CPFILE folder to /data >> different_storage_copy-compare_test.log
fi
echo start compare /data/CPFILE folder
echo start compare /data/CPFILE folder >> different_storage_copy-compare_test.log
(time diff -qr CPFILE /data/CPFILE) 2>> different_storage_copy-compare_test.log
if test $? -eq 0
then
	echo pass:compare /data/CPFILE folder
	echo pass:compare /data/CPFILE folder>> different_storage_copy-compare_test.log
else
	echo fail:compare /data/CPFILE folder
	echo fail:compare /data/CPFILE folder >> different_storage_copy-compare_test.log
fi

echo start copy CPFILE folder to /mnt/media_rw/extsdcard
echo start copy CPFILE folder to /mnt/media_rw/extsdcard >> different_storage_copy-compare_test.log
(time cp -rf CPFILE /mnt/media_rw/extsdcard) 2>> different_storage_copy-compare_test.log

if test $? -eq 0
then
	echo finish CPFILE folder to /mnt/media_rw/extsdcard
	echo finish CPFILE folder to /mnt/media_rw/extsdcard >> different_storage_copy-compare_test.log
else
	echo error when copy CPFILE folder to /mnt/media_rw/extsdcard
	echo error when copy CPFILE folder to /mnt/media_rw/extsdcard >> different_storage_copy-compare_test.log
fi
echo start compare /mnt/media_rw/extsdcard/CPFILE folder
echo start compare /mnt/media_rw/extsdcard/CPFILE folder >> different_storage_copy-compare_test.log
(time diff -qr CPFILE /mnt/media_rw/extsdcard/CPFILE) 2>> different_storage_copy-compare_test.log
if test $? -eq 0
then
	echo pass:compare /mnt/media_rw/extsdcard/CPFILE folder
	echo pass:compare /mnt/media_rw/extsdcard/CPFILE folder>> different_storage_copy-compare_test.log
else
	echo fail:compare /mnt/media_rw/extsdcard/CPFILE folder
	echo fail:compare /mnt/media_rw/extsdcard/CPFILE folder >> different_storage_copy-compare_test.log
fi

echo start copy CPFILE folder to /mnt/usbdisk/usbdisk1
echo start copy CPFILE folder to /mnt/usbdisk/usbdisk1 >> different_storage_copy-compare_test.log
(time cp -rf CPFILE /mnt/usbdisk/usbdisk1) 2>> different_storage_copy-compare_test.log

if test $? -eq 0
then
	echo finish CPFILE folder to /mnt/usbdisk/usbdisk1
	echo finish CPFILE folder to /mnt/usbdisk/usbdisk1 >> different_storage_copy-compare_test.log
else
	echo error when copy CPFILE folder to /mnt/usbdisk/usbdisk1
	echo error when copy CPFILE folder to /mnt/usbdisk/usbdisk1 >> different_storage_copy-compare_test.log
fi
echo start compare /mnt/usbdisk/usbdisk1/CPFILE folder
echo start compare /mnt/usbdisk/usbdisk1/CPFILE folder >> different_storage_copy-compare_test.log
(time diff -qr CPFILE /mnt/usbdisk/usbdisk1/CPFILE) 2>> different_storage_copy-compare_test.log
if test $? -eq 0
then
	echo pass:compare /mnt/usbdisk/usbdisk1/CPFILE folder
	echo pass:compare /mnt/usbdisk/usbdisk1/CPFILE folder>> different_storage_copy-compare_test.log
else
	echo fail:compare /mnt/usbdisk/usbdisk1/CPFILE folder
	echo fail:compare /mnt/usbdisk/usbdisk1/CPFILE folder >> different_storage_copy-compare_test.log
fi

echo finish different_storage_copy-compare_test
echo finish different_storage_copy-compare_test >> different_storage_copy-compare_test.log
echo ////////////////////////////////////////////////////////////////////////
echo result:
cat different_storage_copy-compare_test.log
echo you can open different_storage_copy-compare_test.log to check test result