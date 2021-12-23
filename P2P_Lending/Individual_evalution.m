function Objectives=Individual_evalution(individual,item,investacount,requestacount,preference)
%% ��������
% investacount   ÿ���û��̶���Ͷ�ʽ�������
% requestacount  ÿ������������ܶ�ȣ�������
% preference     �û�*�����ƫ�þ���

Objectives=zeros(1,2,'double');
Objectives(1)=mean(preference(logical(individual)));

totalinvest=investacount*individual;
fundedstate=totalinvest-requestacount;

full_funded=find(fundedstate>=0);
Objectives(2)=(length(full_funded)/item)*(sum(requestacount(full_funded))/sum(totalinvest));


