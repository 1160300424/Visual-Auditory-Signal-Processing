function energy = Energy(xx)
%����������ÿһ֡�������洢��һ����
[N,frame]=size(xx);  %N��,frame��

W=ones(N,frame);%��������
afterWindow=W.*xx;  %ÿһ֡���Ӵ�
square=afterWindow.*afterWindow;  %ƽ��

%����ÿһ֡��������ÿһ֡�������洢��һ����
energy=sum(square);  %����ƽ�����ÿһ��֮�ͣ�Ҳ���Ƕ�ʱ���� 
    %Energy��1*col����������Ϊ����ÿһ֡��������ռһ������Ҫת��
    %һ��Ȼ��д���ļ�
end

