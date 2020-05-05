function l = Arc_length( Nstrk,Npnt_all,pnt )
% arc length
for i=1:Nstrk
    strk_leth(i,1)=sum(sqrt((pnt(2:Npnt_all(i,1),1,i)-pnt(1:Npnt_all(i,1)-1,1,i)).^2+(pnt(2:Npnt_all(i,1),2,i)-pnt(1:Npnt_all(i,1)-1,2,i)).^2));
end
l=sum(strk_leth);
end

