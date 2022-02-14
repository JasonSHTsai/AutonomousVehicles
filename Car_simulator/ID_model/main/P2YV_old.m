function [ Velocity_sam , Yaw_sam ] = P2YV_old( samtime , X , Y , Vx , Vy , Yaw )
Ts = samtime( 2 , 1 ) - samtime( 1 , 1 ) ;
Tf = Ts * 1e-2 ;
simtime = samtime( 1 , 1 ) : Tf : samtime( end , 1 ) ;
simtime = simtime' ;
X_sim = spline( samtime' , X' , simtime ) ;
Y_sim = spline( samtime' , Y' , simtime ) ;
Velocity_sim = zeros(length( simtime ),1);
Yaw_sim = zeros(length( simtime ),1);
Velocity_sam = zeros(length( simtime ),1);
Yaw_sam = zeros(length( simtime ),1);
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
       Velocity_sam( j , 1 ) = Velocity_sim( i , 1 ) ;
       Yaw_sam( j , 1 ) = Yaw_sim( i , 1 ) ;
       j = j + 1 ;
    end 
end
%取值
end