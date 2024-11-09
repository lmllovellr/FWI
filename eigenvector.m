function [H]=eigenvector(A)
  [x,y]=eig(A);
  [C_y,id_y]=sort(diag(y),'descend');
  h=x(:,id_y(1));
  H=abs(h);
  
    