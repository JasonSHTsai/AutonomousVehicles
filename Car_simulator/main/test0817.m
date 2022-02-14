clc;close all; clear;
load oldex1;
load Fictitious_1;


clear Desired_Heading_angle Desired_Velocity
Sample_N = 20;
V1=Y1(:,1);
Yaw1=Y1(:,2);
for i = 1:fix(length(t_sim)/Sample_N)+1
    t_sample(i,:) = t_sim(:,1 + (i-1)*Sample_N);
    Desired_Velocity(i,:) = V1(1 + (i-1)*Sample_N,1);
    Desired_Heading_angle(i,:) = Yaw1(1 + (i-1)*Sample_N,1);
end

figure();
plot(t_sim, Y(:,1)); hold on; plot(t_sample,Desired_Velocity,'.','LineWidth', 0.6)
title('(a) Desired velocity vs. Simulator updated velocity'); xlabel('Time (s)');ylabel('Velocity (m/s)');%xlim([0 260]);
 ylim([0 12]);
legend('Vehicle heading angle','Simulator heading angle','location','southeast')
figure();
plot(t_sim, Y(:,2)); hold on; plot(t_sample,Desired_Heading_angle*180/pi,'.','LineWidth', 0.6);%xlim([0 260]);
title('(b) Desired heading angle vs. Simulator updated heading angle'); xlabel('Time (s)');ylabel('Heading angle (degree)');
legend('Vehicle heading angle','Simulator heading angle','location','southeast');%ylim([-100 100]);

figure();
subplot(2,1,1);
plot(t_sim,U(:,1));%hold on; plot(t_sim, U_ideal(:,1)*180/pi,'-.','LineWidth', 0.5)
title('(a) Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-500  500]);%xlim([130 150]);
%axis([160 ,200 ,-500, 500])
legend('Vehicle steer angle','Desired steer angle','location','southeast');
subplot(2,1,2) 
plot(t_sim,U(:,2));%hold on; plot (t_sim, Accelcmd,'-.');
title('(b) Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');ylim([-1.2 1.2]);%xlim([130 150]);
legend('Vehicle throttle & brake','Desired throttle & brake','location','southeast');