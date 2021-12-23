CT = 30;
filename = ['Results\',num2str(CT),'\MOEAD\PS.mat']; % 选了100个种群
PS = importdata(filename);
user = size(PS{1},1);

popsize = size(PS,1);
num = 0;
for i = 1:popsize
   num = num + sum(sum(PS{i}))/user;
end

num = num / popsize;