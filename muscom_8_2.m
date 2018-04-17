clear all, close all, clc
load('guitar.mat');
N=length(wave2proc);
times=10;
T=N/8000;
OMG=8000*2*pi;
wave=repmat(wave2proc,times,1);
[t,omg,FT,IFT]=prefourier([0,T*times],times*N,[-OMG/2,OMG/2],8000);
F=abs(FT*wave);
%plot(F(4001:8000));
Ffreq=zeros(1,4000);
Ffreq(1:4000)=F(4001:8000);
[curmaxF,curfreq]=max(Ffreq);
curmaxF=mean(Ffreq((curfreq-2):(curfreq+2)));
for n=1:100
   limit=round(curfreq/2)+20;
   tempF=Ffreq(1:limit);
   [tempmaxF,tempfreq]=max(tempF);
   if tempfreq<20
       break;       
   end
   tempmaxF=mean(Ffreq((tempfreq-2):(tempfreq+2)));
   k=tempmaxF/curmaxF;
   curfreq=tempfreq;
     curmaxF=tempmaxF;
   if k<0.4
        break;
   end
end
fundf=curfreq;
unitrang=mean(Ffreq((fundf-2):(fundf+2)));
harmfreq=fundf.*[1:8];
harmrang=zeros(1,8);
for i=1:8
   harmrang(i)=mean(Ffreq((harmfreq(i)-2):(harmfreq(i)+2)));
end
harmrangrate=harmrang./unitrang;
stem([1:8],harmrangrate,'filled');
axis([0 9 0 1.5]);
% set(gca,'FontSize',16);
xlabel('n');
ylabel('rate');
