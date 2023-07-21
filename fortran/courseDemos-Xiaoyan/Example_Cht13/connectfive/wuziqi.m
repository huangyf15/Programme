function varargout = wuziqi(varargin)
% This is a simplified version of Connect Five (in Chinese, WuZiQi) 
% game for two players.  
% Players can choose which color to go first, then click Start button.
% Click Clear button to clear the current game, and click Start to start
% over.
% Click Undo button to undo the goes.
% Check checkbox 'Hint On' to let computer help find threats such as 
% Huosan (free-ends three) and Chongsi (one-free-end four). 
% The game rule can be found in Wikipedia. 
% http://en.wikipedia.org/wiki/Gomoku (English)
% http://zh.wikipedia.org/wiki/%E4%BA%94%E5%AD%90%E6%A3%8B (Chinese)
% According to current home-played Wuziqi rules in China, 
% I have modified some of the rules:
% This version allows the free choose of first-to-go color. It doesn't
% ban Three-and-Three and Four-and-Four. And the chess board is bigger than
% 15x15.
% Author: Zhen Qian.  zhqian@gmail.com
% First version. 08/01/2007


gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @wuziqi_OpeningFcn, ...
                   'gui_OutputFcn',  @wuziqi_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
               
if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'new');

	% Use system color scheme for figure:
	%set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

	if nargout > 0
		varargout{1} = fig;
	end


end

if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%%
% --- Executes just before wuziqi is made visible.
function wuziqi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wuziqi (see VARARGIN)

% Choose default command line output for wuziqi
handles.output = hObject;


handles.ncol = 32;
handles.nrow = 22;
handles.grids = zeros(handles.ncol, handles.nrow);
handles.step = [];
handles.white = 1;
handles.start = 0;
handles.hint = 0;

axes(handles.axes2);
im = imread('title.jpg');
imshow(im,[]);

axes(handles.axes3);
im = imread('demo.jpg');
imshow(im,[]);

axes(handles.axes1);
hold on
plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
line ([0.9,0.9,handles.ncol+0.1,handles.ncol+0.1,0.9],[0.9,handles.nrow+0.1,handles.nrow+0.1,0.9,0.9],'color','k');
for i=1:handles.ncol
line ([i,i],[1, handles.nrow],'color','k');
end

for i=1:handles.nrow
line ([1 handles.ncol],[i,i],'color','k');
end
axis off
%title('Wu Zi Qi');
%guidata (hObject, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes wuziqi wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%
function mutual_exclude(off)
set(off,'Value',0)

%%
% --- Outputs from this function are returned to the command line.
function varargout = wuziqi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%%
%function figure1_CreateFcn(hObject, eventdata, handles)



%%
% --- Executes on button press in start.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%% Start
handles.start = 1;
set(handles.radiobutton2,'Enable','off');
set(handles.radiobutton1,'Enable','off');
handles.grids = zeros(handles.ncol, handles.nrow);

handles.step = [];

axes(handles.axes1); 
hold off

if handles.white ==1
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
else
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','k','markersize',20,'MarkerEdgeColor','w');
end

hold on
line ([0.9,0.9,handles.ncol+0.1,handles.ncol+0.1,0.9],[0.9,handles.nrow+0.1,handles.nrow+0.1,0.9,0.9],'color','k');
hold on
for i=1:handles.ncol
line ([i,i],[1, handles.nrow],'color','k');
end

for i=1:handles.nrow
line ([1 handles.ncol],[i,i],'color','k');
end
axis off
guidata(hObject, handles);

%%
% --- Executes on button press in Undo.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if length(handles.step)>0
   i = abs(handles.step(length(handles.step)));
   [x,y]=ind2sub([handles.ncol,handles.nrow],i);
   handles.grids(x,y) = 0;
   if length(handles.step)>1
       handles.step = handles.step(1:length(handles.step)-1);
   else
       handles.step = [];
   end 
   if handles.white == 1
       handles.white = 0;
   else
       handles.white = 1;
   end
   Draw_Chess(handles);
end

guidata(hObject, handles);


%%
% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
starts=get(gca,'CurrentPoint');
Clck=starts(2,:);
x = round(Clck(1));
y = round(Clck(2));
indicator = 0;

hold on;
if (x>0)&&(x<=handles.ncol)&&(y>0)&&(y<=handles.nrow)&&(handles.start==1)    
    if handles.grids(x,y)==0
        if handles.white ==1
            %plot(x,y,'o','MarkerFaceColor','w','markersize',10,'MarkerEdgeColor','k');
            %plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','k','markersize',20,'MarkerEdgeColor','w');
            handles.white = 0;
            s = 1;
            handles.grids(x,y) = 1;
        else
            %plot(x,y,'o','MarkerFaceColor','k','markersize',10,'MarkerEdgeColor','w');
            %plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
            handles.white = 1;
            s = -1;
            handles.grids(x,y) = -1;
        end
        handles.step = [handles.step, s*sub2ind([handles.ncol,handles.nrow],x,y)];
        indicator = Draw_Chess(handles);
    end    
end

if indicator ~=0
    handles.start = 0;
    set(handles.radiobutton2,'Enable','on');
    set(handles.radiobutton1,'Enable','on');
    handles.grids = zeros(handles.ncol, handles.nrow);
    handles.step = [];
end
    
guidata(hObject, handles);

%%
% --- Executes on button press in black first.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
handles.white=0;
plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','k','markersize',20,'MarkerEdgeColor','w');
off = [handles.radiobutton1];
mutual_exclude(off);
guidata(hObject,handles);


%%
% --- Executes on button press in white first.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
handles.white=1;
plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
off = [handles.radiobutton2];
mutual_exclude(off);
guidata(hObject,handles);


%%
% --- Executes on button press in Clear.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.start = 0;
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton1,'Enable','on');
handles.grids = zeros(handles.ncol, handles.nrow);

handles.step = [];

axes(handles.axes1); 
hold off

if handles.white ==1
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
else
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','k','markersize',20,'MarkerEdgeColor','w');
end

hold on
line ([0.9,0.9,handles.ncol+0.1,handles.ncol+0.1,0.9],[0.9,handles.nrow+0.1,handles.nrow+0.1,0.9,0.9],'color','k');
%hold on
for i=1:handles.ncol
line ([i,i],[1, handles.nrow],'color','k');
end

for i=1:handles.nrow
line ([1 handles.ncol],[i,i],'color','k');
end
axis off
guidata(hObject,handles);

%%
function indicator = Draw_Chess(handles)

axes(handles.axes1);
hold off

if handles.white ==1
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','w','markersize',20,'MarkerEdgeColor','k');
else
    plot(handles.ncol+3.5,handles.nrow,'o','MarkerFaceColor','k','markersize',20,'MarkerEdgeColor','w');
end

hold on
line ([0.9,0.9,handles.ncol+0.1,handles.ncol+0.1,0.9],[0.9,handles.nrow+0.1,handles.nrow+0.1,0.9,0.9],'color','k');
%hold on
for i=1:handles.ncol
    line ([i,i],[1, handles.nrow],'color','k');
end

for i=1:handles.nrow
    line ([1 handles.ncol],[i,i],'color','k');
end
axis off

for j = 1:length(handles.step)
    [x,y]=ind2sub([handles.ncol,handles.nrow],abs(handles.step(j)));
    if handles.step(j)>0
        plot(x,y,'o','MarkerFaceColor','w','markersize',10,'MarkerEdgeColor','k');
    else
        plot(x,y,'o','MarkerFaceColor','k','markersize',10,'MarkerEdgeColor','w');
    end
end


indicator = 0;

if handles.hint == 1
    M = findsansiwu(handles.grids);
    indM = find(M~=0);
    for j = 1:length(indM)
        [x,y]=ind2sub([handles.ncol,handles.nrow],indM(j));
        switch M(indM(j))
            case 3
                plot(x,y,'o','MarkerFaceColor','w','markersize',10,'MarkerEdgeColor','g');
            case -3
                plot(x,y,'o','MarkerFaceColor','k','markersize',10,'MarkerEdgeColor','g');
            case 4
                plot(x,y,'o','MarkerFaceColor','w','markersize',10,'MarkerEdgeColor','r');
            case -4
                plot(x,y,'o','MarkerFaceColor','k','markersize',10,'MarkerEdgeColor','r');
            case 5               
                plot(x,y,'o','MarkerFaceColor','w','markersize',15,'MarkerEdgeColor','r');
                indicator = 5;
            case -5
                plot(x,y,'o','MarkerFaceColor','k','markersize',15,'MarkerEdgeColor','r');
                indicator = -5;
         end
    end
else
    M = findwu(handles.grids);
    indM = find(M~=0);
    for j = 1:length(indM)
        [x,y]=ind2sub([handles.ncol,handles.nrow],indM(j));
        switch M(indM(j))
            case 5
                plot(x,y,'o','MarkerFaceColor','w','markersize',15,'MarkerEdgeColor','r');
                indicator = 5;
            case -5
                plot(x,y,'o','MarkerFaceColor','k','markersize',15,'MarkerEdgeColor','r');
                indicator = -5;
         end
    end
end

if indicator == 5
    uiwait(msgbox('White wins!','Info','modal'));
elseif indicator == -5
    uiwait(msgbox('Black wins!','Info','modal'));
end

%%
% --- Executes on button press in hint on.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
handles.hint = get(handles.checkbox2,'value');
Draw_Chess(handles);
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%clf

