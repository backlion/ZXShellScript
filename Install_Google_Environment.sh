#Author：Issac Lin
#Ext: 7536
#version:1.2
#Install_Google_Environment
#install Google play,Gmail,GoogleCalendarSync,busybox
#
echo "Install_Google_Environment version: 1.2"
mount -o remount,rw /system
cp busybox /system/xbin
chmod 777 /system/xbin/busybox
/system/xbin/busybox --install /system/xbin
cp -R system /
cat GooglePlay.apk > /system/priv-app/GooglePlay.apk
cat NetworkLocation.apk > /system/priv-app/NetworkLocation.apk
chmod 644 /system/priv-app/GoogleLoginService/GoogleLoginService.apk
chmod 755 /system/priv-app/GoogleLoginService/
chmod 644 /system/priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
chmod 755 /system/priv-app/GoogleServicesFramework
chmod 644 /system/priv-app/Phonesky/Phonesky.apk
chmod 755 /system/priv-app/Phonesky
chmod 644 /system/priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
chmod 755 /system/priv-app/PrebuiltGmsCore
chmod 644 /system/priv-app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
chmod 755 /system/priv-app/GoogleCalendarSyncAdapter
chmod 644 /system/priv-app/GooglePlay.apk
chmod 644 /system/priv-app/NetworkLocation.apk
chmod 644 /system/app/PrebuiltGmail/PrebuiltGmail.apk
chmod 755 /system/app/PrebuiltGmail
#cp com.google.android.maps.jar system/framework
cat com.google.android.maps.jar > /system/framework/com.google.android.maps.jar
cat android.hardware.location.xml > /etc/permissions/android.hardware.location.xml
cat com.android.location.provider.xml > /etc/permissions/com.android.location.provider.xml
cat com.google.android.location.provider.xml > /etc/permissions/com.google.android.location.provider.xml
cat location_service_conf.xml > /etc/permissions/location_service_conf.xml
cat tablet_core_hardware.xml > /etc/permissions/tablet_core_hardware.xml
cat com.google.android.maps.xml > /etc/permissions/com.google.android.maps.xml
chmod -R 755 /etc/permissions/
chmod 755 /system/framework/com.google.android.maps.jar
reboot