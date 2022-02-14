function [ polyCoeffs, lf, lr] = ICM_ID( Steering, Heading, orderPoly, lf, lr)

% Angle unit is rad.
if nargin<3
    orderPoly = 3; 
end
if nargin<4
    lf = 1.515;
    lr = 1.504;
end
if nargin==4
    lr = lf;
end

deltaHA = []
for i=2:length(Heading)
    deltaHA = [deltaHA; Heading(i)-Heading(i-1)];
end

ratio = (lf+lr)/lr;
SteerWheels = atan2(ratio*tan(deltaHA));
polyCoeffs = polyfit(SteerWheels, Steering, orderPoly);

end