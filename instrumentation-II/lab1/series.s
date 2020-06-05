        ;; Write a program to calculate the sum of following sequence 1 × 2 + 2 × 3 + 3 × 4 + 4 × 5 + ... up to n terms, where n is an 8-bit number stored at memory location 9000H. Display the 16-bit result in output ports. Use subroutine for multiplication.
        jmp start
        ;; data
n: equ 9000H
port:   equ 43H
portlsb:   equ 41H
portmsb:   equ 42H        ;; code
start:  nop
        ;; initializing output port
        MVI A, 80H
        OUT port
        ;; main program
        LDA n
        MOV C, A
	LXI H, 00
        ;; looping through all the terms
loop:   MOV A, C
        MOV B, C
        INR A                   ;this will reduce 1 extra loop
        CALL mul
        DAD D
esCarry: DCR C
        JNZ loop
        ;; final output
        MOV A, L
        OUT portlsb
        MOV A, H
        OUT portmsb
        HLT
        ;; multiplication subroutine
mul:    PUSH B                  ;preserving data
	MVI D, 0                ;destroying previous data
	MOV C, A                ;preserving data of Accumulator
        ;; multiplication by series of addition
	MVI A, 0
loo:    ADD C
        JNC esc
        INR D
esc:    DCR B
        JNZ loo
ex:	MOV E, A
	POP B
        RET
