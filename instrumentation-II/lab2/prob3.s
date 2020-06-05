        ;; Problem 3
	controlPort:    equ 83H
	portA:  equ 80H
	portB:  equ 81H
	portC:  equ 82H
	mcontrolPort:    equ 43H
	mportA:  equ 40H
	mportB:  equ 41H
	mportC:  equ 42H
        ;; code
        ;; subproblem a
        MVI A, 80H
        OUT mcontrolPort
        MVI A, 90H
        OUT controlPort
        IN portA
        OUT portB
        OUT mportA
        ;; sub problem b
        MVI A, 92H
        OUT controlPort
        IN portA
        MOV B, A
        IN portB
        ADD B
        OUT mportA
        JNC es
        MVI A, 1H
        OUT mportC
es:     RST 5
