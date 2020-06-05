        ;; Problem 1 of DAC
        MVI A, 80H              ;8255A control word
        OUT 43H
        XRA A
L1:     OUT 40H                 ;for Xout
        OUT 41H                 ;for Yout
        INR A
        CPI 0FFH
        JNZ L1
L2:     OUT 40H
        OUT 41H
        DCR A
        JNZ L2
        JMP L1
