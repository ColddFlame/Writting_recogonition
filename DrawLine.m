function LINES = DrawLine(Lines)
sF = length(Lines);
for i = 1:sF
    X = Lines(i).startpoint(1) - Lines(i).endpoint(1);
    Y = Lines(i).startpoint(2) - Lines(i).endpoint(2);
    if abs(Lines(i).direction(1)) == 1 && Lines(i).direction(2) == 0
        XX = Lines(i).startpoint(1):(-X/99):Lines(i).endpoint(1);
        YY = Lines(i).startpoint(2)*ones(1,length(XX));
        plot(XX,YY,'LineWidth',10,'Color','b');
    elseif Lines(i).direction(1) == 0 && abs(Lines(i).direction(2)) == 1
        YY = Lines(i).startpoint(2):(-Y/99):Lines(i).endpoint(2);
        XX = Lines(i).startpoint(1)*ones(1,length(YY));
        plot(XX,YY,'LineWidth',10,'Color','k');
    end
end
LINES = Lines;