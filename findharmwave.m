function findharmwave(fundf,Ffreq)
unitrang=mean(Ffreq((fundf-2):(fundf+2)));
harmfreq=fundf.*[1:8];
harmrang=zeros(1,8);
for i=1:8
   harmrang(i)=mean(Ffreq((harmfreq(i)-2):(harmfreq(i)+2)));
end
harmrangrate=harmrang./unitrang;
harmrangrate