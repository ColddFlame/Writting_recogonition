function [ x_lb,x_ub,y_lb,y_ub ] = Bnd_box( pnt,Nstrk,Npnt_all )
% Bonding box
for i=1:Nstrk
 max_strk(i,1:2)=max(pnt(1:Npnt_all(i,1),1:2,i));
 min_strk(i,1:2)=min(pnt(1:Npnt_all(i,1),1:2,i));
end
max_all(:,1:2)=[max(max_strk(:,1)) max(max_strk(:,2))];
min_all(:,1:2)=[min(min_strk(:,1)) min(min_strk(:,2))];
x_ub=max_all(1,1);
y_ub=max_all(1,2);
x_lb=min_all(1,1);
y_lb=min_all(1,2);