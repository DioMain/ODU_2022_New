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
	L1 DWORD 1
	L2 DWORD 0
	L3 SDWORD 100
	L4 SDWORD 5
	L5 SDWORD 0
	L6 BYTE 'Please input your name: ', 0
	L7 BYTE ' ', 0
	L8 BYTE 'NEW ENEMY!', 0
	L9 SDWORD 30
	L10 SDWORD 15
	L11 BYTE 'Enemy hp = ', 0
	L12 BYTE ' hp = ', 0
	L13 BYTE 'COMMANDS:', 0
	L14 BYTE 'f - FIGTH, d - DEFENCE', 0
	L15 BYTE 'f', 0
	L16 BYTE 'd', 0
	L17 SDWORD 2
	L18 BYTE 'Unknown command!', 0
	L19 BYTE 'You kill the enemy!', 0
	L20 BYTE 'GAME OVER', 0
.data
	_GetDamageGDresult SDWORD 0
	mainIsAlive DWORD 0
	mainIsHaveEnemy DWORD 0
	mainIsHaveCommand DWORD 0
	mainCommand DWORD ?
	mainPlayerName DWORD ?
	mainPlayerHp SDWORD 0
	mainPlayerDamage SDWORD 0
	mainFightsCount SDWORD 0
	mainEnemyHpBuf SDWORD 0
	mainEnemyDamageBuf SDWORD 0

.code

_GetDamage PROC _GetDamagedmg :  SDWORD 
	push _GetDamagedmg
	push random
	push _GetDamagedmg
	pop edx
	pop edx
	push _GetDamagedmg
		call random
	push eax
	pop eax
	pop ebx
	add eax, ebx
	jo EXIT_OVERFLOW
	push eax
	push random
	push _GetDamagedmg
	pop edx
	pop edx
	pop edx
	pop edx
	push _GetDamagedmg
	push random
	push random
