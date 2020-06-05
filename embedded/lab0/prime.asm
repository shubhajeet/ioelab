	ORG 00H
	BASE EQU 40H
	NUMS EQU 20H
	;; storing value
START:	MOV R1, #BASE
	MOV R2, #20H
	MOV A, #00H
NNUM:	MOV @R1, A
	INC R1
	INC A
	DJNZ R2, NNUM
        ;; Initialization
PRIME:
        MOV R0, #BASE+1
        MOV R1, #NUMS
NEXT:   MOV A, @R0
	;; guesed factor
        MOV R3, A
        DEC R3
        DEC R3
ISP:    MOV A, @R0
	MOV B, R3
	INC B
	DIV AB
        ;; detect if remainder is 0
        XCH A, B
        ORL A, #00H
        JZ ESC
        DJNZ R3, ISP
        MOV A, @R0
        MOV P0, A
        CALL DELAY
ESC:    INC R0
        DJNZ R1, NEXT

	SJMP START
	
DELAY: 	MOV R7, #7

HERE1: 	MOV R6, #1
HERE2: 	MOV R1, #2
HERE3: 	DJNZ R1, HERE3
	DJNZ R6, HERE3
	DJNZ R7, HERE3
	RET
	END


