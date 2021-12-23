function mutated=Individual_mutation(individual,user,item,mutationrate)

ran=rand(user,item);

mutalocation=find(ran<mutationrate);

mutated=individual;

for i=1:size(mutalocation)
    mutated(mutalocation(i))=abs(mutated(mutalocation(i))-1);
end




