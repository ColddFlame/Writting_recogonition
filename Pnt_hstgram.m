function [ box1,box2,box3,box4,box5,box6,box7,box8,box9 ] = Pnt_hstgram( Nstrk,Npnt_all,pnt,x_lb,x_ub,y_lb,y_ub )
% 2D point histogram
% 3*3
pnt_new=[];
for i=1:Nstrk
    pnt_new=vertcat(pnt_new,pnt(1:Npnt_all(i,1),:,i));
end

x1=(x_ub-x_lb)/3+x_lb;
x2=2*(x_ub-x_lb)/3+x_lb;
y1=(y_ub-y_lb)/3+y_lb;
y2=2*(y_ub-y_lb)/3+y_lb;
num_pnt=size(pnt_new,1);
x_new=pnt_new(:,1);
y_new=pnt_new(:,2);

box1=0;box2=0;box3=0;box4=0;box5=0;box6=0;box7=0;box8=0;box9=0;
for j=1:size(x_new,1)
    x=x_new(j);
    y=y_new(j);
    if x>=x_lb&&x<x1&&y>y2&&y<=y_ub
        box1=box1+1;
    else if x>=x1&&x<x2&&y>y2&&y<=y_ub
            box2=box2+1;
        else if x>=x2&&x<=x_ub&&y>y2&&y<=y_ub
                box3=box3+1;
            else if x>=x_lb&&x<x1&&y>y1&&y<=y2
                    box4=box4+1;
                else if x>=x1&&x<x2&&y>y1&&y<=y2
                        box5=box5+1;
                    else if x>=x2&&x<=x_ub&&y>y1&&y<=y2
                            box6=box6+1;
                        else if x>=x_lb&&x<x1&&y>=y_lb&&y<=y1
                                box7=box7+1;
                            else if x>=x1&&x<x2&&y>=y_lb&&y<=y1
                                    box8=box8+1;
                                else if x>=x2&&x<=x_ub&&y>=y_lb&&y<=y1
                                        box9=box9+1;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
box1=box1/num_pnt;
box2=box2/num_pnt;
box3=box3/num_pnt;
box4=box4/num_pnt;
box5=box5/num_pnt;
box6=box6/num_pnt;
box7=box7/num_pnt;
box8=box8/num_pnt;
box9=box9/num_pnt;
end

