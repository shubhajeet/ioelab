        ;; Write an assembly language program to display the sequence of digits 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 in a right to left scrolling fashion with appropriate delay. Use appropriate list of display codes.
        MVI A, 80H
        OUT 43H
	LXI H, 9000H            ;lookup table location
        MVI B, 0AH
ltable: MOV A, M
	CALL DISP               ; call display subroutine
        CALL DELAY
       	INX H
        DCR B
	JNZ ltable
        RST 5
	;;  Following subroutine displays the content of accumulator in 7- segment display
DISP:	MVI C, 08H              ;counter to transmit 8-bit
L1:     RLC                     ;to pass each bit serially from MSB to LSB
	MOV E, A
        OUT 41H                 ;to pass a bit via PB0
	MVI A, 01H
        OUT 42H                 ;clock single on PC0(rise)
	DCR A
        OUT 42H                 ;clock signal on PC0(fall)
	MOV A, E
        DCR C
	JNZ L1
        RET
;; Delay subroutine gives an approx delay of 1.5 s
DELAY:  PUSH PSW
        LXI D, 0FFFFH
DLAY1:  DCX D
        MOV A, D
        ORA E
        JNZ DLAY1
        POP PSW
        RET
