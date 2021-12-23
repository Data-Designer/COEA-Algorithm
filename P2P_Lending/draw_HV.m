CT=1800;


filename=['Results\',num2str(CT),'\HV\HV.mat'];

HV=importdata(filename);


plot(HV(1,:),HV(4,:),'>c','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(3,:),'<b','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(5,:),'^g','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(6,:),'dy','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(2,:),'sm','markersize',12,'linewidth',2);
hold on;
plot(HV(1,:),HV(7,:),'+r','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(8,:),'ob','markersize',32,'linewidth',2);
hold on;
plot(HV(1,:),HV(9,:),'*r','markersize',32,'linewidth',2);

% plot(HV(1,:),HV(4,:),'>c','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(3,:),'<b','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(5,:),'^g','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(6,:),'dy','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(2,:),'sm','markersize',12,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(7,:),'+r','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(8,:),'ob','markersize',32,'linewidth',2);
% hold on;
% plot(HV(1,:),HV(9,:),'*r','markersize',32,'linewidth',2);

set(gca,'FontSize',32);


title('P2PLending');
xlabel('Number of Evaluations');
ylabel('HV');

legend('NSGA-II','SPEA2','MOEA-D','ARMOEA','Top','CoEA(-M)','CoEA(-C)','CoEA');
% legend('MY','RandSelect','SingleCross');
% legend('NSGA-II','GT-MOEA(CR)','GT-MOEA(UR)','GT-MOEA(RM)','GT-MOEA(SC)','GT-MOEA(RS)','GT-MOEA');




