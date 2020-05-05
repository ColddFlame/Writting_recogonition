function [Tsc,Yc] = Tanimoto_Coef(template,point,S)
% form of whole pic
S1 = size(template,1);
S2 = size(point,1);
Template = zeros(48);
Point = zeros(48);
for i = 1:S1
    Template(template(i,1),template(i,2)) = 1;
end
for j = 1:S2
    Point(point(j,1),point(j,2)) = 1;
end
n00 = 0;
nab = 0;
na = 0;
nb = 0;
for i = 1:S
    for j = 1:S
       if Point(i,j) == 1
           nb = nb + 1;
       end
       if Template(i,j) == 1
           na = na + 1;
       end
       if Template(i,j) == 1 && Point(i,j) == 1
           nab = nab + 1;
       end
       if Template(i,j) == 0 && Point(i,j) == 0
           n00 = n00 + 1;
       end
    end
end
n = S^2;
T = nab/(na+nb-nab);
Tc = n00/(na+nb-2*nab+n00);
alpha = 0.75 - 0.25*(na+nb)/(2*n);
Tsc = alpha*T + (1-alpha)*Tc;
Yc = (nab*n00-(na-nab)*(nb-nab))/(nab*n00+(na-nab)*(nb-nab));
end