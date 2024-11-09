function [Mucen]=mucentrality(A)
G=graph(A);
C_DC=centrality(G,'degree');
C_CC=centrality(G,'closeness');
C_BC=centrality(G,'betweenness');
C_PC=centrality(G,'pagerank');
C_EC=centrality(G,'eigenvector');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[C_DC1,id_DC1]=sort(C_DC,'descend');
[C_CC1,id_CC1]=sort(C_CC,'descend');
[C_BC1,id_BC1]=sort(C_BC,'descend');
[C_PC1,id_PC1]=sort(C_PC,'descend');
[C_EC1,id_EC1]=sort(C_EC,'descend');
Mucen1=[C_DC1,id_DC1,C_CC1,id_CC1,C_BC1,id_BC1,C_PC1,id_PC1,C_EC1,id_EC1];
Mucen=[id_DC1,id_CC1,id_BC1,id_PC1,id_EC1];