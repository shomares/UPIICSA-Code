function varargout = Interpolacion(varargin)
% INTERPOLACION MATLAB code for Interpolacion.fig
%      INTERPOLACION, by itself, creates a new INTERPOLACION or raises the existing
%      singleton*.
%
%      H = INTERPOLACION returns the handle to a new INTERPOLACION or the handle to
%      the existing singleton*.
%
%      INTERPOLACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLACION.M with the given input arguments.
%
%      INTERPOLACION('Property','Value',...) creates a new INTERPOLACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interpolacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interpolacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interpolacion

% Last Modified by GUIDE v2.5 16-May-2016 12:17:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interpolacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Interpolacion_OutputFcn, ...
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

% --- Executes just before Interpolacion is made visible.
function Interpolacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interpolacion (see VARARGIN)

% Choose default command line output for Interpolacion
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Interpolacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interpolacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    InterfaceObj=findobj(Interpolacion,'Enable','on');
    set(InterfaceObj,'Enable','off');
    f= handles.function;
    [filename, pathname] = uigetfile({'*.xlsx','Archivos excel';...
          '*.*','All Files' },'Interpolacion');
    if isequal(filename,0)
        msgbox('No ha seleccionado un archivo', 'Error','error');
        set(InterfaceObj,'Enable','on');
    else
        matriz = xlsread(strcat(pathname,filename));
        tabular=GetFuncionTabularSym(f,matriz);
        [filename, pathname] = uiputfile('*.xlsx',...
                       'Archivo Excel');
        if isequal(filename,0) || isequal(pathname,0)
          msgbox('No ha seleccionado un archivo', 'Error','error');
        else
            T= {'x', 'f(x)'};
            name= strcat(pathname,filename);
            xlswrite(name,T,'Resultados','A1');
            xlswrite(name,tabular,'Resultados','A2');
            %open(name)
        end
        
    end
    
    set(InterfaceObj,'Enable','on');
    
  


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
InterfaceObj=findobj(Interpolacion,'Enable','on');
set(InterfaceObj,'Enable','off');
[filename, pathname] = uigetfile({'*.xlsx','Archivos excel';...
          '*.*','All Files' },'Interpolacion');
if isequal(filename,0)
   msgbox('No ha seleccionado un archivo', 'Error','error');
   set(InterfaceObj,'Enable','on');
else
    
  matriz = xlsread(strcat(pathname,filename), 1, '', 'basic');
  tam= size(matriz);
  
  if(tam(2)>1)
      switch get(get(handles.uibuttongroup1,'SelectedObject'),'Tag')
          case 'automaticoRadio', 
              data=get(handles.edit1,'String');
              error= str2double(data);
              f= AnalisisAutoInterpolacion(matriz, error);
          case 'lagrangeRadio', 
              if(tam(1)<10)
                  f= InterporlacionLagrange(matriz);
              else
                   msgbox('Para Lagrange se recomienda datos menores a 10', 'Error','error');
              end
          case 'minimoRadio',
              strgrado= inputdlg('Indique el grado: ','Interpolacion'); 
              grado= str2double(strgrado)+1;
              if(tam(1)>grado)
                  f= InterpolacionMinimosCuadrados(matriz,grado);
              else
                  msgbox('No se puede evaluar a ese grado', 'Error','error');
              end
          case 'newtonradio'
                delt= Delta(matriz);
                if(delt>0)
                    f= InterpolacionNewton(matriz);
                else
                    msgbox('No se puede evaluar con este metodo', 'Error','error');
                end
          case 'transformadaradio'
                msgbox('No impemented', 'Error','error');
              
      end
      cla(handles.axes2, 'reset');
      set(handles.edit4,'String','');

      if(exist('f', 'var'))
          errorValue= AnalisisFuncion(matriz,f);
          errorLab= strcat('Error: ',num2str(errorValue(2)));
          errorLab= strcat(errorLab,' Desviacion estandar: ');
          errorLab= strcat(errorLab,num2str(errorValue(1)));
          set(handles.edit4,'String',errorLab);
          axes(handles.axes2);
          sx= matriz(:,1:1);
          sy= matriz(:, 2:2);
          tam= size(matriz);
          k= matriz(1,1):.5:matriz(matriz(tam(1),1),1);
          ezplot(f,k )
          hold on
          ezplot(f,k )
          hold on 
          scatter(sx,sy)
          handles.function=f;
          guidata(hObject,handles);
      end
  else
      msgbox('No se puede evaluar esa matriz', 'Error','error');
  end
  set(InterfaceObj,'Enable','on');
  
end  
      
function pushbutton3_Callback(hObject, eventdata, handles)
    f= handles.function;
    data=get(handles.edit3,'String');
    x=  str2double(data);
    value= eval(subs(f,x));
    mensaje= num2str(value);
    mensaje=strcat('El resultado es: ', mensaje);
    msgbox(mensaje);
    axes(handles.axes2)
    scatter(x,value);



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


% --- Executes on button press in automaticoRadio.
function automaticoRadio_Callback(hObject, eventdata, handles)
% hObject    handle to automaticoRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of automaticoRadio
set(handles.edit1,'Enable','on');


% --- Executes on button press in lagrangeRadio.
function lagrangeRadio_Callback(hObject, eventdata, handles)
% hObject    handle to lagrangeRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of lagrangeRadio
set(handles.edit1,'Enable','off');


% --- Executes on button press in minimoRadio.
function minimoRadio_Callback(hObject, eventdata, handles)
% hObject    handle to minimoRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of minimoRadio
set(handles.edit1,'Enable','off');




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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
