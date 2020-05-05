function DAMPS = DrawDamp(Damps)
sF = length(Damps);
for i = 1:sF
    X = Damps(i).startpoint(1) - Damps(i).endpoint(1);
    Y = Damps(i).startpoint(2) - Damps(i).endpoint(2);
    if abs(Damps(i).direction(1)) == 1 && Damps(i).direction(2) == 0
        midP1X = Damps(i).startpoint(1) - X*0.45;
        midP2X = Damps(i).endpoint(1) + X*0.45;
        XX1 = Damps(i).startpoint(1):(-X*0.45/99):midP1X;
        YY1 = Damps(i).startpoint(2)*ones(1,100);
        XX2 = midP2X:(-X*0.45/99):Damps(i).endpoint(1);
        YY2 = Damps(i).startpoint(2)*ones(1,100);
        XD1 = midP1X*ones(1,40);
        YD1 = linspace(YY1(1)+0.16*X,YY1(1)-0.16*X,40);
        XD2 = midP2X*ones(1,40);
        YD2 = linspace(YY1(1)+0.2*X,YY1(1)-0.2*X,40);
        XD3 = (midP1X+X*0.05):(-X*0.15/99):midP2X;
        YD3 = (YY1(1)+0.2*X)*ones(1,100);
        XD4 = XD3;
        YD4 = (YY1(1)-0.2*X)*ones(1,100);
        
        plot(XX1,YY1,'LineWidth',10,'Color','k');
        plot(XX2,YY2,'LineWidth',10,'Color','k');
        plot(XD1,YD1,'LineWidth',3,'Color','k');
        plot(XD2,YD2,'LineWidth',3,'Color','k');
        plot(XD3,YD3,'LineWidth',3,'Color','k');
        plot(XD4,YD4,'LineWidth',3,'Color','k');
    elseif Damps(i).direction(1) == 0 && abs(Damps(i).direction(2)) == 1
        midP1Y = Damps(i).startpoint(2) - Y*0.4;
        midP2Y = Damps(i).endpoint(2) + Y*0.4;
        YY1 = Damps(i).startpoint(2):(-Y*0.4/99):midP1Y;
        XX1 = Damps(i).startpoint(1)*ones(1,100);
        YY2 = midP2Y:(-Y*0.4/99):Damps(i).endpoint(2);
        XX2 = Damps(i).startpoint(1)*ones(1,100);
        YD1 = midP1Y*ones(1,40);
        XD1 = linspace(XX1(1)+0.16*Y,XX1(1)-0.16*Y,40);
        YD2 = midP2Y*ones(1,40);
        XD2 = linspace(XX1(1)+0.2*Y,XX1(1)-0.2*Y,40);
        YD3 = (midP1Y+Y*0.05):(-Y*0.15/99):midP2Y;
        XD3 = (XX1(1)+0.2*Y)*ones(1,100);
        YD4 = YD3;
        XD4 = (XX1(1)-0.2*Y)*ones(1,100);
        
        plot(XX1,YY1,'LineWidth',10,'Color','k');
        plot(XX2,YY2,'LineWidth',10,'Color','k');
        plot(XD1,YD1,'LineWidth',3,'Color','k');
        plot(XD2,YD2,'LineWidth',3,'Color','k');
        plot(XD3,YD3,'LineWidth',3,'Color','k');
        plot(XD4,YD4,'LineWidth',3,'Color','k');
    end
end
DAMPS = Damps;