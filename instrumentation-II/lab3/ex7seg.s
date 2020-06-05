        MVI A, 80H
	OUT 43H
        LXI H, 9000H            ;lookup table location
        MVI C, 0AH
ltable: MVI A, 89H
        CALL DISP               ; call display subroutine
	RST 5
        ;;  Following subroutine displays the content of accumulator in 7- segment display
DISP:    MVI C, 08H              ;counter to transmit 8-bit
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
