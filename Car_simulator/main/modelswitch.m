function [flag_mod1,flag_mod2,flag_mod3,flag_mod4,flag_mod5,flag_mod6,flag_mod7,flag_mod8,flag_mod9] = modelswitch(select_MPC, select_overlap, tsim)
%% variables
flag_mod1 = [tsim zeros(length(select_MPC),1)];
flag_mod2 = [tsim zeros(length(select_MPC),1)];
flag_mod3 = [tsim zeros(length(select_MPC),1)];
flag_mod4 = [tsim zeros(length(select_MPC),1)];
flag_mod5 = [tsim zeros(length(select_MPC),1)];
flag_mod6 = [tsim zeros(length(select_MPC),1)];
flag_mod7 = [tsim zeros(length(select_MPC),1)];
flag_mod8 = [tsim zeros(length(select_MPC),1)];
flag_mod9 = [tsim zeros(length(select_MPC),1)];

spm1 = [];
spm2 = [];
spm3 = [];
spm4 = [];
spm5 = [];
spm6 = [];
spm7 = [];
spm8 = [];
spm9 = [];
cm1 = 0;
cm2 = 0;
cm3 = 0;
cm4 = 0;
cm5 = 0;
cm6 = 0;
cm7 = 0;
cm8 = 0;
cm9 = 0;


%% find stop points
for i=2:length(tsim)
    if select_MPC(i-1,2) ~= select_MPC(i,2)
        switch select_MPC(i-1,2)
            case 1
                spm1 = [spm1, i-1];
            case 2
                spm2 = [spm2, i-1];
            case 3
                spm3 = [spm3, i-1];
            case 4
                spm4 = [spm4, i-1];
            case 5
                spm5 = [spm5, i-1];
            case 6
                spm6 = [spm6, i-1];
            case 7
                spm7 = [spm7, i-1];
            case 8
                spm8 = [spm8, i-1];
            case 9
                spm9 = [spm9, i-1];
        end
    elseif i==length(select_MPC)
        switch select_MPC(i,2)
            case 1
                spm1 = [spm1, i];
            case 2
                spm2 = [spm2, i];
            case 3
                spm3 = [spm3, i];
            case 4
                spm4 = [spm4, i];
            case 5
                spm5 = [spm5, i];
            case 6
                spm6 = [spm6, i];
            case 7
                spm7 = [spm7, i];
            case 8
                spm8 = [spm8, i];
            case 9
                spm9 = [spm9, i];
        end
    end
end

%% build model switch signal
%% beginning
switch select_MPC(1,2)            
    case 1
        cm1 = cm1+1;
        flag_mod1(1:spm1(cm1), 2) = 1;
    case 2
        cm2 = cm2+1;
        flag_mod2(1:spm2(cm2), 2) = 1;
    case 3
        cm3 = cm3+1;
        flag_mod3(1:spm3(cm3), 2) = 1;
end
for i=2:length(tsim)
    if select_overlap(i-1,2)==0 && select_overlap(i,2)~=0
        switch select_overlap(i,2)
            case 1 
                cm1 = cm1+1;
                flag_mod1(i-1:spm1(cm1), 2) = 1;
            case 2
                cm2 = cm2+1;
                flag_mod2(i-1:spm2(cm2), 2) = 1;
            case 3
                cm3 = cm3+1;
                flag_mod3(i-1:spm3(cm3), 2) = 1;
            case 4
                cm4 = cm4+1;
                flag_mod4(i-1:spm4(cm4), 2) = 1;
            case 5
                cm5 = cm5+1;
                flag_mod5(i-1:spm5(cm5), 2) = 1;
            case 6
                cm6 = cm6+1;
                flag_mod6(i-1:spm6(cm6), 2) = 1;
            case 7
                cm7 = cm7+1;
                flag_mod7(i-1:spm7(cm7), 2) = 1;
            case 8
                cm8 = cm8+1;
                flag_mod8(i-1:spm8(cm8), 2) = 1;
            case 9
                cm9 = cm9+1;
                flag_mod9(i-1:spm9(cm9), 2) = 1;
        end
    end
end

end