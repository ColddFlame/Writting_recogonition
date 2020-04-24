function Box = CreateBox(temppnt,plotqueue)
minx = min(temppnt(:,1));
miny = min(temppnt(:,2));
maxx = max(temppnt(:,1));
maxy = max(temppnt(:,2));
% X = [minx maxx maxx minx minx];
% Y = [miny miny maxy maxy miny];
% fill(X,Y,'b')
Box.leftbottom = [minx miny];
Box.righttop = [maxx maxy];
Box.plotted = plotqueue;
Box.mass = 0;
end