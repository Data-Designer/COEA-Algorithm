CT = 30;
filename1 = ['Results\',num2str(CT),'\DNN\PS.mat'];
PS = importdata(filename1);
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

PSV = Individual_evalution(PS,item,stock,preference,price);