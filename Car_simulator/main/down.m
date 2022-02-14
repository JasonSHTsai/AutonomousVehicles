clear; clc; close all;
warning off
load OKIDGeneralModelfront1; Gso = G; Hso = H; Cso = C; %«emodel
% load OKIDGeneralModelfront1104; Gso = G; Hso = H; Cso = C; 
% load OKIDGeneralModelunivel; Go = G; Ho = H; Co = C; %«ámodel
load OKIDGeneralMiddle_4; Go = G; Ho = H; Co = C; %«ámodel
% load OKIDGeneralMiddle7; Go = G; Ho = H; Co = C;
load OKIDGeneralModelHigh; G_Final = G; H_Final = H; C_Final = C; D_Final = D;
% load ID_High0115; G_Final = G; H_Final = H; C_Final = C; D_Final = D;
load OKIDGeneralModelbrake2; G_Brake = G; H_Brake = H; C_Brake = C; D_Brake = D;
load exTraj_01_9_v4020_sm170_n6812;
T_delay = 0;
Ts = 0.1;Tend = 50+T_delay; Td = 50; Tf = 0.001;
t_sim = 0:Ts:Tend;
Accelcmd=0.1*ones(501,1);
Velocity = Velocity(1:501,:);
XYplot = XYplot(1:501,:);
Yaw = Yaw(1:501,:);
Fcncal_transctrl_Ts = 0.01;
Earlytochange = 2;
Timetochange = 3; %%sec
Earlytochange2 =2;
Timetochange2 = 4.5; %%sec
Upd_end  = 110;
Upd_flag = 1;
Statechange = 0;
Statechange = Timetochange + 10*Ts;
Statechange2 = Timetochange2 + 0*Ts;
Dso = zeros(2,2);Do = zeros(2,2);
DisSYS = ss(Gso,Hso,Cso,Dso,Ts);
[Eigen_G, TransZeros] = pzmap(DisSYS)
Nc = 6;
Np = 6;
n = size(Gso,1);               % No. of states 
m = size(Hso,2);               % No. of inputs
p = size(Cso,1);               % No. of outputs
for i = 1:T_delay/Ts
  Velocity = [Velocity; Velocity(end,:)];
  Yaw = [Yaw; Yaw(end,:)];
  XYplot = [XYplot; XYplot(end,:)];
end

Ref = [Velocity Yaw];
for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end;Ref(end,:)];   
    end
     Rs_part(:,2*i-1:2*i) = [Ref(i+1:end,:); ref_end];
end

for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end;Velocity(end,:)];   
    end
     V_mph_part(:,i) = [Velocity(i+1:end,:); ref_end];
end

for i = 1:Np-1
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end;Velocity(end,:)];   
    end
     V_mph_part_now(:,i) = [Velocity(i+1:end,:); ref_end];
end

for i = 1:Np-1
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end;Yaw(end,:)];   
    end
     Yaw_part_now(:,i) = [Yaw(i+1:end,:); ref_end];
end

for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end;Yaw(end,:)];   
    end
     Yaw_part(:,i) = [Yaw(i+1:end,:); ref_end];
end
Yaw_part_ref = [Yaw(2:end,:); Yaw(end,:)];
pp = [0 0 1; Ts^2 Ts 1; 4*Ts^2 2*Ts 1];
vvX = [XYplot(end-2,1); XYplot(end-1,1); XYplot(end,1)];
abcX = inv(pp)*vvX;
vvY = [XYplot(end-2,2); XYplot(end-1,2); XYplot(end,2)];
abcY = inv(pp)*vvY;
for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end; [polyval( abcX,(j+2)*Ts), polyval(abcY,(j+2)*Ts)]];   
    end
     XYplot_part(:,2*i-1:2*i) = [XYplot(i+1:end,:); ref_end];
end


XYplot_X = [];pick_num = 2;
for i = 1:length(t_sim) 
   if i <= pick_num/2
       XYplot_X(:,i) = XYplot(1:pick_num,1);
   elseif i+pick_num/2 <= length(t_sim)
       XYplot_X(:,i) = XYplot(i-pick_num/2:i+pick_num/2-1,1);
   else 
       XYplot_X(:,i) = XYplot(end-pick_num+1:end,1);
   end
end

XYplot_Y = [];
for i = 1:length(t_sim) 
   if i <= pick_num/2
       XYplot_Y(:,i) = XYplot(1:pick_num,2);
   elseif i+pick_num/2 <= length(t_sim)
       XYplot_Y(:,i) = XYplot(i-pick_num/2:i+pick_num/2-1,2);
   else 
       XYplot_Y(:,i) = XYplot(end-pick_num+1:end,2);
   end
end

Rs = [t_sim' Rs_part];
Rs_V = [t_sim' V_mph_part];
Rs_Y = [t_sim' Yaw_part];
Rs_V_now = [t_sim' [Velocity V_mph_part_now]];
Rs_Y_now = [t_sim' [Yaw Yaw_part_now]];
Endpoint = XYplot(end,:);
% XY_Ref = [t_sim' XYplot_part];
XY_Ref_Upd = [t_sim' XYplot_part];
XYplot_X = [t_sim' XYplot_X'];
XYplot_Y = [t_sim' XYplot_Y'];
[select_MPC, select_overlap, slope]= select_model(Velocity,Accelcmd,Np);
select_MPC(415:417,:)=4;select_overlap(405:414,:)=4;select_overlap(415:417,:)=2;
select_MPC = [t_sim' select_MPC];
select_overlap = [t_sim' select_overlap];
Accelcmd_ref = [t_sim' Accelcmd];
Yaw_Ref = [t_sim' Yaw_part_ref];
T_sim = [t_sim' t_sim'];
Heading_end = Yaw(end,:);

%% Observer and Mpc

Qo = 1e18*eye(size(Go)); 
Qso = 1e20*eye(size(Gso)); 
Qho = 1e20*eye(size(Gso)); 
Qbo = 1e20*eye(size(Gso)); 
[Gsd,Hsd,Lsd] = Auxi_HG_Observer(Gso,Hso,Cso,Dso,Ts,Qso);
[Gd,Hd,Ld] = Auxi_HG_Observer(Go,Ho,Co,Do,Ts,Qo);
[Gd_Final,Hd_Final,Ld_Final] = Auxi_HG_Observer(G_Final,H_Final,C_Final,D_Final,Ts,Qho);
[Gd_Brake,Hd_Brake,Ld_Brake] = Auxi_HG_Observer(G_Brake,H_Brake,C_Brake,D_Brake,Ts,Qbo);
y0 = Ref(1,:);
xho = Lsd*y0';
R_bar = 6e-5*eye(m*Nc); 
for i= 1:2:m*Np
    R_bar(i,i) =6e-5;
end
Qc = eye(p*Np);
for i  = 1:2:p*Np
    Qc(i,i) = 0.0015;
end


[phis,Fs] = mpcgain_okid3(Gsd,Hsd,Cso,Dso,Lsd,Nc,Np);
[phi,F] = mpcgain_okid3(Gd,Hd,Co,Do,Ld,Nc,Np);
[phi_Final,F_Final] = mpcgain_okid3(Gd_Final,Hd_Final,C_Final,D_Final,Ld_Final,Nc,Np);
[phi_Brake,F_Brake] = mpcgain_okid3(Gd_Brake,Hd_Brake,C_Brake,D_Brake,Ld_Brake,Nc,Np);

M = [ eye(m*Nc); 
     -eye(m*Nc);
      eye(m*Nc); 
     -eye(m*Nc);
     ];

 
 u1_max =  5/3*pi; u1_min = -5/3*pi;
u2_max = 1; u2_min = -1;
 
 U_max = []; U_min = [];
for i = 1:Np
    U_max = [U_max; [u1_max; u2_max]];
    U_min = [U_min; [-u1_min; -u2_min]];
end
 
JEs = 2*(phis'*Qc*phis+R_bar);
JE = 2*(phi'*Qc*phi+R_bar); 
JE_Final = 2*(phi_Final'*Qc*phi_Final+R_bar);
JE_Brake = 2*(phi_Brake'*Qc*phi_Brake+R_bar); 

JF_parts = -2*phis'*Qc;
JF_part = -2*phi'*Qc;
JF_part_Final = -2*phi_Final'*Qc;
JF_part_Brake = -2*phi_Brake'*Qc;

%% Parameters of Simulator Front 
G_Front = Gso; H_Front = Hso; C_Front = Cso; Ld_Front = Lsd; Gd_Front = Gsd; Hd_Front = Hsd;
JE_Front = JEs; phi_Front = phis; F_Front = Fs;
C_sim_Front = inv(eye(p)-C_Front*Ld_Front)*C_Front*(eye(n)-Ld_Front*C_Front);

C_sys_Front = C_sim_Front - C_Front;
G_sys_Front = (eye(n)+Ld_Front*C_sys_Front)*G_Front;
H_sys_Front = (eye(n)+Ld_Front*C_sys_Front)*H_Front;

C_out_Front = (C_sim_Front-C_Front*(eye(n)+Ld_Front*C_sys_Front))*G_Front;
D_out_Front = (C_sim_Front-C_Front*(eye(n)+Ld_Front*C_sys_Front))*H_Front;
%% Parameters of Simulator Middle 
G_Middle = Go; H_Middle = Ho; C_Middle = Co; Ld_Middle = Ld; Gd_Middle = Gd; Hd_Middle = Hd;
JE_Middle = JE; phi_Middle = phi; F_Middle = F;
C_sim_Middle = inv(eye(p)-C_Middle*Ld_Middle)*C_Middle*(eye(n)-Ld_Middle*C_Middle);

C_sys_Middle = C_sim_Middle - C_Middle;
G_sys_Middle = (eye(n)+Ld_Middle*C_sys_Middle)*G_Middle;
H_sys_Middle = (eye(n)+Ld_Middle*C_sys_Middle)*H_Middle;

C_out_Middle = (C_sim_Middle-C_Middle*(eye(n)+Ld_Middle*C_sys_Middle))*G_Middle;
D_out_Middle = (C_sim_Middle-C_Middle*(eye(n)+Ld_Middle*C_sys_Middle))*H_Middle;
%% Parameters of Simulator Final
G_Final = G_Final; H_Final = H_Final; C_Final = C_Final; Ld_Final = Ld_Final; Gd_Final = Gd_Final; Hd_Final = Hd_Final;
JE_Final = JE_Final; phi_Final = phi_Final; F_Final = F_Final;
C_sim_Final = inv(eye(p)-C_Final*Ld_Final)*C_Final*(eye(n)-Ld_Final*C_Final);

C_sys_Final = C_sim_Final - C_Final;
G_sys_Final = (eye(n)+Ld_Final*C_sys_Final)*G_Final;
H_sys_Final = (eye(n)+Ld_Final*C_sys_Final)*H_Final;

C_out_Final = (C_sim_Final-C_Final*(eye(n)+Ld_Final*C_sys_Final))*G_Final;
D_out_Final = (C_sim_Final-C_Final*(eye(n)+Ld_Final*C_sys_Final))*H_Final;
%% Parameters of Simulator Brake
G_Brake = G_Brake; H_Brake = H_Brake; C_Brake = C_Brake; Ld_Brake = Ld_Brake; Gd_Brake = Gd_Brake; Hd_Brake = Hd_Brake;
JE_Brake = JE_Brake; phi_Brake = phi_Brake; F_Brake = F_Brake;
C_sim_Brake = inv(eye(p)-C_Brake*Ld_Brake)*C_Brake*(eye(n)-Ld_Brake*C_Brake);

C_sys_Brake = C_sim_Brake - C_Brake;
G_sys_Brake = (eye(n)+Ld_Brake*C_sys_Brake)*G_Brake;
H_sys_Brake = (eye(n)+Ld_Brake*C_sys_Brake)*H_Brake;

C_out_Brake = (C_sim_Brake-C_Brake*(eye(n)+Ld_Brake*C_sys_Brake))*G_Brake;
D_out_Brake = (C_sim_Brake-C_Brake*(eye(n)+Ld_Brake*C_sys_Brake))*H_Brake;
%% Sim
tic
sim('ISReferenceApplication');
toc

%% Diagram
if length(Y) == length(t_sim)
close all;

figure();
subplot(3,1,1);
plot(tout,Steer*180/pi); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-3*180/pi  5.2*180/pi]);
subplot(3,1,2) 
plot(tout,Acceleration);title('Throttle'); xlabel('Time (s)'); ylabel('Throttle');ylim([0 1.2]);
subplot(3,1,3) 
plot(tout,Brake); title('Brake'); xlabel('Time (s)'); ylabel('Brake');ylim([0 1]);

figure();
subplot(2,1,1);
plot(t_sim,U(:,1)*180/pi); hold on; %plot(t_sim(:,1:end),steer(:,1)*180/pi,'-.');
title('Steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');%ylim([-3*180/pi  5.2*180/pi]);
legend('Vehicle steer angle','Desired steer angle','location','southeast');
subplot(2,1,2);
plot(t_sim,U(:,2)); hold on; %plot(t_sim(:,1:end-T_delay/Ts),Accelcmd(:,1),'-.'); 
title('Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');%ylim([-0.6 1.2]);
legend('Vehicle Throttle/brake','Desired Throttle/brake','location','southeast');
figure();
plot(t_sim, Y(:,1)); hold on; plot(t_sim,Velocity,'-.')
title('Desired velocity vs. Vehicle velocity'); xlabel('Time (s)');ylabel('Velocity (m/s)');
legend('Vehicle velocity','Desired velocity','location','southeast')

figure();
plot(t_sim, Y(:,2)); hold on; plot(t_sim,Yaw,'-.')
title('Desired heading angle vs. Vehicle heading angle'); xlabel('Time (s)');ylabel('Heading angle (rad/s)');
legend('Vehicle heading angle','Desired heading angle','location','southeast')


clear XYplot_s XYplot_sim_s
Sample_N = 10;
for i = 1:fix(length(t_sim)/Sample_N)
    XYplot_s(i,:) = XYplot((i)*Sample_N,:);
    XYplot_sim_s(i,:) = XYplot_sim((i)*Sample_N,:);
end

figure();
plot(XYplot_s(:,2),XYplot_s(:,1),'r X');
hold on;
plot(XYplot_sim(:,2),XYplot_sim(:,1),'b');
title('Paths');xlabel('Y (m)'); ylabel('X (m)');
legend('Desired path', 'Vehicle path','location','southwest');

figure();
plot(t_sim, Velocity-Y(:,1));
title('Velocity error');

figure();
plot(t_sim, Yaw-Y(:,2));
title('Headind error');

figure();
for i=1:length(t_sim)
XY(i,1)=((XYplot_sim(i,1)-XYplot(i,1))^2+(XYplot_sim(i,2)-XYplot(i,2))^2)^0.5;
end
plot(t_sim,XY);
title('point error');

end