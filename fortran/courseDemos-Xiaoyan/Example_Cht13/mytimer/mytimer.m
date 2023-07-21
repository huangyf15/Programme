function varargout = mytimer(varargin)
% MYTIMER MATLAB code for mytimer.fig
%      MYTIMER, by itself, creates a new MYTIMER or raises the existing
%      singleton*.
%
%      H = MYTIMER returns the handle to a new MYTIMER or the handle to
%      the existing singleton*.
%
%      MYTIMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYTIMER.M with the given input arguments.
%
%      MYTIMER('Property','Value',...) creates a new MYTIMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mytimer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mytimer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mytimer

% Last Modified by GUIDE v2.5 11-Dec-2012 17:44:52

% Programmer: œÚ÷æ∫£

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mytimer_OpeningFcn, ...
                   'gui_OutputFcn',  @mytimer_OutputFcn, ...
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


% --- Executes just before mytimer is made visible.
function mytimer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mytimer (see VARARGIN)

% Choose default command line output for mytimer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mytimer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mytimer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
for i = 10:-1:0
   set(handles.timer, 'String', i);
   pause(1);
end
