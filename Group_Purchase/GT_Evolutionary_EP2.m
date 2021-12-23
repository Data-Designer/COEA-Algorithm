function [PS,PSV,HV]=GT_Evolutionary_EP2(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec,temp,gap,price)

HV=[];
for i=1:genaration
    i   
     %% 种群划分
    [NPOP1,~,NPOP2,~]=pop_allocation(population,item,stock,preference,popsize,price);
    
    %% 行列交叉
    for p=1:popsize/2
        [NPOP1{p},NPOP2{p}]=Individual_cross_rowcol(NPOP1{p},NPOP2{p},user,item,crossrate);       
    end
    
    %% 适应度值评价
    OBJ=zeros(popsize/2,2,'double'); 
    for k=1:popsize/2
        OBJ(k,:)=Individual_evalution(NPOP1{k},item,stock,preference,price);
    end
    OBJ1 = OBJ(:,1);
    
    %% 局部搜索
    for j=1:popsize/2
        NPOP1{j}=local_search1(NPOP1{j},OBJ1(j),preference,user,item,mutationrate);
        NPOP2{j}=local_search2(NPOP2{j},user,item,stock,mutationrate);
    end
    
    %% 合并种群
    offspring = [NPOP1;NPOP2;population];
    
    %% 种群修复
    if mod(i,timec)==0
        mutationrate=mutationrate*0.8;
        bili = max(1,temp-gap*(i/timec-1));
        for k=1:2*popsize
            offspring{k}=Individual_repair(offspring{k},user,stock,fix(bili*maxtimeofinvest));
        end
    end
    
   
    %% 适应度函数评价
    P_ObjectValue=zeros(2*popsize,2,'double');
    for k=1:2*popsize
        P_ObjectValue(k,:)=Individual_evalution(offspring{k},item,stock,preference,price);
    end
    
    V1 = max(P_ObjectValue(:,1));
    V2 = max(P_ObjectValue(:,2));
    EPValue = zeros(2*popsize,1,'double');
    for k=1:2*popsize
        EPValue(k) = (V1-P_ObjectValue(k,1))/V1 + (V2-P_ObjectValue(k,2))/V2;
    end
    [~,N] = sortrows(EPValue);
    
    population=offspring(N(1:popsize));
    P_ObjectValue=P_ObjectValue(N(1:popsize),:);
    
    
    [FrontValue,MaxFront]=N_sort(P_ObjectValue,'first');
    ParetoProduct = find(FrontValue == 1);
    PS = population(ParetoProduct);
    PSV = P_ObjectValue(ParetoProduct,:);
    HV = [HV HV3(PSV,[1,1])];

    
    
%     %% 非支配排序
%     [FrontValue,MaxFront]=N_sort(P_ObjectValue,'half');
%     CrowdDistance=F_distance(P_ObjectValue,FrontValue);
%     %选出非支配个体
%     Next=zeros(1,popsize);
%     NoN=numel(FrontValue,FrontValue<MaxFront);
%     Next(1:NoN) = find(FrontValue<MaxFront);
%     %选出最后一个面个体
%     Last=find(FrontValue==MaxFront);
%     [~,Rank]=sort(CrowdDistance(Last),'descend');
%     Next(NoN+1:popsize)=Last(Rank(1:popsize-NoN));
%     %下一代种群
%     population=offspring(Next);
%     FrontValue=FrontValue(Next);
%     P_ObjectValue=P_ObjectValue(Next,:);
%     CrowdDistance=CrowdDistance(Next); 
%     ParetoProduct=find(FrontValue==1);
%     PSV=P_ObjectValue(ParetoProduct,:);
%     if mod(i,timec)==0
%         if i==timec
%             LastHV=HV3(PSV,[1,1]);
%             LastPOP=population;
%             LastParetoProduct=ParetoProduct;
%             LastPSV=PSV;
%             HV=[HV,HV3(PSV,[1,1])];
%         else if HV3(PSV,[1,1])>LastHV*0.8
%                 LastHV=HV3(PSV,[1,1]);
%                 LastPOP=population;
%                 HV=[HV,HV3(PSV,[1,1])];
%                 LastParetoProduct=ParetoProduct;
%                 LastPSV=PSV;
%             else
%                 population=LastPOP;
%                 ParetoProduct=LastParetoProduct;
%                 PSV=LastPSV;
%                 HV=[HV,LastHV];
%             end
%         end
%     else
%         HV=[HV,HV3(PSV,[1,1])];
%     end
end
% PS=population(ParetoProduct);
% PSV=P_ObjectValue(ParetoProduct,:);
end