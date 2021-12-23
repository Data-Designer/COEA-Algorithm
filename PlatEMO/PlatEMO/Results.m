%% P2P_Lending_1700
% user = 3607;
% item = 544;
%% P2P_Lending_1800
% user = 3196;
% item = 645;
%% Group_Purchase
user = 3912;
item = 1040;

solution = result{2};
PS = cell(1,size(result{2},2));
PSV = zeros(size(result{2},2),2,'double');
for i = 1 : size(result{2},2)
    PS{i} = reshape(solution(i).dec,item,user)';
    PSV(i,:) = 1-solution(i).obj;
end
