% CT=1700;
% DT=7;
% [active_user,avaliable_item,item_label,investacount]=get_UI(CT,DT);
% user=size(active_user,1);
% item=size(avaliable_item,1);

CT = 1700;
filename1 = ['DATA\',num2str(CT),'\active_user.mat'];
filename2 = ['DATA\',num2str(CT),'\available_item.mat'];
filename3 = ['DATA\',num2str(CT),'\investamount.mat'];
filename4 = ['DATA\',num2str(CT),'\item_label.mat'];
active_user = importdata(filename1);
available_item = importdata(filename2);
item_label = importdata(filename4);
investacount = importdata(filename3);
user=size(active_user,1);
item=size(available_item,1);

Strategy = {'DMF','UCF','ICF','NSGA2','SPEA2','MOEAD','ARMOEA','Top','Lenders','Borrowers','GTEA(-GM)','GTEA(-GC)','GTEA'};

Result = zeros(13,4,'double');
for k=1:13
    
if k > 3 && k <9   
    PS=importdata(['Results\',num2str(CT),'\',Strategy{k},'\PS_Nondo.mat']);
    PSV=importdata(['Results\',num2str(CT),'\',Strategy{k},'\PSV_Nondo.mat']);
    len=size(PS,2);
else
    PS=importdata(['Results\',num2str(CT),'\',Strategy{k},'\PS.mat']);
    PSV=importdata(['Results\',num2str(CT),'\',Strategy{k},'\PSV.mat']);
    len=size(PS,1);
end
% actual_matric = assess_actual(item,investacount,available_item,item_label);

Final = [];

for j=1:10
    
matrics=[];
for i=1:len
    recommend_matric=assess(PS{i},item,active_user,available_item,item_label);
    recommend_matric=[recommend_matric, PSV(i,1)];
    matrics=[matrics;recommend_matric];
end


avg_matric = mean(matrics,1);

avg_matric(3)=avg_matric(4)/avg_matric(5);

Final = [Final;avg_matric];

end
Final = mean(Final);
Result(k,:)= Final([1 2 3 6]);
end