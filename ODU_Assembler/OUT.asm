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

 system_pause PROTO 

 random PROTO  : DWORD

 lenght PROTO  : DWORD

 power PROTO : DWORD, : DWORD
.const
 null_division BYTE 'ERROR: DIVISION BY ZERO', 0
 overflow BYTE 'ERROR: VARIABLE OVERFLOW', 0 
	L1 SDWORD 1
	L2 BYTE 'test', 0
	L3 SDWORD 0
	L4 SDWORD 10
	L5 SDWORD 15
	L6 BYTE 'factorial: ', 0
.data
	_factnewN SDWORD 0
	_factstr DWORD ?
	_Inlengthlen SDWORD 0
	_InlengthtempNum SDWORD 0
	_Inlengthdegree SDWORD 0
	mainfactorial SDWORD 0

.code

_fact PROC _factN :  SDWORD 
	push _factN
	push L1
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop _factnewN

	push offset L2
	pop _factstr

	mov edx, _factN
	cmp edx, L3
	jz right1
	jnz wrong1
	jmp next1
right1:	mov eax, L1
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
	jmp next1

wrong1:	push _factN
	push _fact
	push _factnewN
	pop edx
	pop edx
	push _factnewN
		call _fact
	push eax
	pop eax
	pop ebx
	imul ebx
	jo EXIT_OVERFLOW
	push eax
	pop _factN

	mov eax, _factN
	ret

next1:	mov eax, L1
	ret
_fact ENDP
_Inlength PROC _Inlengthnum :  SDWORD 
	push L3
	pop _Inlengthlen

	push _Inlengthnum
	pop _InlengthtempNum

	push L1
	pop _Inlengthdegree

	mov edx, _InlengthtempNum
	cmp edx, L3
	jnz cycle1
	jmp continue1
 cycle1:	push _Inlengthnum
	push power
	push L4
	push _Inlengthdegree
	pop edx
	pop edx
	pop edx
	push _Inlengthdegree
	push L4
		call power
	push eax
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push eax
	pop _InlengthtempNum

	push _Inlengthdegree
	push L1
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop _Inlengthdegree

	mov edx, _InlengthtempNum
	cmp edx, L3
	jnz cycle1
continue1:	push _Inlengthdegree
	push L1
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	pop _Inlengthlen

	mov eax, _Inlengthlen
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
_Inlength ENDP
main PROC
	push _fact
	push L5
	pop edx
	pop edx
	push L5
		call _fact
	push eax
	pop mainfactorial


push offset L6
call outstr

push mainfactorial
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