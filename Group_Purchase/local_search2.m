function LS2_individual=local_search2(individual,user,item,stock,mutationrate)

ran=rand(user,item);

mutalocation=find(ran<mutationrate);

mutated=individual;

for i=1:size(mutalocation)
    temp=mutalocation(i);
    col=ceil(temp/user);
    singleitem=sum(individual(:,col));
    if mod(temp,user)==0
        u=user;
    else
        u=mod(temp,user);
    end
    if mutated(temp)==0 && singleitem<stock(col)
        mutated(temp)=1;
    else
        if mutated(temp)==1 && singleitem-1>stock(col)
            mutated(temp)=0;
        end
    end
end

LS2_individual=mutated;

end