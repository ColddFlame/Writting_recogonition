function [ num_cusp,max_cusp_end,min_cusp_end ] = Cusp( Nstrk,Npnt_all,pnt )
% cusps
num_cusp=0;
cusp=[];
for i=1:Nstrk
    for j=2:Npnt_all(i,1)-1
        x1=pnt(j-1,1,i);
        x2=pnt(j,1,i);
        x3=pnt(j+1,1,i);
        y1=pnt(j-1,2,i);
        y2=pnt(j,2,i);
        y3=pnt(j+1,2,i);
        theta1=atan2d(x1-x2,y1-y2);
        theta2=atan2d(x3-x2,y3-y2);
        if abs(theta1-theta2)<=60
            num_cusp=num_cusp+1;
            cusp=[cusp;x2 y2];
        end
    end
end
if num_cusp>=1
for i=1:num_cusp
cusp_end(i,1)=sqrt((cusp(i,1)-pnt(Npnt_all(Nstrk,1),1,Nstrk))^2+(cusp(i,2)-pnt(Npnt_all(Nstrk,1),2,Nstrk))^2);
end
max_cusp_end=max(cusp_end);
min_cusp_end=min(cusp_end);
else
    max_cusp_end=0;
    min_cusp_end=0;
end

