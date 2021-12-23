function score=HV3(functionvalue,refpoint)

score=0;
pl = sortrows(functionvalue);

len=size(pl,1);

for i=1:len
    if(i==1)
       score=score+pl(i,1)*pl(i,2);
    else
       score=score+(pl(i,1)-pl(i-1,1))*pl(i,2);
    end
end

score=score/(refpoint(1)*refpoint(2));

end