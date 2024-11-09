function X=normal(data)
nor=zscore(data);
X=mapminmax(nor,0,1);
% x=max(data);
% y=min(data);
% N=length(data);
% for i=1:N
%     X(i)=(data(i)-y)/(x-y);
% end
