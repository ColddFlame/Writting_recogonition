function [Nint,dis_max,dis_min] = Intersection(Nstrk,Npnt_all,pnt)
%Intersection
temp = pnt(1:Npnt_all(1),:,1);
temp1 = [];
count = 0;
if Nstrk>1
for i = 2:Nstrk
temp = [temp;pnt(1:Npnt_all(i),:,i)];
end
end    
for i = size(temp,1)-1
   for j = i+1:size(temp,1)
       if sqrt((temp(i,1) - temp(j,1))^2 + (temp(i,2) - temp(j,2))^2)<0.005
           count = count + 1;
           temp1 = [temp1;[temp(i,1) temp(i,2)]];
end
end
end
temp1 = [unique(temp1(:,1)),unique(temp1(:,2))];
Nint = count;
if Nint>0
for i = 1:size(temp1,1)
   for j = 1:Nstrk
   distance(i,j,1) = sqrt((pnt(1,1,j) - temp1(i,1))^2 + (pnt(1,2,j) - temp1(i,2))^2);
   distance(i,j,2) = sqrt((pnt(end,1,j) - temp1(i,1))^2 + (pnt(end,2,j) - temp1(i,2))^2);  
   end
end
dis_max = max(max(distance));
dis_min = min(min(distance));
else
    dis_max = 0;
    dis_min = 0;
end
end