Tsim = 0:0.1:60;
load Velocity
load Yaw
X0 = 0; Y0 = 0;
Vx = Velocity_updated(:,1).*cos(Yaw_part(:,1));
Vy = Velocity_updated(:,1).*sin(Yaw_part(:,1));
Yaw_sim = Yaw_part(:,1);
T_sample = Tsim';
[ X_tmp, Y_tmp] = YV2P( T_sample, X0, Y0, Vx, Vy, Yaw_sim, zeros(2,1) );