function LS1_individual=local_search1(individual,obj,preference,user,item,mutationrate)

ran=rand(user,item);

mutalocation=find(ran<mutationrate);

mutated=individual;

for i=1:size(mutalocation)
    temp=mutalocation(i);
    if mutated(temp)==0 && preference(temp)>obj
        mutated(temp)=1;
    else
        if mutated(temp)==1 && preference(temp)<obj
            mutated(temp)=0;
        end
    end
end

LS1_individual=mutated;

end