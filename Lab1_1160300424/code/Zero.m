function zero = Zero(xx)
%���������
    [N,frame]=size(xx);  %N��,frame��
    wn=1/(2*N);
    sgn=ones(N,frame); %������ת��Ϊ���ź���������ֵ
    for i=1:N
        for j=1:frame
            if(xx(i,j)<0)
                sgn(i,j)=-1;
            end
        end
    end
    Z=zeros(N-1,frame);
    %�����ж��ٸ����
    for j=1:frame
        for i=2:N
			Z(i-1,j)=abs(sgn(i,j)-sgn(i-1,j));
        end   
    end
    zero=sum(Z).*wn;
end

