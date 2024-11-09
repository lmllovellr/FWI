tic
clear 
clc
close all
data=textread('EUAirTransportation-multiplex.edges.txt');
Edg=data;
n=max(Edg(:,1));%%层数
E=length(Edg(:,1));%%连边数目
N1=max(Edg(:,2));N2=max(Edg(:,3));
N=max(N1,N2);%%节点数目
[Result,interHeD,interKL,interJS]=Fuzzy_weight_information(data);
Madj=Multi_Adj(Edg);
A=sum(Madj,3);%%聚合邻接矩阵
A(A~=0) = 1;
G=graph(A);
% C_BC=centrality(G,'betweenness');
% C_PC=centrality(G,'pagerank');
% C_EC=centrality(G,'eigenvector');
D=graShortdistance(A,N);
Ks=mycoreness(A);
[KsGC] = KsG_Cenctrity(A,D,Ks);
[HKS] = HKS(A);
[RESULT,GML] = get_multi_local(D,N,2);
[result,value,Lfic] = LFIC(D);

% [C_BC1,id_BC1]=sort(C_BC,'descend');
% [C_PC1,id_PC1]=sort(C_PC,'descend');
% [C_EC1,id_EC1]=sort(C_EC,'descend');
[C_KsGC1,id_KsGC1]=sort(KsGC,'descend');
[C_HKS1,id_HKS1]=sort(HKS,'descend');
[C_GML1,id_GML1]=sort(GML,'descend');
[C_Lfic1,id_Lfic1]=sort(Lfic,'descend');
Fin=[Result,C_KsGC1,id_KsGC1,C_HKS1,id_HKS1,C_GML1,id_GML1,C_Lfic1,id_Lfic1];
% Fin=[Result,C_BC1,id_BC1,C_PC1,id_PC1,C_EC1,id_EC1,C_KsGC1,id_KsGC1,C_HKS1,id_HKS1,C_GML1,id_GML1,C_Lfic1,id_Lfic1];
toc