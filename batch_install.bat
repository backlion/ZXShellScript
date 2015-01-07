::Author：Issac Lin
::Ext: 7536
::version:1.1
::batch_install
::
@echo off
::setlocal enabledelayedexpansion
set total=0
set success=0
set already=0
set fail=0

if "%1"=="" goto :input

if exist %1\Android adb push %1\Android /sdcard/Android
::if exist %1\android adb push %1\Android /sdcard/Android
::set /a count+=1
if exist batch_install.log del /F /Q batch_install.log
for %%i in (%1\*.apk) do (
	adb install "%%i" >> batch_install.log
)
for /f %%t in ('findstr pkg batch_install.log') do (
	set /a total+=1
)
for /f %%t in ('findstr Success batch_install.log') do (
	set /a success+=1
)
for /f %%t in ('findstr INSTALL_FAILED_ALREADY_EXISTS batch_install.log') do (
	set /a already+=1
)
if exist batch_install.log del /F /Q batch_install.log
set /a fail=%total%-%success%-%already%
echo finish batch_install
echo total install %total% apk
echo success install %success% apk,already install %already% apk
echo fail install %fail% apk
goto :end

:input
echo you must input apk path
:end
pause