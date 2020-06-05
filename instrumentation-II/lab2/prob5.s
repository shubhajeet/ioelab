        ;; problem 5
RAM:    MVI A, 09H
        OUT 83H
	MVI A, 0DH
        OUT 83H
	MVI A, 0F0H
        OUT 83H
        MVI A, 00
        SIM
        EI
LOOP:   JMP LOOP

prog:   IN 80H
        OUT 81H
        MVI A, 0FH
        OUT 80H
        EI
        RET
