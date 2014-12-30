::Author：Issac Lin
::Ext: 7536
::version:1.0
::batch_install
::
@echo off
if "%1"=="" goto :input

for %%i in (%1\*.apk) do adb install "%%i"

echo finish batch_install
goto :end

:input
echo you must input apk path
:end
pause