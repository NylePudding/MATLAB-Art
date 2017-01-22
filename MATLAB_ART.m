function varargout = MATLAB_ART(varargin)
% MATLAB_ART MATLAB code for MATLAB_ART.fig
%      MATLAB_ART, by itself, creates a new MATLAB_ART or raises the existing
%      singleton*.
%
%      H = MATLAB_ART returns the handle to a new MATLAB_ART or the handle to
%      the existing singleton*.
%
%      MATLAB_ART('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_ART.M with the given input arguments.
%
%      MATLAB_ART('Property','Value',...) creates a new MATLAB_ART or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MATLAB_ART_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MATLAB_ART_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MATLAB_ART

% Last Modified by GUIDE v2.5 13-Jan-2017 14:22:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MATLAB_ART_OpeningFcn, ...
                   'gui_OutputFcn',  @MATLAB_ART_OutputFcn, ...
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


% --- Executes just before MATLAB_ART is made visible.
function MATLAB_ART_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MATLAB_ART (see VARARGIN)

% Choose default command line output for MATLAB_ART
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MATLAB_ART wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MATLAB_ART_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in btn_gen.
function btn_gen_Callback(hObject, eventdata, handles)
% hObject    handle to btn_gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.txt_load,'String','Generating...');

name = get(handles.txt_name,'Value');
gender = get(handles.pop_gender,'Value');
age = get(handles.pop_age,'Value');
type = get(handles.pop_type,'Value');
filter = get(handles.pop_filter,'Value');

n = sum(double(name))*age;
rng('shuffle');


a = [];

s = 750;

b = zeros(s/2);

% b(1:end,end) = 1;
% b(end,1:end) = 1;

ext = randperm(s,age);


for i = 1:s/2
    if any(ext==i)
        b(1:i,i) = 1;
        b(i,1:i) = 1;
    end
end


m = [b fliplr(b);
     flipud(b) flipud(fliplr(b))];
 
% m = randi(2, s) - 1;

if strcmp(gender,'Male')
    gender = 1; 
end

if strcmp(gender,'Female')
    gender = 2;
end

a = conway_life(m);


cm = colour_scheme(30,type,gender);

colormap(cm);
surface = pcolor(a);
shading flat
axis equal off

set(handles.txt_load,'String','Done');

% --- Executes on selection change in pop_age.
function pop_age_Callback(hObject, eventdata, handles)
% hObject    handle to pop_age (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_age contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_age


% --- Executes during object creation, after setting all properties.
function pop_age_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_age (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_type.
function pop_type_Callback(hObject, eventdata, handles)
% hObject    handle to pop_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_type


% --- Executes during object creation, after setting all properties.
function pop_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_gender.
function pop_gender_Callback(hObject, eventdata, handles)
% hObject    handle to pop_gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_gender contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_gender


% --- Executes during object creation, after setting all properties.
function pop_gender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_gender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_filter.
function pop_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pop_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_filter


% --- Executes during object creation, after setting all properties.
function pop_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_name_Callback(hObject, eventdata, handles)
% hObject    handle to txt_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_name as text
%        str2double(get(hObject,'String')) returns contents of txt_name as a double


% --- Executes during object creation, after setting all properties.
function txt_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end