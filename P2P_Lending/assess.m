function recommend_matric=assess(individual,item,active_user,avaliable_item,item_label)

recommend_matric = zeros(1,5,'double');

%% ×ÜÍ¶×Ê
recommend_matric(5)=sum(active_user(:,3)'*individual);

totalinvest = sum(active_user(:,3)'*individual);
difference=active_user(:,3)'*individual-avaliable_item(:,3)';
successed_listings=find(difference>=0);
temp=[];

if ~isempty(successed_listings)
    s = 0;
    for i=1:size(successed_listings)
        if avaliable_item(successed_listings(i),4)==-1
            temp=[temp i];
            s = s+1;
        end
    end
end

successed_listings(temp)=[];

recommend_matric(1)=length(successed_listings)/item;
recommend_matric(2)=sum(avaliable_item(successed_listings,3))/totalinvest;


label=item_label(:,2)';
paid=length(find(label==1))/length(label);
defaulted=length(find(label==0))/length(label);
paid=paid/(paid+defaulted);

profit=0;
for i=1:length(successed_listings)
    ai=successed_listings(i);
    if avaliable_item(ai,4)==0
        ran=rand;
        if ran<paid
            profit=profit+avaliable_item(ai,2)*avaliable_item(ai,3);
        else
            profit=profit-avaliable_item(ai,2)*avaliable_item(ai,3);
        end
    else if item_label(find(item_label==avaliable_item(ai,1)),2)==1
            profit=profit+avaliable_item(ai,2)*avaliable_item(ai,3);
        else if item_label(find(item_label==avaliable_item(ai,1)),2)==-1
                profit=profit-avaliable_item(ai,2)*avaliable_item(ai,3);
            else
                ran=rand;
                if ran<paid
                    profit=profit+avaliable_item(ai,2)*avaliable_item(ai,3);
                else
                    profit=profit-avaliable_item(ai,2)*avaliable_item(ai,3);
                end
            end
        end
    end
end

recommend_matric(4) = profit;

recommend_matric(3) = profit/recommend_matric(5);

% recommend_matric(6) = s;

end


                
            
        
        