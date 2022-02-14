function [ Steering] = ICM_u( Heading_now, Heading_next, polyCoeffs, lf, lr)

% Angle unit is rad.
if nargin<4
    lf = 1.515;
    lr = 1.504;
end
if nargin==4
    lr = lf;
end

deltaHA = Heading_next-Heading_now;

ratio = (lf+lr)/lr;
SteerWheels = atan2(ratio*tan(deltaHA));
Steering = polyval(polyCoeffs, SteerWheels);

end