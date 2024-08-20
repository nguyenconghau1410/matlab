function varargout = presentation(varargin)
% PRESENTATION MATLAB code for presentation.fig
%      PRESENTATION, by itself, creates a new PRESENTATION or raises the existing
%      singleton*.
%
%      H = PRESENTATION returns the handle to a new PRESENTATION or the handle to
%      the existing singleton*.
%
%      PRESENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESENTATION.M with the given input arguments.
%
%      PRESENTATION('Property','Value',...) creates a new PRESENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before presentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to presentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help presentation

% Last Modified by GUIDE v2.5 01-Feb-2024 00:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @presentation_OpeningFcn, ...
                   'gui_OutputFcn',  @presentation_OutputFcn, ...
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


% --- Executes just before presentation is made visible.
function presentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to presentation (see VARARGIN)

% Choose default command line output for presentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes presentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = presentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp;*.tif','Supported Image Files'}, 'Ch?n m?t ?nh');
if isequal(filename,0) || isequal(pathname,0)
    return;
end
fullpath = fullfile(pathname, filename);
global img;
img = imread(fullpath);
global I_d;
if size(img, 3) == 3
    I_d = rgb2gray(im2double(img));
else
    I_d = im2double(img);
end
axes(handles.axes1);
imshow(I_d);

function pushbutton2_Callback(hObject, eventdata, handles)
global x; global y;
[y, x] = ginput(1);
y=round(y(1)); x=round(x(1));


function edit1_Callback(hObject, eventdata, handles)


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global x; global y; global I_d;
t = str2double(get(handles.edit1, 'string'));
J = regiongrowing(I_d, x, y, t);
axes(handles.axes2);
imshow(I_d + J);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global img;
std = str2double(get(handles.edit2, 'string'));
dim = str2double(get(handles.edit3, 'string'));
g = splitmerge(img, dim, @predicate, std);
axes(handles.axes3);
imshow(g);
