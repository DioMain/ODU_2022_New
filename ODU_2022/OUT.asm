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
	L1 BYTE 1
	L2 BYTE 'true', 0
	L3 BYTE 'false', 0
	L4 SDWORD 0
	L5 SDWORD 2
	L6 SDWORD 1
.data
	maina DWORD 0
	maini SDWORD 0

.code

main PROC
	push offset L1
	pop maina

	mov edx, maina
	cmp edx, L1
	jz right1
	jnz wrong1
	jmp next1
right1:
push offset L2
call outstrline
	jmp next1

wrong1:
push offset L3
call outstrline

next1:	mov edx, maina
	cmp edx, L1
	jz right2
	jnz wrong2
	jmp next2
right2:
push offset L2
call outstrline
	jmp next2

wrong2:
push offset L2
call outstrline

next2:	push L4
	pop maini

	mov edx, maini
	cmp edx, L5
	jl cycle1
	jmp continue1
 cycle1:	push maini
	push L6
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop maini

	mov edx, L5
	cmp edx, L6
	jgright3
	jmp next3
right3:
push offset L2
call outstrline

next3:	mov edx, maini
	cmp edx, L5
	jl cycle1
continue1:call system_pause
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