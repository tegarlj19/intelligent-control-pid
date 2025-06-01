clear 
clc

Ra = 0.42 ;
La = 0.0003 ;
J = 0.0005 ;
K = 0.0657 ;
Kb = 0.0657 ;
B = 0.0032 ;

num = K ;
den = [La*J (La*B + Ra*J) (Ra*B+Kb*K)];
Gs = tf(num,den);
