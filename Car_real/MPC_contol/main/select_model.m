%% ver new
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

diff_Acceleration = diff(Acceleration);
diff_Acceleration = [diff_Acceleration(1,1); diff_Acceleration];

Omega = diff(Heading);
Omega = [Omega(1,1); Omega];
%% Setting Parameter
V_threshold_1 =3.6 ;V_range_1 = 0.55;%5.3184 
V_threshold_2 = 10.5;V_range_2 = 0.65;%10.3809 
comp_num = 18;
%% Model列表
%-----------------------------------
% 1:低速
%-----------------------------------
% 2:尾端煞車
% 3:中速
%-----------------------------------
% 4:高速
%-----------------------------------
% 5:右煞
%-----------------------------------
% 6:左煞
%% select_MPC  
for i = 1:length(Velocity)
    if Acceleration(i,:) <= -0.2 && face(i,:) == 1 %右轉
        select_MPC(i,:) = 5;
    elseif Acceleration(i,:) <= -0.2 && face(i,:) == -1 %左轉
        select_MPC(i,:) = 6;
    else
        if Velocity(i,:) >= V_threshold_2
            select_MPC(i,:) = 4; %4:高速
        elseif Velocity(i,:) >= V_threshold_1
            select_MPC(i,:) = 3; %2:中速微直線
        else
            select_MPC(i,:) = 1; %1:低速
        end
    end
end
while Velocity(i,1) < 5.555 %尾端煞車
    select_MPC(i,1) = 2;
    i = i-1;
end
index = classify(select_MPC);
for i = 1:size(index,1)
    if index(i,1) >= 5 %讓煞車model不會被smooth掉
        index(i,2) = 100; 
    end
    select_MPC(index(i,3):index(i,4),:) = index(i,1); 
end
select_MPC = smooth(select_MPC,index,15);

index = classify(select_MPC);
for i = 2:size(index,1)
    if index(i,1) == 4 % 如果高速情況Heading變化太多用中model
        count = 0;
        for j = index(i,3):index(i,4)
            if abs(Omega(j,:)) >= 1e-3%1e-2
                count = count+1;
            end
        end
        if count/index(i,2) >= 0.59 || count > 64
            index(i,1) = 3;
        end
    end
    
    if index(i-1,1) >= 5 && index(i,1) >= 5%Heading變化劇烈會造成同個轉彎有不同煞車model
        index(i,1) = 3;
        index(i-1,1) = 3;
    end
    
    if index(i,1) == 5%Heading介於-1.602~-1.383，Heading 變化量介於0.084~0.115才可用右煞
        if Heading(index(i,3),:) < -1.61...
           || Heading(index(i,4),:) > -1.38...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) < 0.08...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) > 0.12
                index(i,1) = 3; 
        end
    elseif index(i,1) == 6%Heading介於-1.841~-0.5776，Heading 變化量介於-0.084~-0.0656才可用左煞
        if Heading(index(i,3),:) > -0.57...
           || Heading(index(i,4),:) < -1.842...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) < 0.064...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) > 0.086
                index(i,1) = 3; 
        end
    end
end
for i = 1:size(index,1)
    select_MPC(index(i,3):index(i,4),:) = index(i,1); 
end

%% select_overlap
index_MPC = classify(select_MPC);
j = 1;
for i = 2:size(index_MPC,1)
    interval_num = fix(index_MPC(i,2)*1.9);%調select_overlap筆數
    if interval_num >= comp_num
        interval_num = comp_num;
    end
    upper_value = index_MPC(i,3)-1;
    lower_value = index_MPC(i,3)-interval_num;
    if lower_value <= index_MPC(i-1,3)-1
        lower_value = index_MPC(i-1,3);
    end
    index_overlap(j,:) = [index_MPC(i,1) interval_num lower_value upper_value];
    j = j+1;
end
select_overlap = zeros(length(select_MPC),1);
for i = 1:size(index_overlap,1)
    select_overlap(index_overlap(i,3):index_overlap(i,4),1) = index_overlap(i,1); 
end

end
%% Original
% function [select_MPC, select_overlap, slope]= select_model(Velocity, Heading, XYplot)
% %% 判斷加速度、角加速度
% slope = diff(Velocity);
% for i = 1:length(slope)
%     if slope(i,:) >= 0
%         slope(i,:) = 1;
%     else
%         slope(i,:) = -1;
%     end
% end
% slope = [slope(1,1); slope];
% index = classify(slope);
% slope = smooth(slope,index,20);
% 
% face = diff(Heading);
% for i = 1:length(face)
%     if face(i,:) >= 0
%         face(i,:) = 1;
%     else
%         face(i,:) = -1;
%     end
% end
% face = [face(1,1); face];
% index = classify(face);
% face = smooth(face,index,30);
% 
% Acceleration = diff(Velocity);
% Acceleration = [Acceleration(1,1); Acceleration];
% 
% diff_Acceleration = diff(Acceleration);
% diff_Acceleration = [diff_Acceleration(1,1); diff_Acceleration];
% 
% Omega = diff(Heading);
% Omega = [Omega(1,1); Omega];
% %% Setting Parameter
% V_threshold_1 = 3.6;V_range_1 = 0.55;
% V_threshold_2 = 10.5;V_range_2 = 0.65;
% comp_num = 18;
% %% Model列表
% %-----------------------------------
% % 1:低速
% %-----------------------------------
% % 2:中速微直線
% % 3:中速過彎
% % 7:中速轉彎加速
% %-----------------------------------
% % 4:高速
% %-----------------------------------
% % 5:右煞Heading變化約0.0697
% % 6:右煞Heading變化約0.076
% % 7:右煞Heading變化約0.091~0.1
% %-----------------------------------
% % 8:左煞Heading變化約0.0605
% % 9:左煞Heading變化約0.076
% % 10:左煞Heading變化約0.106
% % 11:左煞Heading變化約0.214
% %-----------------------------------
% % 12:中速轉彎加速
% %-----------------------------------
% %% select_MPC
% for i = 1:length(Velocity)
%     if slope(i,:) == -1 %先判斷是否煞車
%         if Acceleration(i,:) < -0.007 && Acceleration(i,:) > -0.40 && Acceleration(i-1,:) >= Acceleration(i,:) && Velocity(i,:) > 5.5
%             if face(i,:) == 1
%                 select_MPC(i,:) = -1; %先判斷煞車右轉
%             else
%                 select_MPC(i,:) = -2; %先判斷煞車左轉
%             end
%         else
%             if select_MPC(i-1,:) == -1 || select_MPC(i-1,:) == -2
%                 select_MPC(i,:) = -3; %剩中速轉彎加速和終點煞車要區別
%             else
%                 select_MPC(i,:) = select_MPC(i-1,:); %補進煞車前的模糊區間
%             end
%         end
%     else %再依速度切割model
%         if Velocity(i,:) >= V_threshold_2
%             select_MPC(i,:) = 4; %4:高速
%         elseif Velocity(i,:) >= V_threshold_1
%             if abs(Omega(i,:)) >= 0.003
%                 select_MPC(i,:) = 3; %3:中速過彎
%             else                       
%                 select_MPC(i,:) = 2; %2:中速微直線
%             end
%         else
%             select_MPC(i,:) = 1; %1:低速
%         end
%     end
% end
% index = classify(select_MPC);
% for i = 1:size(index,1)
%     if index(i,1) == -1 %右轉煞車依Heading值決定
%         if Heading(index(i,4)) >= 0
%             index(i,1) = 6; %6:右煞Heading值>0
%         elseif Heading(index(i,4)) >= -1.42
%             index(i,1) = 5; %5:右煞Heading值-1.42< <0
%         else
%             index(i,1) = 7; %7:右煞Heading值<-1.42
%         end
%     elseif index(i,1) == -2 %左轉煞車依Heading值決定
%         if Heading(index(i,4)) >= 0
%             index(i,1) = 11; %11:左煞Heading值>0
%         elseif Heading(index(i,4)) >= -1
%             index(i,1) = 10; %10:左煞Heading值-1< <0
%         else
%             index(i,1) = 9; %9:左煞Heading值<-1
%         end
%     elseif index(i,1) == -3 %中速轉彎加速和終點煞車要區別
%         count = 0;
%         for j = index(i,3):index(i,4)
%             if Velocity(j,:) <= 5.5
%                 count = count+1;
%             end
%         end
%         if count >= 0.9*index(i,2)
%             index(i,1) = 2;%2:大於速度5.5比數佔九成以上為終點煞車
%         else 
%             index(i,1) = 12;%12:反之為中速轉彎加速   20200514
%         end   
%     end
% end
% for i = 1 : size(index) %重建select_MPC
%     if index(i,1) >= 5 && index(i,2) >= 3
%         index(i,2) = 100; %讓model5以上都不會被smooth掉
%     end
%     select_MPC(index(i,3):index(i,4),:) = index(i,1); 
% end
% select_MPC = smooth(select_MPC,index,15);
% %% select_overlap
% index_MPC = classify(select_MPC);
% j = 1;
% for i = 2:size(index_MPC,1)
%     interval_num = fix(index_MPC(i,2)*0.9);%調select_overlap筆數
%     if interval_num >= comp_num
%         interval_num = comp_num;
%     end
%     upper_value = index_MPC(i,3)-1;
%     lower_value = index_MPC(i,3)-interval_num;
%     if lower_value <= index_MPC(i-1,3)-1
%         lower_value = index_MPC(i-1,3);
%     end
%     index_overlap(j,:) = [index_MPC(i,1) interval_num lower_value upper_value];
%     j = j+1;
% end
% select_overlap = zeros(length(select_MPC),1);
% for i = 1:size(index_overlap,1)
%     select_overlap(index_overlap(i,3):index_overlap(i,4),1) = index_overlap(i,1); 
% end