.MODEL SMALL
.STACK 100h
.DATA
	Arr BYTE 1, 2, 3, 4
	 BYTE 5, 6, 7, 8
	BYTE 9, 10, 11, 12
	NOC = 4
	NOR = 3
.CODE
  	MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	MOV BX, 0
	MOV CX, NOR
	L1:
push cx
	MOV AX, NOC
	MUL BX
	PUSH BX
	
	MOV BX, AX
	
	MOV DI, 0	;Columns
	MOV DX, 0
	MOV CX, NOC
		L2:
			ADD DL, BYTE PTR Arr[BX + DI]
			INC DI
		LOOP L2
	MOV DH, 0
	MOV AX, DX
	CALL OUTDEC
	MOV AH, 2
	MOV DL, 10
	INT 21h
	
	POP BX
	INC BX
	POP CX
	LOOP L1
      


	MOV AH, 4Ch
	INT 21h
MAIN ENDP
OUTDEC PROC
	PUSH AX
	PUSH BX
	PUSH CX     
	PUSH DX
		MOV CX,0
		CMP AX,0
		JGE else_label
		PUSH AX
		MOV AH,2
		MOV DL,'-'
		INT 21h
		POP AX
		NEG AX
		else_label:
			MOV BX,10
			MOV DX,0
			DIV BX
			PUSH DX
			INC CX
			CMP AX,0
			JNE else_label
			MOV AH,2
		print_label:
			POP DX
			ADD DL,30h
			INT 21h
			LOOP print_label
		POP DX
		POP CX
		POP BX
		POP AX
		RET
	OUTDEC ENDP
	INDEC PROC 
		PUSH BX
		PUSH CX
		PUSH DX
		begin:
			MOV CX,0
			MOV BX,0
			MOV AH,1
			INT 21h
			CMP AL,'-'
			JE minus
			CMP AL,'+'
			JE plus
			JMP rep_loop
		minus:
			MOV CX,1
		plus:
			INT 21h
		rep_loop:
			CMP AL,'0'
			JL invalid
			CMP AL,'9'
			JG invalid
			SUB AL,30h
			MOV AH,0
			PUSH AX
			MOV AX,10
			MUL BX
			POP BX
			ADD BX,AX
			MOV AH,1
			INT 21h
			CMP AL,13
			JNE rep_loop
			MOV AX,BX
			CMP CX,0
			JE exit
			NEG AX
		exit:
			POP DX
			POP CX
			POP BX
			RET
		invalid:
			MOV AH,2
			MOV DL,0Ah
			INT 21h
			MOV DL,0Dh
			INT 21h
			JMP begin
	INDEC ENDP

END MAIN