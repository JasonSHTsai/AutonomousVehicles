function Angle_compensated = Heading_compensation( time , Angle )
Angle_compensated = zeros(length(Angle),1);
Angle_flag = 0;
num_pi = fix(Angle(1,:)/pi/2);
Angle_compensated(1,:) = Angle(1,:); 


for i = 2 : length( time )
    Angle(i,:) = Angle(i,:) + num_pi*2*pi;
    if  ((Angle(i,:) - Angle(i-1,:)) <= -pi) % Angle compensation
        Angle_flag = Angle_flag + 1;
    elseif ((Angle(i,:) - Angle(i-1,:)) >= pi)
        Angle_flag = Angle_flag - 1;
    end
    
    Angle_compensated(i,:) = Angle(i,:) + Angle_flag*abs(round((Angle(i,:) - Angle_compensated(i-1,:) )/pi))*pi;  
end

end