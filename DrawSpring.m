function SPRINGS = DrawSpring(Springs)
sF = length(Springs);
for i = 1:sF
    X = Springs(i).startpoint(1) - Springs(i).endpoint(1);
    Y = Springs(i).startpoint(2) - Springs(i).endpoint(2);
    if abs(Springs(i).direction(1)) == 1 && Springs(i).direction(2) == 0
        midP1X = Springs(i).startpoint(1)-X/10;
        midP2X = Springs(i).endpoint(1)+X/10;
        XX1 = linspace(Springs(i).startpoint(1),midP1X,5);
        YY1 = Springs(i).startpoint(2)*ones(1,5);
        XXend = linspace(midP2X,Springs(i).endpoint(1),5);
        YYend = Springs(i).startpoint(2)*ones(1,5);
        XX2 = midP1X*ones(1,5);
        YY2 = linspace(YY1(1),YY1(1)-X*2/5,5);
        XXend2 = midP2X*ones(1,5);
        YYend2 = linspace(YY1(1),YY1(1)+X*2/5,5);
        plot(XX1,YY1,'LineWidth',3,'Color','k');
        plot(XX2,YY2,'LineWidth',3,'Color','k');
        plot(XXend,YYend,'LineWidth',3,'Color','k');
        plot(XXend2,YYend2,'LineWidth',3,'Color','k');
        Xx3 = midP1X;
        for j = 1:3
            Xx3 = (Xx3-X/5);
            XX3 = Xx3*ones(1,5);
            YY3 = linspace(YY1(1)+X*2/5,YY1(1)-X*2/5,5);
            plot(XX3,YY3,'LineWidth',3,'Color','k');
        end
        Xx4 = midP1X;
        Yy4 = YY1(1)-X*2/5;
        for j = 1:4
            YY4 = Yy4+X*4/5;
            XX4 = Xx4-X/5;
            plot([Xx4 XX4],[Yy4 YY4],'LineWidth',3,'Color','k');
            Xx4 = XX4;
        end
    elseif Springs(i).direction(1) == 0 && abs(Springs(i).direction(2)) == 1
        
    end
    SPRINGS = Springs;
end