@echo off
cd %~dp0
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
	if "%1"=="" goto dsi
	if "%1"=="dsi" goto dsi
	if "%1"=="hdmi" goto hdmi
	:dsi
	echo flash DSI devicetree
	fastboot.exe flash devicetree %~dp0/image/elite2000-fpga.dtb
	goto continue
	:hdmi
	echo flash HDMI devicetree
	fastboot.exe flash devicetree %~dp0/image/elite2000-fpga-mhl.dtb
	goto continue
	:continue
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
echo Flash all Succeed! Now booting...!
fastboot.exe oem ucmd boot
goto 2

:1
echo Error! Flash image Failed!!!
pause

:2
pause