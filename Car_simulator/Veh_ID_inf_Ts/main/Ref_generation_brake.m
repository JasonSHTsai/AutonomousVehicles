%% Ref Generation
clear ; clc ; close all
Ts = 0.1; Tend = 100; Td = 30; Tf = 0.001;
t_sim = 0:Ts:Tend;
load ID_inf_low2;

%Acceleration Signal
Brake_str1 = 25; Brake_end1 = 40; Brake_du1 = Brake_end1 - Brake_str1;%(sec)
Brake_str2 = 60; Brake_end2 = 75; Brake_du2 = Brake_end2 - Brake_str2;%(sec)
Brake_str3 = 80; Brake_end3 = 85; Brake_du3 = Brake_end3 - Brake_str3;%(sec)
% Brake_str4 = 95; Brake_end4 = 100; Brake_du4 = Brake_end4 - Brake_str4;%(sec)

% Accelcmd = -0.5*(-1+cos(2*pi*t_sim/Td))*0.45;
 Accelcmd = -0.5*(-1+cos(2*pi*t_sim/Td))*0.8;
Accelcmd (:,Brake_str1/Ts : Brake_end1/Ts) = 0;
Accelcmd (:,Brake_str2/Ts : Brake_end2/Ts) = 0;
Accelcmd (:,Brake_str3/Ts : Brake_end3/Ts) = 0;
% Accelcmd (:,Brake_str4/Ts : Brake_end4/Ts) = 0;
%Brake Signal
t_brake1 = -Brake_du1/2:Ts:Brake_du1/2;
t_brake2 = -Brake_du2/2:Ts:Brake_du2/2;
t_brake3 = -Brake_du3/2:Ts:Brake_du3/2;
% t_brake4 = -Brake_du4/2:Ts:Brake_du4/2;

y1 = 0.4*normpdf(t_brake1,0.6,0.6);
y2 = 0*normpdf(t_brake2,0.6,0.6);
y3 = 0.2*normpdf(t_brake3,0.6,0.6);
% y4 = 0.3*normpdf(t_brake4,0.6,0.6);
Accelcmd (:,Brake_str1/Ts : Brake_end1/Ts) = -y1;
Accelcmd (:,Brake_str2/Ts : Brake_end2/Ts) = -y2;
Accelcmd (:,Brake_str3/Ts : Brake_end3/Ts) = -y3;
% Accelcmd (:,Brake_str4/Ts : Brake_end4/Ts) = -y4;
Accel_input = [t_sim' Accelcmd'];

% Accelcmd = zeros(1,fix(length(t_sim)/2));
% Accelcmd2 = 0*ones(1,fix(length(t_sim)/2)+1);
% Accel_input = [t_sim' [Accelcmd Accelcmd2]'];
% Accelcmd = [Accelcmd Accelcmd2];

%%Steer Signal
% T_steer = 15; Rate_steer = 10; Tf = 2;
% t_steer = -T_steer:Ts:T_steer; 
% Steer_tmp = sawtooth(2*pi/10*t_steer,0.5);
% Steer = zeros(1,length(t_sim));Steer = Steer';
% Steer = 5/3*pi*sin(t_sim/8);Steer = Steer';
% Steer(5000:5931,:) = 0; 
% Steer(2501:3905,:) = 0; 
% Steer(9431:end,:) = 0; 

Steer_input = [t_sim' Steer];
Fcncal_transctrl_Ts = 0.01;

sim ISReferenceApplication
%% Diagram
figure();
subplot(2,1,1)
plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');ylim([-5/3*pi 5/3*pi])
subplot(2,1,2)
plot(t_sim,Accelcmd);title('Accel & Brake'); xlabel('Time (s)'); ylabel('Accel & Brake');ylim([-1 1])

figure();
subplot(3,1,1)
plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');ylim([-5/3*pi 5/3*pi])
subplot(3,1,2)
plot(t_sim,Acceleration);title('Acceleration'); xlabel('Time (s)'); ylabel('Acceleration');ylim([0 1])
subplot(3,1,3)
plot(t_sim,Brake); title('Brake'); xlabel('Time (s)'); ylabel('Brake');ylim([0 1])

% yaw_axis_deg = -yaw*180/pi + 450;
% for i = 1:length(yaw)
%     if yaw_axis_deg(i) > 360
%         yaw_axis_deg(i) = yaw_axis_deg(i) - 360;
%     end
% end

figure();
subplot(2,1,1)
plot(t_sim,Velocity); title('Velocity'); xlabel('Time (s)'); ylabel('Velocity (m/s)');
% hold on;plot(t_sim,Velocity_tmp);
subplot(2,1,2)
plot(t_sim,Yaw); title('Heading angle'); xlabel('Time (s)'); ylabel('Heading angle (rad)');
% hold on;plot(t_sim,Yaw_tmp);
% figure();
% plot(t_sim,Velocity_y);
% figure();
% subplot(2,1,1)
% plot(t_sim,yaw_relatively); title('Yaw_relatively'); xlabel('time(s)'); ylabel('Yaw rate(rad/s)');
% subplot(2,1,2)
% plot(t_sim,yaw_rate); title('Yaw_relatively'); xlabel('time(s)'); ylabel('Yaw rate(rad/s)');


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
save('ID_inf_fast0422.mat','Steer','Accelcmd','t_sim','Yaw','Velocity','XYplot');