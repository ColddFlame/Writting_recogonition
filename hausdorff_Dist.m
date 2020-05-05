function [H_D,H_DM] = hausdorff_Dist(Template,Points)
% form of points locations solely
[D1,DM1] = hD(Template,Points);
[D2,DM2] = hD(Points,Template);
H_D = max(D1,D2);
H_DM = max(DM1,DM2);
end