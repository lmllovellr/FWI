function [Q,Joule,Jou1,Jou2]=Power(n,N,I,R,t,W)
% I=D_D;t=MutiDist;
for k=1:n
for ii=1:N
    for jj=1:N      
     Q(ii,jj,k)=  ((I{k}(ii,jj)).^2) .*(R{k}(ii,jj)).*(t(ii,jj,k));         
    end
    Jou1(ii,:,k)=Q(ii,:,k);
    Jou2(ii,:,k)=Q(ii,:,k).*W(k,ii);
end
end
Joule=sum(Jou2,3);