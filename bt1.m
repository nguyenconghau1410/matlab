function varargout = bt1(varargin)
% BT1 MATLAB code for bt1.fig
%      BT1, by itself, creates a new BT1 or raises the existing
%      singleton*.
%
%      H = BT1 returns the handle to a new BT1 or the handle to
%      the existing singleton*.
%
%      BT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BT1.M with the given input arguments.
%
%      BT1('Property','Value',...) creates a new BT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bt1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bt1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bt1

% Last Modified by GUIDE v2.5 12-Jan-2024 14:37:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bt1_OpeningFcn, ...
                   'gui_OutputFcn',  @bt1_OutputFcn, ...
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


% --- Executes just before bt1 is made visible.
function bt1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bt1 (see VARARGIN)

% Choose default command line output for bt1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bt1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bt1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.jpg'; '*.png'; '*.tif'}, 'File Selector');
global I_grey;
I = imread(strcat(pathname, filename));
I_grey = rgb2gray(I);
axes(handles.axes1);
imshow(I_grey)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global I_grey
global I_gauss
I_gauss = imnoise(I_grey,'gaussian', 0.1);
axes(handles.axes2)
imshow(I_gauss)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global I_grey
global I_p
I_p = imnoise(I_grey,'salt & pepper');
axes(handles.axes2)
imshow(I_p)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global I_grey;
global I_gauss
global I_p
I_db = im2double(I_gauss);
a = str2num(get(handles.edit1, 'string'));
t = ones(a, a);
res = conv2(I_db, t / (a * a));
axes(handles.axes3);
imshow(res);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global I_gauss
global I_p
a = str2num(get(handles.edit1, 'string'));
t = fix(a * a / 2 + 1);
res = ordfilt2(I_gauss, t ,ones(a, a));
axes(handles.axes3);
imshow(res);



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global I_gauss
global I_p
a = str2num(get(handles.edit1, 'string'));
res = ordfilt2(I_gauss, 1 ,ones(a, a));
axes(handles.axes4);
imshow(res);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global I_gauss
global I_p
a = str2num(get(handles.edit1, 'string'));
res = ordfilt2(I_gauss, a * a ,ones(a, a));
axes(handles.axes4);
imshow(res);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
