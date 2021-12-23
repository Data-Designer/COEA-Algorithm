clear;
clc;
CT  = 10;
filename1=['Results\',num2str(CT),'\NSGA2\PS_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PS_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PS_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PS_Repair.mat'];
filename5=['Results\',num2str(CT),'\Top\PS_Repair.mat'];
active_user = importdata('DATASET\active_user.mat');
avaliable_item = importdata('DATASET\available_item.mat');

user=size(active_user,1);
item=size(avaliable_item,1);    

stock=avaliable_item(:,2)';
% stock = importdata('DATASET\stock.mat');
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
PSV = cell(5,1);
for i = 5 : 5
    PSV{i} = zeros(size(PS{i},2),2,'double');
    for k=1:size(PS{i},2)
         PSV{i}(k,:) = Individual_evalution(PS{i}{k},item,stock,preference,price);
    end
end

filename1=['Results\',num2str(CT),'\NSGA2\PSV_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PSV_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PSV_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PSV_Repair.mat'];
filename5=['Results\',num2str(CT),'\Top\PSV_Repair.mat'];
PSV1 = PSV{1};
PSV2 = PSV{2};
PSV3 = PSV{3};
PSV4 = PSV{4};
PSV5 = PSV{5};

save(filename1,'PSV1');
save(filename2,'PSV2');
save(filename3,'PSV3');
save(filename4,'PSV4');
save(filename5,'PSV5');