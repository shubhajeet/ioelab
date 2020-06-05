        ;; A table consists of ten 8-bit data starting at 8050H. Write an 8085 program to store the sum of odd numbers at 8060H and store sum of even numbers at 8070H. Also display the sum at output ports
        jmp start
        ;; data
startAdd: equ 8050H
noOfData: equ 10
sumEven: equ 8060H
sumOdd: equ 8070H
port:   equ 40H
portEven:   equ 41H
portOdd:   equ 42H        ;; code
start:  nop
        ;; initializing output port
        MVI A, 80H
        OUT 40H
        ;; main program
        MVI C, noOfData
        LXI H, startAdd
        ;; looping through all the data
loop:   MOV A, M
        RAR
        JC odd
        RAL
        ADD D
        MOV D, A
        ;; adding even numbers
        JMP esc
odd:    RAL
        ADD E
        MOV E, A
        ;; adding odd numbers
esc:    INX H
        DCR C
        JNZ loop
        ;; displaying and storing sum of even nos
        MOV A, D
        OUT portEven
        STA sumEven
        ;; displaying and storing sum of odd nos
        MOV A, E
        OUT portOdd
        STA sumOdd
        hlt
