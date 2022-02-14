%% Loading
clear all;close all;warning off;
close_system;
open C:\Users\MVLAB\Desktop\BooBoo\ID_model\main\System\MPC_control_ID.slx;
load ('C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_tmp','G', 'H', 'C', 'D',...
                                                      'ID_U_clear', 'ID_Y_clear','ID_interval',...
                                                      'Accelcmd', 'Steer', 'Velocity', 'Heading', 'XYplot',...
                                                      'Beta', 'xdot', 'ydot', 'Gear', 'tsim');
Gok = G; Hok = H; Cok = C;Dok = D;
% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_High0115';Gok = G; Hok = H; Cok = C;Dok = D;

% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_Start1030';Gok = G; Hok = H; Cok = C;Dok = D;
% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_Low1030';Gok = G; Hok = H; Cok = C;Dok = D;

% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_Low1202';Gok = G; Hok = H; Cok = C;Dok = D;
% load OKIDGeneralModelexfront2;
% Gok = G; Hok = H; Cok = C;Dok = D;Qok = 1e20*eye(size(Gok));Qc = 0.0015*eye(12);Rc = 1e-5*eye(12);
% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_Mid1108';Gok = G; Hok = H; Cok = C;Dok = D;
% load 'C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_High1111';Gok = G; Hok = H; Cok = C;Dok = D;

load ('C:\Users\MVLAB\Desktop\BooBoo\reference_generation\main\Ref_rightturnbrake2','Accelcmd','Steer','Velocity', 'Heading', 'XYplot','tsim');
%% Setting Parameters
Fcncal_transctrl_Ts = 0.01;
Ts = tsim(2,1)-tsim(1,1) ;Tf = 0.001;Tend = (length(tsim)-1)*Ts;
DisSYS = ss(Gok,Hok,Cok,Dok,Ts);
[Eigen_G, TransZeros] = pzmap(DisSYS)
Nc = 6;
Np = 6;
n = size(Gok,1);               % No. of states 
m = size(Hok,2);               % No. of inputs
p = size(Cok,1);               % No. of outputs

U_ideal = [Steer Accelcmd];U_ref = [tsim U_ideal];
Y_ideal = [Velocity Heading];Y_ref = [tsim Y_ideal];

pp = [0 0 1; Ts^2 Ts 1; 4*Ts^2 2*Ts 1];
vvX = [Y_ideal(end-2,1); Y_ideal(end-1,1); Y_ideal(end,1)];
abcX = inv(pp)*vvX;
vvY = [Y_ideal(end-2,2); Y_ideal(end-1,2); Y_ideal(end,2)];
abcY = inv(pp)*vvY;
for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end; [polyval(abcX,(j+2)*Ts), polyval(abcY,(j+2)*Ts)]];   
    end
     Rs_part(:,2*i-1:2*i) = [Y_ideal(i+1:end,:); ref_end];
end
Rs = [tsim Rs_part];
ro = Y_ideal(1,:)';
% ro = [0;0];

pp = [0 0 1; Ts^2 Ts 1; 4*Ts^2 2*Ts 1];
vvX = [XYplot(end-2,1); XYplot(end-1,1); XYplot(end,1)];
abcX = inv(pp)*vvX;
vvY = [XYplot(end-2,2); XYplot(end-1,2); XYplot(end,2)];
abcY = inv(pp)*vvY;
for i = 1:Np
    ref_end = [];
    for j = 1:i
        ref_end = [ref_end; [polyval(abcX,(j+2)*Ts), polyval(abcY,(j+2)*Ts)]];   
    end
     XYplot_part(:,2*i-1:2*i) = [XYplot(i+1:end,:); ref_end];
end
XYplot_ref = [tsim XYplot_part];
Tsim = [tsim tsim];
%% Parameter of Observer and Mpc
if exist('Qok') == 1
    [Gd,Hd,Ld] = Auxi_HG_Observer(Gok,Hok,Cok,Dok,Ts,Qok);
else
    error_inf = 'again';power = 15;
    while isequal('again',error_inf) && power < 1000
        power = power+1
        try
            Qok = 10^power*eye(size(Gok));
            [Gd,Hd,Ld] = Auxi_HG_Observer(Gok,Hok,Cok,Dok,Ts,Qok);
            error_inf = 'pass';
        catch
            error_inf = 'again';
        end
    end
end

% if exist('Rc') == 0
    Rc = 1e-5*eye(Nc*m);
    for i  = 1:2:Nc*m
        Rc(i,i) = 1e-4;
    end
% end

% if exist('Qc') == 0
   Qc = 1e9*eye(Np*p);
   for i  = 1:2:Np*p
        Qc(i,i) = 1e5;
   end
% end

[phi,F] = mpcgain_okid3(Gd,Hd,Cok,Dok,Ld,Nc,Np);
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
 
JE = 2*(phi'*Qc*phi+Rc);
JF_part = -2*phi'*Qc;
%% Sim
tic
sim('MPC_control_ID');
toc
%% Check model
check_inf = check_model(U, Y, U_ideal, Y_ideal, ID_interval);
if check_inf == 0
    tout(end) = 0;
end
%% Plot
% if tout(end) == Tend

switch_point = [];
for i = 2:length(ID_interval)
    if ID_interval(i,2) ~= ID_interval(i-1,2)
        switch_point = [switch_point; ID_interval(i,1)];
    end
end    
    
figure();
subplot(2,1,1);
plot(tsim,U(:,1)*180/pi); hold on; plot(tsim,U_ideal(:,1)*180/pi,'-.');hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(U(:,1)*180/pi),max(U(:,1)*180/pi)],'k-.');
    hold on;
end
title('Steer angle'); xlabel('Time (s)'); ylabel('Steer angle (deg)');
legend('Vehicle steer angle','Desired steer angle');
subplot(2,1,2);
plot(tsim,U(:,2)); hold on; plot(tsim,U_ideal(:,2),'-.'); hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(U(:,2)),max(U(:,2))],'k-.');
    hold on;
end
title('Throttle/Brake'); xlabel('Time (s)'); ylabel('Throttle/Brake');
legend('Vehicle throttle/brake','Desired throttle/brake');

figure();
U_error = U-U_ideal;
subplot(2,1,1);
plot(tsim,U_error(:,1)*180/pi);hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(U_error(:,1)*180/pi),max(U_error(:,1)*180/pi)],'k-.');
    hold on;
end
title('U_{error1}');xlabel('Time (s)');ylabel('U_{error1}');
subplot(2,1,2);
plot(tsim,U_error(:,2));hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(U_error(:,2)),max(U_error(:,2))],'k-.');
    hold on;
end
title('U_{error2}');xlabel('Time (s)');ylabel('U_{error2}');

figure();
subplot(2,1,1);
plot(tsim,Y(:,1)); hold on; plot(tsim,Y_ideal(:,1),'-.'); hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(Y(:,1)),max(Y(:,1))],'k-.');
    hold on;
end
title('Velocity'); xlabel('Time (s)'); ylabel('Velocity');
legend('Vehicle Velocity','Desired Velocity');
subplot(2,1,2);
plot(tsim,Y(:,2)*180/pi); hold on; plot(tsim,Y_ideal(:,2)*180/pi,'-.');hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(Y(:,2)*180/pi),max(Y(:,2)*180/pi)],'k-.');
    hold on;
end
title('Heading angle'); xlabel('Time (s)'); ylabel('Heading angle (deg)');
legend('Vehicle heading angle','Desired heading angle');

figure();
Y_error = Y-Y_ideal;
subplot(2,1,1);
plot(tsim,Y_error(:,1));hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(Y_error(:,1)),max(Y_error(:,1))],'k-.');
    hold on;
end
title('Y_{error1}');xlabel('Time (s)');ylabel('Y_{error1}');
subplot(2,1,2);
plot(tsim,Y_error(:,2)*180/pi);hold on;
for i = 1:length(switch_point)
    plot([switch_point(i,:),switch_point(i,:)],[min(Y_error(:,2)*180/pi),max(Y_error(:,2)*180/pi)],'k-.');
    hold on;
end 
title('Y_{error2}');xlabel('Time (s)');ylabel('Y_{error2}');

disp(sprintf('Distance to end (Vehicle): %2.5f m',pdist2(XYplot_sim(end,:), XYplot(end,:))));
disp(sprintf('¼ÒÀÀµ²§ô'));
save('C:\Users\MVLAB\Desktop\BooBoo\ID_model\ID_', 'G', 'H', 'C', 'D',...
                                                          'ID_U_clear', 'ID_Y_clear','ID_interval',...
                                                          'Accelcmd', 'Steer', 'Velocity', 'Heading', 'XYplot',...
                                                          'Beta', 'xdot', 'ydot', 'Gear', 'tsim',...
                                                          'Qok', 'Rc', 'Qc');
% else
% disp(sprintf('GGGGGGGÃz±¼·S'));
% end