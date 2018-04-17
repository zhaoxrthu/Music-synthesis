clear all, close all, clc
melody=[523.25 523.25 587.33 392 349.23 349.23 293.66 392];
rhythm=[1 0.5 0.5 2 1 0.5 0.5 2];
fs = 8000;
wave = zeros(1,sum(rhythm)*fs+1);
wave8plu1 = zeros(1,sum(rhythm)*fs+1);
wave8sub1 = zeros(1,sum(rhythm)*fs+1);
curpos=1;
for count=1:length(rhythm)  
curfreq=melody(count);
curtime=rhythm(count);
t=0:1/fs:curtime-1/fs;
temp=zeros(1,length(t));
temp1=zeros(1,length(t));
temp2=zeros(1,length(t));
temp=temp+envelope(t/curtime).*sin(t*curfreq*2*pi);
temp1=temp1+envelope(t/curtime).*sin(t*curfreq*2*2*pi);
temp2=temp2+envelope(t/curtime).*sin(t*curfreq/2*2*pi);
wave(1,curpos:(curpos+length(temp)-1))=temp;
wave8plu1(1,curpos:(curpos+length(temp1)-1))=temp1;
wave8sub1(1,curpos:(curpos+length(temp2)-1))=temp2;
curpos = curpos+length(temp);
end
wave8plu2=zeros(1,round(length(wave)/2));
sound(wave8plu1)
pause;
sound(wave8sub1)
for count=1:length(wave)/2
    wave8plu2(count)=wave(2*count);
end
wave8sub2=zeros(1,round(length(wave)*2));
for count=1:length(wave)*2
    wave8sub2(count)=wave(round(count/2));
end
pause;
sound(wave8plu2)
pause;
sound(wave8sub2)
