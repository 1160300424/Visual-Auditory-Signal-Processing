function zero = Zero(xx)
%计算过零率
    [N,frame]=size(xx);  %N行,frame列
    wn=1/(2*N);
    sgn=ones(N,frame); %将所有转化为符号函数计算后的值
    for i=1:N
        for j=1:frame
            if(xx(i,j)<0)
                sgn(i,j)=-1;
            end
        end
    end
    Z=zeros(N-1,frame);
    %计算有多少个零点
    for j=1:frame
        for i=2:N
			Z(i-1,j)=abs(sgn(i,j)-sgn(i-1,j));
        end   
    end
    zero=sum(Z).*wn;
end

