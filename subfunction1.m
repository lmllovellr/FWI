

 function [j,n2,Mer2,Num2,ssum]=subfunction1(P,Q,m)  %n2��ʾβ������Ŀ,Sum��ʾ����Ԫ�ص��ܺ�
% t=length(Q);%��ʾ�м���Ԫ��
% Sum=zeros(1,t);
num=zeros(500);
Num2=zeros(1000,10000);%��Ÿ���ֵ
Mer2=strings(1000,10000);%M��Ž���Ԫ��
ss=length(m);% ���ʼ����������ȷ��������ϵ

sss=0;
for i=1:length(m)  %size(M,1)������
%     if length(char(P(i)))==1
%         for j=1:t
%             if strcmp(Q(j),P(i))
%                 Sum(1,j)=m(i);
%             end
%         end
%     else
                sss=sss+1;
        Mer2(1,sss)=P(i);
        Num2(1,sss)=m(i);
%     end
end

sum=0;

% n2=length(m);
ssum=0;
%Z=combntns(P,f);���ɼ�������
%L=length(P);
for i=1:ss
    n1=length(num2str(P(i)));
    if m(i)==0
    else
    sum=sum+(-m(i)*log2(m(i)/(2^n1-1)));
    end
end

a1=1;%�洢�������ɵ����� ssum��ʾ�����������ɵ�
num(a1)=sum;
    limit=zeros(1,1000);
    limit(1,1)=sss;
    j=0;% j��ʾ��ʼ�ڼ�������ѭ��
while (abs(ssum-sum))>=0.001
    
    sum=ssum;

    ssum=0;
    j=j+1;
    n2=1;%��ʾ��һ��������±�
    
    %����һ����ǩ

  
    
    for i=1:limit(1,j) %��ǰ�����Ԫ�ط���   ��ֵ����������Ե���С
                L=strlength(Mer2(j,i));  %��ʾ���ַ�����ĸ����
                 
                ele=0;
                for ii=1:L
                str=string(combntns(char(Mer2(j,i)),ii));
                l2=length(str);
                for iii=1:l2
                ele=ele+2^(ii)-1;
                end
                end
            for ii=1:L
                str=string(combntns(char(Mer2(j,i)),ii));
                ll=length(str);
                for iii=1:ll
                         len=strlength(str(iii)); %"ABC"����Ϊ3
                     
%                          if len==1
%                              for jj=1:t
%                                  if strcmp(Q(jj),str(iii))
%                                     
%                                      Sum(1,jj)=Sum(1,jj)+Num2(j,i)*(2^len-1)/ele;
%                                  end
%                              end
%                          else

                            Mer2(j+1,n2)=str(iii);

                            Num2(j+1,n2)=Num2(j,i)*(2^len-1)/ele;
                            n2=n2+1;
%                           end
                end
           end
     end


    
    limit(1,j+1)=n2;
    
    %����һ��Ԫ���������Ϣ��
    for i=1:n2  
            %���������Ԫ����������ĸ���֮��
                if Num2(j+1,i)==0
                else                   
                 n1=length(num2str(Mer2(j+1,i)));
                 ssum=ssum+(-Num2(j+1,i)*log2(Num2(j+1,i)/(2^n1-1)));  
                end
    end
%     for i=1:t
%         if Sum(1,i)==0
%         else
%             ssum=ssum+(-Sum(1,i)*log2(Sum(1,i)/(2^1-1)));
%         end
%     end
    
    a1=a1+1;
        num(a1)=ssum;
end



j=j+1;



end