function [D,D_M] = hD(A,B)
L1 = size(A,1);
L2 = size(B,1);
DD = zeros(1,L1);
for i = 1:L1
    dd = zeros(1,L2);
    for j = 1:L2
        dd(j) = sqrt((A(i,1)-B(j,1))^2+(A(i,2)-B(j,2))^2);
    end
    DD(i) = min(dd);
end
D = max(DD);
D_M = mean(DD);
end