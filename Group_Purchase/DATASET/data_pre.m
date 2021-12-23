data = struct2cell(load('ITOU.mat'));
ans_lis = data{1,1};
len = length(ans_lis);
A = [];
for i=1:len
    A(i) = length(ans_lis{i,1});
end
A = A'; % 销量
% 下面是生成price
% price = []
% for i=1:len
%     if 2*(rand-0.5)>0
%         price(i) = round((445/A(i))*5 + rand*10); % 加上随机种子
%     else
%         price(i) = round(445/A(i))*5
%     end
% end
% price = price';
% 下面是stock的计算过程可以调整
% stock = []
% for i=1:len
%     if 2*(rand-0.5)>0
%         stock(i) = round((A(i)/445)*700+rand*100); 
%     else
%         stock(i) = round((A(i)/455)*700);
%     end
% end
% stock = stock';
% 好像不需要根据id进行索引
% active_user  = struct2cell(load('active_user.mat'));
% cell = active_user{1,1};
% user_id = cell(:,2); % 我们需要计算
item_buy = struct2cell(load("actual_buy.mat"));
item_buy = item_buy{1,1}(:,1); %获得的item_buy id list

item_id = struct2cell(load("available_item.mat"));
item_id = item_id{1,1} %该命令可以根据id获取对应的价格
avg_price = []
for i=1:len
    avg = 0;
    item_buy_lis = item_buy{i,1}; %获取了一个lis
    item_len = length(item_buy_lis);
    for j=1:item_len
        avg =avg+item_id(item_buy_lis(j),3);
    end
    avg = avg/item_len;
    avg_price(i) = avg;
end
avg_price = avg_price'
    


