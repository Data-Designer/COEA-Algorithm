data = struct2cell(load('ITOU.mat'));
ans_lis = data{1,1};
len = length(ans_lis);
A = [];
for i=1:len
    A(i) = length(ans_lis{i,1});
end
A = A'; % ����
% ����������price
% price = []
% for i=1:len
%     if 2*(rand-0.5)>0
%         price(i) = round((445/A(i))*5 + rand*10); % �����������
%     else
%         price(i) = round(445/A(i))*5
%     end
% end
% price = price';
% ������stock�ļ�����̿��Ե���
% stock = []
% for i=1:len
%     if 2*(rand-0.5)>0
%         stock(i) = round((A(i)/445)*700+rand*100); 
%     else
%         stock(i) = round((A(i)/455)*700);
%     end
% end
% stock = stock';
% ������Ҫ����id��������
% active_user  = struct2cell(load('active_user.mat'));
% cell = active_user{1,1};
% user_id = cell(:,2); % ������Ҫ����
item_buy = struct2cell(load("actual_buy.mat"));
item_buy = item_buy{1,1}(:,1); %��õ�item_buy id list

item_id = struct2cell(load("available_item.mat"));
item_id = item_id{1,1} %��������Ը���id��ȡ��Ӧ�ļ۸�
avg_price = []
for i=1:len
    avg = 0;
    item_buy_lis = item_buy{i,1}; %��ȡ��һ��lis
    item_len = length(item_buy_lis);
    for j=1:item_len
        avg =avg+item_id(item_buy_lis(j),3);
    end
    avg = avg/item_len;
    avg_price(i) = avg;
end
avg_price = avg_price'
    


