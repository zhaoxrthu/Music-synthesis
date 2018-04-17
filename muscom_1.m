clear all, close all, clc
test=[523.25 587.33 392 349.23 293.6];
doresofare=zeros(1,40001);
for pos=1:8000
    doresofare(pos)=sin(pos/8000*523.25*2*pi);
end
for pos=8001:16000
    doresofare(pos)=sin((pos/8000-1)*587.33*2*pi);
end
for pos=16001:24000
    doresofare(pos)=sin((pos/8000-2)*392*2*pi);
end
for pos=24001:32000
    doresofare(pos)=sin((pos/8000-3)*349.23*2*pi);
end
for pos=32001:40000
     doresofare(pos)=sin((pos/8000-4)*293.6*2*pi);
end
% sound(doresofare)
melody=[523.25 523.25 587.33 392 349.23 349.23 293.66 392];
rhythm=[1 0.5 0.5 2 1 0.5 0.5 2];
fs = 8000;
wave = zeros(1,sum(rhythm)*fs+1);
curpos=1;
for count=1:length(rhythm) 
curfreq=melody(count);
curtime=rhythm(count);
t=0:1/fs:(curtime-1/fs);
temp=zeros(1,length(t));
temp=temp+sin(t*curfreq*2*pi);
wave(1,curpos:(curpos+length(temp)-1))=temp;
curpos = curpos+length(temp);
end
% pause;
sound(wave)