function LS2_individual=local_search3(individual,user,item,investacount,requestacount,mutationrate)

ran=rand(user,item);

mutalocation=find(ran<mutationrate);

mutated=individual;

for i=1:size(mutalocation)
    temp=mutalocation(i);
    col=ceil(temp/user);
    singleitem=investacount*individual(:,col);
    if mod(temp,user)==0
        u=user;
    else
        u=mod(temp,user);
    end
    if mutated(temp)==0 && singleitem<requestacount(col)
        mutated(temp)=1;
    end
end

LS2_individual=mutated;

end