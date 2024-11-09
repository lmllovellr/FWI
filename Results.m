function [Result,Score_HeD,Score_KL,Score_JS,interHeD,interKL,interJS]=Results(N,Jourle,FinHeDs,FinScore_KL,FinScore_JS)
inner=sum(Jourle,2);
for i=1:N
%     Fin1=FinHeDs{i};
%     Fin2=FinScore_KL{i};
%     Fin3=FinScore_JS{i};
   interHeD(i)=sum(sum(FinHeDs{i})); 
    interKL(i)=sum(sum(FinScore_KL{i})); 
    interJS(i)=sum(sum(FinScore_JS{i}));
   FinHeD(i)=inner(i)+interHeD(i);
   FinKL(i)=inner(i)+interKL(i);
   FinJS(i)=inner(i)+interJS(i);
end
[Score_HeD,id_FinHeD]=sort(FinHeD,'descend');
[Score_KL,id_FinKL]=sort(FinKL,'descend');
[Score_JS,id_FinJS]=sort(FinJS,'descend');
Result=[Score_HeD',id_FinHeD',Score_KL',id_FinKL',Score_JS',id_FinJS'];
