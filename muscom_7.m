clear all, close all, clc
load('guitar.mat');
delta=abs(realwave-wave2proc);
figure;
hold on;
subplot(3,1,1);
plot(realwave)
title('realwave');
subplot(3,1,2);
plot(wave2proc)
title('wave2proc');
subplot(3,1,3);
plot(delta)
title('|delta|');

len=length(realwave);
unitsam=100;
mywave2proc=resample(realwave,10*unitsam,len);
for icount=1:unitsam
   aver=mean(mywave2proc(unitsam*(0:9)+icount));
   mywave2proc(unitsam*(0:9)+icount)=aver;
end
mywave2proc=resample(mywave2proc,len,length(mywave2proc));
t=1:243;
figure;
hold on;
delta=abs(wave2proc-mywave2proc);
subplot(3,1,1);
plot(wave2proc,'b')
title('wave2proc');
subplot(3,1,2);
plot(mywave2proc,'r')
title('mywave2proc');
subplot(3,1,3);
plot(delta);
title('|delta|');
