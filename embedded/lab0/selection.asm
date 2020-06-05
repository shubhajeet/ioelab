	ORG 00H
	NUMS EQU 10
	BASE EQU 60H
	;; storing value
START:	MOV R1, #BASE
	MOV @R1, #0A5H
	INC R1
	MOV @R1, #0FDH
	INC R1
	MOV @R1, #067H
	INC R1
	MOV @R1, #042H
	INC R1
	MOV @R1, #0DFH
	INC R1
	MOV @R1, #09AH
	INC R1
	MOV @R1, #084H
	INC R1
	MOV @R1, #01BH
	INC R1
	MOV @R1, #0C7H
	INC R1
	MOV @R1, #031H
	ACALL SORT
        ;; Initialization	
        MOV R0, #BASE
        MOV R1, #NUMS
NEXT:   MOV A, @R0
        MOV P0, A
        INC R0
        CALL DELAY
        DJNZ R1, NEXT
	SJMP START
	
DELAY: 	MOV R7, #7

HERE1: 	MOV R6, #1
HERE2: 	MOV R1, #2
HERE3: 	DJNZ R1, HERE3
	DJNZ R6, HERE3
	DJNZ R7, HERE3
	RET
SORT:
	MOV R3, #BASE
	MOV R2, #NUMS-1
l1:	;address of the initial point of unsorted array
	MOV A, R3
	MOV R1, A
	MOV R0, A
	INC R1

	;; counter
        MOV A, R2
        MOV R4, A
        ;; default smallest value
	
        ;; A as temporary place for storage of lowest value
l2:     MOV A, @R0
	CLR C
        SUBB A, @R1
        JNC LARGE
        MOV A, R1
        MOV R0, A
LARGE:  INC R1
        DJNZ R4, l2
        ;; Moving the lowest value to its right place
        MOV A, R3
        MOV R1, A
        XCH A, @R1
        XCH A, @R0
        XCH A, @R1
	INC R3
        DJNZ R2, l1
	RET
	END

