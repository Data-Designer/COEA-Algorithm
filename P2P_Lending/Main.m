clear;
clc;
%% ʵ���������
CT=1800;
timec = 10;
DT=7;
numofinvest=50;
maxtimeofinvest=50;


genaration=200;
popsize=100;
crossrate=0.25;
mutationrate=0.1;    


%% ��ȡ�г���ǰʱ���µĿ��ô���ͻ�Ծ�û�
[active_user,avaliable_item,item_label,investamount]=get_UI(CT,DT);
user=size(active_user,1);
item=size(avaliable_item,1);
investacount=active_user(:,3)';
requestacount=avaliable_item(:,3)';
 

preference=zeros(user,item,'double'); 
for i=1:user
    temp=avaliable_item(:,2)'/active_user(i,2);
    preference(i,:)=avaliable_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
end

%% ��ʼ��
t1=clock;
% mutationrate=1/item; 
population=initial_random(user,item,numofinvest,popsize);

%% ��������
[PS,PSV,HV]=GT_Evolutionary(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
% [PS,PSV,HV]=NSGA2(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate);
freetime=etime(clock,t1);

filename1=['1800\RandSelect\PS.mat'];
save(filename1,'PS');                                                                                                                                                                                                            
filename2=['1800\RandSelect\PSV.mat'];
save(filename2,'PSV'); 
filename3=['1800\RandSelect\HV.mat'];    
save(filename3,'HV'); 

% filename1=['���\PS.mat'];
% save(filename1,'PS');                                                                                                                                                                                                            
% filename2=['���\PSV.mat'];
% save(filename2,'PSV'); 
% filename3=['���\HV.mat'];
% save(filename3,'HV'); 

