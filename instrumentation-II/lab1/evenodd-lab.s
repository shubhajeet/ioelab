        ;; A table consists of ten 8-bit data starting at 8050H. Write an 8085 program to store the sum of odd numbers at 8060H and store sum of even numbers at 8070H. Also display the sum at output ports
        jmp start
        ;; data
startAdd: equ 8050H
finalAdd: equ 5AH
sumEvenlsb: equ 8060H
sumEvenmsb: equ 8061H
sumOddlsb: equ 8070H
sumOddmsb: equ 8071H
port:   equ 43H
portlsb:   equ 41H
portmsb:   equ 42H        ;; code
start:  nop
        ;; initializing output port
        MVI A, 80H
        OUT port
        ;; main program
        LXI H, startAdd
        LXI B, 00
        LXI D, 00
        ;; looping through all the data
loop:   MOV A, M
        RAR
        JC odd
        RAL
        ADD C
        JNC esc
        INR B
esc:    MOV C, A
        ;; adding even numbers
        JMP loopend
odd:    RAL
        ADD E
        JNC esc2
        INR D
esc2:   MOV E, A
        ;; adding odd numbers
loopend: INX H
        MOV A, L
	CPI finalAdd
        JNZ loop
        ;; displaying and storing sum of even nos
        MOV A, C
        OUT portlsb
        STA sumEvenlsb
        MOV A, B
        OUT portmsb
        STA sumEvenmsb
        ;; some delay between display of even nos and odd numbers
        CALL delay
        ;; displaying and storing sum of odd nos
        MOV A, E
        OUT portlsb
        STA sumOddlsb
        MOV A, D
        OUT portmsb
        STA sumOddmsb
        HLT
        ;; delay loop
delay: PUSH B                   ;preserving B pair data
       PUSH D                   ;preserving D pair data
       MVI B, 80                ;counter
loop2: MVI C, 80                ;counter
loop1: DCR C
       JNZ loop1
       DCR B
       JNZ loop2
       POP D
       POP B
       RET
