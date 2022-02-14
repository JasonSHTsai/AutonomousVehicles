%% ver new
function [select_MPC, select_overlap, slope]= select_model(Velocity, Heading, XYplot)
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
%% Model�C��
%-----------------------------------
% 1:�C�t
%-----------------------------------
% 2:���ݷ٨�
% 3:���t
%-----------------------------------
% 4:���t
%-----------------------------------
% 5:�k��
%-----------------------------------
% 6:����
%% select_MPC  
for i = 1:length(Velocity)
    if Acceleration(i,:) <= -0.2 && face(i,:) == 1 %�k��
        select_MPC(i,:) = 5;
    elseif Acceleration(i,:) <= -0.2 && face(i,:) == -1 %����
        select_MPC(i,:) = 6;
    else
        if Velocity(i,:) >= V_threshold_2
            select_MPC(i,:) = 4; %4:���t
        elseif Velocity(i,:) >= V_threshold_1
            select_MPC(i,:) = 3; %2:���t�L���u
        else
            select_MPC(i,:) = 1; %1:�C�t
        end
    end
end
while Velocity(i,1) < 5.555 %���ݷ٨�
    select_MPC(i,1) = 2;
    i = i-1;
end
index = classify(select_MPC);
for i = 1:size(index,1)
    if index(i,1) >= 5 %���٨�model���|�Qsmooth��
        index(i,2) = 100; 
    end
    select_MPC(index(i,3):index(i,4),:) = index(i,1); 
end
select_MPC = smooth(select_MPC,index,15);

index = classify(select_MPC);
for i = 2:size(index,1)
    if index(i,1) == 4 % �p�G���t���pHeading�ܤƤӦh�Τ�model
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
    
    if index(i-1,1) >= 5 && index(i,1) >= 5%Heading�ܤƼ@�P�|�y���P�����s�����P�٨�model
        index(i,1) = 3;
        index(i-1,1) = 3;
    end
    
    if index(i,1) == 5%Heading����-1.602~-1.383�AHeading �ܤƶq����0.084~0.115�~�i�Υk��
        if Heading(index(i,3),:) < -1.61...
           || Heading(index(i,4),:) > -1.38...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) < 0.08...
           || abs(Heading(index(i,3),:)-Heading(index(i,4),:)) > 0.12
                index(i,1) = 3; 
        end
    elseif index(i,1) == 6%Heading����-1.841~-0.5776�AHeading �ܤƶq����-0.084~-0.0656�~�i�Υ���
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
    interval_num = fix(index_MPC(i,2)*1.9);%��select_overlap����
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
% V_threshold_1 = 3.6;V_range_1 = 0.55;
% V_threshold_2 = 10.5;V_range_2 = 0.65;
% comp_num = 18;
% %% Model�C��
% %-----------------------------------
% % 1:�C�t
% %-----------------------------------
% % 2:���t�L���u
% % 3:���t�L�s
% % 7:���t���s�[�t
% %-----------------------------------
% % 4:���t
% %-----------------------------------
% % 5:�k��Heading�ܤƬ�0.0697
% % 6:�k��Heading�ܤƬ�0.076
% % 7:�k��Heading�ܤƬ�0.091~0.1
% %-----------------------------------
% % 8:����Heading�ܤƬ�0.0605
% % 9:����Heading�ܤƬ�0.076
% % 10:����Heading�ܤƬ�0.106
% % 11:����Heading�ܤƬ�0.214
% %-----------------------------------
% % 12:���t���s�[�t
% %-----------------------------------
% %% select_MPC
% for i = 1:length(Velocity)
%     if slope(i,:) == -1 %���P�_�O�_�٨�
%         if Acceleration(i,:) < -0.007 && Acceleration(i,:) > -0.40 && Acceleration(i-1,:) >= Acceleration(i,:) && Velocity(i,:) > 5.5
%             if face(i,:) == 1
%                 select_MPC(i,:) = -1; %���P�_�٨��k��
%             else
%                 select_MPC(i,:) = -2; %���P�_�٨�����
%             end
%         else
%             if select_MPC(i-1,:) == -1 || select_MPC(i-1,:) == -2
%                 select_MPC(i,:) = -3; %�Ѥ��t���s�[�t�M���I�٨��n�ϧO
%             else
%                 select_MPC(i,:) = select_MPC(i-1,:); %�ɶi�٨��e���ҽk�϶�
%             end
%         end
%     else %�A�̳t�פ���model
%         if Velocity(i,:) >= V_threshold_2
%             select_MPC(i,:) = 4; %4:���t
%         elseif Velocity(i,:) >= V_threshold_1
%             if abs(Omega(i,:)) >= 0.003
%                 select_MPC(i,:) = 3; %3:���t�L�s
%             else                       
%                 select_MPC(i,:) = 2; %2:���t�L���u
%             end
%         else
%             select_MPC(i,:) = 1; %1:�C�t
%         end
%     end
% end
% index = classify(select_MPC);
% for i = 1:size(index,1)
%     if index(i,1) == -1 %�k��٨���Heading�ȨM�w
%         if Heading(index(i,4)) >= 0
%             index(i,1) = 6; %6:�k��Heading��>0
%         elseif Heading(index(i,4)) >= -1.42
%             index(i,1) = 5; %5:�k��Heading��-1.42< <0
%         else
%             index(i,1) = 7; %7:�k��Heading��<-1.42
%         end
%     elseif index(i,1) == -2 %����٨���Heading�ȨM�w
%         if Heading(index(i,4)) >= 0
%             index(i,1) = 11; %11:����Heading��>0
%         elseif Heading(index(i,4)) >= -1
%             index(i,1) = 10; %10:����Heading��-1< <0
%         else
%             index(i,1) = 9; %9:����Heading��<-1
%         end
%     elseif index(i,1) == -3 %���t���s�[�t�M���I�٨��n�ϧO
%         count = 0;
%         for j = index(i,3):index(i,4)
%             if Velocity(j,:) <= 5.5
%                 count = count+1;
%             end
%         end
%         if count >= 0.9*index(i,2)
%             index(i,1) = 2;%2:�j��t��5.5��Ʀ��E���H�W�����I�٨�
%         else 
%             index(i,1) = 12;%12:�Ϥ������t���s�[�t   20200514
%         end   
%     end
% end
% for i = 1 : size(index) %����select_MPC
%     if index(i,1) >= 5 && index(i,2) >= 3
%         index(i,2) = 100; %��model5�H�W�����|�Qsmooth��
%     end
%     select_MPC(index(i,3):index(i,4),:) = index(i,1); 
% end
% select_MPC = smooth(select_MPC,index,15);
% %% select_overlap
% index_MPC = classify(select_MPC);
% j = 1;
% for i = 2:size(index_MPC,1)
%     interval_num = fix(index_MPC(i,2)*0.9);%��select_overlap����
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