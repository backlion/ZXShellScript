#Author：Issac Lin
#Ext: 7536
#version:1.1
#mount_unmount_eMMCandSD_stress
#log_location:./mount_unmount_eMMCandSD_stress.log
#
echo "mount_unmount_eMMCandSD_stress version: 1.1"
if test -z $1
then
	echo "You must input the mount and unmount times"
else
	rm mount_unmount_eMMCandSD_stress.log
	LOOP=1
#	mkdir /data/fat
	mount -o remount,rw /
	mkdir /temp
	umount /mnt/media_rw/extsdcard
	date >> mount_unmount_eMMCandSD_stress.log
	while test LOOP -le $1
	do
		mount -t vfat /dev/block/mmcblk0p1  /mnt/media_rw/extsdcard
		echo "mount $LOOP times"
		echo "mount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		umount /mnt/media_rw/extsdcard
		echo "unmount $LOOP times"
		echo "unmount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		let LOOP++
	done
	mount -t vfat /dev/block/mmcblk0p1  /mnt/media_rw/extsdcard
	mkdir /mnt/media_rw/extsdcard/temp
	sh via_cpcmp test /mnt/media_rw/extsdcard/temp
	cat CPLOG
	cat CPLOG >> mount_unmount_eMMCandSD_stress.log
fi
