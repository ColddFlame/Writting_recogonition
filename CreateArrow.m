function Force = CreateArrow(pnt1,pnt2,plotqueue)
Y = pnt1(1,2)-pnt1(end,2);
X = pnt1(1,1)-pnt1(end,1);
if 180-atan2d(Y,X) < 15 || atan2d(Y,X)+180 < 15 || abs(atan2d(Y,X)) < 15
    XX = pnt1(1,1):(-X/99):pnt1(end,1);
    YY = mean(pnt1(:,2))*ones(1,100);
%     plot(XX,YY,'LineWidth',15,'Color','b');
    [X2,L2] = max(pnt2(:,1));
    [X22,L22] = min(pnt2(:,1));
    Y2 = max(pnt2(:,2));
    Y22 = min(pnt2(:,2));
    if Y2-YY(1) > YY(1)-Y22
        Y22 = 2*YY(1)-Y2;
    elseif Y2-YY(1) < YY(1)-Y22
        Y2 = 2*YY(1)-Y22;
    end
    XL = max(XX);
    XS = min(XX);
    if X2<XL && X2>XS
        XX2 = [X2 X22 X2 X2];
        YY2 = [Y2 YY(1) Y22 Y2];
        Force.endpoint = [X22 YY(end)];
    elseif X22<XL && X22>XS
        XX2 = [X22 X2 X22 X22];
        YY2 = [Y2 YY(1) Y22 Y2];
        Force.endpoint = [X2 YY(end)];
    end
%     fill(XX2,YY2,'b');
    Force.startpoint = [XX(1) YY(1)];
    Force.direction = [-sign(X),0];
    Force.magnitude = 0;
    Force.plotted = plotqueue;
elseif abs(90-atan2d(Y,X)) < 15 || abs(atan2d(Y,X)+90) < 15
    YY = pnt1(1,2):(-Y/99):pnt1(end,2);
    XX = mean(pnt1(:,1))*ones(1,100);
%     plot(XX,YY,'LineWidth',15,'Color','b');
    [Y2,L2] = max(pnt2(:,2));
    [Y22,L22] = min(pnt2(:,2));
    X2 = max(pnt2(:,1));
    X22 = min(pnt2(:,1));
    if X2-XX(1) > XX(1)-X22
        X22 = 2*XX(1)-X2;
    elseif X2-XX(1) < XX(1)-X22
        X2 = 2*XX(1)-X22;
    end
    YL = max(YY);
    YS = min(YY);
    if Y2<YL && Y2>YS
        YY2 = [Y2 Y22 Y2 Y2];
        XX2 = [X2 XX(1) X22 X2];
    elseif Y22<YL && Y22>YS
        YY2 = [Y22 Y2 Y22 Y22];
        XX2 = [X2 XX(1) X22 X2];
    end
%     fill(XX2,YY2,'b');
    Force.startpoint = [XX(1) YY(1)];
    Force.endpoint = [XX(end) Y2];
    Force.direction = [0,-sign(Y)];
    Force.magnitude = 0;
    Force.plotted = plotqueue;
else
    Force.startpoint = [pnt1(1,1) pnt1(1,2)];
    npnt = size(pnt1,1);
    [newpnt1] = Resample(pnt1,30,npnt);
    mean_point = [mean(newpnt1(:,1)), mean(newpnt1(:,2))];
    direction = mean_point-Force.startpoint;
    Force.direction = direction/norm(direction);
    Force.magnitude = 0;
    Force.plotted = plotqueue;
    Force.endpoint = Force.startpoint + 2*(mean_point-Force.startpoint);
    XX = [Force.startpoint(1) Force.endpoint(1)];
    YY = [Force.startpoint(2) Force.endpoint(2)];
%     plot(XX,YY,'LineWidth',15,'Color','b');
    length_Arrow = norm(Force.startpoint-Force.endpoint);
    headsize = 0.25*length_Arrow;
    perpendirection = [Force.direction(2) -Force.direction(1)*2];
    Point1 = Force.endpoint + Force.direction*headsize;
    Point2 = Force.endpoint + perpendirection*headsize*2;
    Point3 = Force.endpoint - perpendirection*headsize*2;
    X_head = [Point1(1) Point2(1) Point3(1) Point1(1)];
    Y_head = [Point1(2) Point2(2) Point3(2) Point1(2)];
%     fill(X_head,Y_head,'b');
end

end