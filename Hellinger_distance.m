function Hd=Hellinger_distance(N,p1,p2)
pa1=p1;
pa2=p2;
Num=length(pa1);
h=isempty([pa1,pa2]);
if h==0
    a1=sqrt(pa1);
    a2=sqrt(pa2);
    f=a1-a2;
    hd=f.^2;
%     for i=Num
%         a1(i)=sqrt(pa1(i))
%         a2(i)=sqrt(pa2(i))
%         f(i)=a1(i)-a2(i)
%         hd(i)=(f(i)).^2
%     end
else
    hd=0;
end
s=hd;
kk=sum(s);
Hd=(1/sqrt(2))*sqrt(kk);
