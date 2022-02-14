%% ver 1.0
% function [select_MPC, select_overlap, slope]= select_model(Velocity, Steer, Accelcmd, Np)
% %% 判斷斜度
% slope = diff(Velocity);
% for i = 1:length(slope)
%     if slope(i,:) >= 0
%         slope(i,:) = 1;
%     else
%         slope(i,:) = -1;
%     end
% end
% slope = [slope(1,1);slope];
% index = classify(slope);
% slope = smooth(slope,index,50);
% %% Setting Parameter
% V_threshold_1=3.6;V_range_1=0.55;%0.7for ex1
% V_threshold_2=10.5;V_range_2=0.45;
% B_threshold = -0.1;B_range = 0.8;
% S_threshold = 0.1;S_range = 0.8;
% comp_num = 18;
% %% select_MPC
% for i = 1:length(Velocity)
%     if Accelcmd(i,:) <= B_threshold
%         select_MPC(i,:) = 4;
%     elseif Velocity(i,:) >= V_threshold_2
%        select_MPC(i,:) = 3;
%    elseif Velocity(i,:) >= V_threshold_1
%        select_MPC(i,:) = 2;
%    else
%        select_MPC(i,:) = 1;
%    end
% end
% index = classify(select_MPC);
% select_MPC = smooth(select_MPC,index,20);
% %% select_overlap
% for i = 1:length(Velocity)
%     if Accelcmd(i,:) <= B_threshold*B_range
%         select_overlap(i,:) = 4;
%     else
%         if slope(i,:) > 0
%             if Velocity(i,:) >= V_threshold_2*V_range_2
%                 select_overlap(i,:) = 3;
%             elseif Velocity(i,:) >= V_threshold_1*V_range_1
%                 select_overlap(i,:) = 2;
%             else
%                 select_overlap(i,:) = 0;
%             end
%         else
%             if Velocity(i,:) <= V_threshold_1*(2-V_range_1)
%                 select_overlap(i,:) = 1;
%             elseif Velocity(i,:) <= V_threshold_2*(2-V_range_1)
%                 select_overlap(i,:) = 2;
%             else
%                 select_overlap(i,:) = 0;
%             end
%         end
%     end
% end
% index = classify(select_overlap);
% select_overlap = smooth(select_overlap,index,3);
% %% 消除select_MPC跟select_overlap重疊區域
% for i = 1:length(Velocity)
%     if select_overlap(i,1) == select_MPC(i,1)
%         select_overlap(i,1) = 0;
%     end
% end
% %% 消除select_overlap對不到select_MPC的區域
% index_MPC = classify(select_MPC);
% index_overlap = classify(select_overlap);
% j = 2;
% for i = 1 : size(index_overlap,1)
%     if index_overlap(i,1) ~= 0
%         if index_overlap(i,4)+1 ~= index_MPC(j,3) || index_overlap(i,1) ~= index_MPC(j,1)
%             index_overlap(i,1) = 0;
%         else
%             if j < size(index_MPC,1)
%                 j = j+1;
%             else
%                 j = j;
%             end
%         end
%     end
% end
% 
% %% 重建select_overlap
% for i = 1 : size(index_overlap)
%     select_overlap(index_overlap(i,3):index_overlap(i,4),:) = index_overlap(i,1); 
% end
% %% 若無select_overlap則往前補償
% for i = 2:length(select_MPC)
%     if abs(select_MPC(i,:)-select_MPC(i-1,:)) > 0
%         if select_overlap(i-1,:) ~= select_MPC(i,:)
%             select_overlap(i-comp_num:i-1,:) = select_MPC(i,:);
%         end
%     end
% end
% end
%% ver 2.0
function [select_MPC, select_overlap, slope]= select_model(Velocity, Accelcmd, Np)
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
%% Setting Parameter
V_threshold_1=3.6;V_range_1=0.55;%0.7for ex1
V_threshold_2=10.57;V_range_2=0.65;
B_threshold = -0.1;B_range = 0.8;
S_threshold = 0.001;S_range = 0.8;
comp_num = 18;
%% select_MPC
for i = 1:length(Velocity)
    if Accelcmd(i,:) <= B_threshold
        select_MPC(i,:) = 4;
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
%% select_overlap
for i = 1:length(Velocity)
    if Accelcmd(i,:) <= B_threshold*B_range
        select_overlap(i,:) = 4;
    else
        if slope(i,:) > 0
            if Velocity(i,:) >= V_threshold_2*V_range_2
                select_overlap(i,:) = 3;
            elseif Velocity(i,:) >= V_threshold_1*V_range_1
                select_overlap(i,:) = 2;
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
for i= length(Velocity)
    if select_MPC ==4
        select_overlap(i-5,:)=4;
    end
end
index = classify(select_overlap);
select_overlap = smooth(select_overlap,index,5);
%% 消除select_MPC跟select_overlap重疊區域
for i = 1:length(Velocity)
    if select_overlap(i,1) == select_MPC(i,1)
        select_overlap(i,1) = 0;
    end
end
%% 消除select_overlap對不到select_MPC的區域
index_MPC = classify(select_MPC);
index_overlap = classify(select_overlap);
j = 2;
for i = 1 : size(index_overlap,1)
    if index_overlap(i,1) ~= 0 && size(index_MPC,1) >= 2
        if index_overlap(i,4)+1 ~= index_MPC(j,3) || index_overlap(i,1) ~= index_MPC(j,1)
            index_overlap(i,1) = 0;
        else
            if j < size(index_MPC,1)
                j = j+1;
            else
                j = j;
            end
        end
    end
end

%% 重建select_overlap
for i = 1 : size(index_overlap)
    select_overlap(index_overlap(i,3):index_overlap(i,4),:) = index_overlap(i,1); 
end
%% 若無select_overlap則往前補償
for i = 2:length(select_MPC)
    if abs(select_MPC(i,:)-select_MPC(i-1,:)) > 0
        if select_overlap(i-1,:) ~= select_MPC(i,:)
            select_overlap(i-comp_num:i-1,:) = select_MPC(i,:);
        end
    end
end
end