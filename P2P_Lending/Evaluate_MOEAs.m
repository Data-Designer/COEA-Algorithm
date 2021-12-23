CT = 1800;
filename1=['Results\',num2str(CT),'\NSGA2\PS_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PS_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PS_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PS_Repair.mat'];

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

PS = cell(4,1);
PS{1} = PS1;
PS{2} = PS2;
PS{3} = PS3;
PS{4} = PS4;

PSV = cell(4,1);
for i = 1 : 4
    PSV{i} = zeros(size(PS{i},2),2,'double');
    for k=1:size(PS{i},2)
         PSV{i}(k,:) = Individual_evalution(PS{i}{k},item,investacount,requestacount,preference);
    end
end

filename1=['Results\',num2str(CT),'\NSGA2\PSV_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PSV_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PSV_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PSV_Repair.mat'];
PSV1 = PSV{1};
PSV2 = PSV{2};
PSV3 = PSV{3};
PSV4 = PSV{4};

save(filename1,'PSV1');
save(filename2,'PSV2');
save(filename3,'PSV3');
save(filename4,'PSV4');