function WALLS = DrawWall(Walls)
sF = length(Walls);
for i = 1:sF
    X = Walls(i).startpoint(1) - Walls(i).endpoint(1);
    Y = Walls(i).startpoint(2) - Walls(i).endpoint(2);
    if abs(Walls(i).direction(1)) == 1 && Walls(i).direction(2) == 0
        XX = Walls(i).startpoint(1):(-X/99):Walls(i).endpoint(1);
        YY = Walls(i).startpoint(2)*ones(1,length(XX));
        plot(XX,YY,'LineWidth',3,'Color','k');
        
        step_wall_x = X/9;
        step_wall_y = step_wall_x;
        for j= 1:9
            X_wall = [XX(1)-(j-1)*step_wall_x, XX(1)-j*step_wall_x];
            Y_wall = [YY(1), YY(1)+0.5*Walls(i).fixedside(2)*step_wall_y];
            plot(X_wall,Y_wall,'LineWidth',1,'Color','k');
        end
    elseif Walls(i).direction(1) == 0 && abs(Walls(i).direction(2)) == 1
        YY = Walls(i).startpoint(2):(-Y/99):Walls(i).endpoint(2);
        XX = Walls(i).startpoint(1)*ones(1,length(YY));
        plot(XX,YY,'LineWidth',3,'Color','k');
        step_wall_y = Y/9;
        step_wall_x = step_wall_y;
        for j= 1:9
            Y_wall = [YY(1)-(j-1)*step_wall_y, YY(1)-j*step_wall_y];
            X_wall = [XX(1), XX(1)+0.5*Walls(i).fixedside(1)*step_wall_x];
            plot(X_wall,Y_wall,'LineWidth',1,'Color','k');
        end
    end
end
WALLS = Walls;
end