function energy = Energy(xx)
%计算能量，每一帧的能量存储在一列里
[N,frame]=size(xx);  %N行,frame列

W=ones(N,frame);%方窗函数
afterWindow=W.*xx;  %每一帧都加窗
square=afterWindow.*afterWindow;  %平方

%计算每一帧的能量，每一帧的能量存储在一行里
energy=sum(square);  %计算平方后的每一列之和，也就是短时能量 
    %Energy是1*col的列向量，为了让每一帧的能量都占一行们需要转置
    %一下然后写入文件
end

