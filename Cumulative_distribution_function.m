clc
clear
load('Arabidopsis_Multiplex_Genetic.mat')
HH=Fin;
[N,y]=size(HH);
g=1:2:13;
for i=1:7
 r1 = hist(HH(:,g(i)),unique(HH(:,g(i))));
 r{i}=r1;
 r2{i}=r1./N;
 r3{i}=cumsum(r2{i});
 r4{i}=1-r3{i};
 DM(i)=length(r1)./N;
end

set(gca,'FontName','Times New Roman','FontSize',12);
plot(1:length(r{1}),r4{1},'r-','MarkerSize',10, 'MarkerFaceColor',[0.5,0.5,0.5])
hold on
plot(1:length(r{2}),r4{2},'m-')
hold on
plot(1:length(r{3}),r4{3},'k-')
% hold on
plot(1:length(r{4}),r4{4},'b-')
hold on
plot(1:length(r{5}),r4{5},'g-')
hold on
plot(length(r{6}),r4{6},'c-')
hold on
plot(length(r{7}),r4{7},'y-')
legend('FWI','FWI_{HD}','FWI_{KL}','KsGC','HKS','GML','Lfic');
xlabel('Time','FontSize',12); 
ylabel('Node','FontSize',12);