function population=initial_random(user,item,numofinvest,popsize)

population=cell(popsize,1);

for i=1:popsize
    pop=zeros(user,item); % ����100����Ⱥ��ÿ����Ⱥ����user*item��С�ľ�֤
    position=randperm(user*item,user*numofinvest); % ���������ţ����ѡ��user*numofinvest��λ��
    pop(position)=1;
    population{i}=pop;
end



