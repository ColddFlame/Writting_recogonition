function [A,B] = LeastSqr_line( x,y )
% Line least square method
n=length(x);
sx=sum(x);sy=sum(y);
sx2=sum(x.*x);sxy=sum(x.*y);sy2=sum(y.*y);
A=(n*sxy-sx*sy)/(n*sx2-sx^2);
B=sy/n-A*sx/n;
end

