CT=10;

filename1=[num2str(CT),'\MY\HV.mat'];
filename2=[num2str(CT),'\RandSelect\HV.mat'];
filename3=[num2str(CT),'\SingleCross\HV.mat'];
filename4=[num2str(CT),'\RandomMutation\HV.mat'];
filename5=[num2str(CT),'\Framework\HV.mat'];
filename6=[num2str(CT),'\NSGA2\HV.mat'];


HV1=importdata(filename1);
HV2=importdata(filename2);
HV3=importdata(filename3);
HV4=importdata(filename4);
HV5=importdata(filename5);
HV6=importdata(filename6);

B1=[];
B2=[];
B3=[];
B4=[];
B5=[];
B6=[];

C1=[1,HV1(1)];
C2=[1,HV2(1)];
C3=[1,HV3(1)];
C4=[1,HV4(1)];
C5=[1,HV5(1)];
C6=[1,HV6(1)];


for i=0:5:200
    if i==0
        B1=[0,0];
        B2=[0,0];
        B3=[0,0];
        B4=[0,0];
        B5=[0,0];
        B6=[0,0];
    else
        B1=[B1;i,HV1(i)];
        B2=[B2;i,HV2(i)];
        B3=[B3;i,HV3(i)];
        B4=[B4;i,HV4(i)];
        B5=[B5;i,HV5(i)];
        B6=[B6;i,HV6(i)];
    end
    if mod(i,20)==0 && i~=0
        C1=[C1;i,HV1(i)];
        C2=[C2;i,HV2(i)];
        C3=[C3;i,HV3(i)];
        C4=[C4;i,HV4(i)];
        C5=[C5;i,HV5(i)];
        C6=[C6;i,HV6(i)];
    end
end


figure(1)
plot(B1(:,1),B1(:,2),'c-.^','markersize',12);
hold on;
% plot(C1(:,1),C1(:,2),'r-.*','markersize',12);
% hold on;
plot(B2(:,1),B2(:,2),'r-.P','markersize',12);
% % hold on;
% % plot(C2(:,1),C2(:,2),'y-.*','markersize',12);
hold on;
plot(B3(:,1),B3(:,2),'b-.*','markersize',12);
hold on;
plot(B4(:,1),B4(:,2),'g-.+','markersize',12);
hold on;
plot(B5(:,1),B5(:,2),'k-.o','markersize',12);
hold on;
plot(B6(:,1),B6(:,2),'m-.d','markersize',12);



xlabel('Generations'); ylabel('HV');

set(gca,'FontSize',18);

legend('MY','RandSelect');

% set(gca,'YTick',[0.04 0.08 0.09 0.10]);
% legend('MY','RandSelect','SingleCross');
legend('MY','RandSelect','SingleCross','RandomMutation','Framework','NSGA2');


