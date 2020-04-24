function [ bin1,bin2,bin3,bin4,bin5,bin6,bin7,bin8] = Angle_hstgram( Nstrk,Npnt_all,pnt )
% angle histogram

bin1=0;bin2=0;bin3=0;bin4=0;bin5=0;bin6=0;bin7=0;bin8=0;
for i=1:Nstrk
    for j=2:Npnt_all(i,1)
        x1=pnt(j-1,1,i);
        x2=pnt(j,1,i);
        y1=pnt(j-1,2,i);
        y2=pnt(j,2,i);
        theta=atan2d(x2-x1,y2-y1);
        switch true
            case theta<-135&&theta>=-180
                bin1=bin1+1;
            case theta<-90&&theta>=-135
                bin2=bin2+1;
            case theta<-45&&theta>=-90
                bin3=bin3+1;
            case theta<0&&theta>=-45
                bin4=bin4+1;
            case theta<45&&theta>=0
                bin5=bin5+1;
            case theta<90&&theta>=45
                bin6=bin6+1;
            case theta<135&&theta>=90
                bin7=bin7+1;
            case theta<=180&&theta>=135
                bin8=bin8+1;
        end
    end
end
num_angle=sum(Npnt_all(:,1))-Nstrk;
bin1=bin1/num_angle;
bin2=bin2/num_angle;
bin3=bin3/num_angle;
bin4=bin4/num_angle;
bin5=bin5/num_angle;
bin6=bin6/num_angle;
bin7=bin7/num_angle;
bin8=bin8/num_angle;

