function [Points] = Resample(points,n,Npnt)
Total_dist = 0;
cumulsum = zeros(Npnt,1);
for i = 1: Npnt-1
    Distance = sqrt((points(i+1,1)-points(i,1))^2+(points(i+1,2)-points(i,2))^2);
    Total_dist = Total_dist + Distance;
    cumulsum(i+1) = Total_dist;
end
Aver_dist = Total_dist/(n-1);
Points = zeros(n,2);
Points(1,:) = points(1,1:2);
for j = 1:n-1
    dis_loc = cumulsum-j*Aver_dist;
    abs_disloc = abs(dis_loc);
    [~,I] = min(abs_disloc);
    if I == 1
        location1 = 1;
        location2 = 2;
    elseif I == Npnt
        location1 = Npnt-1;
        location2 = Npnt;
    else
        if dis_loc(I)*dis_loc(I-1)<0
            location1 = I-1;
            location2 = I;
        else
            location1 = I;
            location2 = I+1;
        end
    end
    Points(j+1,:) = get_point(points,Aver_dist,j,cumulsum,location1,location2);
end
% PP = points(1:Npnt,1:2);
% k = 1;
% D = 0;
% for j = 2:Npnt
%     d = sqrt((PP(j,1)-PP(j-1,1))^2+(PP(j,2)-PP(j-1,2))^2);
%     if (D+d>=Aver_dist)
%         k = k+1;
%         Points(k,:) = PP(j-1,:)+((Aver_dist-D)/d)*(PP(j,:)-PP(j-1,:));
%         D = 0;
%         PP(j,:) = Points(k,:);
%     else
%         D = D + d;
%     end
% end
Points(end,:) = points(Npnt,1:2);
end