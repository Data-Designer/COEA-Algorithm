function Objectives=Individual_evalution(individual,item,investacount,requestacount,preference)
%% 参数介绍
% investacount   每个用户固定的投资金额，行向量
% requestacount  每个贷款申请的总额度，行向量
% preference     用户*贷款的偏好矩阵

Objectives=zeros(1,2,'double');
Objectives(1)=mean(preference(logical(individual)));

totalinvest=investacount*individual;
fundedstate=totalinvest-requestacount;

full_funded=find(fundedstate>=0);
Objectives(2)=(length(full_funded)/item)*(sum(requestacount(full_funded))/sum(totalinvest));


