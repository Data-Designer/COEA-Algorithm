CT = 1800;
DT = 7;
[active_user,avaliable_item,item_label,~]=get_UI(CT,DT);

filename1=['1800\MY\PS.mat'];
filename2=['1800\SingleCross\PS.mat'];

PS1=importdata(filename1);
PS2=importdata(filename2);

A = ResultofMatircs(PS1,active_user,avaliable_item,item_label);
B = ResultofMatircs(PS2,active_user,avaliable_item,item_label);

% user=[359 1716 3933 6572 7452 7599 8518 9368];



plot(A(:,1),A(:,2),'sc','markersize',8);
hold on;
plot(B(:,1),B(:,2),'dm','markersize',8);

set(gca,'FontSize',18);

xlabel('Platform Operational Efficiency');
ylabel('Investment Income Ratio');



legend('MY','SingleCross');

