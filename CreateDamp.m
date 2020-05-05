function DAMP = CreateDamp(temppnt,plotqueue)
Y = temppnt(1,2)-temppnt(end,2);
X = temppnt(1,1)-temppnt(end,1);
if 180-atan2d(Y,X) < 30 || atan2d(Y,X)+180 < 30 || abs(atan2d(Y,X)) < 30   
    XX = temppnt(1,1):(-X/99):temppnt(end,1);
    YY = mean(temppnt(:,2))*ones(1,100);
    DAMP.direction = [-sign(X),0];
elseif abs(90-atan2d(Y,X)) < 30 || abs(atan2d(Y,X)+90) < 30
    YY = temppnt(1,2):(-Y/99):temppnt(end,2);
    XX = mean(temppnt(:,1))*ones(1,100);
    DAMP.direction = [0,-sign(Y)];
end
    DAMP.plotted = plotqueue;
    DAMP.startpoint = temppnt(1,1:2);
    DAMP.endpoint = temppnt(end,1:2);
    DAMP.coefficient = 0;
%     plot(XX1,YY1,'LineWidth',20,'Color','b');
%     plot(XXend,YYend,'LineWidth',20,'Color','b');
end