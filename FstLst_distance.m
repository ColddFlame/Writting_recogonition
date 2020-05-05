function d= FstLst_distance( Nstrk,Npnt_all,pnt )
% fist and last distance
for i=1:Nstrk
    d_strk(i,1)=sqrt((pnt(Npnt_all(i,1),1,i)-pnt(1,1,i))^2+(pnt(Npnt_all(i,1),2,i)-pnt(1,2,i))^2);
end
d=mean(d_strk);
end

