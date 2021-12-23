UTOI = importdata('DATA\UTOI_1700.mat');
ITOU = importdata('DATA\ITOU_1700.mat');
active_user = importdata('DATA\1700\active_user.mat');
available_item = importdata('DATA\1700\available_item.mat');

active_user = active_user(:,1);
available_item = available_item(:,1);

user = size(active_user,1);
item = size(available_item,1);

ICF=zeros(user,item,'double');

for i=1:item
    i
    if available_item(i) > size(ITOU,1)
        continue;
    end
    if isempty(ITOU{available_item(i)})
        continue;
    end
    for j=1:user
        if isempty(UTOI{active_user(j)})
            continue;
        end
        if(any(ITOU{available_item(i)}==active_user(j)))
            continue;
        end
        k=numel(UTOI{active_user(j)});
        aa=UTOI{active_user(j)};
        
        part=[];
        for h=1:k
            part=[part ITOU{aa(h)}];
        end
        same=length(find(ismember(part,ITOU{available_item(i)})==1));
        total=length(part)+k*length(ITOU{available_item(i)})-same;    
%         simi=0;
%         for h=1:k
%             same=length(find(ismember(traindata{i},traindata{aa(h)})==1));
%             total=length(unique([traindata{i},traindata{aa(h)}]));
%             FUI=1/(1+exp(-1*EUI(aa(h))/0.05));  %CF±‰–Œ
%             simi=(same/total)*FUI+simi;
%         end
        ICF(j,i)=same/total;
%         Rting(j)=simi/k;
    end
end
    