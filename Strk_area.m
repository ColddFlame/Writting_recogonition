function s = Strk_area( Nstrk,Npnt_all,pnt )
% stroke area
for i=1:Nstrk
    for j=1:Npnt_all(i,1)-2
    s_pnt(i,j)=0.5*det([pnt(j+1,1,i)-pnt(1,1,i),pnt(j+1,2,i)-pnt(1,2,i);pnt(j+2,1,i)-pnt(1,1,i),pnt(j+2,2,i)-pnt(1,2,i)])*...
        sign(det([pnt(j+1,1,i)-pnt(1,1,i),pnt(j+1,2,i)-pnt(1,2,i);pnt(j+2,1,i)-pnt(1,1,i),pnt(j+2,2,i)-pnt(1,2,i)]));
    end
end
s_strk=sum(s_pnt,2);
s=mean(s_strk);
end

