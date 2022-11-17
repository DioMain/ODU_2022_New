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
	L1 SDWORD 0
	L2 SDWORD 12
	L3 SDWORD 2
	L4 BYTE 'then', 0
	L5 BYTE 'else', 0
.data
	maintest SDWORD 0

.code

main PROC
	push L1
	pop maintest

	mov edx, L2
	cmp edx, L3
	jz right1
	jnz wrong1
	jmp next1
right1:
push offset L4
call outstrline
	jmp next1

wrong1:
push offset L5
call outstrline

next1:call system_pause
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