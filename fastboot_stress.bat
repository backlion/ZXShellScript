@echo off
set count=0
cd %~dp0
:start
set /a count+=1
echo %date% %time%,run %count% times
echo Start flash boot.img to emmc
fastboot.exe flash boot %~dp0/image/boot.img
IF %ERRORLEVEL% == 0 echo Flash boot image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash system.img to emmc
fastboot.exe flash system %~dp0/image/system.img
IF %ERRORLEVEL% == 0 echo Flash system image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash userdata.img to emmc
fastboot.exe flash userdata %~dp0/image/userdata.img
IF %ERRORLEVEL% == 0 echo Flash userdata image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash devicetree to emmc
fastboot.exe flash devicetree %~dp0/image/elite2000-fpga.dtb
IF %ERRORLEVEL% == 0 echo Flash devicetree image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash cache.img to emmc
fastboot.exe flash cache %~dp0/image/cache.img
IF %ERRORLEVEL% == 0 echo Flash cache image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash recovery.img to emmc
fastboot.exe flash recovery %~dp0/image/recovery.img
IF %ERRORLEVEL% == 0 echo Flash recovery image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

echo Start flash splash.dat to emmc
fastboot.exe flash bootlogo %~dp0/image/splash.dat
IF %ERRORLEVEL% == 0 echo Flash bootlogo image succeed
IF NOT %ERRORLEVEL% == 0 goto 1

:0
echo Flash all Succeed! run again!
goto start

:1
echo Error! Flash image Failed:%date% %time% !!!
pause

:2
pause