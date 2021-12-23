L=30;

active_user = importdata('DATASET\active_user.mat');
avaliable_item = importdata('DATASET\available_item.mat');
actual_buy = importdata('DATASET\actual_buy.mat');

user=size(active_user,1);
item=size(avaliable_item,1);

stock = avaliable_item(:,2)';
Price = avaliable_item(:,3);
% 下面名字不能改
Strategy = {'DMF','UCF','ICF','NSGA2','SPEA2','MOEAD','ARMOEA','Top','Lenders','Borrowers','GTEA(-GM)','GTEA(-GC)','GTEA'};
% Strategy = {'Actual','UCF','ICF','MOEAD','Lenders','Borrowers','GTEA(-GM)','GTEA(-GC)','GTEA'};

Result = zeros(13,4,'double');

for k=1:13
    
    if k > 3 && k < 9
        PS=importdata(['Results\',num2str(L),'\',Strategy{k},'\PS_Nondo.mat']);
        PSV=importdata(['Results\',num2str(L),'\',Strategy{k},'\PSV_Nondo.mat']);
    else
        PS=importdata(['Results\',num2str(L),'\',Strategy{k},'\PS.mat']); % 种群user*item
        PSV=importdata(['Results\',num2str(L),'\',Strategy{k},'\PSV.mat']); % 好像是在不同目标上的评价值
    end
    
 
    len=size(PS);

    matrics=[];
    for i=1:len
        recommend_matric = assess(PS{i},user,item,stock,Price,actual_buy);
        matrics=[matrics;recommend_matric PSV(i,1)]; % 好像类似append
    end

    if size(matrics,1) > 1
        avg_matric = mean(matrics);
    else
        avg_matric = matrics;
    end

    Result(k,:)= avg_matric;
end