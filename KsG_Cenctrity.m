function [C] = KsG_Cenctrity(A,D,Ks)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
N=size(A,2);
aver_D = sum(sum(D))/(N*(N-1));
% aver_D = max(max(D));
[DeD,aver_DeD]=Degree_Distribution(A);
R=(1/2)*aver_D;

% Ks = K_Shell(A);
KsD1 = repmat(Ks,N,1);
KsD2 = repmat(Ks',1,N);
KsD = (KsD1 - KsD2)/(max(Ks)-min(Ks));
T = repmat(exp(1),N,N);
KsD = (T.^KsD);
clear KsD1;
clear KsD2;
clear T;

C=repmat(DeD,N,1);

Lij=D;
Lij(Lij>=R)=0;
Lij=1./(Lij.*Lij);
Lij(Lij==inf)=0;
DD=DeD';
DD=repmat(DD,1,N);
Temp = C.*DD;
Temp = Temp.*KsD;
CC=Temp.*(Lij);

CC(isnan(CC))=0;
C=sum(CC,2);
end

