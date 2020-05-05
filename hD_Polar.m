function [D_M] = hD_Polar(A,B)
L1 = size(A,1);
L2 = size(B,1);
DD = zeros(1,L1);
for i = 1:L1
    dd = zeros(1,L2);
    for j = 1:L2
        dd(j) = sqrt(A(i,1)^2+B(j,1)^2-2*A(i,1)*B(j,1)*cos(A(i,2)-B(j,2)));
    end
    DD(i) = min(dd)*A(i,1)^0.1;
end
D_M = mean(DD);
end