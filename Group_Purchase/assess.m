function recommend_matric=assess(individual,user,item,stock,Price,actual_buy)

recommend_matric = zeros(1,3,'double');

totalbuy = sum(individual);
differece = totalbuy - stock;
success_item = find(differece >= 0);

% %% 购买成功率
% recommend_matric(4)= sum(stock(1,success_item))/sum(totalbuy);

%% 团购成功率
recommend_matric(1)= length(success_item)/item;

%% 总销售金额
Total_Sell = stock(success_item)*Price(success_item);
recommend_matric(3) = Total_Sell;

%% 资金占有率
Total_Buy = sum(individual)*Price;

%% 资金利用率
recommend_matric(2) = Total_Sell/Total_Buy;

% %% 精度
% precision=0;
% recall=0;
% for i=1:user  
%     precision = precision+sum(individual(i,actual_buy{i}));
%     recall = recall + length(actual_buy{i});
% end
% recommend_matric(4) = precision/sum(sum(individual));   
% 
% %% 召回率
% recommend_matric(5) = precision/recall;

end


                
            
        
        