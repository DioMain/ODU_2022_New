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

 lenght PROTO  : DWORD

 power PROTO : DWORD, : DWORD
.const
 null_division BYTE 'ERROR: DIVISION BY ZERO', 0
 overflow BYTE 'ERROR: VARIABLE OVERFLOW', 0 
	L1 BYTE 'COPY TEXT!', 0
	L2 SDWORD 7
	L3 SDWORD 125
	L4 SDWORD 10
	L5 SDWORD 5
	L6 SDWORD 2
	L7 SDWORD 1
	L8 SDWORD 16
	L9 BYTE 'TEXT', 0
	L10 BYTE ' ', 0
.data
	_ostresult SDWORD 0
	mainoriginal DWORD ?
	maincopyright DWORD ?
	mainoffset SDWORD 0
	mainnums SDWORD 0
	mainrandnum SDWORD 0
	textlen SDWORD 0
	maincon DWORD ?
	mainconv DWORD ?

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
	push offset L1
	pop mainoriginal

	push offset copy
	push mainoriginal
	pop edx
	pop edx
	push mainoriginal
		call copy
	push eax
	pop maincopyright

	push L2
	pop mainoffset

	push _ost
	push L3
	push L4
	pop edx
	pop edx
	pop edx
	push L4
	push L3
		call _ost
	push eax
	push L5
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	push L6
	push L6
	push L7
	pop eax
	pop ebx
	imul ebx
	jo EXIT_OVERFLOW
	push eax
	pop ebx
	pop eax
	cmp ebx,0
	je SOMETHINGWRONG
	cdq
	idiv ebx
	push eax
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	push mainoffset
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	pop mainnums

	push random
	push L8
	pop edx
	pop edx
	push L8
		call random
	push eax
	pop mainrandnum

	push lenght
	push offset L9
	pop edx
	pop edx
	push offset L9
		call lenght
	push eax
	pop textlen

	push offset concat
	push mainoriginal
	push maincopyright
	pop edx
	pop edx
	pop edx
	push maincopyright
	push mainoriginal
		call concat
	push eax
	pop maincon


push maincopyright
call outstrline

push offset L10
call outstrline

push mainnums
call outnumline

push offset L10
call outstrline

push maincon
call outstrline

push offset L10
call outstrline

push mainrandnum
call outnumline

push offset L10
call outstrline

push textlen
call outnumline

push offset L10
call outstrline
	push offset intToStr
	push textlen
	pop edx
	pop edx
	push textlen
		call intToStr
	push eax
	pop mainconv


push mainconv
call outstrline
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