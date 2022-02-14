clear all;close all;
load ID_inf_example3;
% load Steer0_inf4;
% load ID_inf3;Velocity = velocity;Accelcmd = acbr;
% load ID_inf_0730;Accelcmd = Acbr;
Np = 6;

[select_MPC, select_overlap, slope] = select_model(Velocity, Accelcmd, Np)

%% plot
figure();
plot(select_MPC);
hold on;
plot(select_overlap);
hold on;
plot(slope);
legend('MPC','overlap','slope');
% legend('MPC','overlap');
figure()
plot(Velocity);
hold on;
plot(Accelcmd);
hold on;
plot(slope);
legend('Velocity','Accelcmd','slope');