function [X3,Y3] = Image_trans(pnt,Npnt)
X = pnt(1:Npnt,1);      X = X - min(X);
Y = pnt(1:Npnt,2);          Y = Y - min(Y);
H = max(Y);             % Height of the Bounding Box
W = max(X);             %  Width of the Bounding Box
d = abs(H-W)/2;

%%
if H>W
    X2 = (X+d/2)/(W+d)*47;
    Y2 = Y/max(Y)*47;
else
    Y2 = (Y+d/2)/(H+d)*47;
    X2 = X/max(X)*47;
end
X2 = round(X2)+1;     Y2 = round(Y2)+1;
X3(1) = X2(1);
Y3(1) = Y2(1);
for i = 1:size(X2,1)-1
    if X2(i) ~= X2(i+1) || Y2(i) ~= Y2(i+1)
        X3 = [X3;X2(i+1)];
        Y3 = [Y3;Y2(i+1)];
    end
end