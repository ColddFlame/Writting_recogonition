function d_P2L = Dist_Pnt2Line(k,b,x0,y0)
% Distance between point(x0,y0) and line y=kx+b
d_P2L=abs(k*x0-y0+b)./sqrt(k^2+1);
end

