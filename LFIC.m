function [result,value,valueunsorted] = LFIC(filename2)
% clc; clear;
%load X
% file=load(filename,'s'); %读取网络文件
dis=filename2;
a=max(dis)';
 max_shortested =a;
% a=size(file(:,1),1); 
X=max(size(dis(:,1)))  %网络点数
% max_shortested = file(:,2)

max_step = max(max_shortested);
neighbor_stas=zeros(X,max_step);
for i=1:X  %计算每个节点的Information Centrality
    temp=dis(i,:);  %把dis里该节点的一行取出来，即到所有点的最短路径
    %统计每一个节点的每一阶邻居数量
    j = 1;
    while j <= max_step
        neighbor_stas(i,j) = length(find(temp == j));
        j = j + 1;
    end
end

IC=zeros(1,X);
FuzzyN=zeros(1,X)+exp(0);
BoxN=zeros(1,X);
for i=1:X  %计算每个节点的Information Centrality
    %获得盒尺寸
    k=ceil(max_shortested(i)/2);
    %统计盒子里点总数(01逻辑)
    BoxN(i) = sum(neighbor_stas(i,1:k));
    %计算盒子里的Fuzzynum
    FuzzyN(i) = sum(neighbor_stas(i,1:k) .* exp(-(1:k).^2 ./ k^2));
    %计算Fuzzy Entropy
    p=zeros(k,1);
    for m=1:k
        p(m)=(neighbor_stas(i,m)*exp(-m^2/k^2))/FuzzyN(i);
        p(m) = p(m) / exp(1);
        IC(i)=IC(i)+(-p(m)*log(p(m)))/m^2;  % 阶乘
    end    
end
[value,result]=sort(IC);
valueunsorted=IC';

end

