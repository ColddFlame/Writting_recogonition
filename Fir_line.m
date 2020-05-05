function fit_dis = Fir_line( Nstrk,Npnt_all,pnt )
% fit line feature
pnt_new=[];
for i=1:Nstrk
    pnt_new=vertcat(pnt_new,pnt(1:Npnt_all(i,1),:,i));
end
x_new=pnt_new(:,1);
y_new=pnt_new(:,2);
[k,b] = LeastSqr_line( x_new,y_new );
for j=1:size(x_new,1)
    x0=x_new(i);
    y0=y_new(i);
    d_P2L(i,1)= Dist_Pnt2Line(k,b,x0,y0);
end
fit_dis=mean(d_P2L);
end
