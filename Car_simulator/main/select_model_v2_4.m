%% ver new
function [select_MPC, select_overlap]= select_model_v2_4(Velocity, Heading, XYplot)
%% �P�_�[�t�סB���[�t��
slope = diff(Velocity);
for i = 1:length(slope)
    if slope(i,:) >= 0
        slope(i,:) = 1; 
    else
        slope(i,:) = -1;
    end
end
slope = [slope(1,1); slope];
index_MPC = classify(slope);
slope = smooth_2(slope,index_MPC,20);

face = diff(Heading);
for i = 1:length(face)
    if face(i,:) > 0
        face(i,:) = 1;
    elseif face(i,:) == 0
        face(i,:) = 0;
    else
        face(i,:) = -1;
    end
end
face = [face(1,1); face];
index_MPC = classify(face);
face = smooth_2(face,index_MPC,30);

Acceleration = diff(Velocity);
Acceleration = [Acceleration(1,1); Acceleration];

diff_Acceleration = diff(Acceleration);
diff_Acceleration = [diff_Acceleration(1,1); diff_Acceleration];

Omega = diff(Heading);
Omega = [Omega(1,1); Omega];
%% Setting Parameter
V_threshold_1 =3.6;%3.6 ;V_range_1 = 0.55;%5.3184 
V_threshold_2 = 10.5;%10.35 ;V_range_2 = 0.65;%10.3809
comp_num = 18;
%% Model�C��
%-----------------------------------
% 1:�C�t�D���u
% 2:���t�D���u
% 3:���t�D���u
%-----------------------------------
% 4:�C�t���u
% 5:���t���u
% 6:���t���u
%-----------------------------------
% 7:�k��
% 8:����
% 9:����
%-----------------------------------
% 10:���ݷ٨�
%% select_MPC  
for i = 1:length(Velocity)
    if Acceleration(i,:) <= -0.0083 && face(i,:) == 0 && Velocity(i,:) < 4.06
        select_MPC(i,:) = 9;% 9:����
    elseif Acceleration(i,:) <= -0.2 
        if face(i,:) == 1
            select_MPC(i,:) = 7;% 7:�k��
        else
            select_MPC(i,:) = 8;% 8:����
        end
    else
        if Velocity(i,:) >= V_threshold_2
            if abs(Omega(i,:)) >= 1e-11%1e-7
                select_MPC(i,:) = 3; % 3:���t�D���u
            else
                select_MPC(i,:) = 6; % 6:���t���u
            end
        elseif Velocity(i,:) >= V_threshold_1
            if abs(Omega(i,:)) >= 2e-12%8e-8
                select_MPC(i,:) = 2; % 2:���t�D���u
            else
                select_MPC(i,:) = 5; % 5:���t���u
            end
        else
            if abs(Omega(i,:)) >= 1e-6%3.1e-2
                select_MPC(i,:) = 1; % 1:�C�t�D���u
            else
                select_MPC(i,:) = 4; % 4:�C�t���u
            end
        end
    end
end

if select_MPC(end-10,:) ~= 9
    brake_end = [0 1000];
    for i = 30:length(Velocity)
        if Velocity(i,1) < brake_end(1,2)
            brake_end = [i Velocity(i,1)];
        end
    end
    for i = brake_end(1,1):-1:1 % 10:���ݷ٨�
        if Velocity(i,1) < 5.555
            select_MPC(i,1) = 10;
        else
            break;
        end
    end
end

index_MPC = classify(select_MPC);
for i = 1:size(index_MPC,1)
    if index_MPC(i,1) >= 7%���٨�model���|�Qsmooth��
        if index_MPC(i,2) >= 3
            index_MPC(i,2) = 100; 
        end
    end
    select_MPC(index_MPC(i,3):index_MPC(i,4),:) = index_MPC(i,1); 
end
select_MPC = smooth_2(select_MPC,index_MPC,15);

index_MPC = classify(select_MPC);
for i = 2:size(index_MPC,1)
    if index_MPC(i,1) == 3 % �p�G���t���pHeading�ܤƤӦh�Τ�model
        count = 0;
        for j = index_MPC(i,3):index_MPC(i,4)
            if abs(Omega(j,:)) >= 1e-3 && Velocity(j,1) < 12
                count = count+1;
            end
        end
        if count/index_MPC(i,2) >= 0.58 || count > 64
            index_MPC(i,1) = 2;
        end
    end
    
    if index_MPC(i-1,1) >= 7 && index_MPC(i,1) >= 7% Heading�ܤƼ@�P�|�y���P�����s�����P�٨�model->�ϥΤ��t���s
        if index_MPC(i,1) == 10
            index_MPC(i,1) = 10;
            index_MPC(i-1,1) = 2;
        else
            index_MPC(i,1) = 2;
            index_MPC(i-1,1) = 2;
        end
    end
    
    if index_MPC(i,1) == 7%Heading����-1.602~-1.383�AHeading �ܤƶq����0.084~0.115�~�i�Υk��
        if Heading(index_MPC(i,3),:) < -1.61...
           || (Heading(index_MPC(i,3),:) > -1.5 && Heading(index_MPC(i,4),:) < -1.38)...
           || (abs(Heading(index_MPC(i,3),:)-Heading(index_MPC(i,4),:)) > 0.05 && abs(Heading(index_MPC(i,3),:)-Heading(index_MPC(i,4),:)) < 0.08)...
           || abs(Heading(index_MPC(i,3),:)-Heading(index_MPC(i,4),:)) > 0.12
                index_MPC(i,1) = 2; 
        end
    elseif index_MPC(i,1) == 8%Heading����-1.841~-0.5776�AHeading �ܤƶq����-0.084~-0.0656�~�i�Υ���
        if Heading(index_MPC(i,3),:) > -0.57...
           || Heading(index_MPC(i,4),:) < -1.842...
           || abs(Heading(index_MPC(i,3),:)-Heading(index_MPC(i,4),:)) < 0.066...
           || abs(Heading(index_MPC(i,3),:)-Heading(index_MPC(i,4),:)) > 0.086
                index_MPC(i,1) = 2; 
        end
    end
    
    if index_MPC(i,1) == 9 && index_MPC(i-1,1) == 5
        index_MPC(i-1,1) = 2;
    end
    
    if index_MPC(i,1) == 10
        if (index_MPC(i-1,1) == 2 && index_MPC(i-1,2) < 45) && (index_MPC(i-2,1) == 2 && index_MPC(i-2,2) < 45)
            index_MPC(i-1,1) = 10;
            index_MPC(i-2,1) = 10;
        end
    end
    
end
for i = 1:size(index_MPC,1)
    select_MPC(index_MPC(i,3):index_MPC(i,4),:) = index_MPC(i,1); 
end

%% select_overlap
for i = 1:length(Velocity)
    if Acceleration(i,:) < -0.00832 && Acceleration(i,:) >= -0.008351 && face(i,:) == 0 && Velocity(i,:) <= 4.141%%-0.008335
        select_overlap(i,:) = 9;% 9:����
    elseif Acceleration(i,:) <= -2e-5 && Acceleration(i,:) > -0.2
        if face(i,:) == 1
            select_overlap(i,:) = 7;% 7:�k��
        else
            select_overlap(i,:) = 8;% 8:����
        end
    else
        if Velocity(i,:) >= 8.2 && Velocity(i,:) < 10.35%6.825
            if abs(Omega(i,:)) >= 9.6e-12%1e-7
                select_overlap(i,:) = 3; % 3:���t�D���u
            else
                select_overlap(i,:) = 6; % 6:���t���u
            end
        elseif Velocity(i,:) >= 2.9 && Velocity(i,:) <= 3.62 %1.98!!!!!!!!!!!!!!!!!!!2.5
            if abs(Omega(i,:)) >= 2e-12%0.8e-7
                select_overlap(i,:) = 2; % 2:���t�D���u
            else
                select_overlap(i,:) = 5; % 5:���t���u
            end
        else
            select_overlap(i,:) = 0;
        end
    end
end

index_overlap = classify(select_overlap);% ��B��������
select_overlap = smooth_2(select_overlap,index_overlap,2);%6
%% ����select_overlap�藍��select_MPC���ϰ�
index_MPC = classify(select_MPC);
index_overlap = classify(select_overlap);
for i = 2:size(index_overlap,1)
    if index_overlap(i,4) < size(select_MPC,1)
        if index_overlap(i,1) ~= select_MPC(index_overlap(i,4)+1,1)%...!!!!!!!!!!!!!!!
        %%|| select_MPC(index_overlap(i,4),1) == select_MPC(index_overlap(i,4)+1,1)
            index_overlap(i,1) = 0;
        end
    end
end
index_overlap(end,1) = 0;% �̫�@���B�z����A�|��
%% ����select_overlap
for i = 1 : size(index_overlap)
    select_overlap(index_overlap(i,3):index_overlap(i,4),:) = index_overlap(i,1); 
end
%% �Y�Lselect_overlap�h���e���v
for i = length(select_MPC):-1:4
    if abs(select_MPC(i,:)-select_MPC(i-1,:)) > 0
        if select_overlap(i-1,:) ~= select_MPC(i,:)
%             if i > comp_num
                select_overlap(i-comp_num:i-1,:) = select_MPC(i,:);
%             else
%                 select_overlap(i-comp_num+5:i-1,:) = select_MPC(i,:);
%             end
        end
    end
end
%% �٨����v�A�]��smooth�|�����@����overlap
for i = size(index_MPC,1)
    if index_MPC(i,1) == 7 || index_MPC(i,1) == 8
        select_overlap(index_MPC(i,3):index_MPC(i,4)) = index_MPC(i,1);
    end
end
end


%% Original
% function [select_MPC, select_overlap]= select_model_v2(Velocity, Heading, XYplot)
% %% �P�_�[�t�סB���[�t��
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
% V_threshold_1 =3.6 ;V_range_1 = 0.55;%5.3184 
% V_threshold_2 = 10.5;V_range_2 = 0.65;%10.3809 
% comp_num = 18;
% %% Model�C��
% %-----------------------------------
% % 1:�C�t
% %-----------------------------------
% % 2:���ݷ٨�
% % 3:���t
% %-----------------------------------
% % 4:���t
% %-----------------------------------
% % 5:�k��
% %-----------------------------------
% % 6:����
% %% select_MPC  
% for i = 1:length(Velocity)
%     if Acceleration(i,:) <= -0.2 && face(i,:) == 1 %�k��
%         select_MPC(i,:) = 7;
%     elseif Acceleration(i,:) <= -0.2 && face(i,:) == -1 %����
%         select_MPC(i,:) = 8;
%     else
%         if Velocity(i,:) >= V_threshold_2
%             select_MPC(i,:) = 3; %4:���t
%         elseif Velocity(i,:) >= V_threshold_1
%             select_MPC(i,:) = 2; %2:���t�L���u
%         else
%             select_MPC(i,:) = 1; %1:�C�t
%         end
%     end
% end
% while Velocity(i,1) < 5.555 %���ݷ٨�
%     select_MPC(i,1) = 9;
%     i = i-1;
% end
% index = classify(select_MPC);
% for i = 1:size(index,1)
%     if index(i,1) >= 7 %���٨�model���|�Qsmooth��
%         index(i,2) = 100; 
%     end
%     select_MPC(index(i,3):index(i,4),:) = index(i,1); 
% end
% select_MPC = smooth(select_MPC,index,15);
% 
% index = classify(select_MPC);
% for i = 2:size(index,1)
%     if index(i,1) == 3 % �p�G���t���pHeading�ܤƤӦh�Τ�model
%         count = 0;
%         for j = index(i,3):index(i,4)
%             if abs(Omega(j,:)) >= 1e-3%1e-2
%                 count = count+1;
%             end
%         end
%         if count/index(i,2) >= 0.59 || count > 64
%             index(i,1) = 2;
%         end
%     end
%     
%     if index(i-1,1) >= 7 && index(i,1) >= 7%Heading�ܤƼ@�P�|�y���P�����s�����P�٨�model
%         index(i,1) = 2;
%         index(i-1,1) = 2;
%     end
%     
%     if index(i,1) == 7%Heading����-1.602~-1.383�AHeading �ܤƶq����0.084~0.115�~�i�Υk��
%         if Heading(index(i,3),:) < -1.61...
%            || Heading(index(i,4),:) > -1.38...
%            || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) < 0.08...
%            || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) > 0.12
%                 index(i,1) = 2; 
%         end
%     elseif index(i,1) == 8%Heading����-1.841~-0.5776�AHeading �ܤƶq����-0.084~-0.0656�~�i�Υ���
%         if Heading(index(i,3),:) > -0.57...
%            || Heading(index(i,4),:) < -1.842...
%            || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) < 0.064...
%            || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) > 0.086
%                 index(i,1) = 2; 
%         end
%     end
% end
% for i = 1:size(index,1)
%     select_MPC(index(i,3):index(i,4),:) = index(i,1); 
% end
% 
% %% select_overlap
% index_MPC = classify(select_MPC);
% j = 1;
% for i = 2:size(index_MPC,1)
%     interval_num = fix(index_MPC(i,2)*1.9);%��select_overlap����
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
% 
% end