#Author：Issac Lin
#Ext: 7536
#version:1.0
#mount_unmount_eMMCandSD_stress
#log_location:./mount_unmount_eMMCandSD_stress.log
#
echo "mount_unmount_eMMCandSD_stress version: 1.0"
if test -z $1
then
	echo "You must input the mount and unmount times"
else
	LOOP=1
#	mkdir /data/fat
	mount -o remount,rw /
	mkdir /temp
	umount /data/fat
	date >> mount_unmount_eMMCandSD_stress.log
	while test LOOP -le $1
	do
		mount -t vfat /dev/block/mmcblk0p1  /data/fat/
		echo "mount $LOOP times"
		echo "mount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		umount /data/fat
		echo "unmount $LOOP times"
		echo "unmount $LOOP times" >> mount_unmount_eMMCandSD_stress.log
		let LOOP++
	done
	sh via_cpcmp test /temp
fi
