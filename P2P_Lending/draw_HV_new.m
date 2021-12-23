CT=1700;


filename=['Results\',num2str(CT),'\HV\HV.mat'];
HV=importdata(filename);

% 
% style = char('sm-','<b-','>c-','^g-','dy-','+r-','ob-','*r-');
% legends = char('Top','SPEA2','NSGA-II','MOEA-D','ARMOEA','CoEA(-M)','CoEA(-C)','CoEA');
% 
% for i=2:9
%     figure(i-1);
%     a = HV(1,:);
%     b = HV(i,:);
%     values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
%     plot(values(1,:),values(2,:),style(i-1,:),'markersize',5,'linewidth',2);
% %     hold on;
%     title('Groupbuying');
%     xlabel('Number of Evaluations');
%     ylabel('HV');
%     legend(legends(i-1,:));
% 
% end

    

a = HV(1,:);
b = HV(2,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'sm-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(3,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'<b-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(4,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'>c-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(5,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'^g-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(6,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'dy-','markersize',12,'linewidth',2);
hold on;


a = HV(1,:);
b = HV(7,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'+r-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(8,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'ob-','markersize',12,'linewidth',2);
hold on;

a = HV(1,:);
b = HV(9,:);
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:),'*r-','markersize',12,'linewidth',2);



set(gca,'FontSize',42);


% title('p2p lending');
xlabel('Number of Evaluations');
ylabel('HV');

legend('Top','SPEA2','NSGA-II','MOEA-D','ARMOEA','CoEA(-M)','CoEA(-C)','CoEA');

