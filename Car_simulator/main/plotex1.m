
clc;clear; close all;
load ex1new;
% load Ex5-1_20200802;
% XYplot=XYplot*MR;
% XYplot_sim1=XYplot_sim1*MR;
%% Diagram
figure();
subplot(2,1,1);
plot(t_sim,U2(:,1)*180/pi);%hold on; plot(t_sim, U_ideal(:,1)*180/pi,'-.','LineWidth', 0.5)
title('(a) Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-500  500]);xlim([130  150]);
%axis([160 ,200 ,-500, 500])
legend('Simulator steer angle','Desired steer angle','location','southeast');
subplot(2,1,2) 
plot(t_sim,Acceleration1-Brake1);%hold on; plot (t_sim, Accelcmd,'-.');
title('(b) Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');ylim([-1.5 1.5]);xlim([130  150]);
% subplot(3,1,3) 
% plot(t_sim,Brake1); title('Brake'); xlabel('Time (s)'); ylabel('Brake');ylim([0 1]);
legend('Simulator throttle & brake','Desired throttle & brake','location','southeast');

figure();
plot(t_sim,Steer1*180/pi); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');%ylim([-10*180/pi  10*180/pi]);


figure();
plot(t_sim,Acceleration1);title('Throttle'); xlabel('Time (s)'); ylabel('Throttle');ylim([0 1.2]);


% figure();
% subplot(2,1,1);
% plot(t_sim,U(:,1)*180/pi); hold on; plot(t_sim(:,1:end),U_ideal(:,1)*180/pi,'-.');
% title('Steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');%ylim([-3*180/pi  5.2*180/pi]);
% legend('Vehicle steer angle','Desired steer angle','location','southeast');
% subplot(2,1,2);
% plot(t_sim,U(:,2)); hold on; plot(t_sim(:,1:end-T_delay/Ts),U_ideal(:,2),'-.'); 
% title('Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');%ylim([-0.6 1.2]);
% legend('Vehicle Throttle/brake','Desired Throttle/brake','location','southeast');

% for i=1:3101
%     if U1(i,3)<0.1
%         U1(i,3)=0;
%     end
% end
% figure();
% subplot(3,1,1);
% plot(t_sim,U(:,1)*180/pi); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-3*180/pi  5.2*180/pi]);
% subplot(3,1,2) 
% plot(t_sim,U(:,2));title('Throttle'); xlabel('Time (s)'); ylabel('Throttle');ylim([0 1.2]);
% subplot(3,1,3) 
% plot(t_sim,U(:,3)); title('Brake'); xlabel('Time (s)'); ylabel('Brake');ylim([0 1]);

clear Desired_Heading_angle Desired_Velocity
Sample_N = 20;
for i = 1:fix(length(t_sim)/Sample_N)+1
    t_sample(i,:) = t_sim(:,1 + (i-1)*Sample_N);
    Desired_Velocity(i,:) = Velocity(1 + (i-1)*Sample_N,1);
    Desired_Heading_angle(i,:) = Yaw(1 + (i-1)*Sample_N,1);
end

figure();
subplot(2,1,1);
plot(t_sim, Y1(:,1)); hold on; plot(t_sample,Desired_Velocity,'.','LineWidth', 0.6)
title('(a) Desired velocity vs. Simulator updated velocity'); xlabel('Time (s)');ylabel('Velocity (m/s)');
ylim([0 15]);
legend('Simulator updated velocity','Desired velocity','location','southeast')
subplot(2,1,2);
plot(t_sim, Y1(:,2)*180/pi); hold on; plot(t_sample,Desired_Heading_angle*180/pi,'.','LineWidth', 0.6);
title('(b) Desired heading angle vs. Simulator updated heading angle'); xlabel('Time (s)');ylabel('Heading angle (degree)');
legend('Simulator updated heading angle','Desired heading angle','location','southeast');%ylim([-100 100]);

figure();
plot(t_sim, Y1(:,1));hold on; plot(t_sim,Velocity_updated(:,1),'.-.')
xlabel('Time (s)');ylabel('Velocity (m/s)');
legend('Simulator updated velocity','Desired velocity','location','southeast')
title('Desired velocity vs. Simulator updated velocity');

figure();
subplot(2,1,1);
plot(t_sim, Y1(:,1)); hold on; plot(t_sample,Desired_Velocity,'.','LineWidth', 0.6)
xlabel('Time (s)');ylabel('Velocity (m/s)');%xlim([0 260]);
ylim([0 15]);
legend('Simulator velocity','Desired velocity','location','southeast')
title('(a) Desired velocity vs. Simulator velocity');
subplot(2,1,2);
plot(t_sim, Y1(:,2)*180/pi); hold on; plot(t_sample,Desired_Heading_angle*180/pi,'.','LineWidth', 0.6);
legend('Simulator heading angle','Desired heading angle','location','southeast');%ylim([-100 100]);
xlabel('Time (s)');ylabel('Heading angle (degree)');
title('(b) Desired heading angle vs. Simulator heading angle');


clear XYplot_s XYplot_sim_s
Sample_N = 10;
for i = 1:fix(length(t_sim)/Sample_N)
    XYplot_s(i,:) = XYplot(1 + (i)*Sample_N,:);
    XYplot_sim_s(i,:) = XYplot_sim1(1 + (i)*Sample_N,:);
end
A=50; B=100;
figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r .-.');
hold on;
plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b');% xlim([-2 2]);
title('Paths');xlabel('Y (m)'); ylabel('X (m)');
legend('Desired path', 'Simulator path','location','southwest');

figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r x');
hold on;
plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b ');
plot(XYplot_s(A,2),XYplot_s(A,1),'* k');
title('Paths @ A');xlabel('Y (m)'); ylabel('X (m)');
ylim([XYplot_s(A,1)-0.005, XYplot_s(A,1)+0.005]);xlim([XYplot_s(A,2)-0.005, XYplot_s(A,2)+0.005]);
legend('Desired path', 'Simulator path','location','southwest');

figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r x');
hold on;
plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b ');
plot(XYplot_s(B,2),XYplot_s(B,1),'* k');
title('Paths @ B');xlabel('Y (m)'); ylabel('X (m)');
ylim([XYplot_s(B,1)-0.005, XYplot_s(B,1)+0.005]);xlim([XYplot_s(B,2)-0.005, XYplot_s(B,2)+0.005]);
legend('Desired path', 'Simulator path','location','southwest');
% 
figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r -.');
hold on;
plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b ');
plot(XYplot(end,2),XYplot(end,1),'* k');
title('Paths @ C');xlabel('Y (m)'); ylabel('X (m)');
ylim([XYplot(end,1)-0.05, XYplot(end,1)+0.05]);xlim([XYplot(end,2)-0.05, XYplot(end,2)+0.05]);
legend('Desired path', 'Simulator path','location','southwest');


figure();
subplot(2,1,1);
plot(t_sim, Y1(:,1)-Velocity(:,1));
title('(a) Simulator velocity-desired velocity');
xlabel('Time(s)');ylabel('Error (m/s)');

subplot(2,1,2);
plot(t_sim, (Y1(:,2)-Yaw(:,1))*180/pi);ylim([-5 5])
title('(b) Simulator heading angel error-desired heading angle');
xlabel('Time (s)');ylabel('Error (degree)');


for i=1:length(XYplot)
    XYplotpoint(i,:)=((XYplot(i,1)-XYplot_sim1(i,1))^2+(XYplot(i,2)-XYplot_sim1(i,2))^2)^0.5;
end
figure();
plot(t_sim, (XYplotpoint*100),'k ');

xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in distance');

figure();
plot(t_sim, abs(XYplot(:,1)-XYplot_sim1(:,1))*100,'k ');

xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in X-axis');

figure();
plot(t_sim, abs(XYplot(:,2)-XYplot_sim1(:,2))*100,'k ');

xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in Y-axis');

[Nearst_XY,distance,t] = distance2curve(XYplot,XYplot_sim1,'linear');
% plot(XYplot(:,2),XYplot(:,1),'k-o',XYplot_sim(:,2),XYplot_sim(:,1),'r*')
% hold on
% plot(Nearst_XY(:,2),Nearst_XY(:,1),'g*')

PathX_error = XYplot_sim1(:,1)-Nearst_XY(:,1);
PathY_error = XYplot_sim1(:,2)-Nearst_XY(:,2);
Near_distance_error = sqrt(PathX_error.^2+PathY_error.^2);
figure();
plot(t_sim,(Near_distance_error*100),'k ');
title('Path-tracking error in distance');
xlabel('Time (s)');ylabel('Error (cm)');%ylim([0 3]);

clear XYplot_s XYplot_sim_s
Sample_N = 10;
for i = 1:fix(length(t_sim)/Sample_N)
    XYplot_s(i,:) = XYplot(1 + (i)*Sample_N,:);
    XYplot_sim_s(i,:) = XYplot_sim1(1 + (i)*Sample_N,:);
end

A =50; B =100;
figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r .-.');xlim([-100 1000]);
hold on;
plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b');
plot(XYplot_s(A,2),XYplot_s(A,1),'* k');text(44.68,493.6,'A'); %-268.8,437.6  -472,450 62.75,332.8
plot(XYplot_s(B,2),XYplot_s(B,1),'* k');text(240.6,761.2 ,'B'); %-485.8,869.1  -1333,650  185,243.2
plot(XYplot_s(end,2),XYplot_s(end,1),'* k');text(904.7,670.6,'C'); %-1238,1000  -1750,1127  -173,320
title('Paths');xlabel('Y (m)'); ylabel('X (m)');
legend('Desired path', 'Simulator path','location','southwest');

figure();
plot(t_sim, Lambda(:,1) , 'k');
title('Lambda'); ylabel('\lambda_s_i_m_u_1(\itkT)'); xlabel('Time (s)')