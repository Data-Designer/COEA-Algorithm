function [NPOP1,OBJ1,NPOP2,OBJ2]=pop_allocation_ep(population,item,stock,preference,popsize,price)

obj=zeros(popsize,2,'double'); % 100*2的矩阵
Npopsize=popsize/2; % 50，子目标的种群数

for i=1:popsize
    obj(i,:)=Individual_evalution(population{i},item,stock,preference,price);
end

OBJ1=obj(:,1);
OBJ2=obj(:,2);

[~,N1]=sortrows(OBJ1,-1);
[~,N2]=sortrows(OBJ2,-1);



NPOP1=population(N1(1:Npopsize));
NPOP2=population(N2(1:Npopsize));

OBJ1=obj(N1(1:Npopsize),:);
OBJ2=obj(N2(1:Npopsize),:);

end