function [NPOP1,OBJ1,NPOP2,OBJ2]=pop_allocation(population,item,stock,preference,popsize,price)

obj=zeros(popsize,2,'double');
Npopsize=popsize/2;

for i=1:popsize
    obj(i,:)=Individual_evalution(population{i},item,stock,preference,price); % ÿ����Ⱥ������Ŀ���ֵ
end

OBJ1=obj(:,1);
OBJ2=obj(:,2);

[~,N1]=sortrows(OBJ1,-1);
[~,N2]=sortrows(OBJ2,-1);



NPOP1=population(N1(1:Npopsize)); % ÿ����Ⱥ��ǰ50��Ⱦɫ�塣
NPOP2=population(N2(1:Npopsize));
OBJ1=OBJ1(N1(1:Npopsize)); % ��ǰ50��Ⱦɫ��ĵ÷�
OBJ2=OBJ2(N2(1:Npopsize));

end

