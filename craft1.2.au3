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
$click = 0

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
;~ 	If(PixelGetColor(692, 148) == 0xFFEB04) Then
;~ 		$msg="fullinv"
;~ 		Return('fullinv')
	If(PixelGetColor(1150, 848) == 0xFFFFFF) Then
		$msg="wait"
		Return('wait')
;~ 	ElseIf(PixelGetColor(1017, 887) == 0xffffff  Or PixelGetColor(1017, 887) == 0x3EEA8C Or PixelGetColor(1017, 887) == 0x28EA7F _
;~ 		Or PixelGetColor(1017, 887) == 0xBFF4D7 Or PixelGetColor(1017, 887) == 0x89EBB5 Or PixelGetColor(1017, 887) == 0x39EA89 ) Then
;~ 		$msg="ready"
;~ 		Return('ready')
	ElseIf(PixelGetColor(718, 670) == 0xFFFFFF) Then
		$msg="level"
		Return('level')
	ElseIf(PixelGetColor(782, 412) == 0xFFFFFF) Then
		$msg="resources"
		Return('resources')
	ElseIf(PixelGetColor(1185, 930) == 0x37202C) Then
		$msg="crafting"
		Return('crafting')
	ElseIf(PixelGetColor(485, 771) == 0xF9ECDA) Then
		$msg="masterpiece"
		Return('masterpiece')
	ElseIf(PixelGetColor(786, 365) == 0xFFFFFF) Then
		$msg="craftingdetails"
		Return('craftingdetails')
	ElseIf(PixelGetColor(1157, 848) == 0xFFFFFF) Then
		$msg="wait"
		Return('wait')
	ElseIf(PixelGetColor(1157, 848) == 0x7B6B64) Then
		$msg="craft"
		Return('craft')
	ElseIf(PixelGetColor(598, 943) == 0xCBD2CF) Then
		$msg="blueprint"
		Return('blueprint')
	Else
	$msg= "Else#0x" & Hex(PixelGetColor(1017, 887),6)
	EndIf
EndFunc

Func craft($item = 0)
	$click = 0
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

		Case 5
		MouseClick("primary",580, 850,1)
		Sleep(50)
		MouseClick("primary",580, 850,1)
		Sleep(50)
		MouseClick("primary",580, 850,1)

		Case 6
		MouseClick("primary",707, 850,1)
		Sleep(50)
		MouseClick("primary",707, 850,1)
		Sleep(50)
		MouseClick("primary",707, 850,1)

		Case 7
		MouseClick("primary",830, 850,1)
		Sleep(50)
		MouseClick("primary",830, 850,1)
		Sleep(50)
		MouseClick("primary",830, 850,1)

		Case Else
		MouseClick("primary",50, 850,1)
		Sleep(50)
		MouseClick("primary",50, 850,1)
		Sleep(50)
		MouseClick("primary",50, 850,1)
	EndSwitch
		Sleep(25)
EndFunc

Func sales()
				ConsoleWrite("sales"  & @CRLF)
	$aCoord = PixelSearch(383, 191, 611, 399, 0xEFE8D3)
		If Not @error Then
			ConsoleWrite("Sales#X and Y are: " & $aCoord[0] & "," & $aCoord[1] & @CRLF)
			Local $iCheckSum = PixelChecksum($aCoord[0], $aCoord[1], $aCoord[0]+2, $aCoord[1]+4)
				ConsoleWrite("iCheckSum#" & $iCheckSum & @CRLF)
			if($iCheckSum == 2551588843 or $iCheckSum == 2556700654 or $iCheckSum == 3701353716 or $iCheckSum == 2817601353) Then
				MouseClick("Primary",$aCoord[0], $aCoord[1])
				Sleep(50)
				MouseClick("primary",417, 630)

		If(PixelGetColor(746, 695) == 0xFFFFFF) Then
				MouseClick("primary",457, 694)
		ElseIf(PixelGetColor(749, 707) == 0x6EFF2E) Then
				MouseClick("primary",829, 691)
		ElseIf(PixelGetColor(739, 695) == 0xFFD300) Then
				MouseClick("primary",457, 694)
		Else
				MouseClick("primary",766, 700)
		EndIf
		EndIf
		MouseClick("primary",614, 780)
		Else

		EndIf
EndFunc

Func buy()
	$aCoord = PixelSearch(383, 191, 611, 399, 0xF2E76C)
		If Not @error Then
			ConsoleWrite("buy x and Y are: " & $aCoord[0] & "," & $aCoord[1] & @CRLF)
			Local $iCheckSum = PixelChecksum($aCoord[0], $aCoord[1], $aCoord[0], $aCoord[1]+40)
			ConsoleWrite("iCheckSum#" & $iCheckSum & @CRLF)
			if($iCheckSum == 1567440210 or $iCheckSum == 1281236976) Then
				MouseClick("Primary",$aCoord[0], $aCoord[1])
				Sleep(50)
				MouseClick("primary",407, 696)
			EndIf
		EndIf

EndFunc

Func fullinv()
	If(PixelGetColor(692, 148) == 0xFFEB04) Then
		MouseClick("primary",243, 955)
		Sleep(50)
		MouseClick("primary",69, 835)
		Sleep(50)
		MouseClick("primary",596, 678)
		Sleep(50)
		MouseClick("primary",506, 553)
		Sleep(50)
		MouseClick("primary",667, 628);yes?
		Sleep(50)
		MouseClick("primary",714, 466)
	EndIf
EndFunc

While 1
;~ 	ConsoleWrite("LOG#0x" & Hex(PixelGetColor(1017, 887),6) & @CRLF)
Switch location()
	Case "wait"
		$aCoord = PixelSearch(1024, 911, 1062, 920, 0xFFC817, 10)
		If Not @error Then
			ConsoleWrite("ready# x and Y are: " & $aCoord[0] & "," & $aCoord[1] & @CRLF)
			MouseClick("primary",1040, 889,2)
			$click = $click+1
			If($click>6)  Then
				$click = 0
				Sleep(1500)
				fullinv()
			EndIf
		Else
		sales()
		EndIf

	Case "crafting"
;~ 		craft(5); else
		craft(Random(0,8,1))
		Sleep(2500)
	Case "masterpiece"
		MouseClick("primary",485, 771)
	Case "level"
		MouseClick("primary",718, 670)
	Case "craftingdetails"
		MouseClick("primary",786, 365)
	Case "blueprint"
		MouseClick("primary",598, 943)
	Case "resources"
		MouseClick("primary",784, 410)
;~ 	Case "fullinv"
;~ 		Sleep(1000)
;~ 		fullinv()
	Case "craft"
		$msg = "startcraft"
		MouseClick("primary",1107, 901)
		Sleep(250)
	Case Else

	ConsoleWrite("LOG#0x" & Hex(PixelGetColor(1017, 887),6) & @CRLF)
	EndSwitch
	ConsoleWrite($msg & @CRLF)
WEnd



