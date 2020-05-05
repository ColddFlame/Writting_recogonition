function  [pnt_polar,x_c,y_c]=Polar_trans(pnt,Npnt,flag)
for i=1:Npnt-1
    x_i(i,1)=(pnt(i,1)+pnt(i+1,1))/2;
    y_i(i,1)=(pnt(i,2)+pnt(i+1,2))/2;
    l_i(i,1)=sqrt((pnt(i,1)-pnt(i+1,1))^2+(pnt(i,2)-pnt(i+1,2))^2);
end
x_c=sum(x_i(1:Npnt-1).*l_i(1:Npnt-1))/sum(l_i(1:Npnt-1));
y_c=sum(y_i(1:Npnt-1).*l_i(1:Npnt-1))/sum(l_i(1:Npnt-1));
ink_length=sum(l_i(1:Npnt-1));
k=1000/sum(l_i(1:Npnt-1));
if flag == 1
    plot(x_c,y_c,'o','MarkerFaceColor','r')
end
for j=1:Npnt-1
    r(j,1)=sqrt((pnt(j,1)-x_c)^2+(pnt(j,2)-y_c)^2);
    theta(j,1)=atan2((pnt(j,2)-y_c),(pnt(j,1)-x_c));
end
r(:,1)=k*r(:,1);
pnt_polar=[r theta];
% figure(2)
% plot(theta(:,1),r(:,1),'o')
end