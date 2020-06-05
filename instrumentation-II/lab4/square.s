        ;; Problem 2 of DAC
        ;; Square wave generation
amp:    equ 9000H
time:   equ 0FFFFH
        MVI A, 80H              ;8255A control word
        OUT 43H
        LDA amp
        MOV B, A
start:  XRA A
L1:     OUT 40H                 ;for Xout
        OUT 41H                 ;for Yout
        CALL DELAY
        MOV A, B
L2:     OUT 40H
        OUT 41H
        CALL DELAY
        JMP start
        ;; Delay subroutine gives an approx delay of 1.5 s
DELAY:  PUSH PSW
        LXI D, time
DLAY1:  DCX D
        MOV A, D
        ORA E
        JNZ DLAY1
        POP PSW
        RET
