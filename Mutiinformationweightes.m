tic
clc
clear
close all
data=textread('xenopus_genetic_multiplex_edges.txt');
Edg=data;
n=max(Edg(:,2));%%层数
E=length(Edg(:,1));%%连边数目
N1=max(Edg(:,1));N2=max(Edg(:,3));
N=max(N1,N2);%%节点数目
Madj=Multi_Adj(Edg);
q=3;
for i=1:n
Mutiadj=Madj;
    MutiB{i}=graph(Mutiadj(:,:,i));
    Degree_adj(i,:)=degree(MutiB{i});
    MutiDist(:,:,i)=graShortdistance(Mutiadj(:,:,i),N);
    [R1,LPI1]=Pseudo_inverse_matrix2(N,Mutiadj(:,:,i));
    R{i}=R1;
    LPI{i}=LPI1;
    [D,degree2]=degree_degreedistance(Mutiadj(:,:,i));
    D_D{i}=D;
    DEG(i,:)=degree2;
    [ weight,GML ]= get_multi_local(MutiDist(:,:,i),N,q);
    weights(i,:)=weight(1,:);
end
 [kneigh,Degree_node,P,PP,W]=probability(n,N,Mutiadj,Degree_adj,weights);
%%
for r=1:N
    for t=1:n
        for s=1:n
            g1=length(P{t,r});
            g2=length(P{s,r});
            M=max(g1,g2);
            if g1<g2
                P{t,r}=[P{t,r}, zeros(1,M-g1)];
                HH{t,r}=[P{t,r};P{s,r}];
            else
                P{s,r}=[P{s,r}, zeros(1,M-g2)];
                HH{t,r}=[P{t,r};P{s,r}];
            end

             t
             s
%             r
%              P{t,r}
%              P{s,r}
            Hd1=Hellinger_distance(M,P{t,r},P{s,r});
            Hd(t,s)=Hd1;
            [score_KL1,score_JS1] = KL_JS_div(P{t,r},P{s,r});
            score_KL(t,s)=score_KL1;
            score_JS(t,s)=score_JS1;
        end
    end
    HeD{r}= Hd;
    Score_KL{r}=score_KL;
    Score_JS{r}=score_JS;
    FinHeDs{r}= triu(Hd);
    FinScore_KL{r}=triu(score_KL);
    FinScore_JS{r}=triu(score_JS);
    
end
[Q,Joule,Jou1,Jou2]=Power(n,N,D_D,R,MutiDist,W);
alpha=1./mean(Joule(:));
% alpha=1./var(Joule(:));
beta=2;
% fuzzynumber=1./(1+(((C-c)./alpha).^beta));%%%%generalized bell fuzzy
% fuzzynumber=fuzzy_Jourle(alpha,beta,Joule);
[F1,F2,F3,A1,A2,A3,J]=fuzzy(n,Jou1,HeD,Score_KL,Score_JS,W);
[Result,Score_fHeD,Score_fKL,Score_fJS,interHeD,interKL,interJS]=Results2(F1,F2,F3);
toc