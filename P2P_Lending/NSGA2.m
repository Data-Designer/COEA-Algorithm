function [PS,PSV,HV]=NSGA2(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate)

HV=[];
for i=1:genaration
    i   
    %% �������
    offspring = cell(100,1);
    for j=1:popsize
        crossindual=randperm(popsize,2);
        child1=Individual_cross(population{crossindual(1)},population{crossindual(1)},user,item);                   %����
        child2=Individual_mutation(child1,user,item,mutationrate);                                                  %����                                           %�޸�
        offspring{j}=child2;
    end
    offspring = [offspring;population];
    if mod(i,10)==0
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
    if mod(i,10)==0
        if i==10
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
