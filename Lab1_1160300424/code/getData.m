function [data,x_double,x_native,xx,FS] = getData(fileName)
%从fileName里读取wav文件1
%x_double 返回的是音频数据归一化后的数据，为double类型，在双门限函数VAD里将用到 n*1
%x_native 返回的是音频的原始数据,原始类型 n*1
%realData,是将数据去掉wav文件头，和最后一个不满一帧的数据  (n-44-tail)*1
%xx_double      返回的是将归一化音频分帧后的矩阵（去头去尾了）
%xx_native      返回的是原始的矩阵
% fs返回的是音频的频率

    [x_double,~]=audioread(fileName);%返回样本数据x,与采样频率y
    [x_native,FS]=audioread(fileName,'native');
    sound(x_double,FS);% 以采样率 Fs 向扬声器发送音频信号 y。 

    n=256 ;%帧长为256个采样点
    p=0;   %帧叠为0

    [Size,~]=size(x_double);%wav头部有44字节  
    tail=mod(Size-22,n);  %多余多少个采样点

    b=23:1:Size-tail;
    data=x_double(b,1);%去掉了wav头的数据,和不足256的最后一帧数据（去头去尾）
    
    xx=buffer(data,n,p);%将得到的数据存储在数组xx里,每一列为一帧
   
end

