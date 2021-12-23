CT = 10;
maxtimeofinvest = 10;
filename1=['Results\',num2str(CT),'\NSGA2\PS.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PS.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PS.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PS.mat'];
filename5=['Results\',num2str(CT),'\Top\PS.mat'];

active_user = importdata('DATASET\active_user.mat');
avaliable_item = importdata('DATASET\available_item.mat');
user=size(active_user,1);
item=size(avaliable_item,1);    
stock=avaliable_item(:,2)';
preference=zeros(user,item,'double');  
price=avaliable_item(:,3);
for i=1:user
    temp=avaliable_item(:,3)'/active_user(i,3);
    preference(i,:)=exp(-1*pi*(temp-1).*(temp-1));
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
    i
    for k=1:size(PS{i},2)
        k
        PS{i}{k}=Individual_repair(PS{i}{k},user,stock,maxtimeofinvest);
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