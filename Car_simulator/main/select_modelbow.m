%% ver 3.0
function [select_MPC, select_overlap, slope]= select_model(Velocity, Heading, XYplot)
%% 判斷加速度、角加速度
slope = diff(Velocity);
for i = 1:length(slope)
    if slope(i,:) >= 0
        slope(i,:) = 1;
    else
        slope(i,:) = -1;
    end
end
slope = [slope(1,1); slope];
index = classify(slope);
slope = smooth(slope,index,20);

face = diff(Heading);
for i = 1:length(face)
    if face(i,:) >= 0
        face(i,:) = 1;
    else
        face(i,:) = -1;
    end
end
face = [face(1,1); face];
index = classify(face);
face = smooth(face,index,30);

Acceleration = diff(Velocity);
Acceleration = [Acceleration(1,1); Acceleration];
Omega = diff(Heading);
Omega = [Omega(1,1); Omega];
%% Setting Parameter
V_threshold_1 = 3.6;V_range_1 = 0.55;
V_threshold_2 = 10.5;V_range_2 = 0.65;
comp_num = 18;

%---------------
% 1:低速
%---------------
% 2:中速微直線
% 3:中速過彎
% 7:中速轉彎加速
%---------------
% 4:高速
%---------------
% 5:煞車右轉
% 6:煞車左轉
%---------------
%% select_MPC
for i = 1:length(Velocity)
    if slope(i,:) == -1 %先判斷是否煞車
        if Acceleration(i,:) < -0.007 && Acceleration(i,:) > -0.4 && Acceleration(i,:) >= Acceleration(i+1,:)
            if face(i,:) == 1
                select_MPC(i,:) = 5; %5:煞車右轉
            else
                select_MPC(i,:) = 6; %6:煞車左轉
            end
        else
            if select_MPC(i-1,:) == 5 || select_MPC(i-1,:) == 6
                select_MPC(i,:) = 3; %7:中速轉彎加速 先用中速之後要改!!!!!!!!!!!!!!!!!!!!!
            else
                select_MPC(i,:) = select_MPC(i-1,:); %補進煞車前的模糊區間
            end
        end
    else %再依速度切割model
        if Velocity(i,:) >= V_threshold_2
            select_MPC(i,:) = 4; %4:高速
        elseif Velocity(i,:) >= V_threshold_1
            if abs(Omega(i,:)) >= 0.003
                select_MPC(i,:) = 3; %3:中速過彎
            else                       
                select_MPC(i,:) = 2; %2:中速微直線
            end
        else
            select_MPC(i,:) = 1; %1:低速
        end
    end
end

index = classify(select_MPC);
select_MPC = smooth(select_MPC,index,20);
%% select_overlap
for i = 1:length(Velocity)
    if slope(i,:) == -1 %先判斷是否煞車
        select_overlap(i,:) = 0;
    else
        if Velocity(i,:) >= V_threshold_2*V_range_2
            select_overlap(i,:) = 4; %4:高速
        elseif Velocity(i,:) >= V_threshold_1*V_range_1
            if abs(Omega(i,:)) >= 0.003
                select_overlap(i,:) = 3; %3:中速過彎
            else
                select_overlap(i,:) = 2; %2:中速微直線
            end
        else
            select_overlap(i,:) = 0; %1:低速
        end
    end
end
index = classify(select_overlap);
select_overlap = smooth(select_overlap,index,3);
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
    if index_overlap(i,1) ~= 0
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


% %% Original
% function [select_MPC, select_overlap, Acceleration]= select_model(Velocity, Heading, XYplot)
% %% 判斷加速度、角加速度
% Acceleration = diff(Velocity);
% for i = 1:length(Acceleration)
%     if Acceleration(i,:) >= 0
%         Acceleration(i,:) = 1;
%     else
%         Acceleration(i,:) = -1;
%     end
% end
% Acceleration = [Acceleration(1,1); Acceleration];
% index = classify(Acceleration);
% Acceleration = smooth(Acceleration,index,20);
% 
% Omega = diff(Heading);
% Omega = [Omega(1,1); Omega];
% %% Setting Parameter
% V_threshold_1 = 3.6;V_range_1 = 0.55;
% V_threshold_2 = 10.5;V_range_2 = 0.65;
% comp_num = 18;
% % 1:低速
% % 2:中速直線
% % 3:中速轉彎
% % 4:高速
% % 5:煞車
% %% select_MPC
% for i = 1:length(Velocity)
% %     if Acceleration(i,:) < -3e-5 && abs(Omega(i,:)) < 1e-3
% %         select_MPC(i,:) = 4;
% %     else
%         if Velocity(i,:) >= V_threshold_2
%             select_MPC(i,:) = 4;
%         elseif Velocity(i,:) >= V_threshold_1
%             if abs(Omega(i,:)) >= 0.003%轉彎
%                 select_MPC(i,:) = 3;
%             else                       %直線
%                 select_MPC(i,:) = 2;
%             end
%         else
%             select_MPC(i,:) = 1;
%         end
%     end
% % end
% index = classify(select_MPC);
% select_MPC = smooth(select_MPC,index,20);
% %% select_overlap
% for i = 1:length(Velocity)
%         if Acceleration(i,:) > 0
%             if Velocity(i,:) >= V_threshold_2*V_range_2
%                 select_overlap(i,:) = 4;
%             elseif Velocity(i,:) >= V_threshold_1*V_range_1
%                 if abs(Omega(i,:)) >= 0.003%轉彎
%                     select_overlap(i,:) = 3;
%                 else
%                     select_overlap(i,:) = 2;
%                 end
%             else
%                 select_overlap(i,:) = 0;
%             end
%         else
%             if Velocity(i,:) <= V_threshold_1*(2-V_range_1)
%                 if abs(Omega(i,:)) >= 0.003%轉彎
%                     select_overlap(i,:) = 3;
%                 else
%                     select_overlap(i,:) = 2;
%                 end
%             elseif Velocity(i,:) <= V_threshold_2*(2-V_range_2)
%                 select_overlap(i,:) = 4;
%             else
%                 select_overlap(i,:) = 0;
%             end
%         end
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