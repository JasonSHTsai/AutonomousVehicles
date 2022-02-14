%% Loading
clear; clc; close all;warning off;
location = 'C:\meeting\20210812\Car_simulator\ID_model\';

%% Paper Ex1 (Fictitious path Ex1)
% load Steer0_inf4;Heading = Yaw;clear 'Yaw';
% U_ideal = [Steer Accelcmd];
% cont = 7; 
% M7sel = 1;
%% Paper Ex2 (Fictitious path Ex2)
% load ID_inf_example;Heading = Yaw;clear 'Yaw';
% U_ideal = [Steer Accelcmd];
% cont = 7;
% M7sel = 2;
%%  Paper Ex3 (Real path Ex3)
load ('ex_3_20200627','Velocity', 'Yaw', 'XYplot');Heading = Yaw;
load ('rot_Ex5-3','MR', 'invMR');
cont = 40;
M7sel = 2;
%% (Real path Ex2)
% load ('ex_2_20200627','Velocity', 'Yaw', 'XYplot');Heading = Yaw;
% load ('rot_Ex5-2','MR', 'invMR');
% cont = 40;
% M7sel = 2;
%% Part 1 Fig. 7 Testing (Real path Ex1)
% load('Ex5-1_20200802','Velocity', 'Yaw', 'XYplot');Heading = Yaw;
% load ('rot_Ex5-1','MR', 'invMR');
% cont = 40;
% M7sel = 2;

%% Models
%% 低速加速(LA)
%%   右轉:LAR 1 
    file = 'LAR_best.mat';
    load([location file],'G', 'H', 'C', 'D');
    [Gok_1, Hok_1, Cok_1, Dok_1,Qc_1,Rc_1 ,Qok_1] = initial( G, H, C, D, 1e0, 8.5e-4, 3e-5, 3e-5, 1e6); %(方向角,速度,油門,方向盤)
%%   左轉:LAL 2
     file = 'LAL_best.mat';
     load([location file],'G', 'H', 'C', 'D');
     [Gok_2, Hok_2, Cok_2, Dok_2,Qc_2,Rc_2 ,Qok_2] = initial( G, H, C, D, 1e0, 1.5e1, 6e-2, 6e-4, 1e6);
%%   直線:LAS 3
    file = 'LAS_19_best.mat';
    load([location file],'G', 'H', 'C', 'D');
    [Gok_3, Hok_3, Cok_3, Dok_3,Qc_3,Rc_3 ,Qok_3] = initial( G, H, C, D, 1e0, 1.5e-3, 1e-5, 1e-5, 1e6);
%% 低速減速(LB)
%%   直線:LBS 4 (Fictitious path Ex1低速減速直線)
    file = 'LBS0120_best.mat';
    load([location file],'G', 'H', 'C', 'D');
    [Gok_4, Hok_4, Cok_4, Dok_4,Qc_4,Rc_4 ,Qok_4] = initial( G, H, C, D, 1e0, 8.5e-4, 3e-5, 3e-5, 1e6);
%%   直線:LBS 5 (Real path Ex3路徑低速減速直線)
    load ('OKIDGeneralMiddle_4','G', 'H', 'C', 'D'); %學長中速轉彎
    [Gok_5, Hok_5, Cok_5, Dok_5,Qc_5,Rc_5 ,Qok_5] = initial( G, H, C, D,1e0, 2e-2, 4e-3, 1e0, 1e6);
%%   直線:LBS 6 (Real path Ex1, 2路徑低速減速直線)
    file = 'LBS0120_best_old.mat'; 
    load([location file],'G', 'H', 'C', 'D');
    [Gok_6, Hok_6, Cok_6, Dok_6,Qc_6,Rc_6 ,Qok_6] = initial( G, H, C, D,9e3, 8.5e3, 3e-2, 3e-5, 1e6);
%% 中速
%%   全部:M 7 (中速)
    load ('OKIDGeneralMiddle_4','G', 'H', 'C', 'D'); %學長中速轉彎
    switch M7sel
        case 1
            [Gok_7, Hok_7, Cok_7, Dok_7,Qc_7,Rc_7 ,Qok_7] = initial( G, H, C, D, 1e0, 8.5e-4, 1.8e-3, 6e-4, 1e6); % Fictitious path Ex1
        case 2
            [Gok_7, Hok_7, Cok_7, Dok_7,Qc_7,Rc_7 ,Qok_7] = initial( G, H, C, D, 1e0, 1.5e-3, 6e-5, 6e-5, 1e6); %其他
    end
%% 高速加速(HA)
%%   右轉含直線:HAR 8
    file = 'HAR_426_best_0105.mat';
    load([location file],'G', 'H', 'C', 'D');
    [Gok_8, Hok_8, Cok_8, Dok_8,Qc_8,Rc_8 ,Qok_8] = initial( G, H, C, D, 1e0, 1.5e-3, 6e-5, 6e-5, 1e6);
%%   左轉含直線:HAL 9
    file = 'HAL_430_best.mat';
    load([location file],'G', 'H', 'C', 'D');
    [Gok_9, Hok_9, Cok_9, Dok_9,Qc_9,Rc_9 ,Qok_9] = initial( G, H, C, D, 1e0, 1.5e-3, 6e-5, 6e-5, 1e6);

%% Setting Initial Parameters
Ts = 0.1;Tf = 0.001;Td = 50; 
Tend = (length(XYplot)-1)*Ts;
tsim = (0:Ts:Tend)';
Fcncal_transctrl_Ts = 0.01;

Nc = 6;
Np = 6;
n = size(Gok_1,1);               % No. of states 
m = size(Hok_1,2);               % No. of inputs
p = size(Cok_1,1);               % No. of outputs
Y_ideal = [Velocity Heading];
Ref = [Velocity Heading];
ro = Ref(1,:)';
%-----------------產生Rs方法:插值延伸Np筆-----------------
pp = [0 0 1; Ts^2 Ts 1; 4*Ts^2 2*Ts 1];
vvX = [Ref(end-2,1); Ref(end-1,1); Ref(end,1)];
abcX = inv(pp)*vvX;
vvY = [Ref(end-2,2); Ref(end-1,2); Ref(end,2)];
abcY = inv(pp)*vvY;
for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end; [polyval( abcX,(j+2)*Ts), polyval(abcY,(j+2)*Ts)]];   
    end
     Rs_part(:,2*i-1:2*i) = [Ref(i+1:end,:); ref_end];
end

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
%-----------------產生Rs方法:插值延伸Np筆-----------------
Rs = [tsim Rs_part];
XY_Ref_Upd = [tsim XYplot_part];
T_sim = [tsim tsim];

%% Select model
[Acceleration,Angular_acceleration,temp,select_MPC] = select_model_0222(Velocity,Heading,3.75,12,25,8,2);
select_MPC = [tsim select_MPC];

%% Observer
[Gd_1,Hd_1,Ld_1] = Auxi_HG_Observer(Gok_1,Hok_1,Cok_1,Dok_1,Ts,Qok_1);
[Gd_2,Hd_2,Ld_2] = Auxi_HG_Observer(Gok_2,Hok_2,Cok_2,Dok_2,Ts,Qok_2);
[Gd_3,Hd_3,Ld_3] = Auxi_HG_Observer(Gok_3,Hok_3,Cok_3,Dok_3,Ts,Qok_3);
[Gd_4,Hd_4,Ld_4] = Auxi_HG_Observer(Gok_4,Hok_4,Cok_4,Dok_4,Ts,Qok_4);
[Gd_5,Hd_5,Ld_5] = Auxi_HG_Observer(Gok_5,Hok_5,Cok_5,Dok_5,Ts,Qok_5);
[Gd_6,Hd_6,Ld_6] = Auxi_HG_Observer(Gok_6,Hok_6,Cok_6,Dok_6,Ts,Qok_6);
[Gd_7,Hd_7,Ld_7] = Auxi_HG_Observer(Gok_7,Hok_7,Cok_7,Dok_7,Ts,Qok_7);
[Gd_8,Hd_8,Ld_8] = Auxi_HG_Observer(Gok_8,Hok_8,Cok_8,Dok_8,Ts,Qok_8);
[Gd_9,Hd_9,Ld_9] = Auxi_HG_Observer(Gok_9,Hok_9,Cok_9,Dok_9,Ts,Qok_9);

%% Select overlap
select_overlap2=zeros(length(select_MPC),1);
select_overlap=zeros(length(select_MPC),1);
for i=1:length(select_MPC)-1
    if(select_MPC(i,2)~=select_MPC(i+1,2))
        j=1;
        
        next_Model=select_MPC(i+1,2);
        temp=(eval(['Gok_',num2str(next_Model)]))-(eval(['Ld_',num2str(next_Model)]))*(eval(['Cok_',num2str(next_Model)]))*(eval(['Gok_',num2str(next_Model)]));
        while(1)
            farthest_pole=0;
            tt = eig(temp^j);
            for k=1:length(tt)
                if(farthest_pole<=norm(tt(k,1)))
                    farthest_pole=norm(tt(k,1));
                end
            end
            if(farthest_pole<0.02 || j>=8) %5:0.2/8:0.02
                break
            end
            j=j+1;
        end
    
        for z=1:j
            if((i+1-z) == 0)
                break;
            end
            if(select_overlap(i+1-z)==0)
                select_overlap(i+1-z)=next_Model;
            else
                select_overlap2(i+1-z)=next_Model;
            end
        end
    end
end
select_overlap = [tsim select_overlap];
select_overlap2 = [tsim select_overlap2];

%% Open simulator (j)  X sampling times before switch and close simulator (i) after switch
[flag_mod1,flag_mod2,flag_mod3,flag_mod4,flag_mod5,flag_mod6,flag_mod7,flag_mod8,flag_mod9] = modelswitch(select_MPC, select_overlap, tsim);

%% Constraints parameters and HQP
 M = [ eye(m*Nc); 
     -eye(m*Nc);
      eye(m*Nc); 
     -eye(m*Nc);
     ];
u1_max =  3*pi; u1_min = -3*pi;
u2_max = 1; u2_min = -1;
U_max = []; U_min = [];
for i = 1:Np
    U_max = [U_max; [u1_max; u2_max]];
    U_min = [U_min; [-u1_min; -u2_min]];
end

[phi_1,F_1] = mpcgain_okid3(Gd_1,Hd_1,Cok_1,Dok_1,Ld_1,Nc,Np);
[phi_2,F_2] = mpcgain_okid3(Gd_2,Hd_2,Cok_2,Dok_2,Ld_2,Nc,Np);
[phi_3,F_3] = mpcgain_okid3(Gd_3,Hd_3,Cok_3,Dok_3,Ld_3,Nc,Np);
[phi_4,F_4] = mpcgain_okid3(Gd_4,Hd_4,Cok_4,Dok_4,Ld_4,Nc,Np);
[phi_5,F_5] = mpcgain_okid3(Gd_5,Hd_5,Cok_5,Dok_5,Ld_5,Nc,Np);
[phi_6,F_6] = mpcgain_okid3(Gd_6,Hd_6,Cok_6,Dok_6,Ld_6,Nc,Np);
[phi_7,F_7] = mpcgain_okid3(Gd_7,Hd_7,Cok_7,Dok_7,Ld_7,Nc,Np);
[phi_8,F_8] = mpcgain_okid3(Gd_8,Hd_8,Cok_8,Dok_8,Ld_8,Nc,Np);
[phi_9,F_9] = mpcgain_okid3(Gd_9,Hd_9,Cok_9,Dok_9,Ld_9,Nc,Np);

JE_1 = 2*(phi_1'*Qc_1*phi_1+Rc_1);
JE_2 = 2*(phi_2'*Qc_2*phi_2+Rc_2);
JE_3 = 2*(phi_3'*Qc_3*phi_3+Rc_3);
JE_4 = 2*(phi_4'*Qc_4*phi_4+Rc_4);
JE_5 = 2*(phi_5'*Qc_5*phi_5+Rc_5);
JE_6 = 2*(phi_6'*Qc_6*phi_6+Rc_6);
JE_7 = 2*(phi_7'*Qc_7*phi_7+Rc_7);
JE_8 = 2*(phi_8'*Qc_8*phi_8+Rc_8);
JE_9 = 2*(phi_9'*Qc_9*phi_9+Rc_9);

JF_part_1 = -2*phi_1'*Qc_1;
JF_part_2 = -2*phi_2'*Qc_2;
JF_part_3 = -2*phi_3'*Qc_3;
JF_part_4 = -2*phi_4'*Qc_4;
JF_part_5 = -2*phi_5'*Qc_5;
JF_part_6 = -2*phi_6'*Qc_6;
JF_part_7 = -2*phi_7'*Qc_7;
JF_part_8 = -2*phi_8'*Qc_8;
JF_part_9 = -2*phi_9'*Qc_9;

%% Parameters of Simulators
Csim_1 = inv(eye(p)-Cok_1*Ld_1)*Cok_1*(eye(n)-Ld_1*Cok_1);
Csys_1 = Csim_1-Cok_1;
Gsys_1 = (eye(n)+Ld_1*Csys_1)*Gok_1;
Hsys_1 = (eye(n)+Ld_1*Csys_1)*Hok_1;
Cout_1 = (Csim_1-Cok_1*(eye(n)+Ld_1*Csys_1))*Gok_1;
Dout_1 = (Csim_1-Cok_1*(eye(n)+Ld_1*Csys_1))*Hok_1;

Csim_2 = inv(eye(p)-Cok_2*Ld_2)*Cok_2*(eye(n)-Ld_2*Cok_2);
Csys_2 = Csim_2-Cok_2;
Gsys_2 = (eye(n)+Ld_2*Csys_2)*Gok_2;
Hsys_2 = (eye(n)+Ld_2*Csys_2)*Hok_2;
Cout_2 = (Csim_2-Cok_2*(eye(n)+Ld_2*Csys_2))*Gok_2;
Dout_2 = (Csim_2-Cok_2*(eye(n)+Ld_2*Csys_2))*Hok_2;

Csim_3 = inv(eye(p)-Cok_3*Ld_3)*Cok_3*(eye(n)-Ld_3*Cok_3);
Csys_3 = Csim_3-Cok_3;
Gsys_3 = (eye(n)+Ld_3*Csys_3)*Gok_3;
Hsys_3 = (eye(n)+Ld_3*Csys_3)*Hok_3;
Cout_3 = (Csim_3-Cok_3*(eye(n)+Ld_3*Csys_3))*Gok_3;
Dout_3 = (Csim_3-Cok_3*(eye(n)+Ld_3*Csys_3))*Hok_3;

Csim_4 = inv(eye(p)-Cok_4*Ld_4)*Cok_4*(eye(n)-Ld_4*Cok_4);
Csys_4 = Csim_4-Cok_4;
Gsys_4 = (eye(n)+Ld_4*Csys_4)*Gok_4;
Hsys_4 = (eye(n)+Ld_4*Csys_4)*Hok_4;
Cout_4 = (Csim_4-Cok_4*(eye(n)+Ld_4*Csys_4))*Gok_4;
Dout_4 = (Csim_4-Cok_4*(eye(n)+Ld_4*Csys_4))*Hok_4;

Csim_5 = inv(eye(p)-Cok_5*Ld_5)*Cok_5*(eye(n)-Ld_5*Cok_5);
Csys_5 = Csim_5-Cok_5;
Gsys_5 = (eye(n)+Ld_5*Csys_5)*Gok_5;
Hsys_5 = (eye(n)+Ld_5*Csys_5)*Hok_5;
Cout_5 = (Csim_5-Cok_5*(eye(n)+Ld_5*Csys_5))*Gok_5;
Dout_5 = (Csim_5-Cok_5*(eye(n)+Ld_5*Csys_5))*Hok_5;

Csim_6 = inv(eye(p)-Cok_6*Ld_6)*Cok_6*(eye(n)-Ld_6*Cok_6);
Csys_6 = Csim_6-Cok_6;
Gsys_6 = (eye(n)+Ld_6*Csys_6)*Gok_6;
Hsys_6 = (eye(n)+Ld_6*Csys_6)*Hok_6;
Cout_6 = (Csim_6-Cok_6*(eye(n)+Ld_6*Csys_6))*Gok_6;
Dout_6 = (Csim_6-Cok_6*(eye(n)+Ld_6*Csys_6))*Hok_6;

Csim_7 = inv(eye(p)-Cok_7*Ld_7)*Cok_7*(eye(n)-Ld_7*Cok_7);
Csys_7 = Csim_7-Cok_7;
Gsys_7 = (eye(n)+Ld_7*Csys_7)*Gok_7;
Hsys_7 = (eye(n)+Ld_7*Csys_7)*Hok_7;
Cout_7 = (Csim_7-Cok_7*(eye(n)+Ld_7*Csys_7))*Gok_7;
Dout_7 = (Csim_7-Cok_7*(eye(n)+Ld_7*Csys_7))*Hok_7;

Csim_8 = inv(eye(p)-Cok_8*Ld_8)*Cok_8*(eye(n)-Ld_8*Cok_8);
Csys_8 = Csim_8-Cok_8;
Gsys_8 = (eye(n)+Ld_8*Csys_8)*Gok_8;
Hsys_8 = (eye(n)+Ld_8*Csys_8)*Hok_8;
Cout_8 = (Csim_8-Cok_8*(eye(n)+Ld_8*Csys_8))*Gok_8;
Dout_8 = (Csim_8-Cok_8*(eye(n)+Ld_8*Csys_8))*Hok_8;

Csim_9 = inv(eye(p)-Cok_9*Ld_9)*Cok_9*(eye(n)-Ld_9*Cok_9);
Csys_9 = Csim_9-Cok_9;
Gsys_9 = (eye(n)+Ld_9*Csys_9)*Gok_9;
Hsys_9 = (eye(n)+Ld_9*Csys_9)*Hok_9;
Cout_9 = (Csim_9-Cok_9*(eye(n)+Ld_9*Csys_9))*Gok_9;
Dout_9 = (Csim_9-Cok_9*(eye(n)+Ld_9*Csys_9))*Hok_9;

%% Sim
tic;
sim('ISReferenceApplication');
toc;

if exist('MR') ~= 0
    XYplot = XYplot*MR;
    XYplot_sim1 = XYplot_sim1*MR;
end

%% 繪圖前轉換
Steer1 = 180/pi*Steer1;
Y_sim(:,2) = 180/pi*Y_sim(:,2);
Y_ideal(:,2) = 180/pi*Y_ideal(:,2);
Heading = 180/pi*Heading;
Heading_updated(:,1) = 180/pi*Heading_updated(:,1);
SystemError_sim(:,2) = 180/pi*SystemError_sim(:,2);
OutputError_sim(:,2) = 180/pi*OutputError_sim(:,2);

%% Inputs and outputs for identifying Models 1, 4, and 7 (Fig. 4)
% Steer = 180/pi*Steer;
% figure();
% subplot(2,1,1);
% plot(tsim, Steer);hold on; 
% title('Steer angle');xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-110 110]);
% subplot(2,1,2);
% plot(tsim, Accelcmd);hold on; 
% title('Throttle & Brake');xlabel('Time (s)'); ylabel('Throttle & Brake');ylim([-0.2 0.8]);
% 
% figure();
% subplot(2,1,1);
% plot(tsim, Velocity);hold on; 
% title('Velocity');xlabel('Time (s)'); ylabel('Velocity (m/s)');
% subplot(2,1,2);
% plot(tsim, Heading);hold on; 
% title('Heading angle');xlabel('Time (s)'); ylabel('Heading angle (deg)');
%% Inputs and outputs for identifying Models 3 and 8 (Fig. 5)
% Steer = 180/pi*Steer;
% figure();
% subplot(2,1,1);
% plot(tsim, Steer);hold on; 
% title('Steer angle');xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-300 300]);
% subplot(2,1,2);
% plot(tsim, Accelcmd);hold on; 
% title('Throttle & Brake');xlabel('Time (s)'); ylabel('Throttle & Brake');ylim([-0.5 1.2]);
% 
% figure();
% subplot(2,1,1);
% plot(tsim, Velocity);hold on; 
% title('Velocity');xlabel('Time (s)'); ylabel('Velocity (m/s)');
% subplot(2,1,2);
% plot(tsim, Heading);hold on; 
% title('Heading angle');xlabel('Time (s)'); ylabel('Heading angle (deg)');
%% Plot simulator and ideal control inputs (Fig. 10, 19)
% U_ideal(:,1) = 180/pi*U_ideal(:,1);
% figure();
% subplot(2,1,1);
% plot(tsim, Steer1); hold on; plot(tsim, U_ideal(:,1),'-.','LineWidth', 0.5);
% title('(a) Steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');
% ylim([-300 300]);
% legend('Simulator steer angle','Desired steer angle','location','southeast');
% subplot(2,1,2);
% plot(tsim, Acceleration1-Brake1); hold on; plot (tsim, U_ideal(:,2),'-.','LineWidth', 0.5);
% title('(b) Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');
% ylim([-0.6 1.2]);
% legend('Simulator throttle & brake','Desired throttle & brake','location','southeast');
%% Plot simulator control inputs (Fig. 15(b), 24(b))
% figure();
% subplot(3,1,1);
% plot(tsim, Steer1);
% title('Simulator steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');
% ylim([-300 300]);
% subplot(3,1,2);
% plot(tsim, Acceleration1);
% title('Simulator throttle'); xlabel('Time (s)'); ylabel('Throttle');
% ylim([0 1.2]);
% subplot(3,1,3);
% plot(tsim, Brake1);
% title('Simulator brake'); xlabel('Time (s)'); ylabel('Brake');
% ylim([0 1.2]);
%% Plot simulator control inputs (Fig. 29, 30)
figure();
subplot(2,1,1);
plot(tsim, Steer1);
title('(a) Steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');
% xlim([160 200]);
subplot(2,1,2);
plot(tsim, Acceleration1-Brake1);
title('(b) Throttle & Brake'); xlabel('Time (s)'); ylabel('Throttle & Brake');
% xlim([160 200]);
%% Plot simulator and ideal control inputs (Seperate)
% figure();
% plot(tsim, Steer_sim); title('Steer angle'); xlabel('Time (s)'); ylabel('Steer (deg)');ylim([-600 600]);
% figure();
% plot(tsim, Throttle_sim);title('Throttle'); xlabel('Time (s)'); ylabel('Throttle');ylim([0 1.3]);
% figure();
% plot(tsim, Brake_sim);title('Brake'); xlabel('Time (s)'); ylabel('Brake');ylim([0 1.3]);
%% Simulator updated, ideal velocity and heading angle sampling
clear Desired_Heading_angle Desired_Velocity
Sample_N = 20;
for i = 1:fix(length(tsim)/Sample_N)+1
    t_sample(i,:) = tsim(1 + (i-1)*Sample_N,:);
    Ideal_Velocity(i,:) = Velocity(1 + (i-1)*Sample_N,1);
    Ideal_Heading_angle(i,:) = Heading(1 + (i-1)*Sample_N,1);
end
%% Plot simulator updated, ideal velocity and heading angle (Join, 2 plots)
% figure();
% subplot(2,1,1)
% plot(tsim, Velocity_updated(:,1)); hold on; plot(t_sample, Ideal_Velocity,'.','LineWidth', 0.6);
% xlabel('Time (s)');ylabel('Velocity (m/s)');
% legend('Simulator updated velocity','Desired velocity','location','southeast')
% title('(a) Desired velocity vs. Simulator updated velocity');
% xlim([0 260])
% ylim([0 15])
% subplot(2,1,2)
% plot(tsim, Heading_updated(:,1)); hold on; plot(t_sample, Ideal_Heading_angle,'.','LineWidth', 0.6);
% xlabel('Time (s)');ylabel('Heading angle (deg)');
% legend('Simulator updated heading angle','Desired heading angle','location','southeast')
% title('(b) Desired heading angle vs. Simulator updated heading angle');
% xlim([0 260])
%% Plot simulator updated, ideal velocity and heading angle (Seperate)
% figure();
% subplot(2,1,1)
% plot(tsim, Velocity_updated(:,1)); hold on; plot(t_sample, Ideal_Velocity,'.','LineWidth', 0.6);
% xlabel('Time (s)');ylabel('Velocity (m/s)');
% legend('Simulator updated velocity','Desired velocity','location','southeast')
% title('(a) Desired velocity vs. Simulator updated velocity');
% xlim([0 260])
% ylim([0 15])
% 
% % figure();
% subplot(2,1,2)
% plot(tsim, Heading_updated(:,1)); hold on; plot(t_sample, Ideal_Heading_angle,'.','LineWidth', 0.6);
% xlabel('Time (s)');ylabel('Heading angle (deg)');
% legend('Simulator updated heading angle','Desired heading angle','location','southeast')
% title('(b) Desired heading angle vs. Simulator updated heading angle');
% xlim([0 260])
%% Plot simulator and ideal velocity and heading angle (Fig. 8, 17, 27)
figure();
subplot(2,1,1);
plot(tsim, Y_sim(:,1)); hold on; plot(t_sample,Ideal_Velocity,'.','LineWidth', 0.6);
title('(a) Desired velocity vs. Simulator velocity'); xlabel('Time (s)');ylabel('Velocity (m/s)');
legend('Simulator velocity','Desired velocity','location','southeast');
subplot(2,1,2);
plot(tsim, Y_sim(:,2)); hold on; plot(t_sample,Ideal_Heading_angle,'.','LineWidth', 0.6);
title('(b) Desired heading angle vs. Simulator heading angle'); xlabel('Time (s)');ylabel('Heading angle (deg)');
legend('Simulator heading angle','Desired heading angle','location','southeast');
%% Plot ideal - simulator velocity and heading angle (Fig. 9, 18, 28)
figure();
subplot(2,1,1);
plot(tsim, Y_sim(:,1)-Y_ideal(:,1));
title('(a) Simulator velocity - desired velocity'); xlabel('Time (s)');ylabel('Velocity error (m/s)');
subplot(2,1,2);
plot(tsim, Y_sim(:,2)-Y_ideal(:,2));
title('(b) Simulator heading angle - desired heading angle'); xlabel('Time (s)');ylabel('Heading angle error (deg)');
%% Path sampling
A = fix(length(XYplot_sim1)/3);B = fix(length(XYplot_sim1)*2/3);C = fix(length(XYplot_sim1));
j = 1;
for i = 1:length(tsim)
    if mod(i-1, 10) == 0
        XYplot_sam(j,:) = XYplot(i,:);
        j = j+1;
    end
end
%% Plot path (Fig. 11, 20)
% figure();
% plot(XYplot_sam(:,2), XYplot_sam(:,1),'rx','MarkerSize', 8);hold on;
% plot(XYplot_sim1(:,2), XYplot_sim1(:,1),'b');hold on;
% text(XYplot(A,2)+8,XYplot(A,1)-2,'A','FontSize',14);hold on;
% plot(XYplot(A,2), XYplot(A,1),'k*','MarkerSize', 10);hold on;
% text(XYplot(B,2)+5,XYplot(B,1),'B','FontSize',14);hold on;
% plot(XYplot(B,2), XYplot(B,1),'k*','MarkerSize', 10);hold on;
% text(XYplot(C,2)+5,XYplot(C,1)+5,'C','FontSize',14);hold on;
% plot(XYplot(C,2), XYplot(C,1),'k*','MarkerSize', 10);hold on;
% title('Paths');xlabel('Y (m)'); ylabel('X (m)');
% legend('Desired path', 'Simulator path', 'location','southwest');
% xlim([0 300]);
% 
% figure();
% dcm_obj = datacursormode(gcf);
% set(dcm_obj,'UpdateFcn',@NewCallback);
% plot(XYplot(:,2),XYplot(:,1),'r-.');hold on;
% plot(XYplot_sim1(:,2),XYplot_sim1(:,1),'b ');hold on;
% plot(XYplot(C,2),XYplot(C,1),'* k');
% title('Paths @ C');xlabel('Y (m)'); ylabel('X (m)');
% ylim([XYplot(C,1)-5e-3, XYplot(C,1)+5e-3]);xlim([XYplot(C,2)-5e-3, XYplot(C,2)+5e-3]);
% legend('Desired path', 'Simulator path','location','southeast');
%% Plot path (Fig. 26)
figure();
plot(XYplot_sam(:,2), XYplot_sam(:,1),'r.-.','MarkerSize', 8);hold on;
plot(XYplot_sim1(:,2), XYplot_sim1(:,1),'b');hold on;
text(XYplot(A,2),XYplot(A,1)-50,'A','FontSize',14);hold on;
plot(XYplot(A,2), XYplot(A,1),'k*','MarkerSize', 10);hold on;
text(XYplot(B,2),XYplot(B,1)-70,'B','FontSize',14);hold on;
plot(XYplot(B,2), XYplot(B,1),'k*','MarkerSize', 10);hold on;
text(XYplot(C,2)-80,XYplot(C,1),'C','FontSize',14);hold on;
plot(XYplot(C,2), XYplot(C,1),'k*','MarkerSize', 10);hold on;
title('Paths');xlabel('Y (m)'); ylabel('X (m)');
legend('Desired path', 'Simulator path', 'location','southeast');
%% Plot select model
% figure();
% plot(tsim,select_MPC(:,2));hold on;
% plot(tsim,select_overlap(:,2),'--');hold on;
% title('Sequences of model selections');xlabel('Time (s)'); ylabel('Model indices (i)');
% legend('Sequence of model selections for vehicle','Sequence of model selections for simulator')
% ylim([-2 11]);
%% Plot tracking error (Fig. 12, 13, 21, 22, 31, 32)
X_error = XYplot(:,1)-XYplot_sim1(:,1);
Y_error = XYplot(:,2)-XYplot_sim1(:,2);
Distance_error = sqrt(X_error.^2+Y_error.^2);

figure();
plot(tsim, X_error*100,'k');
xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in X-axis');

figure();
plot(tsim, Y_error*100,'k');
xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in Y-axis');

figure();
plot(tsim, Distance_error*100,'k');
xlabel('Time (s)');ylabel('Error (cm)');
title('Trajectory-tracking error in distance');

[Nearst_XY,distance,t] = distance2curve(XYplot,XYplot_sim1,'linear');
PathX_error = XYplot_sim1(:,1)-Nearst_XY(:,1);
PathY_error = XYplot_sim1(:,2)-Nearst_XY(:,2);
Near_distance_error = sqrt(PathX_error.^2+PathY_error.^2);

figure();
plot(tsim,(Near_distance_error*100),'k');
title('Path-tracking error in distance');
xlabel('Time (s)');ylabel('Error (cm)');
%% Plot lambda (Fig. 16)
% figure();
% plot(tsim, Lambda(:,1)); hold on;
% plot(tsim, Lambda(:,13),'k--');hold on;
% legend('\lambda_{steer pos}(\itkT)','\lambda_{steer neg}(\itkT)');
% title('\lambda_{u1}(\itkT)'); ylabel('\lambda_{u1}(\itkT)'); xlabel('Time (s)');
% 
% figure();
% plot(tsim, Lambda(:,2));hold on;
% plot(tsim, Lambda(:,14),'k--');hold on;
% legend('\lambda_{throttle}(\itkT)','\lambda_{break}(\itkT)');
% title('\lambda_{u2}(\itkT)'); ylabel('\lambda_{u2}(\itkT)'); xlabel('Time (s)');
%% Plot vehicle vs. simulator velocity and heading angle (Fig. 14, 23)
% load('data_veh_ex1_20220210.mat');
% Y(:,2) = 180/pi*Y(:,2);
% SystemError_veh(:,2) = 180/pi*SystemError_veh(:,2);
% OutputError_veh(:,2) = 180/pi*OutputError_veh(:,2);
% 
% Sample_N = 10;
% for i = 1:fix(length(tsim)/Sample_N)+1
%     t_sample2(i,:) = tsim(1 + (i-1)*Sample_N,:);
%     Sim_Velocity(i,:) = Y_sim(1 + (i-1)*Sample_N,1);
%     Sim_Heading_angle(i,:) =  Y_sim(1 + (i-1)*Sample_N,2);
% end
% 
% figure();
% plot(tsim, Y(:,1)); hold on; plot(t_sample2,Sim_Velocity,'rx');
% title('Vehicle output 1 vs. Simulator output 1'); xlabel('Time (s)');ylabel('Velocity (m/s)');
% legend('Vehicle output 1','Simulator output 1','location','southeast');
% 
% figure();
% plot(tsim, Y(:,2)); hold on; plot(t_sample2,Sim_Heading_angle,'rx');
% title('Vehicle output 2 vs. Simulator output 2'); xlabel('Time (s)');ylabel('Heading angle (deg)');
% legend('Vehicle output 2','Simulator output 2','location','southeast');

% figure();
% plot(tsim, Y(:,1)-Y_sim(:,1));
% title('Vehicle output 1 - Simulator output 1');
% xlabel('Time (s)');ylabel('Error (m/s)');
% 
% figure();
% plot(tsim, Y(:,2)-Y_sim(:,2));
% title('Vehicle output 2 - Simulator output 2');
% xlabel('Time (s)');ylabel('Error (deg)');
%% Plot systemerror (Part 1)
% figure();
% plot(tsim, SystemError_sim(:,1)');
% title('Fictitious system error #1'); xlabel('Time (s)'); ylabel('Fictitious system error #1 (m/s)');
% 
% figure();
% plot(tsim, SystemError_sim(:,2)');
% title('Fictitious system error #2'); xlabel('Time (s)'); ylabel('Fictitious system error #2 (deg)');

% figure();
% plot(tsim, SystemError_veh(:,1)');
% title('Vehicle system error #1'); xlabel('Time (s)'); ylabel('Vehicle system error #1 (m/s)');
% 
% figure();
% plot(tsim, SystemError_veh(:,2)');
% title('Vehicle system error #2'); xlabel('Time (s)'); ylabel('Vehicle system error #2 (deg)');
%% Plot S_Ldterm (Part 1)
% figure();
% plot(tsim, LdError_sim');title('L_{d}*e_{sim}(\itk)');xlabel('Time (s)'); 
% ylabel('Fictitious input disturbances #1 - #4');
% legend('#1','#2','#3','#4');

% figure();
% plot(tsim, LdError_veh');title('L_{d}*e_{sys}(\itk)');xlabel('Time (s)'); 
% ylabel('Vehicle input disturbances #1 - #4');
% legend('#1','#2','#3','#4');
%% Plot outputerror (Part 1)
% figure();
% plot(tsim, OutputError_sim(:,1)');
% title('Fictitious output error #1'); xlabel('Time (s)'); ylabel('Fictitious output disturbance #1 (m/s)');
% 
% figure();
% plot(tsim, OutputError_sim(:,2)');
% title('Fictitious output error #2'); xlabel('Time (s)'); ylabel('Fictitious output disturbance #2 (deg)');

% figure();
% plot(tsim, OutputError_veh(:,1)');
% title('Vehicle output error #1'); xlabel('Time (s)'); ylabel('Vehicle output disturbance #1 (m/s)');
% 
% figure();
% plot(tsim, OutputError_veh(:,2)');
% title('Vehicle output error #2'); xlabel('Time (s)'); ylabel('Vehicle output disturbance #2 (deg)');