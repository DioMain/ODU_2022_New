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
	L1 DWORD 1
	L2 SDWORD 1
	L3 BYTE 'f', 0
	L4 BYTE 'a', 0
	L5 BYTE 'str', 0
	L6 BYTE 'Is True!', 0
	L7 DWORD 0
	L8 BYTE 'Is False', 0
	L9 SDWORD 2
	L10 BYTE '2', 0
	L11 BYTE 'testing', 0
.data
	maina DWORD 0
	mainb DWORD 0
	maini0 SDWORD 0
	maini1 SDWORD 0
	mainc DWORD ?
	maind DWORD ?
	mainstr0 DWORD ?
	mainstr1 DWORD ?
	mainmessage DWORD ?

.code

main PROC
	push offset L1
	pop maina

	push offset L1
	pop mainb

	push L2
	pop maini0

	push L2
	pop maini1

	push offset L3
	pop mainc

	push offset L4
	pop maind

	push offset L5
	pop mainstr0

	push offset L5
	pop mainstr1

	push offset L6
	pop mainmessage

	mov eax, maina
	mov ebx, L7
	.IF eax  !=  ebx

push mainmessage
call outstrline
	.ELSE

push offset L8
call outstrline

	.ENDIF
next1:
	mov esi, mainc
	mov esi, maind
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  ==  bl

push mainmessage
call outstrline

	.ENDIF
next2:
	mov eax, maini0
	mov ebx, maini1
	.IF SDWORD PTR eax  ==  SDWORD PTR ebx

push mainmessage
call outstrline

	.ENDIF
next3:
	mov eax, maini0
	mov ebx, L9
	.IF SDWORD PTR eax  !=  SDWORD PTR ebx

push mainmessage
call outstrline

	.ENDIF
next4:
	mov esi, maind
	mov edi, offset L10
	mov al, BYTE PTR [esi]
	mov bl, BYTE PTR [edi]
	.IF al  !=  bl

push mainmessage
call outstrline

	.ENDIF
next5:
	mov esi, mainstr0
	mov esi, mainstr1
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

push mainmessage
call outstrline
	.ELSE

push offset L8
call outstrline

	.ENDIF
next6:
	mov esi, mainstr0
	mov edi, offset L11
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

	.IF eax  !=  2

push mainmessage
call outstrline
	.ELSE

push offset L8
call outstrline

	.ENDIF
next7:
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