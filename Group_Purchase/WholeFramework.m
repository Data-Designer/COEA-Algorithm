clear;
clc;
%% ʵ���������
temp2 = 1;
timec = 10;
numofinvest=30;
maxtimeofinvest=30;
genaration=200;
popsize=100;
crossrate=0.25;
mutationrate=0.1;    
Strategy = {'GTEA','GTEA(-GC)','GTEA(-GM)','Lenders','Borrowers'};
gap = 0.2;


%% ��ȡ�г���ǰʱ���µĿ��ô���ͻ�Ծ�û�
active_user = importdata('DATASET\active_user.mat'); % ����,�û�ID,��ʷ����ֵ 3912*3
avaliable_item = importdata('DATASET\available_item.mat'); % ��ƷID����棬�۸�

user=size(active_user,1);
item=size(avaliable_item,1);    

stock=avaliable_item(:,2)';
% stock = importdata('DATASET\stock.mat');
preference=zeros(user,item,'double');  

price=avaliable_item(:,3);

for i=1:user
    temp=avaliable_item(:,3)'/active_user(i,3);
    preference(i,:)=exp(-1*pi*(temp-1).*(temp-1)); % �����û�����ÿ����Ʒ��ƫ��
end

for stg =1:5
    stg
%% ��ʼ��
population=initial_random(user,item,numofinvest,popsize); % 100����Ⱥ��ÿ����Ⱥ����user*item
if stg == 1
%% ��������
  [PS,PSV,HV]=GT_Evolutionary_EP(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec,price);
% else if stg == 2
%         continue;
% %         [PS,PSV,HV]=GT_Evolutionary_RandSelect(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec,temp2,gap,price);
    else if stg == 2
            [PS,PSV,HV]=GT_Evolutionary_SingleCross(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,timec,price);
        else if stg == 3
                [PS,PSV,HV]=GT_Evolutionary_RandomMutation(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,crossrate,timec,price);
% %             else if stg == 4
% %                     continue;
% % %                     [PS,PSV,HV]=NSGA2(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,timec,price);
                else if stg == 4
                        [PS,PSV,HV]=GT_Evolutionary_Lenders(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,timec,price);
                    else if stg == 5
                            [PS,PSV,HV]=GT_Evolutionary_Borrowers(population,stock,preference,genaration,popsize,user,item,mutationrate,maxtimeofinvest,timec,price);
                        end
                    end
              end
        end 
end
filename1=['Results\',num2str(numofinvest),'\',Strategy{stg},'\PS.mat'];
save(filename1,'PS');                                                                                                                                                                                                            
filename2=['Results\',num2str(numofinvest),'\',Strategy{stg},'\PSV.mat'];
save(filename2,'PSV'); 
filename3=['Results\',num2str(numofinvest),'\',Strategy{stg},'\HV.mat'];    
save(filename3,'HV'); 
end


