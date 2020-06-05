        ;; Problem 2
controlPort:    equ 83H
portA:  equ 80H
portB:  equ 81H
portC:  equ 82H
        ;; code
        ;; subproblem a
        MVI A, 90H
        OUT controlPort
        MVI A, 0AAH
        OUT portB
        OUT portC
        MVI A, 55H
        OUT portB
        ;; sub problem b
        MVI A, 00H
        OUT portC
        MVI A, 0FH
        MVI C, 8
loop:   OUT controlPort
        DCR A
        DCR A
        DCR C
        JNZ loop
        RST 5
