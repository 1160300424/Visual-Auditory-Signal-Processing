function [vad_data] = vadData(head,tail,n,x_native)
%从原音频真实数据里截取端点检测之后的数据
b=(head-1)*n+1:1:tail*n;
vad_data=x_native(b,:);
end

