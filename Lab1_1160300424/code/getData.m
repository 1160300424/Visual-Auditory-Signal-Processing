function [data,x_double,x_native,xx,FS] = getData(fileName)
%��fileName���ȡwav�ļ�1
%x_double ���ص�����Ƶ���ݹ�һ��������ݣ�Ϊdouble���ͣ���˫���޺���VAD�ｫ�õ� n*1
%x_native ���ص�����Ƶ��ԭʼ����,ԭʼ���� n*1
%realData,�ǽ�����ȥ��wav�ļ�ͷ�������һ������һ֡������  (n-44-tail)*1
%xx_double      ���ص��ǽ���һ����Ƶ��֡��ľ���ȥͷȥβ�ˣ�
%xx_native      ���ص���ԭʼ�ľ���
% fs���ص�����Ƶ��Ƶ��

    [x_double,~]=audioread(fileName);%������������x,�����Ƶ��y
    [x_native,FS]=audioread(fileName,'native');
    sound(x_double,FS);% �Բ����� Fs ��������������Ƶ�ź� y�� 

    n=256 ;%֡��Ϊ256��������
    p=0;   %֡��Ϊ0

    [Size,~]=size(x_double);%wavͷ����44�ֽ�  
    tail=mod(Size-22,n);  %������ٸ�������

    b=23:1:Size-tail;
    data=x_double(b,1);%ȥ����wavͷ������,�Ͳ���256�����һ֡���ݣ�ȥͷȥβ��
    
    xx=buffer(data,n,p);%���õ������ݴ洢������xx��,ÿһ��Ϊһ֡
   
end

