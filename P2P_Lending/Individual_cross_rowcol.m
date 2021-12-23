function [temp1,temp2]=Individual_cross_rowcol(indual1,indual2,user,item,crossrate)

cross1=rand(1,user);
cross2=rand(1,item);
temp1=indual1;
temp2=indual2;

for i=1:item
    if cross2(i)<crossrate
        temp1(:,i)=indual2(:,i);
    end
end

for i=1:user
    if cross1(i)<crossrate
        temp2(i,:)=indual1(i,:);
    end
end