for i = 1:1040
    stock(i) = avaliable_item(i,2) + rand*20;
end

stock = ceil(stock);