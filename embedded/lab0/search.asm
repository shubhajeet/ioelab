	ORG 00H
	NUMS EQU 10
	BASE EQU 55H
	;; storing value
START:	MOV R1, #BASE
	MOV @R1, #025H
	INC R1
	MOV @R1, #03DH
	INC R1
	MOV @R1, #0F7H
	INC R1
	MOV @R1, #013H
	INC R1
	MOV @R1, #0C9H
	INC R1
	MOV @R1, #04EH
	INC R1
	MOV @R1, #062H
	INC R1
	MOV @R1, #077H
	INC R1
	MOV @R1, #0B8H
	INC R1
	MOV @R1, #0EBH

        ;; Initialization
	
        MOV R0, #BASE
        MOV R4, #NUMS
NEXT:   ;; grabbing the data
	MOV A, @R0
        MOV R2, A               ;temporary storage
        MOV R3, #8              ;no of bit
Nbit:   MOV A, R2
        RR A
        ANL A, #00000011b
        XRL A, #00000011b
        JNZ NO11
        MOV A, @R0
        MOV P0, A
        CALL DELAY
        AJMP ESC
NO11:   MOV R2, A
        DJNZ R3, Nbit
ESC:    INC R0
        DJNZ R4, NEXT
DELAY: 	MOV R7, #7

HERE1: 	MOV R6, #1
HERE2: 	MOV R1, #2
HERE3: 	DJNZ R1, HERE3
	DJNZ R6, HERE3
	DJNZ R7, HERE3
	RET

	END


