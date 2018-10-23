	clear;
	clc;
    %�ļ����к�
    i=9;
    %�����к�ת��Ϊ�ַ���
	EnFile=[num2str(i),'_en.txt'];   %�����ļ�
	ZeroFile=[num2str(i),'_zero.txt']; %�������ļ�
	audioFile=[num2str(i),'.wav'];    %ԭ��Ƶ�����ļ�
    writePcmPath=[num2str(i),'_VAD.pcm'];    %�˵�����pcm�ļ�
    writeWavPath=[num2str(i),'_VAD.wav'];    %�˵�����wav�ļ�
    n=256;
    %�����������õ�����
    [realData,x_double,x_native,xx,FS] = getData(audioFile);
    
   
    energy=Energy(xx); %��������(ԭʼ���ݵ�������
    writeFile(energy',EnFile); %������д���ı��ļ�
    
    zero=Zero(xx); %���������   
    writeFile(zero',ZeroFile);%��������д���ı��ļ�
    
   
    [head,tail] = VAD(xx); %�˵���,���ݱ����һ��
    [vad_data] = vadData(head,tail,n,x_native);%�õ��˵�������ʵ��Ƶ����
    
    writePcm(vad_data,writePcmPath); %���˵���������д��PCM
    writeWav(vad_data,writeWavPath,FS);  %���˵���������д��wav�ļ�
    

