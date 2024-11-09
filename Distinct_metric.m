clc
clear
close all
load('SacchCere_Multiplex_Genetic.mat');
load('C_SMG.mat');
HH=Fin;
[N,y]=size(HH);
R0(:,11:12)=HH(:,5:6);
R00(:,11:12)=HH(:,5:6);
R1(:,11:12)=HH(:,5:6);
g=1:2:11;
for i=1:6
 r100 = hist(R00(:,g(i)),unique(R00(:,g(i))));
 r00{i}=r100;
 r200{i}=r100./N;
 r300{i}=cumsum(r200{i});
 r400{i}=1-r300{i};
 DM00(i)=length(r100)./N;
end

figure(1)
plot(1:length(r00{6}),r400{6},'r-','MarkerSize',3, 'MarkerFaceColor',[0.5,0.5,0.5])
hold on
plot(1:length(r00{1}),r400{1},'c-')
hold on
plot(1:length(r00{2}),r400{2},'b-')
hold on
plot(1:length(r00{3}),r400{3},'k-')
hold on
plot(1:length(r00{4}),r400{4},'g-')
hold on
plot(1:length(r00{5}),r400{5},'m-')
% hold on
% plot(1:length(r{7}),r4{7},'y-')
legend('FWI','DC','BC','PC','EC','CC','FontName','Times New Roman');
xlabel('Rank','FontName','Times New Roman','FontSize',12); 
ylabel('CDF','FontName','Times New Roman','FontSize',12);

for i=1:6
 r10 = hist(R0(:,g(i)),unique(R0(:,g(i))));
 r0{i}=r10;
 r20{i}=r10./N;
 r30{i}=cumsum(r20{i});
 r40{i}=1-r30{i};
 DM0(i)=length(r10)./N;
end

figure(2)
plot(1:length(r0{6}),r40{6},'r-','MarkerSize',3, 'MarkerFaceColor',[0.5,0.5,0.5])
hold on
plot(1:length(r0{1}),r40{1},'c-')
hold on
plot(1:length(r0{2}),r40{2},'b-')
hold on
plot(1:length(r0{3}),r40{3},'k-')
hold on
plot(1:length(r0{4}),r40{4},'g-')
hold on
plot(1:length(r0{5}),r40{5},'m-')
% hold on
% plot(1:length(r{7}),r4{7},'y-')
legend('FWI','DC','BC','PC','EC','CC','FontName','Times New Roman');
xlabel('Rank','FontName','Times New Roman','FontSize',12); 
ylabel('CDF','FontName','Times New Roman','FontSize',12);


for i=1:6
 r11 = hist(R1(:,g(i)),unique(R1(:,g(i))));
 r01{i}=r11;
 r21{i}=r11./N;
 r31{i}=cumsum(r21{i});
 r41{i}=1-r31{i};
 DM01(i)=length(r11)./N;
end
figure(3)
plot(1:length(r01{6}),r41{6},'r-','MarkerSize',3, 'MarkerFaceColor',[0.5,0.5,0.5])
hold on
plot(1:length(r01{1}),r41{1},'c-')
hold on
plot(1:length(r01{2}),r41{2},'b-')
hold on
plot(1:length(r01{3}),r41{3},'k-')
hold on
plot(1:length(r01{4}),r41{4},'g-')
hold on
plot(1:length(r01{5}),r41{5},'m-')
% hold on
% plot(1:length(r{7}),r4{7},'y-')
legend('FWI','DC','BC','PC','EC','CC','FontName','Times New Roman');
xlabel('Rank','FontName','Times New Roman','FontSize',12); 
ylabel('CDF','FontName','Times New Roman','FontSize',12);