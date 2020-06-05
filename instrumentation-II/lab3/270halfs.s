        ;; Write a program for 270 degrees rotation of the stepper motor using half step sequence in the direction same as that of sample program.
        MVI A, 80H              ;All ports are O/P
        OUT 43H
        LXI H, 300
        MVI D, 0CCH
        MVI B, 88H              ;Initial control bit pattern
LOOP:   MOV A, D
        OUT 40H
        RLC
	MOV D, A
	PUSH B
        CALL DELAY              ;Delay between steps
        POP B
	DCX H
       	MOV A, B
        OUT 40H
        RRC
        MOV B, A
        PUSH B
        CALL DELAY              ;Delay between steps
        POP B
        RRC
        ;; Change RRC to RLC to reverse the direction
        DCX H
        MOV A, H
        ORA L
        JNZ LOOP
        ;; Delay subroutine gives an approx delay of 1.5 s
DELAY:  PUSH PSW
        LXI D, 0FFFFH
DLAY1:  DCX D
	MOV A, D
        ORA E
	JNZ DLAY1
        POP PSW
	RET
