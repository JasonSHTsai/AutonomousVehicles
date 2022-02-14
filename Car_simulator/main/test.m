clc;clear; close all;
load exTraj_01_9_v4020_sm170_dsm5_noEv_rf2_20200415;
t_sim = 0:0.1:length(Velocity)/10-0.1;
%% 判斷斜度
slope = diff(Velocity);
Velocityb = diff(Velocity);
for i = 1:length(slope)
    if slope(i,:) >= 0
        slope(i,:) = 1;
    else
        slope(i,:) = -1;
    end
end
slope = [slope(1,1);slope];
Velocityb = [Velocityb(1,1) ;Velocityb];
index = classify(slope);
slope = smooth(slope,index,20);
%% 判段左右轉
cur = diff(Yaw);
for i = 1:length(cur)
    if cur(i,:) >= 0
        cur(i,:) = 1;
    else
        cur(i,:) = -1;
    end
end
cur = [cur(1,1);cur];
index = classify(cur);
cur = smooth(cur,index,10);

%% Setting Parameter
V_threshold_1=3.6;V_range_1=0.55;%0.7for ex1
V_threshold_2=10.5;V_range_2=0.65;
B_threshold = -0.25;B_range = 0.8;
S_threshold = 0.001;S_range = 0.8;
comp_num = 18;
%% select_MPC
for i = 1:length(Velocity)
    if Velocityb(i,:) <= -0.25 && cur(i,:)==1 && i<1000
            select_MPC(i,:) = 4; 
    elseif Velocityb(i,:) <= -0.25 && cur(i,:)==1 && i>1000&& i<2500
            select_MPC(i,:) = 4; 
    elseif Velocityb(i,:) <= -0.02 && cur(i,:)==-1 && i<1000
            select_MPC(i,:) = 8;
    elseif Velocityb(i,:) <= -0.25 && cur(i,:)==-1 && i>=1000 && i<2000
            select_MPC(i,:) = 5;
    elseif Velocityb(i,:) <= -0.27 && cur(i,:)==-1 && i>=2000 && i<2350
            select_MPC(i,:) = 6;
    elseif Velocityb(i,:) <= -0.25 && cur(i,:)==-1 && i>=2350
            select_MPC(i,:) = 6;
    elseif Velocityb(i,:) <= -0.0616 && i>=2500
            select_MPC(i,:) = 7;
    elseif Velocity(i,:) >= V_threshold_2
       select_MPC(i,:) = 3;
    elseif Velocity(i,:) >= V_threshold_1
       select_MPC(i,:) = 2;
    else
       select_MPC(i,:) = 1;%沒轉彎
%        if abs(Steer(i,:)) >= S_threshold
%            select_MPC(i,:) = 2;%有轉彎
%        else
%            select_MPC(i,:) = 1;%沒轉彎
%        end
   end
end
index = classify(select_MPC);
select_MPC = smooth(select_MPC,index,10);
select_overlap = zeros(length(Velocity),1);
%% select_overlap
for i = 1:length(Velocity)
    if Velocityb(i,:) <= -0.07 && cur(i,:)==1 && Velocityb(i,:)>-0.25        
            select_overlap(i,:) = 4;
    elseif  Velocityb(i,:) <= -0.001 && cur(i,:)==-1 && i<1000 && Velocityb(i,:) > -0.02 
            select_overlap(i,:) = 8;
    elseif -0.25 < Velocityb(i,:) && cur(i,:)==-1 && i>1000 && i<2000 && Velocityb(i,:) <= -0.02
            select_overlap(i,:) = 5;
    elseif -0.27 < Velocityb(i,:) && cur(i,:)==-1 && i>2000 && Velocityb(i,:) <= -0.03
            select_overlap(i,:) = 6;
    else
        if Velocityb(i,:) > 0
            if Velocity(i,:) >= V_threshold_2*V_range_2 && Velocity(i,:) < V_threshold_2
                select_overlap(i,:) = 3;
            elseif Velocity(i,:) >= V_threshold_1*V_range_1 &&  Velocity(i,:)<3.6
                select_overlap(i,:) = 2;
            else
                select_overlap(i,:) = 0;
            end
        else
            if Velocityb(i,:) <= -0.25 && Velocity(i,:) >=V_threshold_1
                select_overlap(i,:) = 2;
%                 if abs(Steer(i,:)) >= S_threshold
%                     select_overlap(i,:) = 2;%有轉彎
%                 else
%                     select_overlap(i,:) = 1;%沒轉彎
%                 end
            elseif  Velocityb(i,:) <= -0.25 && Velocity(i,:) >= 10.6
                select_overlap(i,:) = 3;
            else
                select_overlap(i,:) = 0;
            end
        end
    end
end
% for i= length(Velocity)
%     if select_MPC ==5
%         select_overlap(i-5:i-1,:)=5;
%     end
% end
index = classify(select_overlap);
select_overlap = smooth(select_overlap,index,5);

figure();
plot(t_sim,Yaw);
figure();
plot(t_sim,cur);ylim=([-2 2]);hold on;
plot(t_sim, slope);