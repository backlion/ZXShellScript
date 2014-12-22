path=$(pwd)
echo $path
cp -f boot.img ../bootimage/boot.img
cd ../bootimage
./split_bootimg.pl boot.img
./unramdisk.sh
echo "split bootimage success"
cd ramdisk
echo "service ifconfig_cts /system/bin/sh /data/ifconfig_cts.sh" >> init.rc
echo "	class main" >> init.rc
echo "	user root" >> init.rc
echo "	group root" >> init.rc
echo "	oneshot" >> init.rc
#echo "" >> ../bootimage/ramdisk/init.rc
echo "on property:ro.debuggable=1" >> init.rc
echo "start ifconfig_cts" >> init.rc
echo "update init.rc success"
cd ..
#echo $(pwd)
mv -f boot.img-kernel kernel
./update.sh
mv newboot.img "$path/boot.img"
