function Line = CreateLine(pnt,plotqueue)
Y = pnt(1,2)-pnt(end,2);
X = pnt(1,1)-pnt(end,1);
if 180-atan2d(Y,X) < 30 || atan2d(Y,X)+180 < 30 || abs(atan2d(Y,X)) < 30   
    XX = pnt(end,1):X/99:pnt(1,1);
    YY = mean(pnt(:,2))*ones(1,100);
    Line.direction = [-sign(X),0];
elseif abs(90-atan2d(Y,X)) < 30 || abs(atan2d(Y,X)+90) < 30
    YY = pnt(end,2):Y/99:pnt(1,2);
    XX = mean(pnt(:,1))*ones(1,100);
    Line.direction = [0,-sign(Y)];
end
    plot(XX,YY,'LineWidth',10,'Color','b');
    Line.startpoint = [XX(1) YY(1)];
    Line.endpoint = [XX(end) YY(end)];
    Line.plotted = plotqueue;
end