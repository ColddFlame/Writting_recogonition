function Points = Rotation_Image(pnt,Npnt,theta,x_c,y_c)
Points = zeros(Npnt,2);
for i = 1:Npnt
    Points(i,:) = (pnt(i,1:2)-[x_c y_c])*[cos(theta) sin(theta);-sin(theta) cos(theta)] + [x_c y_c];
end
end