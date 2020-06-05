        ;; Write a program for 180 degrees rotation of the stepper motor using full step sequence in the direction opposite to that of sample program.
        MVI A, 80H              ;All ports are O/P
        OUT 43H

start:   MVI C, 100
        MVI A, 88H              ;Initial control bit pattern
LOOP:   OUT 40H
        PUSH B
        CALL DELAY              ;Delay between steps
        POP B
        RLC
        ;; Change RRC to RLC to reverse the direction
        DCR C
        JNZ LOOP
        LDA 800FH
        XRI 08H
        STA 800FH
        JMP start
        ;; Delay subroutine gives an approx delay of 1.5 s
DELAY:  PUSH PSW
        LXI D, 0FFFFH
DLAY1:  DCX D
	MOV A, D
        ORA E
	JNZ DLAY1
        POP PSW
	RET
