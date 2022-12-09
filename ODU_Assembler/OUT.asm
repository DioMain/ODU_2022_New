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
	L2 BYTE 'Bool', 0
	L3 BYTE 'd', 0
	L4 BYTE 'Char', 0
	L5 BYTE 'fg', 0
	L6 BYTE 'String', 0
	L7 SDWORD 11
	L8 BYTE 'Int', 0
	L9 SDWORD 13
	L10 BYTE 'f', 0
	L11 SDWORD 169
	L12 SDWORD 12
	L13 SDWORD 2
.data
	mainj SDWORD 0

.code

foo PROC fooIsActive :  DWORD , fooa :  SDWORD , foob :  DWORD , foos :  DWORD 
	mov eax, fooIsActive
	mov ebx, L1
	.IF eax  ==  ebx

	push offset L2
	call outstrline

	.ENDIF
	mov esi, foob
	mov edi, offset L3
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl

	push offset L4
	call outstrline

	.ENDIF
	mov esi, foos
	mov edi, offset L5
	mov eax, 0
	.WHILE eax == 0

		mov dl, BYTE PTR [edi]
		.IF dl == 0
			mov dl, BYTE PTR [esi]
			.IF dl == 0
				mov eax, 2
			.ENDIF
		.ENDIF

		mov dl, BYTE PTR [edi]
		mov bl, BYTE PTR [esi]
		.IF dl != bl
			mov eax, 1
		.ENDIF

		inc esi;
		inc edi;
	.ENDW

	.IF eax  ==  2

	push offset L6
	call outstrline

	.ENDIF
	mov eax, fooa
	mov ebx, L7
	.IF SDWORD PTR eax  >  SDWORD PTR ebx

	push offset L8
	call outstrline

	.ENDIF
	push L9
	pop fooa

	push offset L10
	pop foob

	push offset intToStr
	push L11
	pop edx
	pop edx
	push L11
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

push offset L5

push offset L3

push L12

push DWORD ptr L1

call foo
	push L13
	push L13
	push L13
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop eax
	pop ebx
	imul ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainj

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