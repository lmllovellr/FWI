%����ɢ�Ȳ�������  string ���Խ�'ABCD'��Ϊ"ABCD"


Q=['A' 'B'];
P=["A" "B" "AB"];
m1=[1/5 2/5 2/5]; 
m2=[3/5 1/5 1/5];
% m2=[0.1 0.1 0.8 0];
zz=0;

%     a=(0.02/15)*w;
%     m1=[(1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)-a (1/15)+14*a];
%     m2=[0 0 0 1 0 0 0 0 0 0 0 0 0 0 0];



        [row1,list1,Mer1,Num11,infor1]=subfunction1(P,Q,m1);
        [row2,list2,Mer2,Num21,infor2]=subfunction1(P,Q,m2);

%         if row1>=row2
%             row=row1;
%             list=list1;
%             
%         else
%             row=row2;
%            list=list2;
%         end

%%%%%%%
%��ͬԪ�ؼ��е�һ����м���
% c=0;
% Mer=string(zeros(1,1000));
% for i=1:length(Q)
%     Z=combntns(Q,i);
%     lz=length(string(Z));
%     for ii=1:lz
%          c=c+1;
%         Mer(1,c)=Z(ii,:);
%     end
% end
% 
% %%%%%����ǽ���Сrow,listΪ��׼���� �Ը���Ϊ��׼���д��о�
% Sum1=zeros(1,1000);
% Sum2=zeros(1,1000);
% for j=1:list1
%     for jj=1:c
%         d=strcmp(Mer1(row1,j),Mer(1,jj));
%         if d==1
%             Sum1(1,jj)=Sum1(1,jj)+Num11(row1,j);
%             break;
%         end
%         
%     end
% end
% % 
% % for j=1:c
% %     for jj=1:length(Q)
% %     if strcmp(Q(jj),Mer(1,j))
% %         Sum1(1,j)=Num12(1,jj)+Sum1(1,j);
% %         Sum2(1,j)=Num22(1,jj)+Sum2(1,j);
% %     end
% %     end
% % end
% 
% % 
% for j=1:list2
%     for jj=1:c
%         d=strcmp(Mer2(row2,j),Mer(1,jj));
%         if d==1
%             Sum2(1,jj)=Sum2(1,jj)+Num21(row2,j);
%             break;
%         end
%     end
% end
% 
% 
% 
%                  for j=1:c
%                      zz=zz+(Sum1(1,j)-Sum2(1,j))^2;
%                  end
%                  zz=sqrt(zz/2)
% 
% 
%     
