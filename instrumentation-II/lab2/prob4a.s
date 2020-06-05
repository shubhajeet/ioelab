        ;; Problem 4
	contorlPort:    equ 83H
	portA:  equ 80H
	portB:  equ 81H
	portC:  equ 82H
RAM:	MVI A, 09H
	OUT contorlPort
        MVI A, 0B0H
        OUT contorlPort
        MVI A, 0EH
        SIM
        EI
LOOP:   JMP LOOP
83FB3:   JMP prog
prog:	IN portA
        OUT portB
        EI
        RET
