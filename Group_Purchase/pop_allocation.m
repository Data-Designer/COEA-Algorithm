function [NPOP1,OBJ1,NPOP2,OBJ2]=pop_allocation(population,item,stock,preference,popsize,price)

obj=zeros(popsize,2,'double');
Npopsize=popsize/2;

for i=1:popsize
    obj(i,:)=Individual_evalution(population{i},item,stock,preference,price); % 每个种群的两个目标的值
end

OBJ1=obj(:,1);
OBJ2=obj(:,2);

[~,N1]=sortrows(OBJ1,-1);
[~,N2]=sortrows(OBJ2,-1);



NPOP1=population(N1(1:Npopsize)); % 每个种群的前50个染色体。
NPOP2=population(N2(1:Npopsize));
OBJ1=OBJ1(N1(1:Npopsize)); % 这前50个染色体的得分
OBJ2=OBJ2(N2(1:Npopsize));

end

