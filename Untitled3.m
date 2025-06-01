clc;
clear;

% Parameter motor
R = 0.42;
L = 0.0003;
J = 5e-4;
B = 32e-4;
Kt = 657e-4;
Ke = 657e-4;

% Fungsi alih dari tegangan ke kecepatan
num = Kt;
den = [J*L, J*R + L*B, B*R + Kt*Ke];
plant = tf(num, den);

% Asumsikan hasil tuning PID dari PID Tuner
Kp = 0.0015525;
Ki = 0.04166;
Kd = 1.4464e-05;

C = pid(Kp, Ki, Kd);

% Sistem tertutup
T = feedback(C*plant, 1);

% Simulasi respons
step(T);
grid on;
title('Respons Step Sistem Motor DC + PID');

% Output info
info = stepinfo(T);
disp('=== Karakteristik Sistem Tertutup ===');
disp(info);