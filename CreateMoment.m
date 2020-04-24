function Moment = CreateMoment(pnt1,plotqueue)
Y = pnt1(1,2)-pnt1(end,2);
X = pnt1(1,1)-pnt1(end,1);
Moment.center = [mean(pnt1(:,1)), mean(pnt1(:,2))];
Moment.Radius = norm(pnt1(1,1:2)-Moment.center);
Moment.plotted = plotqueue;
if 180-atan2d(Y,X) < 30 || atan2d(Y,X)+180 < 30 || abs(atan2d(Y,X)) < 30
    if pnt1(1,1) < Moment.center(1)
        Moment.clockwise = 1;
    else
        Moment.clockwise = 0;
    end
    Moment.direction = [-sign(X),0];
elseif abs(90-atan2d(Y,X)) < 30 || abs(atan2d(Y,X)+90) < 30
    if pnt1(1,2) > Moment.center(2)
        Moment.clockwise = 1;
    else
        Moment.clockwise = 0;
    end
    Moment.direction = [0,-sign(Y)];
end

