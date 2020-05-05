function [ x_num_max,y_num_max,x_num_min,y_num_min,x_str_dir,y_str_dir,x_end_dir,y_end_dir,x_len_end,y_len_end ] = Minmax( Nstrk,Npnt_all,pnt )
% Min and max feature
% number of local minima and maxima
% starting and ending direction
% length between last direction change and last stroke point
for i=1:Nstrk
    % x staring_direction
    if pnt(2,1,i)>pnt(1,1,i)
        x_str_dir(i,1)=1;
    else if  pnt(2,1,i)<pnt(1,1,i)
            x_str_dir(i,1)=-1;
        else
            x_str_dir(i,1)=0;
        end
    end
    % y staring_direction
    if pnt(2,2,i)>pnt(1,2,i)
        y_str_dir(i,1)=1;
    else if  pnt(2,2,i)<pnt(1,2,i)
            y_str_dir(i,1)=-1;
        else
            y_str_dir(i,1)=0;
        end
    end
    % x ending_direction
    if pnt(Npnt_all(i,1),1,i)>pnt(Npnt_all(i,1)-1,1,i)
        x_end_dir(i,1)=1;
    else if  pnt(Npnt_all(i,1),1,i)<pnt(Npnt_all(i,1)-1,1,i)
            x_end_dir(i,1)=-1;
        else
            x_end_dir(i,1)=0;
        end
    end
    % y ending_direction
    if pnt(Npnt_all(i,1),2,i)>pnt(Npnt_all(i,1)-1,2,i)
        y_end_dir(i,1)=1;
    else if  pnt(Npnt_all(i,1),2,i)<pnt(Npnt_all(i,1)-1,2,i)
            y_end_dir(i,1)=-1;
        else
            y_end_dir(i,1)=0;
        end
    end
    % x numbers of max
    x_num_max(i,1)=size(findpeaks(pnt(1:Npnt_all(i,1),1,i)),1);
    % y numbers of max
    y_num_max(i,1)=size(findpeaks(pnt(1:Npnt_all(i,1),2,i)),1);
    % x numbers of min
    x_num_min(i,1)=size(findpeaks(-pnt(1:Npnt_all(i,1),1,i)),1);
    % y numbers of min
    y_num_min(i,1)=size(findpeaks(-pnt(1:Npnt_all(i,1),2,i)),1);
    
    % process about number of min and max
    % x
    if x_num_max(i,1)>x_num_min
        x_num_min(i,1)=x_num_min(i,1)+2;
    else if x_num_max(i,1)<x_num_min
            x_num_max(i,1)=x_num_max(i,1)+2;
        else
            x_num_min(i,1)=x_num_min(i,1)+1;
            x_num_max(i,1)=x_num_max(i,1)+1;
        end
    end
    % y
    if y_num_max(i,1)>y_num_min
        y_num_min(i,1)=y_num_min(i,1)+2;
    else if y_num_max(i,1)<y_num_min
            y_num_max(i,1)=x_num_max(i,1)+2;
        else
            y_num_min(i,1)=y_num_min(i,1)+1;
            y_num_max(i,1)=y_num_max(i,1)+1;
        end
    end
    % x length between last direction change and last stroke point
    x_len_end=pnt(Npnt_all(i,1),1,i)-pnt(Npnt_all(i,1)-1,1,i);
    % y length between last direction change and last stroke point
    y_len_end=pnt(Npnt_all(i,1),2,i)-pnt(Npnt_all(i,1)-1,2,i);
end
x_num_max = sum(x_num_max);
y_num_max = sum(y_num_max);
x_num_min = sum(x_num_min);
y_num_min = sum(y_num_min);
x_str_dir = x_str_dir(1);
y_str_dir = y_str_dir(1);
x_end_dir = x_end_dir(end);
y_end_dir = y_end_dir(end);
end


