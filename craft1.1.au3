;;;;; Includes
;~ #include <WinAPIFiles.au3>
; ---- opts
Opt("MouseClickDelay",10)
Opt("MouseClickDownDelay",10)
Opt("MouseClickDragDelay",10)
Opt("MouseCoordMode",0)
Opt("SendKeyDelay",25)
Opt("SendKeyDownDelay",0)
Opt("PixelCoordMode",0)

;;;;var
Local Const $sFilePath = (@ScriptDir & "\autoJoin.ini")
Local $game = IniRead($sFilePath, "game", "name", "Default Value")
Local $count = IniRead($sFilePath, "game", "count", "Default Value")
Local $hWnd = WinGetHandle("Shop Titans")
;;wm
Local $WM_MOUSEMOVE     =  0x0200
Local $MK_LBUTTON       =  0x0001
Local $WM_LBUTTONDOWN   =  0x0201
Local $WM_LBUTTONUP     =  0x0202
;;;;ini
HotKeySet("{F1}","join")
HotKeySet("{END}","quit")

WinMove($hWnd,"",-8,0,1200, 1000)
WinActivate($hWnd)
$msg =""

;;quit
Func quit()
	Exit
EndFunc

;;go
Func join()
;~ ControlFocus ( $hWnd, "", "" )
;~ ControlClick ( $hWnd, "", "" , "Primary", 1 ,707, 460 )
;~ ControlSend ( $hWnd, "", "", $game&$count )
;~ ControlSend ( $hWnd, "", "", "{ENTER}" )
;~ $count= $count +1
;~ IniWrite($sFilePath, "game", "count", $count)
EndFunc

Func location()
	if(PixelGetColor(1150, 848) == 0xFFFFFF) Then
		$msg="wait"
		Return('wait')
;~ 	ElseIf(PixelGetColor(1017, 887) == 0xffffff  Or PixelGetColor(1017, 887) == 0x3EEA8C Or PixelGetColor(1017, 887) == 0x28EA7F _
;~ 		Or PixelGetColor(1017, 887) == 0xBFF4D7 Or PixelGetColor(1017, 887) == 0x89EBB5 Or PixelGetColor(1017, 887) == 0x39EA89 ) Then
;~ 		$msg="ready"
;~ 		Return('ready')
	ElseIf(PixelGetColor(1185, 930) == 0x37202C) Then
		$msg="crafting"
		Return('crafting')
	ElseIf(PixelGetColor(485, 771) == 0xF9ECDA) Then
		$msg="masterpiece"
		Return('masterpiece')
;~ 	ElseIf(PixelGetColor(786, 365) == 0xFFFFFF) Then
;~ 		$msg="craftingdetails"
;~ 		Return('craftingdetails')
	ElseIf(PixelGetColor(1157, 848) == 0xFFFFFF) Then
		$msg="wait"
		Return('wait')
	ElseIf(PixelGetColor(1157, 848) == 0x7B6B64) Then
		$msg="craft"
		Return('craft')
	Else
	$msg= "Else#0x" & Hex(PixelGetColor(1017, 887),6)
	EndIf
EndFunc

Func craft($item = 0)
	ConsoleWrite("craft-" & @CRLF)
;~ 	ControlClick ( $hWnd, "", "" , "Primary", 1 ,730, 500 )
	Switch $item
		Case 0
		MouseClick("primary",131, 850,1)
		Sleep(50)
		MouseClick("primary",131, 850,1)
		Sleep(50)
		MouseClick("primary",131, 850,1)

		Case 1
		MouseClick("primary",219, 850,1)
		Sleep(50)
		MouseClick("primary",219, 850,1)
		Sleep(50)
		MouseClick("primary",219, 850,1)

		Case 2
		MouseClick("primary",321, 850,1)
		Sleep(50)
		MouseClick("primary",321, 850,1)
		Sleep(50)
		MouseClick("primary",321, 850,1)

		Case 3
		MouseClick("primary",391, 850,1)
		Sleep(50)
		MouseClick("primary",391, 850,1)
		Sleep(50)
		MouseClick("primary",391, 850,1)

		Case 4
		MouseClick("primary",466, 850,1)
		Sleep(50)
		MouseClick("primary",466, 850,1)
		Sleep(50)
		MouseClick("primary",466, 850,1)

		Case Else
		MouseClick("primary",50, 850,1)
		Sleep(50)
		MouseClick("primary",50, 850,1)
		Sleep(50)
		MouseClick("primary",50, 850,1)
	EndSwitch
		Sleep(25)
EndFunc

While 1
	ConsoleWrite("LOG#0x" & Hex(PixelGetColor(1017, 887),6) & @CRLF)
Switch location()
	Case "wait"
		; Find a pure red pixel or a red pixel within 10 shades variations of pure red
		$aCoord = PixelSearch(1024, 911, 1062, 920, 0xFFC817, 10)
		If Not @error Then
			ConsoleWrite("LOG#X and Y are: " & $aCoord[0] & "," & $aCoord[1])
			MouseClick("primary",1040, 889,2)
		EndIf
	Case "crafting"
		craft(5)
	Case "masterpiece"
		MouseClick("primary",485, 771,1)
	Case "craftingdetails"
		MouseClick("primary",786, 365,1)
	Case "craft"
		$msg = "startcraft"
		MouseClick("primary",1107, 901)
		Sleep(250)
;~ 		craft(Random(0,3,1))
	Case Else
	ConsoleWrite("LOG#0x" & Hex(PixelGetColor(1017, 887),6) & @CRLF)
	EndSwitch
	ConsoleWrite($msg & @CRLF)
WEnd



