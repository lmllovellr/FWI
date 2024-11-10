clc;
clear;
close all;
warning off;

% function Frequency(Fin)
load('Drosophila_Multiplex_Genetic.mat')
% load('Data\01_Jazz.mat');
% load('Data\D_Jazz.mat');
% A = Jazz;
% % N=size(A);
% 
% G = graph(A);
% 
% DC = centrality(G,'degree');
% BC = centrality(G,'betweenness');
% CC = centrality(G,'closeness');
% % [LD] = F_LD(A,D);
% % [FLID] = F_FLID(A,D);
% 
% [GC] = Gravity(A,D);
% [WGC] = WeightGravity(A,D);
% [GGC] = GGC(A,D);
% % [EGM] = EGM(A,D);
% [EGM] = SUPER(A,D);
% 
% 
% 
% [DC,ID_DC] = sort(DC,'descend');
% [BC,ID_BC] = sort(BC,'descend');
% [CC,ID_CC] = sort(CC,'descend');
% % [LD,ID_LD] = sort(LD,'ascend');
% % [FLID,ID_FLID] = sort(FLID,'descend');
% [GC,ID_GC] = sort(GC,'descend');
% [WGC,ID_WGC] = sort(WGC,'descend');
% [GGC,ID_GGC] = sort(GGC,'descend');
% [EGM,ID_EGM] = sort(EGM,'descend');
% 
% 
% 
% Fre_DC = unique(DC);            
% Fre_DC = flipud(Fre_DC);        
% F_DC = zeros(length(Fre_DC),2); 
% F_DC(:,1) = (1:length(Fre_DC)); 
% for i =1:length(Fre_DC)
%     F_DC(i,2) = length(find(DC==Fre_DC(i))); 
% end
% 
% Fre_CC = unique(CC);
% Fre_CC = flipud(Fre_CC); 
% F_CC = zeros(length(Fre_CC),2);
% F_CC(:,1) = (1:length(Fre_CC));
% for i =1:length(Fre_CC)
%     F_CC(i,2) = length(find(CC==Fre_CC(i))); 
% end
% 
% Fre_BC = unique(BC);
% Fre_BC = flipud(Fre_BC); 
% F_BC = zeros(length(Fre_BC),2);
% F_BC(:,1) = (1:length(Fre_BC));
% for i =1:length(Fre_BC)
%     F_BC(i,2) = length(find(BC==Fre_BC(i))); 
% end
% 
% 
% Fre_GC = unique(GC);
% Fre_GC = flipud(Fre_GC); 
% F__GC = zeros(length(Fre_GC),2);
% F__GC(:,1) = (1:length(Fre_GC));
% for i =1:length(Fre_GC)
%     F__GC(i,2) = length(find(GC==Fre_GC(i))); 
% end
% 
% Fre_WGC = unique(WGC);
% Fre_WGC = flipud(Fre_WGC); 
% F__WGC = zeros(length(Fre_WGC),2);
% F__WGC(:,1) = (1:length(Fre_WGC));
% for i =1:length(Fre_WGC)
%     F__WGC(i,2) = length(find(WGC==Fre_WGC(i))); 
% end
% 
% Fre_GGC = unique(GGC);
% Fre_GGC = flipud(Fre_GGC); 
% F__GGC = zeros(length(Fre_GGC),2);
% F__GGC(:,1) = (1:length(Fre_GGC));
% for i =1:length(Fre_GGC)
%     F__GGC(i,2) = length(find(GGC==Fre_GGC(i))); 
% end
% 
% Fre_EGM = unique(EGM);
% Fre_EGM = flipud(Fre_EGM); 
% F__EGM = zeros(length(Fre_EGM),2);
% F__EGM(:,1) = (1:length(Fre_EGM));
% for i =1:length(Fre_EGM)
%     F__EGM(i,2) = length(find(EGM==Fre_EGM(i))); 
% end

Fre_HD = unique(Fin(:,1));            
Fre_HD = flipud(Fre_HD);        
F_HD = zeros(length(Fre_HD),2); 
F_HD(:,1) = (1:length(Fre_HD)); 
for i =1:length(Fre_HD)
    F_HD(i,2) = length(find(Fin(:,1)==Fre_HD(i))); 
end

Fre_KL = unique(Fin(:,3));            
Fre_KL = flipud(Fre_KL);        
F_KL = zeros(length(Fre_KL),2); 
F_KL(:,1) = (1:length(Fre_KL)); 
for i =1:length(Fre_KL)
    F_KL(i,2) = length(find(Fin(:,3)==Fre_KL(i))); 
end

Fre_JS = unique(Fin(:,5));            
Fre_JS = flipud(Fre_JS);        
F_JS = zeros(length(Fre_JS),2); 
F_JS(:,1) = (1:length(Fre_JS)); 
for i =1:length(Fre_JS)
    F_JS(i,2) = length(find(Fin(:,5)==Fre_JS(i))); 
end

Fre_KsGC = unique(Fin(:,7));            
Fre_KsGC = flipud(Fre_KsGC);        
F_KsGC = zeros(length(Fre_KsGC),2); 
F_KsGC(:,1) = (1:length(Fre_KsGC)); 
for i =1:length(Fre_KsGC)
    F_KsGC(i,2) = length(find(Fin(:,7)==Fre_KsGC(i))); 
end

Fre_HKS = unique(Fin(:,9));            
Fre_HKS = flipud(Fre_HKS);        
F_HKS = zeros(length(Fre_HKS),2); 
F_HKS(:,1) = (1:length(Fre_HKS)); 
for i =1:length(Fre_HKS)
    F_HKS(i,2) = length(find(Fin(:,9)==Fre_HKS(i))); 
end

Fre_GML = unique(Fin(:,11));            
Fre_GML = flipud(Fre_GML);        
F_GML = zeros(length(Fre_GML),2); 
F_GML(:,1) = (1:length(Fre_GML)); 
for i =1:length(Fre_GML)
    F_GML(i,2) = length(find(Fin(:,11)==Fre_GML(i))); 
end

Fre_Lfic = unique(Fin(:,13));            
Fre_Lfic = flipud(Fre_Lfic);        
F_Lfic = zeros(length(Fre_Lfic),2); 
F_Lfic(:,1) = (1:length(Fre_Lfic)); 
for i =1:length(Fre_Lfic)
    F_Lfic(i,2) = length(find(Fin(:,13)==Fre_Lfic(i))); 
end
figure  
% for i=1:length(F_DC)
%     plot(F_DC(i,1),F_DC(i,2),'r','Marker','*','LineWidth',2);
%     hold on
% end
    
scatter(F_HD(:,1),F_HD(:,2),50,'Marker','o','LineWidth',1.5);
hold on

scatter(F_KL(:,1),F_KL(:,2),50,'y','Marker','<','LineWidth',1.5);
hold on
scatter(F_JS(:,1),F_JS(:,2),50,'Marker','d','LineWidth',1.5);
hold on

scatter(F_KsGC(:,1),F_KsGC(:,2),50,'Marker','x','LineWidth',1.5);
hold on
scatter(F_HKS(:,1),F_HKS(:,2),50,'Marker','+','LineWidth',1.5);
hold on
scatter(F_GML(:,1),F_GML(:,2),50,'g','Marker','v','LineWidth',1.5);
hold on
scatter(F_Lfic(:,1),F_Lfic(:,2),50,'r','Marker','p','LineWidth',1.5);
hold on




xlabel('Rank','FontSize',10);
ylabel('Frequence','FontSize',10);
legend('FWI_{HD}','FWI_{KL}','FWI','KsGC','HKS','GML','Lfic');
box on

individuation(1) = length(Fre_HD)/length(A);
individuation(2) = length(Fre_KL)/length(A);
individuation(3) = length(Fre_JS)/length(A);
individuation(4) = length(Fre_KsGC)/length(A);
individuation(5) = length(Fre_HKS)/length(A);
individuation(6) = length(Fre_GML)/length(A);
individuation(7) = length(Fre_Lfic)/length(A);



