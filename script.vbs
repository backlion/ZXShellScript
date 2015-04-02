#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	crt.Screen.Send chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "su" & chr(13)
	crt.Screen.Send chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input swipe 500 1000 500 500" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 1300 720" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 1800 1000" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 1750 567" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 1800 1000" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "am start -n com.android.settings/.DisplaySettings" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 500 600" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 600 835" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "am start -n com.android.settings/.SecuritySettings" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 500 300" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input tap 500 200" & chr(13)
	crt.Screen.Send "sleep 1" & chr(13)
	crt.Screen.WaitForString "shell@elite2000:/"
	crt.Screen.Send "input keyevent 3" & chr(13)
End Sub