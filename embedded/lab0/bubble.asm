	ORG 00H
	NUMS EQU 10
	BASE EQU 60H
        ;; storing the value
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
        
	;MOV R0, #BASE
	MOV R2, #NUMS-1	;counter
l1:     MOV A, R2       ;setting the counter which decreases by 1 in every loop
        MOV R4, A
	MOV R1, #BASE           ;pointer to array
l2:     MOV A, @R1              ;reading the array value
	INC R1                  ;moving to the adjacent value
        CLR C                   ;clearing the carry content
        SUBB A, @R1             ;subtracting first with second
        JNC LARGE                ;escaping if first is smaller than second
        MOV A, @R1               ;swapping the values
        DEC R1
        XCH A, @R1
        INC R1
        ;; falgs
LARGE:  DJNZ R4, l2             ;looping till the counter
        ;; flags checking
        DJNZ R2, l1

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
	
	END

