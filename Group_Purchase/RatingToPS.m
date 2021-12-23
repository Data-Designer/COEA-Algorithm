CT = 30;
L = 9;
filename = ['Results\',num2str(CT),'\DNN\UCF.mat'];
UCF = importdata(filename);
user = size(UCF,1);
item = size(UCF,2);

PS = zeros(user,item);


for i = 1 : user
    [A,B] = sortrows(UCF(i,:)',-1);
    PS(i,B(1:L)) = 1;
end

