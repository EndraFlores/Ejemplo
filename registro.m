function varargout = registro(varargin)
% REGISTRO MATLAB code for registro.fig
%      REGISTRO, by itself, creates a new REGISTRO or raises the existing
%      singleton*.
%
%      H = REGISTRO returns the handle to a new REGISTRO or the handle to
%      the existing singleton*.
%
%      REGISTRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTRO.M with the given input arguments.
%
%      REGISTRO('Property','Value',...) creates a new REGISTRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before registro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to registro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help registro

% Last Modified by GUIDE v2.5 30-Apr-2019 15:12:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registro_OpeningFcn, ...
                   'gui_OutputFcn',  @registro_OutputFcn, ...
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


% --- Executes just before registro is made visible.
function registro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to registro (see VARARGIN)

% Choose default command line output for registro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in capturar.
function capturar_Callback(hObject, eventdata, handles)
% hObject    handle to capturar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
%set(handles. imagen,'Visible', 'On');
foto=getsnapshot(vid);
axes(handles.axes1)
imshow(foto)

% --- Executes on button press in EncenderCamara.
function EncenderCamara_Callback(hObject, eventdata, handles)
% hObject    handle to EncenderCamara (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
set(handles.axes1,'visible','on');
axes(handles.axes1);
vid=videoinput('winvideo', 1);
%vid.ReturnedColorSpace='rbg';
 vidRes = get(vid, 'VideoResolution');
 nBands = get(vid, 'NumberOfBands');
 hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
 preview(vid, hImage);


function nombre_Callback(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nombre as text
%        str2double(get(hObject,'String')) returns contents of nombre as a double


% --- Executes during object creation, after setting all properties.
function nombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function matricula_Callback(hObject, eventdata, handles)
% hObject    handle to matricula (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matricula as text
%        str2double(get(hObject,'String')) returns contents of matricula as a double


% --- Executes during object creation, after setting all properties.
function matricula_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matricula (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in regresar.
function regresar_Callback(hObject, eventdata, handles)
% hObject    handle to regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(registro);
inicio



function fatherLastName_Callback(hObject, eventdata, handles)
% hObject    handle to fatherLastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fatherLastName as text
%        str2double(get(hObject,'String')) returns contents of fatherLastName as a double


% --- Executes during object creation, after setting all properties.
function fatherLastName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fatherLastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function motherLastName_Callback(hObject, eventdata, handles)
% hObject    handle to motherLastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of motherLastName as text
%        str2double(get(hObject,'String')) returns contents of motherLastName as a double


% --- Executes during object creation, after setting all properties.
function motherLastName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motherLastName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
