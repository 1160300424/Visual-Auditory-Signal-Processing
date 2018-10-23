function writePcm(vad_data,PcmPath)
%将端点处理后的文件写入raw文件，并以pcm后缀存储
%PcmPath 为将pcm文件写入的路径

    fid=fopen(PcmPath,'wb');%以二进制存为raw
    fwrite(fid,vad_data,'int16');
    fclose(fid); 
end

