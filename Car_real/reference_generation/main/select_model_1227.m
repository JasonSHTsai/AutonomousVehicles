function [select_Model] = select_model_1227(Velocity,Heading,Low_Speed,Medium_Speed,High_Speed,Overlap_Maxium,N)
%% define 18 models
% 低速加速(LA)
%   右轉:LAR 1
%   左轉:LAL 2
%   直線:LAS 3
% 低速減速(LB)
%   右轉:LBR 4
%   左轉:LBL 5
%   直線:LBS 6
% 中速加速(MA)
%   右轉:MAR 7
%   左轉:MAL 8
%   直線:MAS 9
% 中速減速(MB)
%   右轉:MBR 10
%   左轉:MBL 11
%   直線:MBS 12
% 高速加速(HA)
%   右轉:HAR 13
%   左轉:HAL 14
%   直線:HAS 15
% 高速減速(HB)
%   右轉:HBR 16
%   左轉:HBL 17
%   直線:HBS 18
%% 速度，角度延伸 N*Overlap_Maxium筆
len = length(Velocity);
diff_Acceleration = diff(Velocity);
diff_Angular_acceleration = diff(Heading);
avg_Acceleration = mean(diff_Acceleration(end-Overlap_Maxium:end,1),1);
avg_Angular_acceleration = mean(diff_Angular_acceleration(end-Overlap_Maxium:end,1),1);
for i=1:N*Overlap_Maxium
    Velocity = [Velocity;Velocity(end,1)+avg_Acceleration];
    Heading = [Heading;Heading(end,1)+avg_Angular_acceleration]; 
end
Acceleration = [ diff(Velocity) ; 0 ];
Angular_acceleration = [ diff(Heading) ; 0 ];
%% strategize temp model_select  
temp = zeros(length(Velocity),1);
for i=1:length(Velocity)
    if Velocity(i,1) < Low_Speed
        if Acceleration(i,1) >= 0;
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 1;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 3;
            else 
                temp(i,1) = 2;
            end
        else
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 4;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 6;
            else 
                temp(i,1) = 5;
            end
        end
    elseif Low_Speed <= Velocity(i,1) < Medium_Speed
        if Acceleration(i,1) >= 0;
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 7;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 9;
            else 
                temp(i,1) = 8;
            end
        else
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 10;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 12;
            else 
                temp(i,1) = 11;
            end
        end
        
    end
    if Medium_Speed <= Velocity(i,1) 
        if Acceleration(i,1) >= 0;
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 13;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 15;
            else 
                temp(i,1) = 12;
            end
        else
            if Angular_acceleration(i,1) > 0
                temp(i,1) = 16;
            elseif Angular_acceleration(i,1) ==0
                temp(i,1) = 18;
            else 
                temp(i,1) = 17;
            end
        end
    end
end
%% final model select
select_Model = zeros(len ,1);
for i = 1:len 
    t = zeros(18,1);
    for j = 1:N * Overlap_Maxium
        t(temp(i+j)) = t(temp(i+j))+1;
    end
    [~,select_Model(i)] = max(t);
end
