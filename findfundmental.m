function y=findfundmental(wave)
N=length(wave);
times=5;
T=N/8000;
OMG=8000*2*pi;
wave=repmat(wave,times,1);
[t,omg,FT,IFT]=prefourier([0,T*times],times*N,[-OMG/2,OMG/2],8000);
F=abs(FT*wave);
Ffreq=zeros(1,4000);
Ffreq(1:4000)=F(4001:8000);
figure;
plot(Ffreq);
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
   if k > 0.25
        curfreq=tempfreq;
        curmaxF=tempmaxF;
   else
        break;
   end
end
    findharmwave(curfreq,Ffreq);
   y=curfreq;