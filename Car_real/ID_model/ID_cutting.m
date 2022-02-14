function[ID_U, ID_Y, ID_interval] = ID_cutting(Vmin, Vmax, Accelcmd, Steer, Velocity, Heading)
ID_interval = [];
for i = 1:length(Velocity)
    if Velocity(i,:) >= Vmin && Velocity(i,:) < Vmax
        ID_interval = [ID_interval;i];
    end
end
ID_U = [Steer(ID_interval(1,:):ID_interval(end,:))'; Accelcmd(ID_interval(1,:):ID_interval(end,:))'];
ID_Y = [Velocity(ID_interval(1,:):ID_interval(end,:))'; Heading(ID_interval(1,:):ID_interval(end,:))'];
end