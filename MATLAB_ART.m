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

% Last Modified by GUIDE v2.5 12-Feb-2017 11:59:41

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

name = get(handles.txt_name,'String');
gender = get(handles.pop_gender,'Value');
age = get(handles.pop_age,'Value');
type = get(handles.pop_type,'Value');
month = get(handles.pop_month,'Value');
filter = get(handles.pop_filter,'Value');
lifespan = str2double(get(handles.txt_lifespan,'String'));
letter = get(handles.chk_letter, 'value');
s = str2double(get(handles.txt_size,'String'));

% switch(month)
%     case 1
%         cm1 = colour_scheme(30,1,1,1);
%     case 2
%         cm1 = flipud(colour_scheme(30,1,1,500));
%     case 3
%         cm1 = colour_scheme(30,1,1,1350);
%     case 4
%         cm1 = colour_scheme(30,9,1,500);
%     case 5
%         cm1 = colour_scheme(30,3,1,2000);
%     case 6
%         cm1 = colour_scheme(30,9,1,500);
%     case 7
%         cm1 = colour_scheme(30,3,1,2950);
%     case 8
%         cm1 = colour_scheme(30,1,1,2000);
%     case 9
%         cm1 = flipud(colour_scheme(30,2,1,1000));
%     case 10
%         cm1 = colour_scheme(30,9,1,500);
%     case 11
%         cm1 = colour_scheme(30,2,1,2400);
%     case 12
%         cm1 = flipud(colour_scheme(30,1,1,1700));
% end




n = sum(double(name))*age;
rng(n);


m = start_formation(s,age);

[a1,s] = conway_life(m,lifespan);
cm1 = colour_scheme(30,type,gender,-1);
% cm2 = colour_scheme(30,type,gender,-1);

% [~,~,ite] = size(s);
% 
% for i = 1 : ite
%     pause(0.5);
%     imshow(rgb_pcolour(s(:,:,i),cm1));
%     drawnow;
%     refreshdata;
% end


im1 = rgb_pcolour(a1,cm1);
im2 = rgb_pcolour(a1,flipud(cm1));
% im1 = zeros(750,750,3);

letter_mask = name2mask(name);

if letter == 1 
    final = im_mask(im1,im2,a1,letter_mask);
else
    final = im1;
end

imshow(final);




shading flat
axis equal off


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



function txt_lifespan_Callback(hObject, eventdata, handles)
% hObject    handle to txt_lifespan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_lifespan as text
%        str2double(get(hObject,'String')) returns contents of txt_lifespan as a double


% --- Executes during object creation, after setting all properties.
function txt_lifespan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_lifespan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_size_Callback(hObject, eventdata, handles)
% hObject    handle to txt_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_size as text
%        str2double(get(hObject,'String')) returns contents of txt_size as a double


% --- Executes during object creation, after setting all properties.
function txt_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_month.
function pop_month_Callback(hObject, eventdata, handles)
% hObject    handle to pop_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_month


% --- Executes during object creation, after setting all properties.
function pop_month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chk_letter.
function chk_letter_Callback(hObject, eventdata, handles)
% hObject    handle to chk_letter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_letter
