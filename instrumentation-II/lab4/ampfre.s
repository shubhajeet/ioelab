        ;; Problem 2 of DAC
        ;; Triangle wave with changing frequency and amplitude
amp:    equ 9000H
time:   equ 0FFFFH
        MVI A, 80H              ;8255A control word
        OUT 43H
        LDA amp
        MOV B, A
start:  XRA A
L1:     OUT 40H                 ;for Xout
        OUT 41H                 ;for Yout
        PUSH PSW
        CALL DELAY
        POP PSW
        INR A
        CMP B
        JNZ L1
L2:     OUT 40H
        OUT 41H
        PUSH PSW
        CALL DELAY
        POP PSW
        DCR A
        JNZ L2
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
