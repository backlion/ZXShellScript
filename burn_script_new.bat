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
	if "%2"=="" goto orginal
	if "%2"=="A1" goto A1
	if "%2"=="A2" goto A2
	:orginal
		if "%1"=="" goto dsi
		if "%1"=="dsi" goto dsi
		if "%1"=="hdmi" goto hdmi
		:dsi
		echo flash orginal DSI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-fpga.dtb
		goto continue
		:hdmi
		echo flash orginal HDMI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-fpga-mhl.dtb
		goto continue
	:A1
		if "%1"=="" goto A1_dsi
		if "%1"=="dsi" goto A1_dsi
		if "%1"=="hdmi" goto A1_hdmi
		:A1_dsi
		echo flash A1 DSI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-EVM-A1-dsi.dtb
		goto continue
		:A1_hdmi
		echo flash A1 HDMI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-EVM-A1-hdmi.dtb
		goto continue
	:A2
		if "%1"=="" goto A2_dsi
		if "%1"=="dsi" goto A2_dsi
		if "%1"=="hdmi" goto A2_hdmi
		:A2_dsi
		echo flash A2 DSI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-EVM-A2-dsi.dtb
		goto continue
		:A2_hdmi
		echo flash A2 HDMI devicetree
		fastboot.exe flash devicetree %~dp0/image/elite2000-EVM-A2-hdmi.dtb
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