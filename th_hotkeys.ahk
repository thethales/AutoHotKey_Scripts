#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;TO DO
; - Python Script para Gerar o ReadMe file

;#Inicialização
;Cria diretórios necessários para operação do script

IfNotExist,%A_WorkingDir%\neoclipboard\
  FileCreateDir, %A_WorkingDir%\neoclipboard\




;--------------------------------------------------------------------------------------
;ShortCuts
;--------------------------------------------------------------------------------------


^!1::
 Run, C:\Program Files (x86)\VideoLAN\VLC\vlc.exe
Return


;--------------------------------------------------------------------------------------
;Common Commands
;--------------------------------------------------------------------------------------

;#TAREFA# - Copia para a area de transferência e realiza uma pesquisa google
^+c::
	{
 		Send, ^c
 		Sleep 50
 		Run, http://www.google.com/search?q=%clipboard%
 		Return
	}

;#TAREFA# - Salvar no Archive.org
^!F2::
	{
 		Send, ^c
 		Sleep 50
 		Run, https://web.archive.org/save/%clipboard%
 		Return
	}

;#TAREFA# - Abrir o diretório do Script
::t_source::
{ 
 Run, %A_WorkingDir%
Return
}
;#TAREFA# - Imprimir Data e Hora Atual
::t_date::
{
  Send, %A_DD%-%A_MM%-%A_YYYY% %A_Hour%:%A_Min%
Return
}


;::TAREFA:: - Multiplas Areas de Transferência
;====================================================================


^F1::
{
  c=ctrl1
  neoClipCopy(c)
  Return
}

!F1::
{
   c=ctrl1
   neoClipPaste(c)
   Return
}

+F1::
{
 c=ctrl1
 neoClipView(c)
 Return
}



;--------------------------------------------------------------------------------------
;#FUNÇÕES
;--------------------------------------------------------------------------------------

;#TAREFA# - Copia a seleção atual para um arquivo de nome especificado no parâmetro
neoClipCopy(alocator)
{
  Send, ^c
  Sleep 50
  FileDelete, %A_WorkingDir%\%alocator%.txt
  FileAppend, %clipboard%, %A_WorkingDir%\neoclipboard\%alocator%.txt
}

;#TAREFA# - Cola o conteudo do arquivo de texto de nome definido pelo parâmetro em tela
neoClipPaste(alocator)
{
   FileRead, var1, %A_WorkingDir%\neoclipboard\%alocator%.txt
   Sleep 50
   Send, %var1%
}

;#TAREFA# - Mostra o conteudo do arquivo de texto de nome definido pelo parâmetro em tela
neoClipView(alocator)
{
   FileRead, varread1, %A_WorkingDir%\neoclipboard\%alocator%.txt
   Sleep 50
   ExibeToolTip(varread1)
}

;#TAREFA# - Exibe um ToolTipo na tela
ExibeToolTip(var_text)
{

	ToolTip, %var_text%, 100, 150

	; To have a ToolTip disappear after a certain amount of time
	; without having to use Sleep (which stops the current thread):
	#Persistent
	ToolTip, %var_text%
	SetTimer, RemoveToolTip, 3000
	return

	RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
	return

}