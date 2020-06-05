        ;; Problem 4
	contorlPort:    equ 83H
	portA:  equ 80H
	portB:  equ 81H
	portC:  equ 82H
	MVI A, 05H
        OUT contorlPort
        MVI A, 86H
        OUT contorlPort
        MVI A, 0DH
        SIM
        EI
LOOP:   JMP LOOP
8FB9:   JMP prog
prog:   IN portB
        OUT portA
        EI
        RET
