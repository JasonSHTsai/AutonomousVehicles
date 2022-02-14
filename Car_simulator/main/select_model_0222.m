function [Acceleration,Angular_acceleration,temp,select_Model] = select_model_0222(Velocity,Heading,Low_Speed,Medium_Speed,High_Speed,Overlap_Maxium,N)
%% define 18 models
% �C�t�[�t(LA)
%   �k��:LAR 1
%   ����:LAL 2
%   ���u:LAS 3
% �C�t��t(LB)
%   �k��:LBR 4
%   ����:LBL 5
%   ���u:LBS 6
% ���t�[�t(MA)
%   �k��:MAR 7
%   ����:MAL 8
%   ���u:MAS 9
% ���t��t(MB)
%   �k��:MBR 10
%   ����:MBL 11
%   ���u:MBS 12
% ���t�[�t(HA)
%   �k��:HAR 13
%   ����:HAL 14
%   ���u:HAS 15
% ���t��t(HB)
%   �k��:HBR 16
%   ����:HBL 17
%   ���u:HBS 18
%% �t�סA���ש��� N*Overlap_Maxium��
len = length(Velocity);
diff_Acceleration = diff(Velocity);
diff_Angular_acceleration = diff(Heading);
avg_Acceleration = mean(diff_Acceleration(end-Overlap_Maxium:end,1),1);
avg_Angular_acceleration = mean(diff_Angular_acceleration(end-Overlap_Maxium:end,1),1);
for i=1:N*Overlap_Maxium+1
    Velocity = [Velocity;Velocity(end,1)+avg_Acceleration];
    Heading = [Heading;Heading(end,1)+avg_Angular_acceleration]; 
end

%% initialized condition
Acceleration = [ diff(Velocity) ; 0 ];
Angular_acceleration = [ diff(Heading) ; 0 ];

%% strategize temp model_select  
temp = zeros(length(Velocity),1);
for i=1:length(Velocity)
    if Velocity(i,1) < Low_Speed
        if Acceleration(i,1) >= (-5e-3)
            if Angular_acceleration(i,1) > (3e-6)
                temp(i,1) = 1;
            elseif Angular_acceleration(i,1) >= (-3e-6) 
                temp(i,1) = 3;
            else 
                temp(i,1) = 2;
            end
        else
            if Angular_acceleration(i,1) > (3e-6)
                temp(i,1) = 7;
            elseif Angular_acceleration(i,1) >= (-3e-6) 
                if Acceleration(i,1) >= (-3e-2) %%�C�t��t���u�n��model��
                    temp(i,1) = 4; %���N���|1 flag
                elseif  Acceleration(i,1) >= (-6e-2)
                    temp(i,1) = 5; %�v�B���|3
                else
                    temp(i,1) = 6; %�v�B���|1,2
                end
            else 
                temp(i,1) = 7;
            end
        end
    elseif Low_Speed <= Velocity(i,1) < Medium_Speed
        if Acceleration(i,1) >= (-5e-3)
            if Angular_acceleration(i,1) > (3e-6)
                temp(i,1) = 7;
            elseif Angular_acceleration(i,1) >= (-3e-6) 
                temp(i,1) = 7;
            else 
                temp(i,1) = 7;
            end
        else
            if Angular_acceleration(i,1) > (3e-6)
                temp(i,1) = 7;
            elseif Angular_acceleration(i,1) >= (-3e-6)
                temp(i,1) = 7;
            else 
                temp(i,1) = 7;
            end
        end
        
    end
    if Medium_Speed <= Velocity(i,1)
        if Acceleration(i,1)<= (2e-3) && abs(Angular_acceleration(i,1)) <= (1e-4)
            temp(i,1) = temp(i-1,1);
        else
            if Angular_acceleration(i,1) >= 0
                temp(i,1) = 8;
            else 
                temp(i,1) = 9;
            end
        end
    end
end

%% model smooth 
select_Model = zeros(len ,1);
for i = 1:len 
    t = zeros(18,1);
    for j = 1:N * Overlap_Maxium+1 %
        t(temp(i+j)) = t(temp(i+j))+1;
    end
    [max_num,max_ind] = max(t);
    if i==1
        select_Model(i) = max_ind;
    else
        if max_num < ceil((N * Overlap_Maxium+1) / 2) %
            select_Model(i) = select_Model(i-1);
        else
            select_Model(i) = max_ind;
        end
    end
end
%% special adj for �C�t��t���u & ���t��t���u
if select_Model(end)==4 % Fictitious path Ex1���C��ξǪ��model
    for i = len:-1:2 %����t���u�_�I
        if select_Model(i)==6 && select_Model(i-1)~=6
            strbrapoint1 = i;
            break;
        end
    end
    select_Model(strbrapoint1:end) = 4;
end
end
