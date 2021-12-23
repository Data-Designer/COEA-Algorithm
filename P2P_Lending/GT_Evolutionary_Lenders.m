function [PS,PSV,HV]=GT_Evolutionary_Lenders(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec)
HV = [];
for i=1:genaration
    i   
   %% ��Ⱥ����
    NPOP = cell(popsize,1);
    %% ���㽻��
    for p=1:popsize/2
        N = randperm(popsize,2);
        [NPOP{2*p-1},NPOP{2*p}]=Individual_cross(population{N(1)},population{N(2)},user,item);       
    end
    
    %% ��Ӧ��ֵ����
    OBJ=zeros(popsize,2,'double');
    for k=1:popsize
        OBJ(k,:)=Individual_evalution(NPOP{k},item,investacount,requestacount,preference);
    end
    OBJ1 = OBJ(:,1);
    
    %% �ֲ�����
    for j=1:popsize
        NPOP{j}=local_search1(NPOP{j},OBJ1(j),preference,user,item,mutationrate);
%         NPOP2{j}=local_search2(NPOP2{j},user,item,investacount,requestacount,mutationrate);
    end
    
    %% �ϲ���Ⱥ
    offspring = [NPOP;population];
    
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
    
    [~,Sort]=sortrows(P_ObjectValue(:,1),-1);
    population = offspring(Sort(1:popsize));
    HV = [HV,HV3(P_ObjectValue,[1,1])];
end
PS=offspring(Sort(1));
PSV=P_ObjectValue(Sort(1),:);

end