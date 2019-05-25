function varargout = procesmaiento(varargin)
% PROCESMAIENTO MATLAB code for procesmaiento.fig
%      PROCESMAIENTO, by itself, creates a new PROCESMAIENTO or raises the existing
%      singleton*.
%
%      H = PROCESMAIENTO returns the handle to a new PROCESMAIENTO or the handle to
%      the existing singleton*.
%
%      PROCESMAIENTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESMAIENTO.M with the given input arguments.
%
%      PROCESMAIENTO('Property','Value',...) creates a new PROCESMAIENTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before procesmaiento_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to procesmaiento_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help procesmaiento

% Last Modified by GUIDE v2.5 16-May-2019 13:18:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @procesmaiento_OpeningFcn, ...
                   'gui_OutputFcn',  @procesmaiento_OutputFcn, ...
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


% --- Executes just before procesmaiento is made visible.
function procesmaiento_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to procesmaiento (see VARARGIN)

% Choose default command line output for procesmaiento
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes procesmaiento wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = procesmaiento_OutputFcn(hObject, eventdata, handles) 
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
%  global vid
%  set(handles. imagen,'Visible', 'On');
%  img=GS(getsnapshot(vid));
img=imread('D:\Código\Omar2.jpg');
%img=imread(img);
[I, shape] = CaracteristicasFaciales(img);
[faces,faceBound] = detectFaces(I);
%imshow(I);hold on;plot(shape(:,1),shape(:,2),'+','MarkerSize',10);
img=Funcion_opSobel(img,100);
img=Umbral(img,100);
img=uint8(img);
foto=img;
axes(handles.imagen)
imshow(I);hold on;
if(~isempty(faceBound));
    for n=1:size(faceBound,1)
        toleranceX = floor(0.1*(faceBound(n,3)-faceBound(n,1)));
        toleranceY = floor(0.1*(faceBound(n,4)-faceBound(n,2)));
        % original bounds
        x1=faceBound(n,1); y1=faceBound(n,2);
        x2=faceBound(n,3); y2=faceBound(n,4);
        % adjusted bounds to get wider face capture
        x1t=faceBound(n,1)-toleranceX; y1t=faceBound(n,2)-toleranceY;
        x2t=faceBound(n,3)+toleranceX; y2t=faceBound(n,4)+toleranceY;
        imSize = size(I);
        % if adjusted bounds will lead to out-of-bounds plotting, use original bounds
        if x1t < 1 || y1t < 1 || x2t > imSize(2) || y2t > imSize(1)
            fprintf('Out of bounds adjustments. Plotting original values...\n');
            plot([x1 x1 x2 x2 x1],[y1 y2 y2 y1 y1],'LineWidth',2);
        else
            plot([x1t x1t x2t x2t x1t],[y1t y2t y2t y1t y1t],'LineWidth',2);
        end
    end
end
plot(shape(:,1),shape(:,2),'+','MarkerSize',10);

% --- Executes on button press in buscarSistema.
function buscarSistema_Callback(hObject, eventdata, handles)
% hObject    handle to buscarSistema (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in regresar.
function regresar_Callback(hObject, eventdata, handles)
% hObject    handle to regresar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(procesmaiento);
inicio

% --- Executes on button press in encender.
function encender_Callback(hObject, eventdata, handles)
% hObject    handle to encender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid
set(handles.camara1,'visible','on');
axes(handles.camara1);
vid=videoinput('winvideo', 1);
%vid.ReturnedColorSpace='rbg';
 vidRes = get(vid, 'VideoResolution');
 nBands = get(vid, 'NumberOfBands');
 hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
 preview(vid, hImage);

% --- Executes on button press in cerrar.
function cerrar_Callback(hObject, eventdata, handles)
% hObject    handle to cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.camara1,'visible','off');
closepreview
axes(handles.camara1);


function DatosUsuario_Callback(hObject, eventdata, handles)
% hObject    handle to DatosUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DatosUsuario as text
%        str2double(get(hObject,'String')) returns contents of DatosUsuario as a double


% --- Executes during object creation, after setting all properties.
function DatosUsuario_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DatosUsuario (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function imagen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imagen
