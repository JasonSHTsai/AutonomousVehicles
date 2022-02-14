function check_inf = check_model(U, Y, U_ideal, Y_ideal, ID_interval)
check_U_error = [];check_Y_error = [];
check_U_rate = [];check_Y_rate = [];
j = 1;
for i = 1:length(ID_interval)
    if ID_interval(i,2) == 1
        check_U_error(j,:) = U_ideal(i,:)-U(i,:);%% ID�P�z�Q�~�t
        check_Y_error(j,:) = Y_ideal(i,:)-Y(i,:);%% ID�P�z�Q�~�t
        check_U_rate(j,:) = check_U_error(j,:)./U_ideal(i,:);%% �~�t�e�z�Q���
        check_Y_rate(j,:) = check_Y_error(j,:)./Y_ideal(i,:);%% �~�t�e�z�Q���
        j = j+1;
    end
end

check_length = size(check_U_rate,1);
check_point = [];
check_standard = 0.55;
j = 1;
for i = fix(check_length*2/5):fix(check_length/5):check_length%% ����ˬd�O�_����
    if abs(check_U_rate(i,:)) <= check_standard%% �~�t�e�z�Q��Ҧb�d�򤺱o��
        check_point(j,1) = 1;
    else
        check_point(j,1) = 0;
    end
    j = j+1;
end

if sum(check_point)/length(check_point) > 0.5
    check_inf = 1;%% ����
else
    check_inf = 0;%% �o��
end
end