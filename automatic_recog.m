function automatic_recog()
global Npnt
global pnt
global Nstrk
global Npnt_all
global x_lb
global x_ub
global y_lb
global y_ub
global Cpnt
global C
global r
global Walls
global Springs
global Boxes
global Damps
global Lines
global Forces
global Moments
global plotqueue
global class1
global class2
r = 1;
C = C + 1;
if pnt == 0
    C = C - 1;
end
Cpnt(:,:,:,C) = pnt;
[ x_lb,x_ub,y_lb,y_ub ] = Bnd_box( pnt,Nstrk,Npnt_all );
f_all = Features_cl( Nstrk,Npnt_all,pnt );
f_all = f_all';
x = f_all;
dlmwrite('data_Box', f_all,'-append');

%% All
qn = DATA;
  q1 = DATA_lowercase;
  q2 = DATA_uppercase;
ql = [q1;q2];
  qa = DATA_arrow;
  qw = DATA_whirl;
  qb = DATA_box;
  qs = DATA_spring;
  qwa = DATA_wall;
  qd = DATA_damp;
  qli = DATA_line;
  qe = DATA_equal;
qo = [qa;qw;qb;qs;qwa;qd;qli;qe];
%% Number&Other
qtemp1 = qn;
qtemp3 = ql;
qtemp4 = [qn;qo];
[HH,scoreln] = adaboost([qtemp1;qtemp3],qtemp4,x);
%% Judge
ff = 0;
if(HH)>0
    ff = 1;
end
if(HH)<0
    ff = -1;
end
switch ff
    case 1
        class1 ='Number&Letter';
    case -1
        class1 ='Other';
end
% set(handles.Scores,'String',scoreln);

temppnt = [];
for count = 1:Nstrk
    temppnt = [temppnt;pnt(1:Npnt_all(count),:,count)];
end
tempNpnt = sum(Npnt_all);
tempo = [];
tempn = [];
if ff == 1
    h = DATA_h;
    temph = ql;
    temph(136:141,:) = [];
    [hh,scoreh] = adaboost(h,temph,x);
    if hh > 0
        class2 = 'h';
%         set(handles.finalscore,'String',scoreh);
    elseif hh < 0
        [C1,S,H_pre] = Pre_recog(temppnt,tempNpnt);
        [pnt_polar,x_c,y_c]=Polar_trans(temppnt,tempNpnt,1);
        r_r = pnt_polar(:,1);
        theta = pnt_polar(:,2);
        Rotat_theta = pi/18*S;
        New_theta = theta + Rotat_theta;
        Points = Rotation_Image(temppnt,tempNpnt,Rotat_theta,x_c,y_c);
        plot(Points(:,1),Points(:,2),'b.');
        [C11,H1] = ImageClassifier(Points, tempNpnt);
        [C2,H2] = ImageClassifier(temppnt,tempNpnt);
        CH = [C1 C11 C2;H_pre H1 H2];
        [~,L] = min(CH(2,:));
        CF = CH(1,L);
        if CF<=26
            CCF = CF + 64;
        elseif CF>26 && CF <=52
            CCF = CF + 70;
        elseif CF>52
            CCF = num2str(CF-53);
        end
        RESULTF = ['class: ' CCF];
        class2 = RESULTF
    end

elseif ff == -1
    for i = 1:8
        tempoo = qo;
        tempoo((i-1)*45+1:i*45,:) = [];
        [fff,tempscore] = adaboost(qo((i-1)*45+1:i*45,:),tempoo,x);
        tempo(1,i) = fff;
        tempo(2,i) = tempscore;
    end
    [scoreo,tho] = max(tempo(2,:));
    plotqueue = plotqueue + 1;
    switch tho
        case 1
            class2 = 'arrow';
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            TEMPNT2 = pnt(1:Npnt_all(2),:,2);
            FORCE = CreateArrow(TEMPNT,TEMPNT2,plotqueue);
            try
                Forces(end+1) = FORCE;
            catch
                Forces = FORCE;
            end
        case 2
            class2 = 'whirl';
        case 3
            class2 = 'box';
            BOX = CreateBox(temppnt,plotqueue);
            try
                Boxes(end+1) = BOX;
            catch
                Boxes = BOX;
            end
        case 4
            class2 = 'spring';
            SPRING = CreateSpring(temppnt,plotqueue);
            try
                Springs(end+1) = SPRING;
            catch
                Springs = SPRING;
            end
        case 5
            class2 = 'wall';
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            TEMPNT2 = pnt(1:Npnt_all(2),:,2);
            WALL = CreateWall(TEMPNT,TEMPNT2,plotqueue);
            try
                Walls(end+1) = WALL;
            catch
                Walls = WALL;
            end
        case 6
            class2 = 'damp';
            DAMP = CreateDamp(temppnt,plotqueue);
            try
                Damps(end+1) = DAMP;
            catch
                Damps = DAMP;
            end
        case 7
            set(handles.finalrecog,'String','line');
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            LINE = CreateLine(TEMPNT,plotqueue);
            try
                Lines(end+1) = LINE;
            catch
                Lines = LINE;
            end
        case 8
            class2 = 'equal';
    end
%     set(handles.finalscore,'String',scoreo);
end
Npnt_all = zeros(20,1);
pnt = zeros(1000,3,1000);
Npnt = 0;
Nstrk = 0;