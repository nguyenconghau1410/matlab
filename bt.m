function varargout = bt(varargin)
% BT MATLAB code for bt.fig
%      BT, by itself, creates a new BT or raises the existing
%      singleton*.
%
%      H = BT returns the handle to a new BT or the handle to
%      the existing singleton*.
%
%      BT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BT.M with the given input arguments.
%
%      BT('Property','Value',...) creates a new BT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bt

% Last Modified by GUIDE v2.5 12-Jan-2024 13:40:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bt_OpeningFcn, ...
                   'gui_OutputFcn',  @bt_OutputFcn, ...
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


% --- Executes just before bt is made visible.
function bt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bt (see VARARGIN)

% Choose default command line output for bt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bt_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
a = str2num(get(handles.edit1, 'string'));
t = ones(a, a);
global I_grey
I_double = im2double(I_grey);
an = conv2(I_double, t / (a * a));
axes(handles.axes2)
imshow(an)
