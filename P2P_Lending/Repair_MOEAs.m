CT = 1800;
maxtimeofinvest = 50;
filename1=['Results\',num2str(CT),'\NSGA2\PS.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PS.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PS.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PS.mat'];
filename5=['Results\',num2str(CT),'\Top\PS.mat'];

filename22 = ['DATA\',num2str(CT),'\active_user.mat'];
filename33 = ['DATA\',num2str(CT),'\available_item.mat'];

active_user = importdata(filename22);
available_item = importdata(filename33);


user=size(active_user,1);
item=size(available_item,1);    
investacount=active_user(:,3)';
requestacount=available_item(:,3)';
preference=zeros(user,item,'double'); 
for i=1:user
    temp=available_item(:,2)'/active_user(i,2);
    preference(i,:)=available_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
end


PS1=importdata(filename1);
PS2=importdata(filename2);
PS3=importdata(filename3);
PS4=importdata(filename4);
PS5=importdata(filename5);

PS = cell(5,1);
PS{1} = PS1;
PS{2} = PS2;
PS{3} = PS3;
PS{4} = PS4;
PS{5} = PS5;


for i = 5 : 5
    for k=1:size(PS{i},2)
         PS{i}{k}=Individual_repair(PS{i}{k},user,investacount,requestacount,maxtimeofinvest);
    end
end

filename1=['Results\',num2str(CT),'\NSGA2\PS_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PS_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PS_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PS_Repair.mat'];
filename5=['Results\',num2str(CT),'\Top\PS_Repair.mat'];
PS1 = PS{1};
PS2 = PS{2};
PS3 = PS{3};
PS4 = PS{4};
PS5 = PS{5};

save(filename1,'PS1');
save(filename2,'PS2');
save(filename3,'PS3');
save(filename4,'PS4');
save(filename5,'PS5');