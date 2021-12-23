CT=1700;


filename1=['Results\',num2str(CT),'\UCF\PSV.mat'];
filename2=['Results\',num2str(CT),'\ICF\PSV.mat'];
filename3=['Results\',num2str(CT),'\NSGA2\PSV_Nondo.mat'];
filename4=['Results\',num2str(CT),'\SPEA2\PSV_Nondo.mat'];
filename5=['Results\',num2str(CT),'\MOEAD\PSV_Nondo.mat'];
filename6=['Results\',num2str(CT),'\ARMOEA\PSV_Nondo.mat'];
filename7=['Results\',num2str(CT),'\Top\PSV_Nondo.mat'];
filename8=['Results\',num2str(CT),'\DMF\PSV.mat'];
filename9=['Results\',num2str(CT),'\GTEA(-GM)\PSV.mat'];
filename10=['Results\',num2str(CT),'\GTEA(-GC)\PSV.mat'];
filename11=['Results\',num2str(CT),'\GTEA\PSV.mat'];

PSV1=importdata(filename1);
PSV2=importdata(filename2);
PSV3=importdata(filename3);
PSV4=importdata(filename4);
PSV5=importdata(filename5);
PSV6=importdata(filename6);
PSV7=importdata(filename7);
PSV8=importdata(filename8);
PSV9=importdata(filename9);
PSV10=importdata(filename10);
PSV11=importdata(filename11);




plot(PSV1(:,1),PSV1(:,2),'hm','markersize',32,'linewidth',2);
hold on;
plot(PSV2(:,1),PSV2(:,2),'pk','markersize',32,'linewidth',2);
hold on;
plot(PSV3(:,1),PSV3(:,2),'>c','markersize',32,'linewidth',2);
hold on;
plot(PSV4(:,1),PSV4(:,2),'<b','markersize',32,'linewidth',2);
hold on;
plot(PSV5(:,1),PSV5(:,2),'^g','markersize',32,'linewidth',2);
hold on;
plot(PSV6(:,1),PSV6(:,2),'dy','markersize',32,'linewidth',2);
hold on;
plot(PSV7(:,1),PSV7(:,2),'sm','markersize',32,'linewidth',2);
hold on;
plot(PSV8(:,1),PSV8(:,2),'xc','markersize',32,'linewidth',2);
hold on;
plot(PSV9(:,1),PSV9(:,2),'+r','markersize',32,'linewidth',2);
hold on;
plot(PSV10(:,1),PSV10(:,2),'ob','markersize',32,'linewidth',2);
hold on;
plot(PSV11(:,1),PSV11(:,2),'*r','markersize',32,'linewidth',2);

set(gca,'FontSize',32);
% set(gca,'XTick',0.08:0.02:0.18);
% set(gca,'YTick',0.3:0.1:0.7);
% axis([0.08 0.18 0.3 0.7]);


xlabel('Fc','fontangle','italic','fontweight','bold');
ylabel('Fm','fontangle','italic','fontweight','bold');

legend('UCF','ICF','NSGA-II','SPEA2','MOEA-D','ARMOEA','ToP','DMF','CoEA(-M)','CoEA(-C)','CoEA');
% legend('MY','RandSelect','SingleCross');
% legend('NSGA-II','GT-MOEA(CR)','GT-MOEA(UR)','GT-MOEA(RM)','GT-MOEA(SC)','GT-MOEA(RS)','GT-MOEA');
