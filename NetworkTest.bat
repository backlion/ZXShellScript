REM Author:Issac Lin
REM Ext: 7536
REM version:1.0
REM NetworkTest
REM LogPath: ./NetworkTestLog.txt
@ECHO OFF

if "%1"=="" goto :input

	echo Please backup %~dp0NetworkTestLog.txt
	echo Copy 6 files with different size, bigger than: 1GB, 500MB, 100MB, 10MB, 1MB, 1KB
	echo into folder %~dp0PUSH\
	echo Press any key to start LanTest if files are ready
pause

	if exist %~dp0NetworkTestLog.txt del /F /Q %~dp0NetworkTestLog.txt
	echo delete %~dp0NetworkTestLog.txt
	
	adb connect %1
	IF %ERRORLEVEL% == 0 echo adb connect Success
	IF %ERRORLEVEL% == 0 echo adb connect Success >>%~dp0NetworkTestLog.txt
	IF NOT %ERRORLEVEL% == 0 echo adb connect Fail
	IF NOT %ERRORLEVEL% == 0 echo adb connect Fail >>%~dp0NetworkTestLog.txt
	adb push %~dp0PUSH /sdcard/temp/pull/ >>%~dp0NetworkTestLog.txt

:LOOP
	echo %date% %time%
	echo Push-Pull-FC started
	echo delete %~dp0pull\*
	echo %date% %time% >>%~dp0NetworkTestLog.txt
	echo Push-Pull-FC started >>%~dp0NetworkTestLog.txt
	del /F /S /Q %~dp0pull >>%~dp0NetworkTestLog.txt
	adb push %~dp0PUSH /sdcard/temp/push/ >>%~dp0NetworkTestLog.txt
	adb pull /sdcard/temp/push/ %~dp0pull >>%~dp0NetworkTestLog.txt
	FC /B %~dp0PUSH\* %~dp0pull\* >>%~dp0NetworkTestLog.txt
	IF %ERRORLEVEL% == 0 echo Push-Pull-FC Pass
	IF %ERRORLEVEL% == 0 echo Push-Pull-FC Pass >>%~dp0NetworkTestLog.txt
	IF NOT %ERRORLEVEL% == 0 echo Push-Pull-FC Fail
	IF NOT %ERRORLEVEL% == 0 echo Push-Pull-FC Fail >>%~dp0NetworkTestLog.txt
	echo %date% %time%
	echo Push-Pull-FC done
	echo %date% %time% >>%~dp0NetworkTestLog.txt
	echo Push-Pull-FC done >>%~dp0NetworkTestLog.txt

	ping -n 100 %1 >>%~dp0NetworkTestLog.txt
	IF %ERRORLEVEL% == 0 echo Network connect Pass
	IF %ERRORLEVEL% == 0 echo Network connect Pass >>%~dp0NetworkTestLog.txt
	IF NOT %ERRORLEVEL% == 0 echo Network connect Fail
	IF NOT %ERRORLEVEL% == 0 echo Network connect Fail >>%~dp0NetworkTestLog.txt
	
	echo %date% %time%
	echo Push-Pull-FC started
	echo delete %~dp0pull\*
	echo %date% %time% >>%~dp0NetworkTestLog.txt
	echo PullDirectly-FC started >>%~dp0NetworkTestLog.txt
	del /F /S /Q %~dp0pull >>%~dp0NetworkTestLog.txt
	adb pull /sdcard/temp/pull/ %~dp0pull >>%~dp0NetworkTestLog.txt
	FC /B %~dp0PUSH\* %~dp0pull\* >>%~dp0NetworkTestLog.txt
	IF %ERRORLEVEL% == 0 echo PullDirectly-FC Pass
	IF %ERRORLEVEL% == 0 echo PullDirectly-FC Pass >>%~dp0NetworkTestLog.txt
	IF NOT %ERRORLEVEL% == 0 echo PullDirectly-FC Fail
	IF NOT %ERRORLEVEL% == 0 echo PullDirectly-FC Fail >>%~dp0NetworkTestLog.txt
	echo %date% %time% >>%~dp0NetworkTestLog.txt
	echo PullDirectly-FC done >>%~dp0NetworkTestLog.txt
	echo %date% %time%
	echo PullDirectly-FC done

	ping -n 100 %1 >>%~dp0NetworkTestLog.txt
	IF %ERRORLEVEL% == 0 echo Network connect Pass
	IF %ERRORLEVEL% == 0 echo Network connect Pass >>%~dp0NetworkTestLog.txt
	IF NOT %ERRORLEVEL% == 0 echo Network connect Fail
	IF NOT %ERRORLEVEL% == 0 echo Network connect Fail >>%~dp0NetworkTestLog.txt
	
GOTO LOOP

:input
echo you must input address