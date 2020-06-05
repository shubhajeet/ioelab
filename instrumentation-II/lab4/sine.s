        ;; Problem 2 of DAC
        ;; Sin wave generation
time:   equ 0FFFFH
data:   equ 0A00H
noofdata: equ 25
        MVI A, 80H              ;8255A control word
        OUT 43H
start:  MVI C, noofdata
        LXI H, data
next:   MOV A, M
        OUT 40H                 ;for Xout
        OUT 41H                 ;for Yout
        CALL DELAY
        INX H
        DCR C
        JNZ next
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
