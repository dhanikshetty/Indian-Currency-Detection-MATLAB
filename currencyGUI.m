function varargout = currencyGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @currencyGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @currencyGUI_OutputFcn, ...
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

function currencyGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = currencyGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

clc;
[filename, file] = uigetfile('*', '');
if filename ~= 0
    fFileName = fullfile(file,filename);
    f=imread(fFileName);
    axes(handles.axes1),imshow(f);
else
    warndlg('Input image must be selected.',' Warning ')
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

sampleimage = getimage(handles.axes1);
samplename = get(handles.edit1,'String');
if isempty(samplename)
    warndlg('Invalid Input',' Warning ');
else
    saveDB(sampleimage,samplename);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
getDBInfo();

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

deleteDB();


function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

image = getimage(handles.axes1);
result = banknoteRecognition(image);
set(handles.text6,'string',result);
