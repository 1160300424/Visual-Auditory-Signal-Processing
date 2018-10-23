function  [head,tail]=VAD(xx)        
	
	en=Energy(xx);
    zero=Zero(xx);
    
    %��������
	maxSilence=10;    %��������������
    minlen  = 20;    % �����������
    zcrLow=5;    %��ʱ�����ʵ�����
	zcrHigh=10;    %��ʱ�����ʸ�����
	steLow=min(0.002,max(en)/4);     %��ʱ����������
	steHigh=min(10,max(en)/8);    %��ʱ����������
    [~,frame]=size(xx);
    
    state=0;  %��ʼ״̬Ϊ0->����״̬ 1->�������� 2->����״̬ 3->����״̬����
    count=0;  %�����μ����������������������޵ĺʹ������������޻���
                        %���ڹ����ʵ����޵ģ�=>�Ǿ���״̬��Ƭ��
    silence = 0;     %��ʼ�����γ���Ϊ0
    
    head=0;    
    for i=1:frame  %��ÿһ֡�������ж�
        switch state 
            case {0,1}
                if(en(i)>steHigh)   %��֡�����������������ޣ����������׶�
                    state=2;   %��־Ϊ�����׶�
                    head = max(i-count-1,1); 
                    silence=0;
                    count=count+1;
                elseif(en(i)>steLow||zero(i)>zcrLow)  %���ܴ��������׶�
                    state=1;  %��־״̬Ϊ���ܴ�������״̬
                    count=count+1;
                else           %���ھ���״̬
                    state=0;   
                    count=0;
                end    
            case 2   
                if (en(i)> steLow||zero(i)>zcrLow)    % ������������
                    count = count + 1;
                    
                else                       % ����������
                    silence = silence+1;   %����Ƭ��+1
                    if silence < maxSilence % ����������������δ����
                        count  = count + 1;
                    elseif count < minlen   % ��������̫�̣���Ϊ������,��Ҫ�����еļ�������
                        state  = 0;
                        silence = 0;
                        count   = 0;
                    else                    % �����㹻���ˣ���������
                    state=3;
                    end
                end
            case 3
                break;                     
        end
        
    end
    count=count-silence/2;  
    tail=head+count-1;   
end

