function repaired=Individual_repair(individual,user,investacount,requestacount,maxtimeofinvest)

repaired=ceil(individual);



for i=1:user
    totalacount=investacount*repaired;
    ui=repaired(i,:);
    if sum(ui,2)>maxtimeofinvest
        invested=find(ui==1);
        unfull=find(totalacount<requestacount);
        onunfull=ismember(invested,unfull);
        if sum(onunfull)>=sum(ui)-maxtimeofinvest
            temp=invested(onunfull);
            sele=randperm(sum(onunfull),sum(ui)-maxtimeofinvest);
            repaired(i,temp(sele))=0;
        else
            repaired(i,invested(onunfull))=0;
            ui=repaired(i,:);
            invested=find(ui==1);
%             sum(ui)
            sele=randperm(length(invested),sum(ui)-maxtimeofinvest);
            repaired(i,invested(sele))=0;
        end
    end
end

end


% for i=1:item
%     if total<requestacount
%         repaired(:,i)=0;
%     else 
%         invest=repaired(:,i);
%         while investacount*invest<requestacount
%             notinvest=find(invest==0);
%             len=length(notinvest);
%             invest(notinvest(randperm(len,1)))=1;
%         end
%         repaired(:,i)=invest;
%     end
% end

            