function BOXES = DrawBox(Boxes)
sF = length(Boxes);
for i = 1:sF
    minx = Boxes(i).leftbottom(1);
    miny = Boxes(i).leftbottom(2);
    maxx = Boxes(i).righttop(1);
    maxy = Boxes(i).righttop(2);
    X = [minx maxx maxx minx minx];
    Y = [miny miny maxy maxy miny];
    fill(X,Y,'k');
end
BOXES = Boxes;
end