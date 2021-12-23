function population=initial_random(user,item,numofinvest,popsize)

population=cell(popsize,1);

for i=1:popsize
    pop=zeros(user,item); % 生成100个种群，每个种群都是user*item大小的举证
    position=randperm(user*item,user*numofinvest); % 随机打乱序号，随机选择user*numofinvest个位置
    pop(position)=1;
    population{i}=pop;
end



