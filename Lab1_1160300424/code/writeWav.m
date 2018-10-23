function  writeWav(vad_data,writeWavPath,fs)
%将数据写入wav文件
    audiowrite(writeWavPath,vad_data,fs); %使用audiowrite函数
end

