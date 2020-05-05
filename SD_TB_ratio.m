function [sd_str,sd_end,tb_str,tb_end] = SD_TB_ratio( Nstrk,Npnt_all,pnt,x_lb,x_ub,y_lb,y_ub )
% side ratios and top and bottom ratios
width=x_ub-x_lb;
height=y_ub-y_lb;
sd_str=abs(pnt(1,1,1)-x_lb)/width;
sd_end=abs(pnt(Npnt_all(Nstrk,1),1,Nstrk)-x_lb)/width;
tb_str=abs(pnt(1,2,1)-y_ub)/height;
tb_end=abs(pnt(Npnt_all(Nstrk,1),2,Nstrk)-y_ub)/height;
end

