clear all, close all, clc
melody=[523.25 523.25 587.33 392 349.23 349.23 293.66 392];
rhythm=[1 0.5 0.5 2 1 0.5 0.5 2];
fs = 8000;
wave = zeros(1,sum(rhythm)*fs+1);
curpos=1;
timbre = ...
[1	0.0487	0.0177	0.0056	0.0034	0.0018	0.0009	0.0007;
 1  0.0487	0.0177	0.0056	0.0034	0.0018	0.0009	0.0007;
 1	0.7213	0.0769	0.011	0.0048	0.0028	0.002	0.0017;
 1	0.1112	0.0038	0.0029	0.0013	0.0005	0.0005	0.0003;
 1	0.1489	0.0234	0.0027	0.0013	0.0006	0.0007	0.0005;
 1	0.1489	0.0234	0.0027	0.0013	0.0006	0.0007	0.0005;
 1	0.7213	0.0769	0.011	0.0048	0.0028	0.002	0.0017;
 1	0.1112	0.0038	0.0029	0.0013	0.0005	0.0005	0.0003];
for count=1:length(rhythm)  
curfreq=melody(count);
curtime=rhythm(count);
t=0:1/fs:curtime-1/fs;
temp=zeros(1,length(t));
for flag=1:8
temp=temp+(timbre(count,flag)*envelope(t/curtime)).*sin(flag*t*curfreq*2*pi);
end
wave(1,curpos:(curpos+length(temp)-1))=temp;
curpos = curpos+length(temp);
end
plot(wave)
sound(wave)