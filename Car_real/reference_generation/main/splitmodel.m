%% Setting
warning off ;close all ;clear all ;clc;

%% 
load('Steer0_inf4'); Heading = Yaw;
ID_Steer = Steer(41:868,:); 
ID_Accelcmd = Accelcmd(41:868,:);
ID_Velocity = Velocity(41:868,:);
ID_Heading = Heading(41:868,:);
save('bow2_828','ID_Steer','ID_Accelcmd','ID_Velocity','ID_Heading');