function [vad_data] = vadData(head,tail,n,x_native)
%��ԭ��Ƶ��ʵ�������ȡ�˵���֮�������
b=(head-1)*n+1:1:tail*n;
vad_data=x_native(b,:);
end

