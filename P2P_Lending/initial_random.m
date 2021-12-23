function population=initial_random(user,item,numofinvest,popsize)

population=cell(popsize,1);

for i=1:popsize
    pop=zeros(user,item);
    position=randperm(user*item,user*numofinvest);
    pop(position)=1;
    population{i}=pop;
end



