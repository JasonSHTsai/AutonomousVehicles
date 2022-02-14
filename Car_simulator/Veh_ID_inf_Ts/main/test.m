%% Ref Generation
clear ; clc ; close all
Ts = 0.1;Tend = 70;Td = 50; Tf = 0.001;
t_sim = 0:Ts:Tend;
% load Input;
% load ID_inf_test2;
% Accelcmd = Accelcmd_tmp';
%Acceleration Signal
Brake_str1 = 40; Brake_end1 = 70; Brake_du1 = Brake_end1 - Brake_str1;%(sec)
ta = 8; ma = -0.06023;

Accelcmd(0:Ts:100)=0.1*
% for i = 1:length(t_sim)
%     if (i<=6.25/Ts)
%         Accelcmd(i) = 0.1*t_sim(i); 
%     elseif (i>6.25/Ts && i<=15/Ts)
%         Accelcmd(i) = 0.1*t_sim(fix(6.25/Ts)) - ma*t_sim(fix(6.25/Ts)) + ma*t_sim(i);
%     else
%         Accelcmd(i) = Accelcmd(fix(15/Ts));%*Accelcmd(fix(length(t_sim)/ta));  
%     end
% end

% Accelcmd = 0.3*ones(1,length(t_sim));
Accelcmd (:,Brake_str1/Ts : Brake_end1/Ts+1) = 0;



%Brake Signal
bm = 0.00379;
t_brake1 = -Brake_du1/2:Ts:Brake_du1/2+Ts;
y1 = bm*t_brake1 - bm*t_brake1(1);
Accelcmd (:,Brake_str1/Ts : Brake_end1/Ts+1) = -y1;

Accel_input = [t_sim' Accelcmd'];


%%Steer Signal
% tn = 4;
Steer = 0.2*5/3*pi*sin(t_sim/15);
% Steer = 0.02*5/3*pi*sin(t_sim/1);
% Steer(:,6501:end) = 0;

% for i = 1:length(t_sim)
%     if (i<=length(t_sim)/tn)
%         Steer(i) = 0.06*t_sim(i); 
%     else
%         Steer(i) = Steer(fix(length(t_sim)/tn));  
%     end
% end
% Steer = zeros(1,length(t_sim));

Steer_input = [t_sim' Steer'];
Fcncal_transctrl_Ts = 0.01;
figure();
subplot(2,1,1)
plot(t_sim,Steer); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (rad)');ylim([-5/3*pi 5/3*pi])
subplot(2,1,2)
plot(t_sim,Accelcmd);title('Accel & Brake'); xlabel('Time (s)'); ylabel('Accel & Brake');ylim([-1 1])


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
plot(t_sim,Acceleration);title('Acceleration'); xlabel('time(s)'); ylabel('Acceleration');ylim([0 1])
subplot(3,1,3)
plot(t_sim,Brake); title('Brake'); xlabel('time(s)'); ylabel('Brake');ylim([0 1])

% yaw_axis_deg = -yaw*180/pi + 450;
% for i = 1:length(yaw)
%     if yaw_axis_deg(i) > 360
%         yaw_axis_deg(i) = yaw_axis_deg(i) - 360;
%     end
% end

figure();
subplot(2,1,1)
plot(t_sim,Velocity); title('Velocity'); xlabel('Time (s)'); ylabel('Velocity (m/s)');
subplot(2,1,2)
plot(t_sim,Yaw); title('Heading angle'); xlabel('Time (s)'); ylabel('Heading angle (rad)');
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
save('ID_inf_Ts_ab1_smooth.mat','Steer','Accelcmd','t_sim','Yaw','Velocity','XYplot','XYVelocity');