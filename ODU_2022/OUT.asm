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
	L1 DWORD 0
	L2 BYTE 'Test', 0
	L3 SDWORD 13
	L4 BYTE 'f', 0
	L5 SDWORD 169
	L6 SDWORD 12
	L7 BYTE 'd', 0
	L8 BYTE 'fg', 0
.data

.code

foo PROC fooIsActive :  DWORD , fooa :  SDWORD , foob :  DWORD , foos :  DWORD 
	mov eax, fooIsActive
	mov ebx, L1
	.IF eax  ==  ebx

	push offset L2
	call outstrline

	.ENDIF
	push L3
	pop fooa

	push offset L4
	pop foob

	push offset intToStr
	push L5
	pop edx
	pop edx
	push L5
		call intToStr
	push eax
	pop foos

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
foo ENDP
main PROC

push offset L8

push offset L7

push L6

push offset L1

call foo
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