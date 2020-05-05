function [ amax,av,count1,count2 ] = Dom_point(Nstrk,Npnt_all,pnt)
% 4 dominant points based angle feature
theta_orin_str = zeros(100);
for i=1:Nstrk
    for j=2:Npnt_all(i,1)-1
        x1=pnt(j-1,1,i); x2=pnt(j,1,i); x3=pnt(j+1,1,i);
        y1=pnt(j-1,2,i); y2=pnt(j,2,i); y3=pnt(j+1,2,i);
        a=[x2-x1 y2-y1];b=[x3-x2 y3-y2];
        theta_orin(j,i)=real(acosd(dot(a,b)/(norm(a)*norm(b))));
    end
    theta_orin_str(i,1:size(findpeaks(theta_orin(:,i))))=findpeaks(theta_orin(:,i));%%
end
theta_orin = rmmissing(theta_orin,1);
av = sum(sum(theta_orin))/(size(theta_orin,1)*size(theta_orin,2));%%
amax = max(max(theta_orin_str));
count1 = 0;
count2 = 0;
for i = 1:Nstrk
    for j = 1:(length(theta_orin)-1)
    phi(j,i) = theta_orin(j+1,i) - theta_orin(j,i);
    end
end
for i = 1:size(phi,2)
    for j = 1:size(phi,1)
    if abs(phi(j,i))<3
        count1 = count1 + 1;
    end
    if j>=2
      if sign(phi(j,i))~=sign(phi(j-1,i))
          count2 = count2 + 1;
      end
    end
    end
end

end

