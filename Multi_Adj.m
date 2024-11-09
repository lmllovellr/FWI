function Madj=Multi_Adj(Edg)
n=max(Edg(:,1));
E=length(Edg(:,1));
N1=max(Edg(:,2));N2=max(Edg(:,3));
N=max(N1,N2);
Madj=zeros(N,N,n);
for i=1:E
Madj(Edg(i,2),Edg(i,3),Edg(i,1)) =1;   
Madj(Edg(i,3),Edg(i,2),Edg(i,1)) =1;  
end
% for j=1:n
%     h=Madj(:,:,j);
% Madj(:,:,j) = h + h';
% Madj((Madj(:,:,j)~=0),j) = 1;
% end