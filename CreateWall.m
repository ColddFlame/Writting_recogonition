function Wall = CreateWall(pnt1,pnt2,plotqueue)
Y = pnt1(1,2)-pnt1(end,2);
X = pnt1(1,1)-pnt1(end,1);
if 180-atan2d(Y,X) < 30 || atan2d(Y,X)+180 < 30 || abs(atan2d(Y,X)) < 30   
    XX = pnt1(end,1):X/99:pnt1(1,1);
    YY = mean(pnt1(:,2))*ones(1,100);
%     plot(XX,YY,'LineWidth',3,'Color','k');
%     step_wall_x = X/9;
%     step_wall_y = step_wall_x;
    located = sign(mean(pnt2(:,2))-YY(1));
    Wall.fixedside = [0,-located];
    Wall.direction = [-sign(X),0];
%     directed = sign(pnt2(end,1)-pnt2(1,1));
%     for i= 1:9
%         X_wall = [XX(1)+(i-1)*step_wall_x, XX(1)+i*step_wall_x];
%         Y_wall = [YY(1), YY(1)+located*step_wall_y];
%         plot(X_wall,Y_wall,'LineWidth',10,'Color','k');
%     end
elseif abs(90-atan2d(Y,X)) < 30 || abs(atan2d(Y,X)+90) < 30
    YY = pnt1(end,2):Y/99:pnt1(1,2);
    XX = mean(pnt1(:,1))*ones(1,100);
%     plot(XX,YY,'LineWidth',10,'Color','k');
%     step_wall_y = Y/9;
%     step_wall_x = step_wall_y;
    located = sign(mean(pnt2(:,1))-XX(1));
    Wall.fixedside = [-located,0];
    Wall.direction = [0,-sign(Y)];
%     directed = sign(pnt2(end,2)-pnt2(1,2));
%     for i= 1:9
%         Y_wall = [YY(1)+(i-1)*step_wall_y, YY(1)+i*step_wall_y];
%         X_wall = [XX(1), XX(1)+located*step_wall_x];
%         plot(X_wall,Y_wall,'LineWidth',3,'Color','k');
%     end
end
    Wall.startpoint = [XX(1) YY(1)];
    Wall.endpoint = [XX(end) YY(end)];
    Wall.plotted = plotqueue;
end