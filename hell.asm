.model small
.stack 100h
.data
FNAME db 'C:\Windows\System32\drivers\etc\hosts',0
HANDLE dw ?
buffer db 1024 DUP(?)
.code
main proc

mov ax,@data
mov ds,ax

mov ah,3dh
LEA dx,FNAME
mov al,0
int 21h
mov HANDLE,ax
call outdec

MOV BX, HANDLE
lea DX, buffer
MOV AH, 3FH
MOV CX, 1024
INT 21H

mov CX,AX
MOV AH, 40H
MOV BX, 1
INT 21H

jc OPEN_ERROR

OPEN_ERROR:

mov ah,3eh	;close
mov bx,HANDLE
int 21h
jc CLOSE_ERROR
CLOSE_ERROR:
mov ah,4ch
int 21h
main endp

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

end main