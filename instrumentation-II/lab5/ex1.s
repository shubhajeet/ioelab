        ;; Question 1
noOfState:      equ 5
startAddress:   equ 9000H
        MVI A, 80H
        OUT 43H
start:  MVI C, noOfState
        LXI H, startAddress
L1:     MOV A, M
        OUT 40H
	INX H
       	MOV A, M
        OUT 41H
	INX H
        MOV A, M
        OUT 42H
        INX H
        CALL DELAY
        MOV A, M
        OUT 40H
	INX H
       	MOV A, M
        OUT 41H
	INX H
        MOV A, M
        OUT 42H
        INX H
        CALL DELAY2
        DCR C
        JNZ L1
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
DELAY2: PUSH PSW
        LXI D, 0FFFFH
DLAY2:  DCX D
        MOV A, D
        ORA E
        JNZ DLAY2
        POP PSW
        RET