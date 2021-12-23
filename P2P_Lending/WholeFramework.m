clear;
clc;
%% ʵ���������
CT=2000;           %���õ�ǰʱ���
timec = 10;        %�޸���������Ĵ���
DT=7;              %��Ծ���ڣ�������ȡ��Ծ�û�
numofinvest=50;    %�������Ͷ����
maxtimeofinvest=50;
genaration=200;    %��������
popsize=100;       %��Ⱥ��С
crossrate=0.25;    %�������
mutationrate=0.1;  %�������  
Strategy = {'BP','RandSelect','SingleCross','RandomMutation','NSGA2','Lenders','Borrowers'};

%% ��ȡ�г���ǰʱ���µĿ��ô���ͻ�Ծ�û�
[active_user,avaliable_item,item_label,investamount]=get_UI(CT,DT);
user=size(active_user,1); % user_id
item=size(avaliable_item,1); % item_id   
investacount=active_user(:,3)';
requestacount=avaliable_item(:,3)'; % �������
preference=zeros(user,item,'double'); % ��ʼֵ��Ϊ0
for i=1:user % ÿ����Ҷ�ÿ��item��һ��ƫ�õ�ֵ
    temp=avaliable_item(:,2)'/active_user(i,2);
    preference(i,:)=avaliable_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
end

for stg = 7:7
    stg
%% ��ʼ��
population=initial_random(user,item,numofinvest,popsize);
if stg == 1
%% ��������
  [PS,PSV,HV]=GT_Evolutionary_EP(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
else if stg == 2
%         [PS,PSV,HV]=GT_Evolutionary_RandSelect(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
    else if stg == 3
            [PS,PSV,HV]=GT_Evolutionary_SingleCross(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
        else if stg == 4
                [PS,PSV,HV]=GT_Evolutionary_RandomMutation(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
            else if stg == 5
                    [PS,PSV,HV]=NSGA2(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate);
                else if stg == 6
                        [PS,PSV,HV]=GT_Evolutionary_Lenders(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
                    else if stg == 7
                            [PS,PSV,HV]=GT_Evolutionary_Borrowers2(population,investacount,requestacount,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec);
                        end
                    end
                end
            end
        end
    end
end
filename1=['Results\',num2str(CT),'\',Strategy{stg},'\PS.mat'];
save(filename1,'PS');                                                                                                                                                                                                            
filename2=['Results\',num2str(CT),'\',Strategy{stg},'\PSV.mat'];
save(filename2,'PSV'); 
filename3=[num2str(CT),'\',Strategy{stg},'\HV.mat'];    
save(filename3,'HV'); 
end
