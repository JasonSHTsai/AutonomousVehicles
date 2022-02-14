clear all;close all;
Tend = 50;Ts = 0.1;
Tsim = (0:Ts:Tend)';
Uo = -10;
U = sin(Tsim);U = [Tsim U];
signal(1:100,1) = 1;
signal(101:300) = 0;
signal(301:450) = 3;
signal(451:501) = 0;signal = [Tsim signal];

sim change_velocity
plot(U_delay);
hold on;
plot(signal(:,end));
