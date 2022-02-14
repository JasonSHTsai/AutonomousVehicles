function [Velocity_sam, Yaw_sam] = P2YV(mode, Stopflag, samtime, X, Y, Vx, Vy, Yaw, Np, Last_Velocity_end, Last_Heading_end)
% Heading_end = Last_Heading_end;
if length(X) > 2
    Ts = samtime( 2 , 1 ) - samtime( 1 , 1 ) ;
    Tf = Ts / 500;
    simtime = samtime( 1 , 1 ) : Tf : samtime( end , 1 ) ;
    simtime = simtime' ;
    X_sim = spline( samtime' , X' , simtime ) ;
    Y_sim = spline( samtime' , Y' , simtime ) ;
    Velocity_sim = zeros(length( simtime ),1);
    Yaw_sim = zeros(length( simtime ),1);
    Velocity_sam_tmp = zeros(length( samtime ),1);
    Yaw_sam_tmp = zeros(length( samtime ),1);
    comp_yaw = zeros(4,2); 
    Velocity_sim( 1 , 1 ) = ( Vx( 1 , 1 )^2 + Vy( 1 , 1 )^2 )^0.5 ;
    Yaw_sim( 1 , 1 ) = Yaw( 1 , 1 ) ;
    
    %處理前面
    for i = 2 : length( simtime ) - 1
        Velocity_sim( i , 1 ) = ( ( X_sim( i + 1 , 1 ) - X_sim( i - 1 , 1 ) )^2 + ( Y_sim( i + 1 , 1 ) - Y_sim( i - 1 , 1 ) )^2 )^0.5 / Tf / 2 ; 
        Yaw_sim( i , 1 ) = atan2( ( Y_sim( i , 1 ) - Y_sim( i - 1 , 1 ) ) , ( X_sim( i , 1 ) - X_sim( i - 1 , 1 ) ) ) ;
    end
    %處理前面
    %處理最後一筆
    Velocity_sim( length( simtime ) , 1 ) = ( ( X_sim( end , 1 ) - X_sim( end - 1 , 1 ) )^2 + ( Y_sim( end , 1 ) - Y_sim( end - 1 , 1 ) )^2 )^0.5 / Tf ;
    Yaw_sim( length( simtime ) , 1 ) = atan2( ( Y_sim( end , 1 ) - Y_sim( end - 1 , 1 ) ) , ( X_sim( end , 1 ) - X_sim( end - 1 , 1 ) ) ) ;
    %處理最後一筆
    Yaw_sim = Heading_compensation( simtime , Yaw_sim );
    %取值
    j = 1 ;
    for i = 1 : length( simtime )
       if mod( i - 1 , Ts / Tf ) == 0
           Velocity_sam_tmp( j , 1 ) = Velocity_sim( i , 1 ) ;
           Yaw_sam_tmp( j , 1 ) = Yaw_sim( i , 1 ) ;
           j = j + 1 ;
        end 
    end
    
    Velocity_updated_tmp = []; Heading_updated_tmp = [];
    for i = 2:length(X)
        Velocity_updated_tmp = [Velocity_updated_tmp; Velocity_sam_tmp(i)];
        Heading_updated_tmp = [Heading_updated_tmp; Yaw_sam_tmp(i)];
%         Heading_end = Heading_updated_tmp(end,:);
    end
    
    if (length(X) < Np+1 && Stopflag == 1)
        for i = 1:Np+1-length(X)
            Velocity_updated_tmp = [Velocity_updated_tmp;  0.02*(Np+1-length(X)-i)];
            Heading_updated_tmp = [Heading_updated_tmp; Heading_updated_tmp(end,:)];      
%             Heading_end = Heading_updated_tmp(end,:);
        end
        
        Velocity_sam = Velocity_updated_tmp;
        Yaw_sam = Heading_updated_tmp;
     
    elseif (length(X) < Np+1 && Stopflag == 0)
        Velocity_updated_end = Velocity_updated_tmp(end,:);
        for i = 1:Np+1-length(X)
            Velocity_updated_tmp = [Velocity_updated_tmp; Velocity_updated_end*1];
            Heading_updated_tmp = [Heading_updated_tmp; Heading_updated_tmp(end,:)];      
%             Heading_end = Heading_updated_tmp(end,:);
        end
        
        Velocity_sam = Velocity_updated_tmp;
        Yaw_sam = Heading_updated_tmp;
        
    else          
          Velocity_sam = Velocity_updated_tmp;
          Yaw_sam = Heading_updated_tmp;
    end
elseif Stopflag == 0
    Velocity_sam =  zeros(Np,1); Yaw_sam = zeros(Np,1);
         for i = 1:Np  
             Velocity_sam(i,:) =  Last_Velocity_end;
             Yaw_sam(i,:) = Last_Heading_end; %+ 0.0001*randn(1,1);            
         end   
else        
        Velocity_sam =  zeros(Np,1); Yaw_sam = zeros(Np,1);
         for i = 1:Np  
             Velocity_sam(i,:) =  0.02*(Np-i);
             Yaw_sam(i,:) = Last_Heading_end; %+ 0.0001*randn(1,1);            
         end
end
Velocity_sam = (-1)^(mode)*Velocity_sam;
end