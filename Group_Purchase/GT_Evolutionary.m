function [PS,PSV,HV]=GT_Evolutionary(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec)

HV=[];
for i=1:genaration
    i   
    %% 交叉变异
%     for j=1:popsize
%         crossindual=randperm(popsize,2);
%         child1=Individual_cross(population{crossindual(1)},population{crossindual(1)},user,item);                   %交叉
%         child2=Individual_mutation(child1,user,item,mutationrate);                                                  %变异
%         child=Individual_repair(child2,item,investacount,requestacount);                                            %修复
%         offspring{j}=child;
%     end
    
    %% 种群合并
    [NPOP1,OBJ1,NPOP2,~]=pop_allocation(population,item,investacount,requestacount,preference,popsize);
%     
%     if rand < 0.5
%     
    for j=1:popsize/2
        NPOP1{j}=local_search1(NPOP1{j},OBJ1(j),preference,user,item,mutationrate);
        NPOP2{j}=local_search2(NPOP2{j},user,item,investacount,requestacount,mutationrate);
%         NPOP1{j}=Individual_mutation(NPOP1{j},user,item,mutationrate);
%         NPOP2{j}=Individual_mutation(NPOP2{j},user,item,mutationrate);
    end
    
    offspring = [NPOP1;NPOP2;population];
    
%     else
    
%     NP1V=zeros(popsize/2,2,'double');
%     NP2V=zeros(popsize/2,2,'double');
%     
%     for k=1:popsize/2
%         NP1V(k,:)=Individual_evalution(NPOP1{k},item,investacount,requestacount,preference);
%     end
%     
%     for k=1:popsize/2
%         NP2V(k,:)=Individual_evalution(NPOP2{k},item,investacount,requestacount,preference);
%     end
%     
%     [~,ST1]=sortrows(NP1V(:,1),-1);
%     [~,ST2]=sortrows(NP2V(:,2),-1);
%     
%     offspring=cell(100,1);
    
    for p=1:popsize/2
        m = randperm(popsize/2,1);
        n = randperm(popsize/2,1);
        [offspring{2*p-1},offspring{2*p}]=Individual_cross_rowcol(NPOP1{m},NPOP2{n},user,item,crossrate);        %RandSelect
%         [offspring{2*p-1},offspring{2*p}]=Individual_cross_rowcol(NPOP1{ST1(p)},NPOP2{ST2(p)},user,item,crossrate);  %MY
%         [offspring{2*p-1},offspring{2*p}]=Individual_cross(NPOP1{ST1(p)},NPOP2{ST2(p)},user,item);  %SingleCross
%           
    end

    if mod(i,timec)==0
        mutationrate=mutationrate*0.8;
        for k=1:2*popsize
            offspring{k}=Individual_repair(offspring{k},user,investacount,requestacount,maxtimeofinvest);
        end
    end  
    
    
    %% 适应度函数评价
    P_ObjectValue=zeros(2*popsize,2,'double');
    for k=1:2*popsize
        P_ObjectValue(k,:)=Individual_evalution(offspring{k},item,investacount,requestacount,preference);
    end
    
    %% 非支配排序
    [FrontValue,MaxFront]=N_sort(P_ObjectValue,'half');
    CrowdDistance=F_distance(P_ObjectValue,FrontValue);
    %选出非支配个体
    Next=zeros(1,popsize);
    NoN=numel(FrontValue,FrontValue<MaxFront);
    Next(1:NoN) = find(FrontValue<MaxFront);
    %选出最后一个面个体
    Last=find(FrontValue==MaxFront);
    [~,Rank]=sort(CrowdDistance(Last),'descend');
    Next(NoN+1:popsize)=Last(Rank(1:popsize-NoN));
    %下一代种群
    population=offspring(Next);
    FrontValue=FrontValue(Next);
    P_ObjectValue=P_ObjectValue(Next,:);
    CrowdDistance=CrowdDistance(Next); 
    ParetoProduct=find(FrontValue==1);
    PSV=P_ObjectValue(ParetoProduct,:);
    if mod(i,timec)==0
        if i==timec
            LastHV=HV3(PSV,[1,1]);
            LastPOP=population;
            LastParetoProduct=ParetoProduct;
            LastPSV=PSV;
            HV=[HV,HV3(PSV,[1,1])];
        else if HV3(PSV,[1,1])>LastHV*0.8
                LastHV=HV3(PSV,[1,1]);
                LastPOP=population;
                HV=[HV,HV3(PSV,[1,1])];
                LastParetoProduct=ParetoProduct;
                LastPSV=PSV;
            else
                population=LastPOP;
                ParetoProduct=LastParetoProduct;
                PSV=LastPSV;
                HV=[HV,LastHV];
            end
        end
    else
        HV=[HV,HV3(PSV,[1,1])];
    end
end
PS=population(ParetoProduct);
PSV=P_ObjectValue(ParetoProduct,:);
