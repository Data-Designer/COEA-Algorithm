function [indual1,indual2]=Individual_cross_row(indual1,indual2,user,crossrate)

cross=rand(1,user);

for i=1:user
    if cross(i)<crossrate
        temp=indual1(i,:);
        indual1(i,:)=indual2(i,:);
        indual2(i,:)=temp;
    end
end