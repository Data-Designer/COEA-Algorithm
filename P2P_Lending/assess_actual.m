function actual_matric = assess_actual(item,investacount,avaliable_item,item_label)

actual_matric = zeros(1,5,'double');

actual_matric(1)=sum(avaliable_item(find(avaliable_item(:,4)==1),3))/investacount;

actual_matric(2)=length(find(avaliable_item(:,4)==1))/item;

succ=avaliable_item(find(avaliable_item(:,4)==1),[1 2 3]);

profit = 0;

label=item_label(:,2)';
paid=length(find(label==1))/length(label);
defaulted=length(find(label==0))/length(label);
paid=paid/(paid+defaulted);

for i=1:size(succ,1)
    if ~isempty(find(item_label(:,1)==succ(i,1)))
        profit = profit + succ(i,3)*succ(i,2)*item_label(find(item_label(:,1)==succ(i,1)),2);
    else if rand < paid
            profit = profit + succ(i,3)*succ(i,2);
        else
            profit = profit - succ(i,3)*succ(i,2);
        end
    end
end

actual_matric(3)=profit;

actual_matric(4)=investacount;

actual_matric(5)=profit/investacount;

