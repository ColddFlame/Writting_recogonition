function MOMENTS = DrawMoment(Moments)
sF = length(Moments);
for i = 1:sF
    if abs(Moments(i).direction(1)) == 1 && Moments(i).direction(2) == 0
        theta = -60:5:240;
    elseif Moments(i).direction(1) == 0 && abs(Moments(i).direction(2)) == 1
        theta = -150:5:150;
    end
    XX = 0.5*cosd(theta)*Moments(i).Radius+Moments(i).center(1);
    YY = sind(theta)*Moments(i).Radius+Moments(i).center(2);
    plot(XX,YY,'LineWidth',3,'Color','k');
    if abs(Moments(i).direction(1)) == 1 && Moments(i).direction(2) == 0
        if Moments(i).clockwise == 1
            plot(XX(end),YY(end),'o');
        else
            plot(XX(1),YY(1),'o');
        end
    elseif Moments(i).direction(1) == 0 && abs(Moments(i).direction(2)) == 1
        if Moments(i).clockwise == 1
            plot(XX(1),YY(1),'o');
        else
            plot(XX(end),YY(end),'o');
        end
    end
end
MOMENTS = Moments;