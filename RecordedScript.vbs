#$language = "VBScript"
#$interface = "1.0"

crt.Screen.Synchronous = True

' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
	crt.Screen.Send "dsfsd" & chr(13)
	crt.Screen.WaitForString "127" & chr(124) & "shell@elite2000:/ $ "
	crt.Screen.Send chr(13)
	crt.Screen.WaitForString "127" & chr(124) & "shell@elite2000:/ $ "
	crt.Screen.Send chr(13)
	crt.Screen.WaitForString "127" & chr(124) & "shell@elite2000:/ $ "
	crt.Screen.Send "fdsf" & chr(13)
End Sub
