function varargout = InterpolacionResultado(varargin)
% INTERPOLACIONRESULTADO MATLAB code for InterpolacionResultado.fig
%      INTERPOLACIONRESULTADO, by itself, creates a new INTERPOLACIONRESULTADO or raises the existing
%      singleton*.
%
%      H = INTERPOLACIONRESULTADO returns the handle to a new INTERPOLACIONRESULTADO or the handle to
%      the existing singleton*.
%
%      INTERPOLACIONRESULTADO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLACIONRESULTADO.M with the given input arguments.
%
%      INTERPOLACIONRESULTADO('Property','Value',...) creates a new INTERPOLACIONRESULTADO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterpolacionResultado_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterpolacionResultado_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterpolacionResultado

% Last Modified by GUIDE v2.5 15-May-2016 16:54:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterpolacionResultado_OpeningFcn, ...
                   'gui_OutputFcn',  @InterpolacionResultado_OutputFcn, ...
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



% --- Executes just before InterpolacionResultado is made visible.
function InterpolacionResultado_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterpolacionResultado (see VARARGIN)

% Choose default command line output for InterpolacionResultado
handles.output = hObject;

M= varargin{2};
f= varargin{1};
tam= size(M);

sx= M(:,1:1);
sy= M(:, 2:2);
k= M(1,1):1:M(tam(1), 2);
ezplot(f,k,)
hold on 
scatter(sx,sy)


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterpolacionResultado wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterpolacionResultado_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
