clear all, close all, clc
melody=[523.25 523.25 587.33 392 349.23 349.23 293.66 392];
rhythm=[1 0.5 0.5 2 1 0.5 0.5 2];
fs = 8000;
wave = zeros(1,sum(rhythm)*fs+1);
curpos=1;
timbre = [1  0.1  0.4  0.2  0.1   0.05   0.02  0.02];
for count=1:length(rhythm)  
curfreq=melody(count);
curtime=rhythm(count);
t=0:1/fs:curtime-1/fs;
temp=zeros(1,length(t));
for flag=1:8
temp=temp+(timbre(flag)*envelope(t/curtime)).*sin(flag*t*curfreq*2*pi);
end
wave(1,curpos:(curpos+length(temp)-1))=temp;
curpos = curpos+length(temp);
end
plot(wave)
sound(wave)