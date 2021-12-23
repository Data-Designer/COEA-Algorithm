function Objectives=Individual_evalution(individual,item,stock,preference,price)
%% ��������
% investacount   ÿ���û��̶���Ͷ�ʽ�������
% requestacount  ÿ������������ܶ�ȣ�������
% preference     �û�*�����ƫ�þ���

Objectives=zeros(1,2,'double');
Objectives(1)=mean(preference(logical(individual))); % �����individual��population

totalbuy = sum(individual);

fundedstate=totalbuy -stock;



full_funded=find(fundedstate>=0);
Objectives(2)=(length(full_funded)/item)*(stock(full_funded)*price(full_funded))/(sum(individual*price));


% stsalerate=sum(individual)./stock;
% buysuccrate=stock./sum(individual);
% 
% for i=1:item
%     stsalerate(i)=min(1,stsalerate(i));
% %     if stsalerate(i) < 1
% %         stsalerate(i) = 0;
% %     end
%     buysuccrate(i)=min(1,buysuccrate(i));
% end
% 
% Objectives(2)=mean(stsalerate)*mean(buysuccrate);


