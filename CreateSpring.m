function SPRING = CreateSpring(temppnt,plotqueue)
Y = temppnt(1,2)-temppnt(end,2);
X = temppnt(1,1)-temppnt(end,1);
if 180-atan2d(Y,X) < 30 || atan2d(Y,X)+180 < 30 || abs(atan2d(Y,X)) < 30
    SPRING.startpoint(1) = temppnt(1,1);
    SPRING.endpoint(1) = temppnt(end,1);
    SPRING.startpoint(2) = mean(temppnt(:,2));
    SPRING.endpoint(2) = mean(temppnt(:,2));
    SPRING.direction = [-sign(X),0];
elseif abs(90-atan2d(Y,X)) < 30 || abs(atan2d(Y,X)+90) < 30
    SPRING.startpoint(2) = temppnt(1,2);
    SPRING.endpoint(2) = temppnt(end,2);
    SPRING.startpoint(1) = mean(temppnt(:,1));
    SPRING.endpoint(1) = mean(temppnt(:,1));
    SPRING.direction = [0,-sign(Y)];
end
SPRING.plotted = plotqueue;
SPRING.coefficient = 0;
end