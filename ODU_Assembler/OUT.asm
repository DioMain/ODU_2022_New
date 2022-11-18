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
	L1 BYTE '1
	L2 BYTE 'true', 0
	L3 BYTE 'false', 0
.data
	maina DWORD 0

.code

main PROC
	push offset L1
	pop maina


	mov esi, maina
	mov edi, offset L1
	 push maina
	 call lenght
	 mov ebx,eax
	 push L1
	 call lenght
	 cmp ebx,eax
	jnz wrong1
	 mov ecx,eax
	 repe cmpsb
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

next1:
	mov esi, maina
	mov edi, offset L1
	 push maina
	 call lenght
	 mov ebx,eax
	 push L1
	 call lenght
	 cmp ebx,eax
	jnz wrong2
	 mov ecx,eax
	 repe cmpsb
	jz right2
	jnz wrong2
	jmp next2
right2:
push offset L2
call outstrline
	jmp next2

wrong2:
push offset L3
call outstrline

next2:call system_pause
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