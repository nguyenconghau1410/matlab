function varargout = btnhom9(varargin)
% BTNHOM9 MATLAB code for btnhom9.fig
%      BTNHOM9, by itself, creates a new BTNHOM9 or raises the existing
%      singleton*.
%
%      H = BTNHOM9 returns the handle to a new BTNHOM9 or the handle to
%      the existing singleton*.
%
%      BTNHOM9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BTNHOM9.M with the given input arguments.
%
%      BTNHOM9('Property','Value',...) creates a new BTNHOM9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before btnhom9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to btnhom9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help btnhom9

% Last Modified by GUIDE v2.5 20-Jan-2024 18:27:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @btnhom9_OpeningFcn, ...
                   'gui_OutputFcn',  @btnhom9_OutputFcn, ...
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


% --- Executes just before btnhom9 is made visible.
function btnhom9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to btnhom9 (see VARARGIN)

% Choose default command line output for btnhom9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes btnhom9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = btnhom9_OutputFcn(hObject, eventdata, handles) 
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
I_grey = rgb2gray(im2double(I));
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
item = get(handles.popupmenu1, 'Value');
global I_grey;
d0 = str2num(get(handles.edit1, 'string'));
n = str2num(get(handles.edit2, 'string'));
[M, N] = size(I_grey);
FT_img = fft2(double(I_grey));

u = 0:(M-1); 
idx = find(u>M/2);
u(idx) = u(idx)-M; 
v = 0:(N-1); 
idy = find(v>N/2); 
v(idy) = v(idy)-N; 

[V, U] = meshgrid(v, u);
D = sqrt(U.^2+V.^2);
if item == 2
    H = double(D <= d0);
else
    H = double(D >= d0);
end
G = H.*FT_img;
output_image = real(ifft2(double(G)));
axes(handles.axes2);
imshow(output_image)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
item = get(handles.popupmenu1, 'Value');
global I_grey;
d0 = str2num(get(handles.edit1, 'string'));
n = str2num(get(handles.edit2, 'string'));
[M, N] = size(I_grey);
FT_img = fft2(double(I_grey));

u = 0:(M-1); 
idx = find(u>M/2);
u(idx) = u(idx)-M; 
v = 0:(N-1); 
idy = find(v>N/2); 
v(idy) = v(idy)-N; 

[V, U] = meshgrid(v, u);
D = sqrt(U.^2+V.^2);
if item == 2
    H = 1./(1 + (D./d0).^(2*n)); 
else
    H = 1./(1 + (d0./D).^(2*n));
end
G = H.*FT_img;
output_image = real(ifft2(double(G)));
axes(handles.axes2);
imshow(output_image)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
item = get(handles.popupmenu1, 'Value');
global I_grey;
d0 = str2num(get(handles.edit1, 'string'));
n = str2num(get(handles.edit2, 'string'));
[M, N] = size(I_grey);
FT_img = fft2(double(I_grey));

u = 0:(M-1); 
idx = find(u>M/2);
u(idx) = u(idx)-M; 
v = 0:(N-1); 
idy = find(v>N/2); 
v(idy) = v(idy)-N; 

[V, U] = meshgrid(v, u);
D = sqrt(U.^2+V.^2);
H = 1 - exp(-(D.^2)/(2 * (d0 .^ 2)));
if item == 3
    H = 1 - H;
end
G = (1 - H).*FT_img;
output_image = real(ifft2(double(G)));
axes(handles.axes2);
imshow(output_image)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
items = {'Choose' ,'Low', 'High'};

set(hObject, 'String', items);

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
