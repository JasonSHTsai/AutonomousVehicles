%% Ref Generation
clear ; clc ; close all
Ts = 0.01;Tend = 4;Td = 50; Tf = 0.001;
t_sim = 0:Ts:Tend;
% load Input;
% load ID_inf_test2;
% Accelcmd = Accelcmd_tmp';
%Acceleration Signal
% for i = 1:length(t_sim)
%     if i < 301
%         Accelcmd(i) = 0.06*t_sim(i); 
% %     elseif (i>801 && i<1001)
% %         Accelcmd(i) = 0.02*t_sim(i);     
%     else
%         Accelcmd(i) = 0.02;
%         end
% end
Accelcmd = -0.5*(-1+cos(2*pi*t_sim/Td))*1.8;
Accel_input = [t_sim' Accelcmd'];

%%Steer Signal
% Steer = 0.4*5/3*pi*sin(t_sim/1);
Steer = -0.5*(cos(2*pi*t_sim/4))*9;
Steer(1:100) = 0;
Steer_input = [t_sim' Steer'];
Fcncal_transctrl_Ts = 0.01;

figure();
subplot(2,1,1)
plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');%ylim([-5/3*pi 5/3*pi])
subplot(2,1,2)
plot(t_sim,Accelcmd);title('Accel & Brake'); xlabel('Time (s)'); ylabel('Accel & Brake');%ylim([-1 1])

sim ISReferenceApplication
%% Diagram

% figure();
% subplot(3,1,1)
% plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');ylim([-5/3*pi 5/3*pi])
% subplot(3,1,2)
% plot(t_sim,Acceleration);title('Acceleration'); xlabel('time(s)'); ylabel('Acceleration');
% subplot(3,1,3)
% plot(t_sim,Brake); title('Brake'); xlabel('time(s)'); ylabel('Brake');

% yaw_axis_deg = -yaw*180/pi + 450;
% for i = 1:length(yaw)
%     if yaw_axis_deg(i) > 360
%         yaw_axis_deg(i) = yaw_axis_deg(i) - 360;
%     end
% end
figure();
subplot(2,1,1)
plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');%ylim([-5/3*pi 5/3*pi])
subplot(2,1,2)
plot(t_sim,Accelcmd);title('Accel & Brake'); xlabel('Time (s)'); ylabel('Accel & Brake');%ylim([-1 1])

figure();
subplot(2,1,1)
plot(t_sim,Velocity); title('Velocity'); xlabel('Time (s)'); ylabel('Velocity (m/s)');
subplot(2,1,2)
plot(t_sim,Yaw); title('Yaw angle'); xlabel('Time (s)'); ylabel('Yaw angle(rad)');
% subplot(3,1,3)
% plot(tout,(yaw_rate)); title('Yaw Rate'); xlabel('time(s)'); ylabel('Yaw rate(rad/s)');


% figure();
% subplot(2,1,1)
% plot(t_sim,Acceleration);title('Acceleration'); xlabel('time(s)'); ylabel('Acceleration');
% subplot(2,1,2)
% plot(tout,EngTrqCmd); title('EngTrqCmd'); xlabel('time(s)'); ylabel('EngTrqCmd');
% 
% 
% figure();
% subplot(2,1,1)
% plot(t_sim,Brake); title('Brake'); xlabel('time(s)'); ylabel('Brake');
% subplot(2,1,2)
% plot(t_sim,PrsCmd); title('PrsCmd'); xlabel('time(s)'); ylabel('PrsCmd');
% 
% figure();
% subplot(2,1,1)
% plot(tout,V_mph); title('V_{mph}'); xlabel('time(s)'); ylabel('Velocity(mph)');
% subplot(2,1,2)
% plot(tout,GearCmd); title('GearCmd'); xlabel('time(s)'); ylabel('GearCmd');
% save('ID_inf_launch9.mat','Steer','Accelcmd','t_sim','Yaw','Velocity','XYplot');