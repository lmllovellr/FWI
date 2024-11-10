clc
clear
load('Lazega-Law-Firm_Multiplex_Social.mat')
HF=Fin;
[N,y]=size(HF);
g=1:2:13;
for i=1:7
 nr1 = hist(HF(:,g(i)),unique(HF(:,g(i))));
 nr{i}=nr1;
 f=nr1.*(nr1-1);
 d{i}=f;
 M(i)=(1-(sum(f)/(N.*(N-1)))).^2;
end
