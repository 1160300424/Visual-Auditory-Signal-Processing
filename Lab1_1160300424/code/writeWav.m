function  writeWav(vad_data,writeWavPath,fs)
%������д��wav�ļ�
    audiowrite(writeWavPath,vad_data,fs); %ʹ��audiowrite����
end

