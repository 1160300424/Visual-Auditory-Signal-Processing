	clear;
	clc;
    %文件序列号
    i=9;
    %将序列号转化为字符串
	EnFile=[num2str(i),'_en.txt'];   %能量文件
	ZeroFile=[num2str(i),'_zero.txt']; %过零率文件
	audioFile=[num2str(i),'.wav'];    %原音频样本文件
    writePcmPath=[num2str(i),'_VAD.pcm'];    %端点检测后的pcm文件
    writeWavPath=[num2str(i),'_VAD.wav'];    %端点检测后的wav文件
    n=256;
    %从样本样本得到数据
    [realData,x_double,x_native,xx,FS] = getData(audioFile);
    
   
    energy=Energy(xx); %计算能量(原始数据的能量）
    writeFile(energy',EnFile); %将能量写入文本文件
    
    zero=Zero(xx); %计算过零率   
    writeFile(zero',ZeroFile);%将过零率写入文本文件
    
   
    [head,tail] = VAD(xx); %端点检测,数据必须归一化
    [vad_data] = vadData(head,tail,n,x_native);%得到端点检测后的真实音频数据
    
    writePcm(vad_data,writePcmPath); %将端点检测后的数据写入PCM
    writeWav(vad_data,writeWavPath,FS);  %将端点检测后的数据写入wav文件
    

