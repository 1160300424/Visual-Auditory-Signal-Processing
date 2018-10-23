function  [head,tail]=VAD(xx)        
	
	en=Energy(xx);
    zero=Zero(xx);
    
    %设置门限
	maxSilence=10;    %允许的最大静音长度
    minlen  = 20;    % 最短语音长度
    zcrLow=5;    %短时过零率低门限
	zcrHigh=10;    %短时过零率高门限
	steLow=min(0.002,max(en)/4);     %短时能量低门限
	steHigh=min(10,max(en)/8);    %短时能量高门限
    [~,frame]=size(xx);
    
    state=0;  %初始状态为0->静音状态 1->可能语音 2->语音状态 3->语音状态结束
    count=0;  %语音段计数（包括大于能量高门限的和大于能量低门限或者
                        %大于过零率低门限的）=>非静音状态的片段
    silence = 0;     %初始静音段长度为0
    
    head=0;    
    for i=1:frame  %对每一帧都进行判断
        switch state 
            case {0,1}
                if(en(i)>steHigh)   %该帧能量大于能量高门限，进入语音阶段
                    state=2;   %标志为语音阶段
                    head = max(i-count-1,1); 
                    silence=0;
                    count=count+1;
                elseif(en(i)>steLow||zero(i)>zcrLow)  %可能处于语音阶段
                    state=1;  %标志状态为可能处于语音状态
                    count=count+1;
                else           %处于静音状态
                    state=0;   
                    count=0;
                end    
            case 2   
                if (en(i)> steLow||zero(i)>zcrLow)    % 保持在语音段
                    count = count + 1;
                    
                else                       % 语音将结束
                    silence = silence+1;   %静音片段+1
                    if silence < maxSilence % 静音还不够长，尚未结束
                        count  = count + 1;
                    elseif count < minlen   % 语音长度太短，认为是噪声,需要将所有的计数归零
                        state  = 0;
                        silence = 0;
                        count   = 0;
                    else                    % 静音足够长了，语音结束
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

