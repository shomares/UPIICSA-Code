function varargout = Integracion(varargin)
% INTEGRACION MATLAB code for Integracion.fig
%      INTEGRACION, by itself, creates a new INTEGRACION or raises the existing
%      singleton*.
%
%      H = INTEGRACION returns the handle to a new INTEGRACION or the handle to
%      the existing singleton*.
%
%      INTEGRACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRACION.M with the given input arguments.
%
%      INTEGRACION('Property','Value',...) creates a new INTEGRACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Integracion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Integracion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Integracion

% Last Modified by GUIDE v2.5 25-May-2016 12:06:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Integracion_OpeningFcn, ...
                   'gui_OutputFcn',  @Integracion_OutputFcn, ...
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


% --- Executes just before Integracion is made visible.
function Integracion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Integracion (see VARARGIN)

% Choose default command line output for Integracion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Integracion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Integracion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
funcion= get(handles.edit4, 'String');
funcion= strcat('@(x)', funcion);
a= str2double(get(handles.edit2, 'String'));
b= str2double(get(handles.edit3, 'String'));
n= str2double(get(handles.edit5, 'String'));
intervalo= [0 0];
intervalo(1)= a;
intervalo(2)= b;

try
    cla(handles.axes1, 'reset');
    axes(handles.axes1);
    f= str2func(funcion);
    fplot(f,intervalo);
    switch get(get(handles.uibuttongroup1,'SelectedObject'),'Tag')
          case 'simpson13',
               if(mod(n,2)==0)
                resultado= IntegracionSimpson12(f, a, b, n);
               else
                  msgbox('No se puede evaluar con ese intervalo', 'Error','error');
               end
          case 'simpson38', 
               if(mod(n,3)==0)
                resultado= IntegracionSimpson38(f, a, b, n);
               else
                  msgbox('No se puede evaluar con ese intervalo', 'Error','error');
               end
          case 'trapecio',
                resultado= IntegracionTrapecioAnalitico(f, a, b, n);
    end
    if(exist('resultado', 'var'))
        res= num2str(resultado);
        set(handles.edit4, 'String', res);
    end
    catch ME
         msgbox('Expresion mal formada', 'Error','error');
end




function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);

% --- Executes on button press in simpson38.
function simpson38_Callback(hObject, eventdata, handles)
% hObject    handle to simpson38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of simpson38
set(handles.edit5, 'String', '99');
set(handles.edit4, 'String', '');
% --- Executes on button press in trapecio.
function trapecio_Callback(hObject, eventdata, handles)
% hObject    handle to trapecio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of trapecio
set(handles.edit4, 'String', '');




% --- Executes on button press in simpson13.
function simpson13_Callback(hObject, eventdata, handles)
% hObject    handle to simpson13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of simpson13
set(handles.edit4, 'String', '');
set(handles.edit5, 'String', '100');




% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);
% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
texto= get(handles.edit4,'String');
value= get(hObject, 'String');
texto= strcat(texto, value);
set(handles.edit4, 'String', texto);



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
set(handles.edit4, 'String', '');

% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
