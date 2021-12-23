UTOI = importdata('DATA\UTOI_1800.mat');
ITOU = importdata('DATA\ITOU_1800.mat');
active_user = importdata('DATA\1800\active_user.mat');
available_item = importdata('DATA\1800\available_item.mat');

active_user = active_user(:,1);
available_item = available_item(:,1);

user = size(active_user,1);
item = size(available_item,1);

UCF=zeros(user,item,'double');

for i=1:user
    i
    for j=1:item
        if available_item(j) > size(ITOU,1)
            continue;
        end
        if isempty(ITOU{available_item(j)})
            continue;
        end
        if(any(ITOU{available_item(j)}==active_user(i)))
            continue;
        end
        k=numel(ITOU{available_item(j)});
        aa=ITOU{available_item(j)};
        
        part=[];
        for h=1:k
            part=[part UTOI{aa(h)}];
        end
        same=length(find(ismember(part,UTOI{active_user(i)})==1));
        total=length(part)+k*length(UTOI{active_user(i)})-same;    
%         simi=0;
%         for h=1:k
%             same=length(find(ismember(traindata{i},traindata{aa(h)})==1));
%             total=length(unique([traindata{i},traindata{aa(h)}]));
%             FUI=1/(1+exp(-1*EUI(aa(h))/0.05));  %CF±‰–Œ
%             simi=(same/total)*FUI+simi;
%         end
        UCF(i,j)=same/total;
%         Rting(j)=simi/k;
    end
end
    