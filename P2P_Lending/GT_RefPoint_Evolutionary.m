function [PS,PSV,HV,RefPointValue]=GT_RefPoint_Evolutionary(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest)

Global_RefPoint=zeros(user,item);
Global_Flag=zeros(user,item);
HV=[];
for i=1:genaration
    i   
    %% �������
%     for j=1:popsize
%         crossindual=randperm(popsize,2);
%         child1=Individual_cross(population{crossindual(1)},population{crossindual(1)},user,item);                   %����
%         child2=Individual_mutation(child1,user,item,mutationrate);                                                  %����
%         child=Individual_repair(child2,item,investacount,requestacount);                                            %�޸�
%         offspring{j}=child;
%     end
    
    %% ��Ⱥ�ϲ�
    [NPOP1,OBJ1,NPOP2,~]=pop_allocation(population,item,investacount,requestacount,preference,popsize);
    
    for j=1:popsize/2
        NPOP1{j}=local_search1(NPOP1{j},OBJ1(j),preference,user,item,mutationrate);
        NPOP2{j}=local_search2(NPOP2{j},user,item,investacount,requestacount,mutationrate);
    end
    
     m=randperm(popsize/2,1);
     n=randperm(popsize/2,1);
    [Global_RefPoint,Global_Flag]=Get_RefPoint(Global_RefPoint,Global_Flag,NPOP1{m},NPOP2{n});
   
    
    offspring=[NPOP1;NPOP2;population];
    
    if mod(i,20)==0
%         for p=1:popsize
%             m=randperm(popsize/2,1);
%             n=randperm(popsize/2,1);
%             offspring{p}=Individual_cross(NPOP1{m},NPOP2{n},user,item);
%         end
        mutationrate=mutationrate*0.95;
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
    if mod(i,20)==0
        if i==20
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
RefPointValue=Individual_evalution(Global_RefPoint,item,investacount,requestacount,preference);
PS=population(ParetoProduct);
PSV=P_ObjectValue(ParetoProduct,:);
