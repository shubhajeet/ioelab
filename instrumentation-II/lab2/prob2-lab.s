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
        MVI A, 01H
loop:   OUT portC
        RAR
        JNZ loop
        RST 5
