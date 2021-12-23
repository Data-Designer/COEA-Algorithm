function [PS,PSV,HV]=GT_Evolutionary_Lenders(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,timec,price)

HV=[];
for i=1:genaration
    i   
   %% 种群划分
    NPOP = cell(popsize,1);
    
    %% 单点交叉
    for p=1:popsize/2
        N = randperm(popsize,2);
        [NPOP{2*p-1},NPOP{2*p}]=Individual_cross(population{N(1)},population{N(2)},user,item);       
    end
    
    %% 适应度值评价
    OBJ=zeros(popsize,2,'double');
    for k=1:popsize
        OBJ(k,:)=Individual_evalution(NPOP{k},item,stock,preference,price);
    end
    OBJ1 = OBJ(:,1);
    
    %% 局部搜索
    for j=1:popsize
        NPOP{j}=local_search1(NPOP{j},OBJ1(j),preference,user,item,mutationrate);
%         NPOP2{j}=local_search2(NPOP2{j},user,item,stock,mutationrate);
    end
    
    %% 合并种群
    offspring = [NPOP;population];
    
    %% 种群修复
    if mod(i,timec)==0
        mutationrate=mutationrate*0.8;
%         gap = (temp-1)/(genaration/timec-1);
%         bili = max(1,temp-gap*(i/timec-1));
        for k=1:2*popsize
            offspring{k}=Individual_repair(offspring{k},user,stock,maxtimeofinvest);
        end
    end
    
    
    %% 适应度函数评价
    P_ObjectValue=zeros(2*popsize,2,'double');
    for k=1:2*popsize
        P_ObjectValue(k,:)=Individual_evalution(offspring{k},item,stock,preference,price);
    end
    
    [~,Sort]=sortrows(P_ObjectValue(:,1),-1);
    population = offspring(Sort(1:popsize));
end

PS=offspring(Sort(1));
PSV=P_ObjectValue(Sort(1),:);

end
