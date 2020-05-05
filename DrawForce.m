function FORCES = DrawForce(Forces)
sF = length(Forces);
for i = 1:sF
    X = Forces(i).startpoint(1) - Forces(i).endpoint(1);
    Y = Forces(i).startpoint(2) - Forces(i).endpoint(2);
    if abs(Forces(i).direction(1)) == 1 && Forces(i).direction(2) == 0
        XX = Forces(i).startpoint(1):(-X/99):Forces(i).endpoint(1);
        YY = Forces(i).startpoint(2)*ones(1,length(XX));
        plot(XX,YY,'LineWidth',abs(X*50),'Color','k');
        Y2 = YY(1) - X/6;
        Y22 = YY(1) + X/6;
        X22 = Forces(i).endpoint(1);
        X2 = X22 - X/6;
        XX2 = [X2 X22 X22 X2];
        YY2 = [YY(1) Y2 Y22 YY(1)];
        fill(XX2,YY2,'k');
    elseif Forces(i).direction(1) == 0 && abs(Forces(i).direction(2)) == 1
        YY = Forces(i).startpoint(2):(-Y/99):Forces(i).endpoint(2);
        XX = Forces(i).startpoint(1)*ones(1,length(YY));
        plot(XX,YY,'LineWidth',abs(Y*25),'Color','k');
        X2 = XX(1) - Y/18;
        X22 = XX(1) + Y/18;
        Y22 = Forces(i).endpoint(2);
        Y2 = Y22 - Y/6;
        YY2 = [Y2 Y22 Y22 Y2];
        XX2 = [XX(1) X2 X22 XX(1)];
        fill(XX2,YY2,'k');
    else
        XX = [Forces(i).startpoint(1) Forces(i).endpoint(1)];
        YY = [Forces(i).startpoint(2) Forces(i).endpoint(2)];
%         plot(XX,YY,'LineWidth',15,'Color','b');
        length_Arrow = norm(Forces(i).startpoint-Forces(i).endpoint);
        headsize = length_Arrow/6;
        plot(XX,YY,'LineWidth',headsize*300,'Color','k');
        perpendirection = [Forces(i).direction(2) -Forces(i).direction(1)*2];
        Point1 = Forces(i).endpoint + Forces(i).direction*headsize;
        Point2 = Forces(i).endpoint + perpendirection*headsize*0.5;
        Point3 = Forces(i).endpoint - perpendirection*headsize*0.5;
        X_head = [Point1(1) Point2(1) Point3(1) Point1(1)];
        Y_head = [Point1(2) Point2(2) Point3(2) Point1(2)];
        fill(X_head,Y_head,'k');
    end
end
FORCES = Forces;
end