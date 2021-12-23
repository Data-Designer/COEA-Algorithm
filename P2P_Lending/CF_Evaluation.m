CT = 1700;
filename1 = ['Results\',num2str(CT),'\DNN\PS.mat'];
filename2 = ['DATA\',num2str(CT),'\active_user.mat'];
filename3 = ['DATA\',num2str(CT),'\available_item.mat'];

PS = importdata(filename1);
active_user = importdata(filename2);
available_item = importdata(filename3);


user=size(active_user,1);
item=size(available_item,1);    
investacount=active_user(:,3)';
requestacount=available_item(:,3)';
preference=zeros(user,item,'double'); 
for i=1:user
    temp=available_item(:,2)'/active_user(i,2);
    preference(i,:)=available_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
end

PSV = Individual_evalution(PS{1},item,investacount,requestacount,preference);