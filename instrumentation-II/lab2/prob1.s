        ;; Problem 1
controlPort:    equ 43H
portA:  equ 40H
portB:  equ 41H
portC:  equ 42H
        ;; code
        ;; subproblem a
        MVI A, 81H
        OUT controlPort
	MVI A, 0AAH
        OUT portA
        MVI A, 55H
        OUT portB
        ;; sub problem b
        MVI A, 0DH
        OUT controlPort
        MVI A, 09H
        OUT controlPort
        MVI A, 05H
        OUT controlPort
	MVI A, 01H
        OUT controlPort
        ;; sub problem c
        MVI A, 80H
        OUT controlPort
        MVI A, 09H
        OUT controlPort
        MVI A, 05H
        OUT controlPort
	MVI A, 01H
        OUT controlPort
        RST 5
