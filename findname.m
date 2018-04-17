function [name,class]=findname(fundf)
fc=261.63;
ser=round(12*(log2(fundf)-log2(fc)));
class=floor(ser/12);
ser=mod(ser,12)+1;
temp={'C','bD','D','bE','E','F','bG','G','bA','A','bB','B'};
name=temp{ser};
