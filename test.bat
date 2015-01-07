::Author：Issac Lin
::Ext: 7536
::version:1.0
::batch_install
::
@echo off
set a=10
set b=5
set /a c=%a%-%b%
::if "%1"=="" echo "%%i"

::for %%i in (%1\*.apk) do echo "%%i" & echo "%%i"
::for %%i in (%1\*.apk) do (
::adb install "%%i"
::adb install "%1" >> test.txt
::)
echo %c%
echo finish batch_install
goto :end

:input
	echo you must input apk path
:end
	pause