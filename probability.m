function [kneigh,Degree_node,P,PP,W]=probability(n,N,Mutiadj,Degree_adj,weights)
for i=1:n
    for j=1:N
        kneigh{i,j} = kneighbors(Mutiadj(:,:,i),j,1);
        Degree_node{i,j}=Degree_adj(i,kneigh{i,j});
        P{i,j}=Degree_node{i,j}./sum(Degree_node{i,j});
        %     kneigh{(n-(n-2)),j} = kneighbors(Mutiadj(:,:,(n-(n-2))),j,1);
        %     Degree_node{(n-(n-2)),j}=Degree_adj((n-(n-2)),kneigh{(n-(n-2)),j});
        %     P{(n-(n-2)),j}=Degree_node{(n-(n-2)),j}./sum(Degree_node{(n-(n-2)),j});
        %     kneigh{(n-(n-3)),j} = kneighbors(Mutiadj(:,:,(n-(n-3))),j,1);
        %     Degree_node{(n-(n-3)),j}=Degree_adj((n-(n-3)),kneigh{(n-(n-3)),j});
        %     P{(n-(n-3)),j}=Degree_node{(n-(n-3)),j}./sum(Degree_node{(n-(n-3)),j});
        PP=P;
       
    end
%     h=sum(weights);
weights(weights(:)==0)=1/1000000;
    W(i,:)=weights(i,:)./sum(weights);   
end
W(isnan(W(:)))=0;
