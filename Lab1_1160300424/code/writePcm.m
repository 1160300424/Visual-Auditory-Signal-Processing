function writePcm(vad_data,PcmPath)
%���˵㴦�����ļ�д��raw�ļ�������pcm��׺�洢
%PcmPath Ϊ��pcm�ļ�д���·��

    fid=fopen(PcmPath,'wb');%�Զ����ƴ�Ϊraw
    fwrite(fid,vad_data,'int16');
    fclose(fid); 
end

