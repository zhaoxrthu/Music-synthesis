# Music-synthesis
简单的音乐合成、乐段频率分析、并合成了一首完整的乐曲
一、实验代码和函数
   muscom_1.m
   muscom_2.m
   muscom_3_1.m
   muscom_3_2.m
   muscom_4.m
   muscom_5.m
   muscom_6.m
   muscom_7.m
   muscom_8_1.m
   muscom_8_2.m
   muscom_9.m
   muscom_10.m
   muscom_11.m
   muscom_12.m
   envelope.m           %包络函数，模仿示例代码playlxg()中的相关函数，调整了参数；
   findfundmental.m      %寻找频谱中基波频率函数
   findharmwave.m       %寻找个高次谐波分量函数
   findname.m           %根据基波频率匹配音名函数
   playWA.m            %《white album》音乐生成函数，模仿示例代码playlxg()
   prefourier.m          %傅里叶变换预处理函数，直接适用示例代码

二、其他附件
   fmt.wav
   Guitar.mat           
   OgisoSetsuna.jpg       %gui程序背景图片
   谐波情况.xlsx         %由findharmwave.m函数得到的各个音的高次谐波情况
   fmt乐谱.pdf          %根据乐感所得的fmt片段乐谱
   WhiteAlbum.wav      %由playWA.m函数得到的音乐文件
