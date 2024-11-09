function [F1,F2,F3,A1,A2,A3,J]=fuzzy(n,Jou1,HeD,Score_KL,Score_JS,W)
N=length(HeD);
% J=sum(Jou1,2);
for i=1:N
    A1(:,i)=sum(HeD{i},2);
    A2(:,i)=sum(Score_KL{i},2);
    A3(:,i)=sum(Score_JS{i},2);
end

for j=1:n
    JJ{j}=Jou1(:,:,j);
    J(j,:)=sum(JJ{j},2)';
    if sum(J(j,:)==0)&& sum(A3(j,:)==0)
        F3(j,:)=0;
    else
%%#########
    F1(j,:)=exp(-J(j,:).*W(j,:))+exp(-A1(j,:).*(1-W(j,:)));
    F2(j,:)=exp(-J(j,:).*W(j,:))+exp(-A2(j,:).*(1-W(j,:)));
    F3(j,:)=exp(-J(j,:).*W(j,:))+exp(-A3(j,:).*(1-W(j,:)));
%%#########
%     F1(j,:)=exp(-J(j,:)).*W(j,:)+exp(-A1(j,:)).*(1-W(j,:));
%     F2(j,:)=exp(-J(j,:)).*W(j,:)+exp(-A2(j,:)).*(1-W(j,:));
%     F3(j,:)=exp(-J(j,:)).*W(j,:)+exp(-A3(j,:)).*(1-W(j,:));
    end
end
F3(F3==2)=0;

