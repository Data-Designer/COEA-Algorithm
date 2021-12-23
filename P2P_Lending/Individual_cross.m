function [crossed1,crossed2]=Individual_cross(indual1,indual2,user,item)

crossed1=indual1;
crossed2=indual2;

for i=1:user
    for j=1:item
        if indual1(i,j)~=indual2(i,j)
            crossed1(i,j)=randi([0 1]);
            crossed2(i,j)=abs(crossed1(i,j)-1);
        end
    end
end
