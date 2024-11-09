function fuzzynumber=fuzzy_Jourle(alpha,beta,Jourle)
C=Jourle;
h1=max(max(C));
h2=min(min(C));
deta=h1-h2;
 c=median(reshape(Jourle,numel(Jourle),1));
 c2=mean(C(:));
% fuzzynumber=exp(-((C-c).^2)./((2*c2).^2));%%Gaussian fuzzy
 fuzzynumber=1./(1+alpha.*(((C-c)).^beta));%%%%Generalized bell fuzzy
% fuzzynumber=1./(1+(((C-c)./alpha).^beta));%%%%Generalized bell fuzzy
%  fuzzynumber=1./(1+(exp(-alpha.*(C-c))));%%%%Sigmoidal fuzzy

% for i=1:N
%     
%     
% end