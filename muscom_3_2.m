clear all, close all, clc
melody=[523.25 523.25 587.33 392 349.23 349.23 293.66 392];
rhythm=[1 0.5 0.5 2 1 0.5 0.5 2];
fs = 8000;
wave = zeros(1,sum(rhythm)*fs+1);
curpos=1;
for count=1:length(rhythm)  
curfreq=melody(count);
curtime=rhythm(count);
t=0:1/fs:curtime-1/fs;
temp=zeros(1,length(t)); 
temp=temp+envelope(t/curtime).*sin(t*curfreq*2*pi);
wave(1,curpos:(curpos+length(temp)-1))=temp;
curpos = curpos+length(temp);
end
%sound(wave)
wave1=resample(wave,round(length(wave)/1.414),length(wave));
figure;
subplot(2,1,1);
plot(wave);
title('original wave');
subplot(2,1,2);
plot(wave1);
title('wave after changing');
%sound(wave)
sound(wave1)