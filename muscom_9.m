clear all, close all, clc
wave=audioread('fmt.wav');
[B,A]=butter(8,2*150/8000,'high');
wave=filter(B,A,wave);
[B,A]=butter(8,2*1000/8000,'low');
wave=filter(B,A,wave);
[peaks,locs]=findpeaks(abs(wave),'MinPeakDistance',500,'MinPeakHeight',0.1);
[~,locs2]=findpeaks(peaks);
len=length(locs2);
pos=locs(locs2);
fundf=zeros(1,len);
score=cell(3,len);
for i=1:len
    tempwave=wave(pos(i)+11:pos(i)+510);
    fundf(i)=findfundmental(tempwave); 
    [score{1,i}, score{2,i}]=findname(fundf(i));
    if i==len
        score{3,i}=(length(wave)-pos(i))/8000;
    else
       score{3,i}= (pos(i+1)-pos(i))/8000;
    end
end
score
