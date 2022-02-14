clc;clear; close all;
load exTraj_01_9_v6020_sm170;
t_sim = 0:0.1:(length(Yaw)/10)-0.1;
Accelcmd = ones(length(Yaw),1);
Yaw_diff = diff(Yaw);
Str = zeros(length(Yaw_diff),1);
% 判斷斜度
slope = diff(Velocity);
for i = 1:length(slope)
    if slope(i,:) >= 0
        slope(i,:) = 1;
    else
        slope(i,:) = -1;
    end
end
slope = [slope(1,1);slope];
index = classify(slope);
slope = smooth(slope,index,50);
curve = LineCurvature2D(XYplot);
for i =1:length(curve)
    if curve(i,1) <=3e-4 && curve(i,1) >=-3e-4
        Str(i,1) = 1;
    else 
        Str(i,1)= 0;
    end
end
% Str(length(curve),1)=Str(length(curve),1);
index = classify(Str);
Str2 = smooth(Str,index,30);
% j=0;
% for i =1:length(Str)
%     if Str(i,1)=1
%     end
% end

%% Setting Parameter
V_threshold_1=3.6;V_range_1=0.55;%0.7for ex1
V_threshold_2=10.5;V_range_2=0.65;
B_threshold = -0.1;B_range = 0.8;
S_threshold = 0.001;S_range = 0.8;
comp_num = 18;
%% select_MPC
for i = 1:length(Velocity)
    if Str(i,1) == 0
        if Accelcmd(i,:) <= B_threshold
            select_MPC(i,:) = 4;
        elseif Velocity(i,:) >= V_threshold_2
           select_MPC(i,:) = 3;
       elseif Velocity(i,:) >= V_threshold_1
           select_MPC(i,:) = 2;
        else
           select_MPC(i,:) = 1;%沒轉彎
        end
    else
        if Accelcmd(i,:) <= B_threshold
            select_MPC(i,:) = 4;
        elseif Velocity(i,:) >= V_threshold_2
           select_MPC(i,:) = 6;
       elseif Velocity(i,:) >= V_threshold_1
           select_MPC(i,:) = 5;
        else
           select_MPC(i,:) = 1;%沒轉彎
        end
    end
end
index = classify(select_MPC);
select_MPC = smooth(select_MPC,index,20);
%% select_overlap
for i = 1:length(Velocity)
    if Accelcmd(i,:) <= B_threshold*B_range
        select_overlap(i,:) = 4;
    else
        if slope(i,:) > 0
            if Velocity(i,:) >= V_threshold_2*V_range_2 && Str2(i,1)==0
                select_overlap(i,:) = 3;
            elseif Velocity(i,:) >= V_threshold_1*V_range_1 && Str2(i,1)==0
                select_overlap(i,:) = 2;
            elseif Velocity(i,:) >= V_threshold_2*V_range_2 && Str2(i,1)==1
                select_overlap(i,:) = 3;
            elseif Velocity(i,:) >= V_threshold_1*V_range_1 && Str2(i,1)==1
                select_overlap(i,:) = 5;
            else
                select_overlap(i,:) = 0;
            end
        else
            if Velocity(i,:) <= V_threshold_1*(2-V_range_1)
                select_overlap(i,:) = 1;%有轉彎
%                 if abs(Steer(i,:)) >= S_threshold
%                     select_overlap(i,:) = 2;%有轉彎
%                 else
%                     select_overlap(i,:) = 1;%沒轉彎
%                 end
            elseif Velocity(i,:) <= V_threshold_2*(1-V_range_1)
                select_overlap(i,:) = 2;
            else
                select_overlap(i,:) = 0;
            end
        end
    end       
end
index = classify(select_overlap);
select_overlap = smooth(select_overlap,index,3);
    
%% plot
figure();
plot(t_sim,Velocity)
title('Desired velocity vs. Vehicle velocity'); xlabel('Time (s)');ylabel('Velocity (m/s)');
legend('Vehicle velocity','Desired velocity','location','southeast')

figure();
plot(t_sim,Yaw); hold on; plot(t_sim, Str, 'r');ylim([-3 2]);
title('Desired heading angle vs. Vehicle heading angle'); xlabel('Time (s)');ylabel('Heading angle (rad/s)');
legend('Vehicle heading angle','Desired heading angle','location','southeast')

figure();
plot(t_sim, Str);ylim([-1 2]); hold on ; plot(t_sim , Str2,'r');

figure();
plot(t_sim, curve);hold on ; plot(t_sim , Str2,'r');