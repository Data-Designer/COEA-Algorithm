function Objectives=Individual_evalution(individual,item,stock,preference,price)
%% 参数介绍
% investacount   每个用户固定的投资金额，行向量
% requestacount  每个贷款申请的总额度，行向量
% preference     用户*贷款的偏好矩阵

Objectives=zeros(1,2,'double');
Objectives(1)=mean(preference(logical(individual))); % 这里的individual是population

totalbuy = sum(individual);

fundedstate=totalbuy -stock;



full_funded=find(fundedstate>=0);
Objectives(2)=(length(full_funded)/item)*(stock(full_funded)*price(full_funded))/(sum(individual*price));


% stsalerate=sum(individual)./stock;
% buysuccrate=stock./sum(individual);
% 
% for i=1:item
%     stsalerate(i)=min(1,stsalerate(i));
% %     if stsalerate(i) < 1
% %         stsalerate(i) = 0;
% %     end
%     buysuccrate(i)=min(1,buysuccrate(i));
% end
% 
% Objectives(2)=mean(stsalerate)*mean(buysuccrate);


