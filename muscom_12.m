function varargout = muscom_12(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @muscom_12_OpeningFcn, ...
                   'gui_OutputFcn',  @muscom_12_OutputFcn, ...
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

function muscom_12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to muscom_12 (see VARARGIN)

% Choose default command line output for muscom_12
handles.output = hObject;

ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
%background=imread('ToumaKazusa.jpg');
background=imread('OgisoSetsuna.jpg');
image(background);
colormap gray
set(ha,'handlevisibility','off','visible','off');

global fc;
fc=261.63;
global class;
class=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes muscom_12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = muscom_12_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
class=0;
y=getwave(0,class);
sound(y);

function pushbutton2_Callback(hObject, eventdata, handles)
class=0;
y=getwave(2,class);
sound(y);

function pushbutton3_Callback(hObject, eventdata, handles)
class=0;
y=getwave(4,class);
sound(y);

function pushbutton4_Callback(hObject, eventdata, handles)
class=0;
y=getwave(5,class);
sound(y);

function pushbutton5_Callback(hObject, eventdata, handles)
class=0;
y=getwave(7,class);
sound(y);

function pushbutton6_Callback(hObject, eventdata, handles)
class=0;
y=getwave(9,class);
sound(y);

function pushbutton7_Callback(hObject, eventdata, handles)
class=0;
y=getwave(11,class);
sound(y);

function pushbutton8_Callback(hObject, eventdata, handles)
class=0;
y=getwave(1,class);
sound(y);

function pushbutton9_Callback(hObject, eventdata, handles)
class=0;
y=getwave(3,class);
sound(y);

function pushbutton10_Callback(hObject, eventdata, handles)
class=0;
y=getwave(6,class);
sound(y);

function pushbutton11_Callback(hObject, eventdata, handles)
class=0;
y=getwave(8,class);
sound(y);

function pushbutton12_Callback(hObject, eventdata, handles)
class=0;
y=getwave(10,class);
sound(y);

function y=getwave(name,class)
timbre=...
[1	0.0487	0.0177	0.0056	0.0034	0.0018	0.0009	0.0007;
 1	0.385	0.0473	0.0083	0.0041	0.0023	0.0015	0.0012;
 1	0.7213	0.0769	0.011	0.0048	0.0028	0.002	0.0017;
 1	1.0664	0.43295	0.3788	0.0168	0.02095	0.03735	0.0104;
 1	0.8115	0.789	0.7466	0.0288	0.0391	0.0727	0.0191;
 1	0.1489	0.0234	0.0027	0.0013	0.0006	0.0007	0.0005;
 1	0.13005	0.0136	0.0028	0.0013	0.00055	0.0006	0.0004;
 1	0.1112	0.0038	0.0029	0.0013	0.0005	0.0005	0.0003;
 1	0.06695	0.0037	0.0015	0.0007	0.0003	0.00025	0.00015;
 1	0.0227	0.0036	0.0001	0.0001	0.0001	0	    0      ;
 1	0.1509	0.05465	0.00525	0.0044	0.00245	0.0016	0.0011;
 1	0.2119	0.0161	0.0077	0.0079	0.0044	0.0025	0.0016];
fc=261.63;
freq=2^(class+(name)/12)*fc;
t=0:1/8000:0.5-1/8000;
ytemp=zeros(1,length(t));
for j = 1 : 8
    ytemp= ytemp+timbre(name+1,j).*envelope(t/0.5).*sin(t*j*freq*2*pi);
end
y=ytemp;
