function Result = ResultofMatircs(PS,active_user,avaliable_item,item_label)

item=size(avaliable_item,1);
len=size(PS);
matrics=[];
for i=1:len
    recommend_matric=assess(PS{i},item,active_user,avaliable_item,item_label);
    matrics =[matrics;recommend_matric];
end

Result = matrics(:,[1,5]);
Result(:,1)=matrics(:,1).*matrics(:,2);
