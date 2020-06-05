#!/bin/octave
pkg load signal;

g1= 0.0007378
s1b = [1 2 1];
s1a = [1 -1.2686 0.7051];
s1 = [s1b s1a];

s2b = [1 2 1];
s2a = [1 -1.0106 0.3583];
s2 = [s2b s2a];

s3b = [1 2 1];
s3a = [1 -0.9044 0.2155];
s3 = [s3b s3a];

s = [s1; s2; s3]
[z1, p1, k1] = sos2zp(s1,g1)
[z2, p2, k2] = sos2zp(s2)
[z3, p3, k3] = sos2zp(s3)

z = [z1; z2; z3] .+ 0 * i
p = [p1; p2; p3]
k = k1 * k2 * k3

figure()
hold on;
plot(z,z.* 0,'o')
plot(p,'x')
title("poles and zeros the system from section")
xlabel("real axis")
ylabel("complex axis")
print -dpng "poleZeroSos3" ;

[b, a] = sos2tf(s)
"transfer function"
b
a

[z,p,k] = tf2zp(b,a)
figure()
hold on;
plot(z,'o')
plot(p,'x')
title("poles and zeros the system from tf")
xlabel("real axis")
ylabel("complex axis")
print -dpng "poleZerotf3" ;
