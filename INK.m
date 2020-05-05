function varargout = INK(varargin)
% INK MATLAB code for INK.fig
%      INK, by itself, creates a new INK or raises the existing
%      singleton*.
%
%      H = INK returns the handle to a new INK or the handle to
%      the existing singleton*.
%
%      INK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INK.M with the given input arguments.
%
%      INK('Property','Value',...) creates a new INK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before INK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to INK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help INK

% Last Modified by GUIDE v2.5 26-May-2018 18:09:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @INK_OpeningFcn, ...
    'gui_OutputFcn',  @INK_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before INK is made visible.
function INK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to INK (see VARARGIN)

% Choose default command line output for INK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes INK wait for user response (see UIRESUME)
% uiwait(handles.figure1);


global drawing;
drawing = 0;
set(gcf,'WindowButtonDownFcn',@mouseDown)
set(gcf,'WindowButtonMotionFcn',@mouseMove)
set(gcf,'WindowButtonUpFcn',@mouseUp)
global Cpnt
global C
global pnt
global Npnt
global Nstrk
global Npnt_all
global plotqueue
plotqueue = 0;
C = 0;
Cpnt = zeros(1000,3,1000,100);
Npnt_all = zeros(20,1);
pnt = zeros(1000,3,1000);
Npnt = 0;
Nstrk = 0;
tic

% --- Outputs from this function are returned to the command line.
function varargout = INK_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ClearButton.
function ClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla
global Cpnt
global C
global pnt
global Npnt
global Nstrk
global Npnt_all
global Walls
global Springs
global Boxes
global Damps
global Lines
global Forces
global Moments
global plotqueue
% if C == 0
%     Cpnt(:,:,:,1) = zeros(1000,3,1000);
% end
if pnt(:,:,:)==0
    if C > 0
        Cpnt(:,:,:,C) = zeros(1000,3,1000);
        C = C-1;
    end
else
    pnt(:,:,:) = 0;
end
Npnt_all=zeros(20,1);
pnt = zeros(1000,3,1000);
Npnt = 0;
Nstrk = 0;
Walls = [];
Springs = [];
Boxes = [];
Damps = [];
Lines = [];
Forces = [];
Moments = [];
plotqueue = 0;
set(handles.Recognition,'String','');
% set(handles.Scores,'String','');
% set(handles.finalscore,'String','');
set(handles.finalrecog,'String','');


% --- Executes on button press in SaveButton.
function SaveButton_Callback(hObject, eventdata, handles)
% hObject    handle to SaveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pnt
global Npnt

if Npnt<1000
    pnt(Npnt+1:end,:) =[];
end

dlmwrite('InkData.txt',pnt)

function mouseDown(hObject, eventdata, handles)
global drawing
global Nstrk
global Npnt
global r
r = 0;
drawing = 1;
Nstrk=Nstrk+1;
Npnt = 0;

function mouseUp(hObject, eventdata, handles)
global drawing
global Npnt_all
global Npnt
global Nstrk
drawing = 0;
if Nstrk>=1
    Npnt_all(Nstrk,1)=Npnt;
end

function mouseMove(hObject, eventdata, handles)
global drawing
global Npnt
global pnt
global Nstrk
if drawing
    C = get(gca,'CurrentPoint');
    if C(1,1)<1 && C(1,1)>0 && C(1,2)<1 && C(1,2)>0
        Npnt = Npnt+1;
        pnt(Npnt,1,Nstrk) = C(1,1);
        pnt(Npnt,2,Nstrk) = C(1,2);
        pnt(Npnt,3,Nstrk) = toc;
        plot(C(1,1),C(1,2),'b','marker','o','MarkerFaceColor','b')
        hold on
        xlim([0 1]); ylim([0 1]);
        set(gca,'XTick',[],'YTick',[])
        box on
    end
end



% --- Executes on button press in Recognisebutton.
function Recognisebutton_Callback(hObject, eventdata, handles)
% hObject    handle to Recognisebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDAA)
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
        set(handles.Recognition,'String','Number&Letter');
    case -1
        set(handles.Recognition,'String','Other');
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
        set(handles.finalrecog,'String','h');
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
        set(handles.finalrecog,'string',RESULTF)
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
            set(handles.finalrecog,'String','arrow');
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            TEMPNT2 = pnt(1:Npnt_all(2),:,2);
            FORCE = CreateArrow(TEMPNT,TEMPNT2,plotqueue);
            try
                Forces(end+1) = FORCE;
            catch
                Forces = FORCE;
            end
        case 2
            set(handles.finalrecog,'String','whirl');
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            MOMENT = CreateMoment(TEMPNT,plotqueue);
            try
                Moments(end+1) = MOMENT;
            catch
                Moments = MOMENT;
            end
        case 3
            set(handles.finalrecog,'String','box');
            BOX = CreateBox(temppnt,plotqueue);
            try
                Boxes(end+1) = BOX;
            catch
                Boxes = BOX;
            end
        case 4
            set(handles.finalrecog,'String','spring');
            SPRING = CreateSpring(temppnt,plotqueue);
            try
                Springs(end+1) = SPRING;
            catch
                Springs = SPRING;
            end
        case 5
            set(handles.finalrecog,'String','wall');
            TEMPNT = pnt(1:Npnt_all(1),:,1);
            TEMPNT2 = pnt(1:Npnt_all(2),:,2);
            WALL = CreateWall(TEMPNT,TEMPNT2,plotqueue);
            try
                Walls(end+1) = WALL;
            catch
                Walls = WALL;
            end
        case 6
            set(handles.finalrecog,'String','damp');
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
            set(handles.finalrecog,'String','equal');
    end
%     set(handles.finalscore,'String',scoreo);
end
cla
try
    Forces = DrawForce(Forces);
end
try
    Moments = DrawMoment(Moments);
end
try
    Boxes = DrawBox(Boxes);
end
try
    Springs = DrawSpring(Springs);
end
try
    Walls = DrawWall(Walls);
end
try
    Damps = DrawDamp(Damps);
end
try
    Lines = DrawLine(Lines);
end
Npnt_all = zeros(20,1);
pnt = zeros(1000,3,1000);
Npnt = 0;
Nstrk = 0;
% score = 0;


 
   


% --- Executes on button press in clearall.
function clearall_Callback(hObject, eventdata, handles)
% hObject    handle to clearall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla
global Cpnt
global C
global pnt
global Npnt
global Nstrk
global Npnt_all
C = 0;
Cpnt = zeros(1000,3,1000,100);
Npnt_all=zeros(20,1);
pnt = zeros(1000,3,1000);
Npnt = 0;
Nstrk=0;
set(handles.Recognition,'String','');
set(handles.Scores,'String','');
set(handles.finalscore,'String','');
set(handles.finalrecog,'String','');

% --- Executes on button press in undo.
function undo_Callback(hObject, eventdata, handles)
% hObject    handle to undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cpnt
global C
global pnt
global Npnt
global Nstrk
global Npnt_all
global r 
global plotqueue
global Forces
global Moments
global Boxes
global Springs
global Walls
global Damps
global Lines
cla
if r == 1
    if plotqueue ~= 0         
            for z = 1:length(Forces)
                if plotqueue == Forces(z).plotted
                    if max(size(Forces)) == 1
                        Forces = [];
                    end
                    Forces = Forces(1:length(Forces) - 1);
                    break                    
                end
            end
        for z = 1:length(Moments)
                if plotqueue == Moments(z).plotted
                    if max(size(Moments)) == 1
                        Moments = [];
                    end
                    Moments = Moments(1:length(Moments) - 1);
                    break                    
                end
        end
        for z = 1:length(Boxes)
                if plotqueue == Boxes(z).plotted
                    if max(size(Boxes)) == 1
                        Boxes = [];
                    end
                    Boxes = Boxes(1:length(Boxes) - 1);
                    break                    
                end
        end
        for z = 1:length(Springs)
                if plotqueue == Springs(z).plotted
                    if max(size(Springs)) == 1
                        Springs = [];
                    end
                    Springs = Springs(1:length(Springs) - 1);
                    break                    
                end
        end
        for z = 1:length(Walls)
                if plotqueue == Walls(z).plotted
                    if max(size(Walls)) == 1
                        Walls = [];
                    end
                    Walls = Walls(1:length(Walls) - 1);
                    break                    
                end
        end
        for z = 1:length(Damps)
                if plotqueue == Damps(z).plotted
                    if max(size(Damps)) == 1
                        Damps = [];
                    end
                    Damps = Damps(1:length(Damps) - 1);
                    break
                end
        end
        for z = 1:length(Lines)
                if plotqueue == Lines(z).plotted
                    if max(size(Lines)) == 1
                        Lines = [];
                    end
                    Lines = Lines(1:length(Lines) - 1);
                    break
                end
        end   
    end
    %%%%%
try
    Forces = DrawForce(Forces);
end
try
    Moments = DrawMoment(Moments);
end
try
    Boxes = DrawBox(Boxes);
end
try
    Springs = DrawSpring(Springs);
end
try
    Walls = DrawWall(Walls);
end
try
    Damps = DrawDamp(Damps);
end
try
    Lines = DrawLine(Lines);
end
    %%%%%
%     pnt = Cpnt(:,:,:,C);
%     Cpnt(:,:,:,C) = zeros(1000,3,1000);
%     C = C - 1;
end
if Nstrk >= 1
    pnt = zeros(1000,3,1000);
    Nstrk = 0;
    Npnt_all(:,:) = 0;
    Npnt = 0;
    %%%%
try
    Forces = DrawForce(Forces);
end
try
    Moments = DrawMoment(Moments);
end
try
    Boxes = DrawBox(Boxes);
end
try
    Springs = DrawSpring(Springs);
end
try
    Walls = DrawWall(Walls);
end
try
    Damps = DrawDamp(Damps);
end
try
    Lines = DrawLine(Lines);
end
%     pnt(:,:,Nstrk-1) = zeros(1000,3,1);
%     Npnt_all(Nstrk) = 0;
%     Nstrk= Nstrk - 1;
% elseif Nstrk == 0
%     set(handles.Scores,'String','All clean');
% elseif Nstrk == 1 && C == 0
%     Nstrk = 0;    

% elseif Nstrk == 1
%      %     if Cpnt(1,1,1,C) == pnt(1,1,1) && pnt(1,3,1) == Cpnt(1,3,1,C)
%         pnt = Cpnt(:,:,:,C);
%         Cpnt(:,:,:,C) = zeros(1000,3,1000);
%         C = C - 1;
%         sym i;
%         for i = 1:1000
%             if pnt(2,3,i) + pnt(1,3,i) == 0
%                 i = i-1;
%                 break;
%             end
%         end
%         Nstrk = i;
%         sym k;
%         for j = 1:i
%             for k = 1:1000
%                 if pnt(k,1,j) + pnt(k+1,1,j) == 0
%                     k = k-1;
%                     break;
%                 end
%             end
%             Npnt_all(j) = k;
%         end
        
%     else
%      if Nstrk > 1
%         Nstrk = Nstrk - 1;
%         pnt(:,:,Nstrk) = zeros(1000,3,1);
%         Npnt_all(Nstrk+1) = 0;
%      else
%          C = C -1;
%             pnt = Cpnt(:,:,:,C+1);
%              sym i;
%         for i = 1:1000
%             if pnt(2,3,i) + pnt(1,3,i) == 0
%                 i = i-1;
%                 break;
%             end
%         end
%         Nstrk = i;
%         sym k;
%         for j = 1:i
%             for k = 1:1000
%                 if pnt(k,1,j) + pnt(k+1,1,j) == 0
%                     k = k-1;
%                     break;
%                 end
%             end
%             Npnt_all(j) = k;
%         end 
%     end
%     end
end

