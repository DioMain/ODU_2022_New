.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib "..\Debug\ODU_lib.lib"
ExitProcess PROTO:DWORD 
.stack 4096

 outnum PROTO : DWORD

 outstr PROTO : DWORD

 outstrline PROTO : DWORD

 outnumline PROTO : DWORD

 inttostr PROTO : DWORD

 concat PROTO : DWORD, : DWORD

 copy PROTO : DWORD

 system_pause PROTO 

 random PROTO  : DWORD

 strLen PROTO  : DWORD

 inputInt PROTO 

 inputString PROTO 

 inputChar PROTO 

 power PROTO : DWORD, : DWORD
.const
 null_division BYTE 'ERROR: DIVISION BY ZERO', 0
 overflow BYTE 'ERROR: VARIABLE OVERFLOW', 0 
	L1 SDWORD 15
	L2 SDWORD 12
.data
	_GetNumresult SDWORD 0
	_GetNumOffsetresult SDWORD 0
	maina SDWORD 0
	mainText DWORD ?

.code

_GetNum PROC 
	push inputInt
	pop edx
		call inputInt
	push eax
	pop _GetNumresult

	mov eax, _GetNumresult
	ret

SOMETHINGWRONG:
push offset null_division
call outstrline
call system_pause
push -1
call ExitProcess

EXIT_OVERFLOW:
push offset overflow
call outstrline
call system_pause
push -2
call ExitProcess
_GetNum ENDP
_GetNumOffset PROC _GetNumOffsetoffset :  SDWORD 
	push inputInt
	pop edx
		call inputInt
	push eax
	push _GetNumOffsetoffset
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop _GetNumOffsetresult

	mov eax, _GetNumOffsetresult
	ret

SOMETHINGWRONG:
push offset null_division
call outstrline
call system_pause
push -1
call ExitProcess

EXIT_OVERFLOW:
push offset overflow
call outstrline
call system_pause
push -2
call ExitProcess
_GetNumOffset ENDP
main PROC
	push _GetNum
	pop edx
		call _GetNum
	push eax
	pop maina

	push _GetNumOffset
	push L1
	pop edx
	pop edx
	push L1
		call _GetNumOffset
	push eax
	pop maina

	push offset intToStr
	push L2
	pop edx
	pop edx
	push L2
		call intToStr
	push eax
	pop mainText


	push maina
	call outnumline
call system_pause
push 0
call ExitProcess
SOMETHINGWRONG:
push offset null_division
call outstrline
call system_pause
push -1
call ExitProcess
EXIT_OVERFLOW:
push offset overflow
call outstrline
call system_pause
push -2
call ExitProcess
main ENDP
end main