function varargout = p7(varargin)
% P7 MATLAB code for p7.fig
%      P7, by itself, creates a new P7 or raises the existing
%      singleton*.
%
%      H = P7 returns the handle to a new P7 or the handle to
%      the existing singleton*.
%
%      P7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P7.M with the given input arguments.
%
%      P7('Property','Value',...) creates a new P7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before p7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to p7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help p7

% Last Modified by GUIDE v2.5 24-Jan-2016 23:19:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @p7_OpeningFcn, ...
                   'gui_OutputFcn',  @p7_OutputFcn, ...
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


% --- Executes just before p7 is made visible.
function p7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to p7 (see VARARGIN)

% Choose default command line output for p7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes p7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = p7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonopen.
function buttonopen_Callback(hObject, eventdata, handles)
% hObject    handle to buttonopen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif', 'All Image Files'; '*.*', 'All files'},'Choose an image file...');
 
if isequal(filename,0)
    warndlg('File not selected');
    return
end
 
image = imread(strcat(pathname, filename)); 
 
axes(handles.axes1);
imshow(image);
 
set(handles.axes1,'UserData', image);
 % --- Executes on button press in buttoncapture.
function buttoncapture_Callback(hObject, eventdata, handles)
% hObject    handle to buttoncapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = '160x120';
 
switch get(handles.menusize,'Value')
    case 1
        s='160x120';
    case 2
        s='320x240';
    case 3
        s='640x480';
    case 4
        s='800x600';
    case 5
        s='1024x768';
    case 6
        s='1280x960';
    case 7
        s='1600x1200';
    otherwise
end
 
image = imread(['http://visionartificia.gnd.upv.es/axis-cgi/jpg/image.cgi?resolution=' s]);
 
axes(handles.axes1);
imshow(image);
 
set(handles.axes1,'UserData', image);

% --- Executes on button press in buttoncopy.
function buttoncopy_Callback(hObject, eventdata, handles)
% hObject    handle to buttoncopy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=get(handles.axes2,'UserData');
 
axes(handles.axes1);
imshow(image);
 
set(handles.axes1,'UserData',image);



% --- Executes on button press in buttonsave.
function buttonsave_Callback(hObject, eventdata, handles)
% hObject    handle to buttonsave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.jpg;*.tif;*.png;*.gif', 'All Image Files'; 
                                  '*.*', 'All Files'},'Save image file as ...');
                                                                                
image=get(handles.axes2,'UserData');
 
imwrite(image, strcat(pathname,filename));


% --- Executes on button press in buttonnew.
function buttonnew_Callback(hObject, eventdata, handles)
% hObject    handle to buttonnew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image=get(handles.axes2,'UserData');
 
figure
imshow(image);


% --- Executes on selection change in menusize.
function menusize_Callback(hObject, eventdata, handles)
% hObject    handle to menusize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menusize contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menusize


% --- Executes during object creation, after setting all properties.
function menusize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menusize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

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


% --- Executes on button press in buttonmeasure.
function buttonmeasure_Callback(hObject, eventdata, handles)
% hObject    handle to buttonmeasure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global numerobjetos;
global BW;
global cc;
global eccent compac CentroX CentroY;


cc=bwconncomp(BW);

area=regionprops(cc,'Area');
perimetro=regionprops(cc,'Perimeter');
ejemenor=regionprops(cc,'MinorAxisLength');
ejemayor=regionprops(cc,'MajorAxisLength');
centro=regionprops(cc,'Centroid');
numerobjetos=cc.NumObjects;

R = struct2cell(area);
Area = cat(2,R{:});

R = struct2cell(perimetro);
Perimetro = cat(2,R{:});

R = struct2cell(ejemenor);
menor = cat(2,R{:});

R = struct2cell(ejemayor);
mayor = cat(2,R{:});

R = struct2cell(centro);
Centro = cat(1,R{:});

CentroX=Centro(:,1)';
CentroY=Centro(:,2)';

for m=1:numerobjetos
  compac(m)=(Perimetro(m)^2)/(4*pi*Area(m));
    eccent(m)=mayor(m)/menor(m);
   text(CentroX(m), CentroY(m),['COMP: ' num2str(compac(m))],'color','r');
    text(CentroX(m), CentroY(m)+50, ['ECCENT: ' num2str(eccent(m))],'color','g');
end


% --- Executes on button press in buttondiscard.
function buttondiscard_Callback(hObject, eventdata, handles)
% hObject    handle to buttondiscard (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global numerobjetos BW cc eccent compac CentroX CentroY;

compact=str2double(get(handles.edit7,'String'));
eccentrici=str2double(get(handles.edit8,'String'));

numerobjetosnuevo=0;

image=get(handles.buttonopen,'UserData');
axes(handles.axes1);
imshow(image);

diamet=regionprops(cc,'EquivDiameter');
R = struct2cell(diamet);
diametro = cat(2,R{:});


for m=1:numerobjetos
    BW(cc.PixelIdxList{m})=0;
    if compac(m)<compact
     if eccent(m)<eccentrici
          if diametro(m)/3.5<26.75
                
                text(CentroX(m), CentroY(m),['Comp: ' num2str(compac(m))],'color','r');
              text(CentroX(m), CentroY(m)+50, ['Eccen: ' num2str(eccent(m))],'color','g');
              text(CentroX(m), CentroY(m)+100, ['Diam: ' num2str(diametro(m)/3.5)],'color','b');
                numerobjetosnuevo=numerobjetosnuevo+1;
                BW(cc.PixelIdxList{m})=1;
         end
        end
    end
end

numerobjetos=numerobjetosnuevo;

cc=bwconncomp(BW);

diamet=regionprops(cc,'EquivDiameter');
R = struct2cell(diamet);
diametro = cat(2,R{:});

set(handles.text2,'String',[num2str(numerobjetosnuevo) ' Coins']);

set(hObject,'UserData',diametro);

% --- Executes on button press in buttondetect.
function buttondetect_Callback(hObject, eventdata, handles)
% hObject    handle to buttondetect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global BW;
guidata(hObject, handles);

I=get(handles.axes1,'UserData');
igray=rgb2gray(I);

low=str2double(get(handles.edit1,'String'));
high=str2double(get(handles.edit2,'String'));

nclose=str2double(get(handles.edit4,'String'));
nopen=str2double(get(handles.edit3,'String'));

igray(igray <= low|igray >= high)=0;
igray(igray > low&igray < high)=255;

axes(handles.axes2);
imshow(igray)

binaryImage = imclearborder(igray);

binaryImage = imclearborder(binaryImage);
axes(handles.axes2);
se=strel('disk',nclose);
se=strel('disk',nopen);
BW=bwmorph(binaryImage,'dilate',nclose);
BW=bwmorph(BW,'erode',nclose+nopen);
BW=bwmorph(BW,'dilate',nopen);
imshow(BW);
cc=bwconncomp(BW,8);
set(handles.text1, 'string', cc.NumObjects );

if isequal(get(handles.axes1,'UserData'), [])
    return
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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
