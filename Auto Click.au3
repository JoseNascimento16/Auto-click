#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <Array.au3>
#include <Math.au3>

#AutoIt3Wrapper_icon=estrela.ico

HotKeySet("{PGUP}", "SAIR")
HotKeySet("{F4}", "botaoF4")
HotKeySet("{F3}", "botaoF3")

Local $ciclos=0, $milisegundos=0, $constante1=1, $lercheck1=4, $lercheck2=4, $lercheck3=4, $lercheck4=4
Local $x=0, $w=1, $Xclique[1], $Yclique[1], $Xmouse2, $Ymouse2, $botF4=4, $ativar=0, $varMOUSE=0
Local $counter=0, $entrouF3=0, $varRefinacao=0, $controle1=0, $controleF3=0

#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("Auto Click Fake By Zezin", 357, 224, 810, 375)
$Label1 = GUICtrlCreateLabel("Botão do mouse :", 16, 47, 87, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Esquerdo", 117, 45, 87, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Checkbox2 = GUICtrlCreateCheckbox("Direito", 210, 45, 55, 17)
$Checkbox6 = GUICtrlCreateCheckbox("Invisível", 280, 45, 69, 17)
$Label2 = GUICtrlCreateLabel("Ciclos :", 16, 82, 38, 17)
$Input3 = GUICtrlCreateInput("SD - Asgard", 61, 13, 80, 21)
$Input1 = GUICtrlCreateInput("3", 65, 79, 65, 21)
$Checkbox3 = GUICtrlCreateCheckbox("Infinito", 176, 80, 65, 17)
$Label3 = GUICtrlCreateLabel("Macro :", 16, 117, 40, 17)
$Button1 = GUICtrlCreateButton("Configurar", 65, 116, 75, 17)
$Button2 = GUICtrlCreateButton("esperando...", 65, 116, 75, 17)
GUICtrlSetBkColor(-1, 0xFFFF00)
GUICtrlSetState(-1, $GUI_HIDE)
$Button3 = GUICtrlCreateButton("Configurado", 65, 116, 75, 17)
GUICtrlSetBkColor(-1, 0x60F065)
GUICtrlSetState(-1, $GUI_HIDE)
$Label4 = GUICtrlCreateLabel("Milisegundos :", 184, 117, 71, 17)
$Input2 = GUICtrlCreateInput("100", 264, 115, 65, 21)
$Button4 = GUICtrlCreateButton("Ativar", 56, 184, 75, 25)
$Button5 = GUICtrlCreateButton("Stop", 56, 184, 75, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$Button6 = GUICtrlCreateButton("Reset", 200, 184, 75, 25)
$Label5 = GUICtrlCreateLabel("Aperte 'F4' para concluir", 56, 139, 118, 17)
GUICtrlSetColor(-1, 0x008000)
GUICtrlSetState(-1, $GUI_HIDE)
$Label6 = GUICtrlCreateLabel("Objetivo:", 16, 158, 46, 17)
$Checkbox4 = GUICtrlCreateCheckbox("Refinação", 69, 156, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Checkbox5 = GUICtrlCreateCheckbox("Macro", 178, 157, 57, 17)
$Label7 = GUICtrlCreateLabel("(F4)", 145, 117, 22, 17)
$Label8 = GUICtrlCreateLabel("(F3)", 137, 189, 22, 17)
$Label9 = GUICtrlCreateLabel("Janela:", 16, 16, 38, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
	  Case $Button1
		 botao1()
	  Case $Button2
		 botao2()
	  Case $Button3
		 botao3()
	  Case $Button4
		 botao4()
	  Case $Button5
		 botao5()
	  Case $Button6
		 botaoRESET()
	  Case $GUI_EVENT_CLOSE
	  Exit
	EndSwitch

	$nome=GUICtrlRead($Input3)
	$ciclos=GUICtrlRead($Input1)
	$milisegundos=GUICtrlRead($Input2)
	$lercheck1=GUICtrlRead($Checkbox1)
	$lercheck2=GUICtrlRead($Checkbox2)
	$lercheck3=GUICtrlRead($Checkbox3)
	$lercheck4=GUICtrlRead($Checkbox4)
	$lercheck5=GUICtrlRead($Checkbox5)
	$lercheck6=GUICtrlRead($Checkbox6)

   If $lercheck1 == 1 Then
	  GUICtrlSetState($Checkbox2, $GUI_UNCHECKED)
   EndIf
   If $lercheck2 == 1 Then
	  GUICtrlSetState($Checkbox1, $GUI_UNCHECKED)
   EndIf

   If $lercheck4 == 1 Then
	  GUICtrlSetState($Checkbox5, $GUI_UNCHECKED)
   EndIf
   If $lercheck5 == 1 Then
	  GUICtrlSetState($Checkbox4, $GUI_UNCHECKED)
   EndIf

   If $lercheck3 == 1 Then
	  $ciclos = 0
	  GUICtrlSetState($Input1, $GUI_DISABLE)
   Else
	  GUICtrlSetState($Input1, $GUI_ENABLE)
   EndIf

	If $lercheck6 == 1 Then
	  $varMOUSE = 1
	Else
	  $varMOUSE = 0
	EndIf

   If $lercheck3 == 1 Then
	  $ciclos = -1      ;Impõe uma condição para o ciclo ser infinito
   EndIf

   If $ativar == 1 Then
	  $counter = $counter + 1
	  Ciclo()
	  If $counter == $ciclos  Then  ; Compara quantos ciclos ja foram e desativa o ciclo quando coincidir com o numero na Input1
		 $ativar = 0
		 ConsoleWrite($counter)
		 botao5()
	  EndIf
   EndIf

   sleep(40)
WEnd

Func botao1()
   $botF4 = 1
   GUICtrlSetState($Button1, $GUI_HIDE)
   GUICtrlSetState($Button2, $GUI_SHOW)
   GUICtrlSetState($Button3, $GUI_HIDE)
   GUICtrlSetState($Label5, $GUI_SHOW)
   CapturaClique()
EndFunc

Func botao2()

EndFunc

Func botao3()

EndFunc

Func botao4()
   GUICtrlSetState($Button4, $GUI_HIDE)
   GUICtrlSetState($Button5, $GUI_SHOW)
   $ativar = 1
EndFunc

Func botao5()
   GUICtrlSetState($Button5, $GUI_HIDE)
   GUICtrlSetState($Button4, $GUI_SHOW)
   $ativar = 0
   $w = 1
   $counter = 0
   $entrouF3 = 0
   $varRefinacao = 0
EndFunc

Func botaoF4()
   If $botF4 == 4 Then
	  $botF4 = 1
	  GUICtrlSetState($Button1, $GUI_HIDE)
	  GUICtrlSetState($Button2, $GUI_SHOW)
	  GUICtrlSetState($Button3, $GUI_HIDE)
	  GUICtrlSetState($Label5, $GUI_SHOW)
	  CapturaClique()
   EndIf
EndFunc

Func botaoF3()
   GUICtrlSetState($Button4, $GUI_HIDE)
   GUICtrlSetState($Button5, $GUI_SHOW)
   ConsoleWrite($entrouF3)
   If $entrouF3 == 0 Or ($ciclos  ==  -1 And $entrouF3 == 0) Then
		$entrouF3 = 1
		$ativar = 1
		;$controleF3 = 0
	EndIf
   If $ciclos == -1  And $entrouF3 == 1 And $counter > 1 Then
		$ativar = 0
		$counter = 0
		$ciclos=GUICtrlRead($Input1)
		$entrouF3 = 0
		GUICtrlSetState($Button5, $GUI_HIDE)
		GUICtrlSetState($Button4, $GUI_SHOW)
	EndIf

EndFunc

Func botaoRESET()
	Dim $Xclique[1], $Yclique[1]    ; zera o array
   GUICtrlSetState($Button1, $GUI_SHOW)
   GUICtrlSetState($Button2, $GUI_HIDE)
   GUICtrlSetState($Button3, $GUI_HIDE)
   GUICtrlSetState($Button4, $GUI_SHOW)
   GUICtrlSetState($Button5, $GUI_HIDE)
   GUICtrlSetState($Checkbox1, $GUI_CHECKED)
   GUICtrlSetState($Checkbox2, $GUI_UNCHECKED)
   GUICtrlSetState($Checkbox3, $GUI_UNCHECKED)
   $entrouF3 = 0
   $botF4=4
   $x = 0
   $w = 1
   $varRefinacao = 0
   $controleF3 = 0
   ToolTip("")
EndFunc



Func CapturaClique()
   Local $hDLL = DllOpen("user32.dll")
   ;_ArrayDisplay($Xclique, "Array X antes")  ; mostra o array
   ;_ArrayDisplay($Yclique, "Array Y antes")  ; mostra o array
   ConsoleWrite("oi")
   ToolTip("Informe onde devem ser os CLIQUES", 833, 521)
   Sleep(500)
   while 1

	  If _IsPressed("01", $hDLL) Then
		 $mouse1=MouseGetPos()
		 $Xmouse2=$mouse1[0]
		 $Ymouse2=$mouse1[1]
		 _ArrayAdd($Xclique, $Xmouse2)
		 _ArrayAdd($Yclique, $Ymouse2)
		 $x = $x + 1                                                                       ;CAPTURA OS CLIQUES E COLOCA EM 2 ARRAYS DISTINTOS $Xclique e $Yclique
		 ToolTip("Salvos: " & $x, $Xmouse2, $Ymouse2)
		 sleep(500)
		 ToolTip("")
		 ConsoleWrite(" X1 = " & $Xmouse2 & " Y1 = " & $Ymouse2)
		 ;For $A = 0 To $iSize - 1
			;$aReturn[$A][0] = $aArray[$A]p
		 ;Next
	  EndIf
	  If _IsPressed("73", $hDLL) Then
		 ;_ArrayDisplay($Xclique, "Array X depois")
		 ;_ArrayDisplay($Yclique, "Array Y depois")											;Finaliza a captura dos cliques com F3 (codigo 73 linha 217)
		 GUICtrlSetState($Button1, $GUI_HIDE)
		 GUICtrlSetState($Button2, $GUI_HIDE)
		 GUICtrlSetState($Button3, $GUI_SHOW)
		 GUICtrlSetState($Label5, $GUI_HIDE)
		 ToolTip("Salvos: " & $x & " Cliques!", $Xmouse2, $Ymouse2)
		 sleep(1000)
		 ToolTip("")
		 ExitLoop
	  EndIf
   WEnd
   ;GUICtrlSetState($Button16, $GUI_HIDE)
   ;GUICtrlSetState($Button17, $GUI_SHOW)
   DllClose($hDLL)
EndFunc

Func Ciclo()						;Função que determina se será usado botão ESQUERDO ou DIREITO   e   executa o ciclo
	If $lercheck1 == 4 And $lercheck2 == 4 Then
		botao5()
		ToolTip("Escolha o botão do mouse!!", 529, 261)
		sleep(2000)
		ToolTip("")
	EndIf
	If $lercheck4 == 4 And $lercheck5 == 4 Then
		ToolTip("Marque: Refinação ou Macro!", 529, 261)
		sleep(2000)
		ToolTip("")
		botao5()
	EndIf
   If $lercheck1 == 1 Then
	  For $i=0 To $x-1 Step 1
		 Esquerdo()
		 $w = $w + 1
		 If $w == $x+1 Then
			$w = 1
		 EndIf
		 sleep($milisegundos)				; Determina o intervalo entre os cliques
	  Next
   EndIf
   If $lercheck2 == 1 Then
	  For $i=0 To $x-1 Step 1
		 Direito()
		 $w = $w + 1
		 If $w == $x+1 Then
			$w = 1
		 EndIf
		 sleep($milisegundos)				; Determina o intervalo entre os cliques
	  Next
   EndIf
EndFunc

Func Esquerdo()
	$hWnd = WinGetHandle($nome, "")
	If $varMOUSE = 1 Then
		ControlClick($hWnd, "", "", "left", 1, $Xclique[$w]-3, $Yclique[$w]-25)
	Else
		MouseClick("left",$Xclique[$w] , $Yclique[$w] ,1,0)										;Função de clique do botão ESQUERDO
	EndIf
   $varRefinacao = $varRefinacao + 1
   $controle1 = _MathCheckDiv($varRefinacao, 2)
   If $lercheck4 == 1 And $controle1 == 2 Then            ;Na segunda condicao, verifica se o valor em $controle1 é par
	   sleep(15)
		If $varMOUSE = 1 Then
			ControlClick($hWnd, "", "", "right", 1, 592-3, 247-25)
		Else
			MouseClick("right", 592, 247, 1, 0)										;Função de clique do botão ESQUERDO
		EndIf
   EndIf
EndFunc

Func Direito()
	$hWnd = WinGetHandle($nome, "")
	If $varMOUSE = 1 Then
		ControlClick($hWnd, "", "", "right", 1, $Xclique[$w]-3, $Yclique[$w]-25)
	Else
		MouseClick("right",$Xclique[$w] , $Yclique[$w] ,1,0)										;Função de clique do botão DIREITO
	EndIf
EndFunc


Func SAIR()
   Exit
EndFunc