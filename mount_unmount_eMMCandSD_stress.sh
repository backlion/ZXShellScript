#Author：Issac Lin
#Ext: 756706
#version:1.2
#mount_unmount_eMMCandSD_stress
#log_location:./mount_unmount_eMMCandSD_stress.log
#
echo "mount_unmount_eMMCandSD_stress version: 1.2"
if test -z $(ls /mnt/media_rw/extsdcard)
then
	echo "undetected SD card"
	echo "make sure that you have plug the SD card"
else
	if test -e mount_unmount_eMMCandSD_stress.log
	then
		rm mount_unmount_eMMCandSD_stress.log
	fi
	LOOP=1
	#mkdir /data/fat
	mount -o remount,rw /
	#mkdir /temp
	#install busybox
		mount -o remount,rw /system
		cp busybox /system/xbin
		chmod 777 /system/xbin/busybox
		/system/xbin/busybox --install /system/xbin
		echo "finish install busybox"
		echo "finish install busybox" >> different_storage_copy-compare_test.log
	mkdir /mnt/media_rw/extsdcard/temp
	date >> mount_unmount_eMMCandSD_stress.log
	while true
	do
		umount /mnt/media_rw/extsdcard
		echo "unmount $LOOP times"
		echo "unmount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		if test -z $(ls /mnt/media_rw/extsdcard)
		then
			echo "success to unmount SD card"
			echo "success to unmount SD card" >> mount_unmount_eMMCandSD_stress.log
		fi
		mount -t vfat /dev/block/mmcblk0p1  /mnt/media_rw/extsdcard
		echo "mount $LOOP times"
		echo "mount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		if test ! -z $(ls /mnt/media_rw/extsdcard)
		then
			echo "success to mount SD card"
			echo "success to mount SD card" >> mount_unmount_eMMCandSD_stress.log
		fi
		sh via_cpcmp test /mnt/media_rw/extsdcard/temp
		echo "copy&compare $LOOP times"
		echo "copy&compare $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		cat CPLOG
		cat CPLOG >> mount_unmount_eMMCandSD_stress.log
		let LOOP++
	done
fi
