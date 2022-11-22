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
	L1 BYTE 'Typing!', 0
	L2 BYTE 'Input the string: ', 0
	L3 BYTE 'Input the symbol: ', 0
	L4 BYTE 'Input the number: ', 0
.data
	_ostresult SDWORD 0
	mainstrlen SDWORD 0
	maininStr DWORD ?
	maininChar DWORD ?
	maininInt SDWORD 0

.code

_ost PROC _osta :  SDWORD , _ostb :  SDWORD 
	push _osta
	push _ostb
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push edx
	pop _ostresult

	mov eax, _ostresult
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
_ost ENDP
main PROC
	push strLen
	push offset L1
	pop edx
	pop edx
	push offset L1
		call strLen
	push eax
	pop mainstrlen


	push offset L2
	call outstr
	push offset inputString
	pop edx
		call inputString
	push eax
	pop maininStr


	push offset L3
	call outstr
	push offset inputChar
	pop edx
		call inputChar
	push eax
	pop maininChar


	push offset L4
	call outstr
	push inputInt
	pop edx
		call inputInt
	push eax
	pop maininInt


	push maininStr
	call outstrline

	push maininChar
	call outstrline

	push maininInt
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