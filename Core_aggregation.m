tic
clear 
clc
close all
% data=textread('Arabidopsis_Multiplex_Genetic.txt');
load('PierreAuger_Multiplex_Coauthorship.mat');
Edg=data;
n=max(Edg(:,1));%%层数
E=length(Edg(:,1));%%连边数目
N1=max(Edg(:,2));N2=max(Edg(:,3));
N=max(N1,N2);%%节点数目
% % [Result,interHeD,interKL,interJS]=Fuzzy_weight_information(data);
Madj=Multi_Adj(Edg);
A0=sum(Madj,3);%%聚合邻接矩阵
A11=A0;A1=A0;
A1(A1~=0)=1;
p=0.8;
m=round(p*n);
% find((A0>=1)&(A0<=m));
A0((A0>=1)&(A0<=m)) = 1;
A0(A0>m) = 0;
G0=graph(A11);
AA=G0.Edges.Weight;
C_DC00=centrality(G0,'degree','Importance',AA);
C_BC00=centrality(G0,'betweenness','Cost',AA);
C_PC00=centrality(G0,'pagerank','Importance',AA);
C_EC00=centrality(G0,'eigenvector','Importance',AA);
C_CC00=centrality(G0,'closeness','Cost',AA);
% C_AU0=centrality(G1,'authorities');
% C_HU0=centrality(G1,'hubs');
% % D=graShortdistance(A,N);
% % Ks=mycoreness(A);
% % [KsGC] = KsG_Cenctrity(A,D,Ks);
% % [HKS] = HKS(A);
% % [RESULT,GML] = get_multi_local(D,N,2);
% % [result,value,Lfic] = LFIC(D);


[C_DC001,id_DC001]=sort(C_DC00,'descend');
[C_BC001,id_BC001]=sort(C_BC00,'descend');
[C_PC001,id_PC001]=sort(C_PC00,'descend');
[C_EC001,id_EC001]=sort(C_EC00,'descend');
[C_CC001,id_CC001]=sort(C_CC00,'descend');


G=graph(A0);
G1=graph(A1);
AA=G.Edges.Weight;
C_DC=centrality(G,'degree','Importance',AA);
C_BC=centrality(G,'betweenness','Cost',AA);
C_PC=centrality(G,'pagerank','Importance',AA);
C_EC=centrality(G,'eigenvector','Importance',AA);
C_CC=centrality(G,'closeness','Cost',AA);
% C_AU=centrality(G,'authorities','Tolerance',1e-4);
% C_HU=centrality(G,'hubs','Tolerance',1e-4);
[C_DC1,id_DC1]=sort(C_DC,'descend');
[C_BC1,id_BC1]=sort(C_BC,'descend');
[C_PC1,id_PC1]=sort(C_PC,'descend');
[C_EC1,id_EC1]=sort(C_EC,'descend');
[C_CC1,id_CC1]=sort(C_CC,'descend');
% [C_AU1,id_AU1]=sort(C_AU,'descend');
% [C_HU1,id_HU1]=sort(C_HU,'descend');


C_DC0=centrality(G1,'degree');
C_BC0=centrality(G1,'betweenness');
C_PC0=centrality(G1,'pagerank');
C_EC0=centrality(G1,'eigenvector');
C_CC0=centrality(G1,'closeness');
% C_AU0=centrality(G1,'authorities');
% C_HU0=centrality(G1,'hubs');
% % D=graShortdistance(A,N);
% % Ks=mycoreness(A);
% % [KsGC] = KsG_Cenctrity(A,D,Ks);
% % [HKS] = HKS(A);
% % [RESULT,GML] = get_multi_local(D,N,2);
% % [result,value,Lfic] = LFIC(D);


[C_DC01,id_DC01]=sort(C_DC0,'descend');
[C_BC01,id_BC01]=sort(C_BC0,'descend');
[C_PC01,id_PC01]=sort(C_PC0,'descend');
[C_EC01,id_EC01]=sort(C_EC0,'descend');
[C_CC01,id_CC01]=sort(C_CC0,'descend');
% [C_AU01,id_AU01]=sort(C_AU0,'descend');
% [C_HU01,id_HU01]=sort(C_HU0,'descend');
% % [C_KsGC1,id_KsGC1]=sort(KsGC,'descend');
% % [C_HKS1,id_HKS1]=sort(HKS,'descend');
% % [C_GML1,id_GML1]=sort(GML,'descend');
% % [C_Lfic1,id_Lfic1]=sort(Lfic,'descend');
% % Fin=[Result,C_KsGC1,id_KsGC1,C_HKS1,id_HKS1,C_GML1,id_GML1,C_Lfic1,id_Lfic1];
% Fin=[Result,C_BC1,id_BC1,C_PC1,id_PC1,C_EC1,id_EC1,C_KsGC1,id_KsGC1,C_HKS1,id_HKS1,C_GML1,id_GML1,C_Lfic1,id_Lfic1];
R00=[C_DC001,id_DC001,C_BC001,id_BC001,C_PC001,id_PC001,C_EC001,id_EC001,C_CC001,id_CC001];

R0=[C_DC01,id_DC01,C_BC01,id_BC01,C_PC01,id_PC01,C_EC01,id_EC01,C_CC01,id_CC01];
R1=[C_DC1,id_DC1,C_BC1,id_BC1,C_PC1,id_PC1,C_EC1,id_EC1,C_CC1,id_CC1];
toc