function [PS,PSV,HV]=GT_Evolutionary_RandSelect(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec)

HV=[];
for i=1:genaration
    i   
     %% ��Ⱥ����
    [NPOP1,~,NPOP2,~]=pop_allocation(population,item,investacount,requestacount,preference,popsize);
    
    %% ���н���
    X1 = NPOP1;
    X2 = NPOP2;
    for p=1:popsize/2
        m = randperm(popsize/2,1);
        n = randperm(popsize/2,1);
        [NPOP1{p},NPOP2{p}]=Individual_cross_rowcol(X1{m},X2{n},user,item,crossrate);       
    end
    
    %% ��Ӧ��ֵ����
    OBJ=zeros(popsize/2,2,'double');
    for k=1:popsize/2
        OBJ(k,:)=Individual_evalution(NPOP1{k},item,investacount,requestacount,preference);
    end
    OBJ1 = OBJ(:,1);
    
    %% �ֲ�����
    for j=1:popsize/2
        NPOP1{j}=local_search1(NPOP1{j},OBJ1(j),preference,user,item,mutationrate);
        NPOP2{j}=local_search2(NPOP2{j},user,item,investacount,requestacount,mutationrate);
    end
    
    %% �ϲ���Ⱥ
    offspring = [NPOP1;NPOP2;population];
    
    %% ��Ⱥ�޸�
    if mod(i,timec)==0
        mutationrate=mutationrate*0.8;
        for k=1:2*popsize
            offspring{k}=Individual_repair(offspring{k},user,investacount,requestacount,maxtimeofinvest);
        end
    end  
    
    
    %% ��Ӧ�Ⱥ�������
    P_ObjectValue=zeros(2*popsize,2,'double');
    for k=1:2*popsize
        P_ObjectValue(k,:)=Individual_evalution(offspring{k},item,investacount,requestacount,preference);
    end
    
    %% ��֧������
    [FrontValue,MaxFront]=N_sort(P_ObjectValue,'half');
    CrowdDistance=F_distance(P_ObjectValue,FrontValue);
    %ѡ����֧�����
    Next=zeros(1,popsize);
    NoN=numel(FrontValue,FrontValue<MaxFront);
    Next(1:NoN) = find(FrontValue<MaxFront);
    %ѡ�����һ�������
    Last=find(FrontValue==MaxFront);
    [~,Rank]=sort(CrowdDistance(Last),'descend');
    Next(NoN+1:popsize)=Last(Rank(1:popsize-NoN));
    %��һ����Ⱥ
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
