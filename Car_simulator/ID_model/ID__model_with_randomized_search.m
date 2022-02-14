%% Setting
clc ;close all ;clear;
error_minimum=[400,400];
location = 'C:\meeting\1228\reference_generation\main\';
%% ID Gok,Hok,Cok,Dok
% % 低速加速(LA)
% %   右轉:LAR 1 

% %   左轉:LAL 2

% %   直線:LAS 3

% % 低速減速(LB)
% %   右轉:LBR 4 

% %   左轉:LBL 5

% %   直線:LBS 6

% % 中速加速(MA)

% %   右轉:MAR 7

% %   左轉:MAL 8

% %   直線:MAS 9

% % 中速減速(MB)

% %   右轉:MBR 10

% %   左轉:MBL 11

% %   直線:MBS 12


% % 高速加速(HA)
% %   右轉:HAR 13

% %   左轉:HAL 14

% %   直線:HAS 15


% % 高速減速(HB)
% %   右轉:HBR 16

% %   左轉:HBL 17

% %   直線:HBS 18

% % 學長model 1~10
% 1 低速轉彎

% 2 中速轉彎
file = 'bow2_828.mat';


load([location file]);
% ID_U_clear = [ID_Steer(:,2)'; ID_Accelcmd(:,2)'];
% ID_Y_clear = [ID_Velocity(:,1)'; ID_Heading(:,1)'];
ID_U_clear = [ID_Steer'; ID_Accelcmd'];
ID_Y_clear = [ID_Velocity'; ID_Heading'];
%% Randomized Search Methods

for z=1:500
    a = 0;
%     z=5;
    no_minimum_phase=1;
    load('C:\meeting\1228\ID_model\bow2_828_best.mat');
    clear error_minimum;   
    while(no_minimum_phase==1)
           a=a+1;
           if(a>500)
               break;
           end
        if(mod(z,5))
            for i=1:length(ID_U_noise)
                ID_U_noise( 1 , i ) = ID_U_noise( 1 , i )+3*(0.5-rand)*ID_U_noise( 1 , i ) ;
                ID_U_noise( 2 , i ) = ID_U_noise( 2 , i )+3*(0.5-rand)*ID_U_noise( 2 , i ) ;
                ID_Y_noise( 1 , i ) = ID_Y_noise( 1 , i )+3*(0.5-rand)*ID_Y_noise( 1 , i ) ;
                ID_Y_noise( 2 , i ) = ID_Y_noise( 2 , i )+3*(0.5-rand)*ID_Y_noise( 2 , i ) ;
            end
            ID_U = ID_U_clear + ID_U_noise ;
            ID_Y = ID_Y_clear + ID_Y_noise ;
        else
            ID_U_noise( 1 , : ) = (1e-3*randn).* randn( 1 , size( ID_U_clear , 2 ) ) ;
            ID_U_noise( 2 , : ) = (1e-3*randn).* randn( 1 , size( ID_U_clear , 2 ) ) ;
            ID_U = ID_U_clear + ID_U_noise ;
            ID_Y_noise( 1 , : ) = (1e-2*randn).* randn( 1 , size( ID_Y_clear , 2 ) ) ;
            ID_Y_noise( 2 , : ) = (1e-3*randn).* randn( 1 , size( ID_Y_clear , 2 ) ) ;
            ID_Y = ID_Y_clear + ID_Y_noise ;
         end

        
        [ G , H , C , D , L ] = Auxi_OKID_JXL( ID_U , ID_Y , 2 , 4 , 0 , 0 , 0 ) ;
        [ pole, zero ] = pzmap( G , H , C , D ) ;
        no_minimum_phase=0;
        for i=1:size(zero)
            if norm(zero(i))>=1
                no_minimum_phase=1;
            end
        end
        if rank(ctrb(G,H))~=size(G,1) && rank(obsv(G,C))~=size(G,1)
            no_minimum_phase=1;
        end
    end
%     save('C:\meeting\1228\ID_model\LBR.mat','G', 'H', 'C', 'D',...
%                'ID_U_clear', 'ID_Y_clear','ID_U_noise', 'ID_Y_noise',...
%                'Accelcmd', 'Steer', 'Velocity', 'Heading', 'XYplot',...
%                'tsim');
    save('C:\meeting\1228\ID_model\bow2_828.mat','G', 'H', 'C', 'D',...
               'ID_U_clear', 'ID_Y_clear','ID_U_noise', 'ID_Y_noise');
%        save('C:\meeting\1228\ID_model\bow2_828_best.mat','G', 'H', 'C', 'D',...
%        'ID_U_clear', 'ID_Y_clear','ID_U_noise', 'ID_Y_noise','error_minimum');

               
               
    try
%         run('C:\meeting\1228\MPC_contol\main\MPC_control_main_3');
        run('C:\meeting\1228\Bow\MPC_contol\main\MPC_control_main_3');
        if(error_U(end,1) < error_minimum(1,1) && error_U(end,2) < error_minimum(1,2) && length(error_U) == length(Ideal_U))
            error_minimum(1,1) = error_U(end,1)
            error_minimum(1,2) = error_U(end,2)
%             load('C:\meeting\1228\ID_model\LBR.mat');
            load('C:\meeting\1228\ID_model\bow2_828.mat');
%             save('C:\meeting\1228\ID_model\LBR_best.mat','G', 'H', 'C', 'D',...
%                'ID_U_clear', 'ID_Y_clear','ID_U_noise', 'ID_Y_noise',...
%                'Accelcmd', 'Steer', 'Velocity', 'Heading', 'XYplot',...
%                 'tsim','error_minimum'); 
            save('C:\meeting\1228\ID_model\bow2_828_best.mat','G', 'H', 'C', 'D',...
               'ID_U_clear', 'ID_Y_clear','ID_U_noise', 'ID_Y_noise','error_minimum'); 
        end 
     catch
         fprintf('有Error');
%          close all;
     end             
end
       
                