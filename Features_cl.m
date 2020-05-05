function f_all = Features_cl( Nstrk,Npnt_all,pnt )
% features collection

[ x_lb,x_ub,y_lb,y_ub ] = Bnd_box( pnt,Nstrk,Npnt_all );

% feature 1 %
%symbol stroke
f1=Nstrk;

% feature 2 %
[ num_cusp,max_cusp_end,min_cusp_end ] = Cusp( Nstrk,Npnt_all,pnt );
f2=[num_cusp;max_cusp_end;min_cusp_end];

% feature 3 %
% Aspect ratio
r = Ast_Ratio( x_lb,x_ub,y_lb,y_ub );
f3=r;

% feature 4 %
[Nint,dis_max,dis_min] = Intersection(Nstrk,Npnt_all,pnt);
f4 = [Nint;dis_max;dis_min];

% feature 5 %
[ box1,box2,box3,box4,box5,box6,box7,box8,box9 ]=Pnt_hstgram( Nstrk,Npnt_all,pnt,x_lb,x_ub,y_lb,y_ub );
f5=[box1;box2;box3;box4;box5;box6;box7;box8;box9];

% feature 6 %
[ bin1,bin2,bin3,bin4,bin5,bin6,bin7,bin8]=Angle_hstgram( Nstrk,Npnt_all,pnt );
f6=[bin1;bin2;bin3;bin4;bin5;bin6;bin7;bin8];

% feature 7 %
% First and last point distance
d= FstLst_distance( Nstrk,Npnt_all,pnt );
f7=d;

% feature 8 %
% Arc length
l = Arc_length( Nstrk,Npnt_all,pnt );
f8=l;

% feature 9 %
fit_dis = Fir_line( Nstrk,Npnt_all,pnt );
f9=fit_dis;

% feature 10 %
[ amax,av,count1,count2 ] = Dom_point(Nstrk,Npnt_all,pnt);
f10 = [amax;av;count1;count2];%%%

% feature 11 %
% Stroke area
s = Strk_area( Nstrk,Npnt_all,pnt );
f11=s;

% feature 12 and feature 13 %
% Side ratios and top and bottom ratios
[sd_str,sd_end,tb_str,tb_end] = SD_TB_ratio( Nstrk,Npnt_all,pnt,x_lb,x_ub,y_lb,y_ub );

f123=[sd_str;sd_end;tb_str;tb_end];

% feature 14 %
[ x_num_max,y_num_max,x_num_min,y_num_min,x_str_dir,y_str_dir,x_end_dir,y_end_dir,x_len_end,y_len_end ] = Minmax( Nstrk,Npnt_all,pnt );
f14=[ x_num_max;y_num_max;x_num_min;y_num_min;x_str_dir;y_str_dir;x_end_dir;y_end_dir;x_len_end;y_len_end];


f_all=[f1;f2;f3;f4;f5;f6;f7;f8;f9;f10;f11;f123;f14];
end

