function [ X_sam , Y_sam ] = YV2P( samtime , X , Y , Vx , Vy , Yaw , Beta )

Ts = samtime( 2 , 1 ) - samtime( 1 , 1 ) ;
Tf = Ts /10 ;
simtime = samtime( 1 , 1 )  : Tf : samtime( end , 1 ) ;
simtime = simtime' ;
Velocity_sim = zeros(length( simtime ),1); X_sim = zeros(length( simtime ),1); Y_sim = zeros(length( simtime ),1); 
X_sam = zeros(2,1); Y_sam = zeros(2,1);
Vx_sim = spline( samtime' , Vx' , simtime ) ;
Vy_sim = spline( samtime' , Vy' , simtime ) ;
Beta_sim = spline( samtime' , Beta' , simtime ) ; 
for i = 1 : length( simtime )
    Velocity_sim( i , 1 ) = ( Vx_sim( i , 1 )^2 + Vy_sim( i , 1 )^2 )^0.5 ;
end
Yaw_sim = spline( samtime' , Yaw' , simtime ) ;
X_sim( 1 , 1 ) = X( 1 , 1 ) ;%%初始值可自行設定
Y_sim( 1 , 1 ) = Y( 1 , 1 ) ;%%初始值可自行設定
for i = 2 : length( simtime )
    X_sim( i , 1 ) =  X_sim( i - 1 , 1 ) + ( Velocity_sim( i , 1 ) * cos( Yaw_sim( i , 1 ) + Beta_sim( i , 1 ) ) + Velocity_sim( i - 1 , 1 ) * cos( Yaw_sim( i - 1 , 1 ) + Beta_sim( i - 1 , 1 ) ) ) * Tf * 0.5 ;
    Y_sim( i , 1 ) =  Y_sim( i - 1 , 1 ) + ( Velocity_sim( i , 1 ) * sin( Yaw_sim( i , 1 ) + Beta_sim( i , 1 ) ) + Velocity_sim( i - 1 , 1 ) * sin( Yaw_sim( i - 1 , 1 ) + Beta_sim( i - 1 , 1 ) ) ) * Tf * 0.5 ;
end
j = 1 ;
for i = 1 : length( simtime )
    if mod( i - 1 , Ts / Tf ) == 0
       X_sam( j , 1 ) = X_sim( i , 1 ) ;
       Y_sam( j , 1 ) = Y_sim( i , 1 ) ;
       j = j + 1 ;
    end
end
end