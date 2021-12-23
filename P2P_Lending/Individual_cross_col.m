function [indual1,indual2]=Individual_cross_col(indual1,indual2,item,crossrate)

cross=rand(1,item);

for i=1:item
    if cross(i)<crossrate
        temp=indual1(:,i);
        indual1(:,i)=indual2(:,i);
        indual2(:,i)=temp;
    end
end