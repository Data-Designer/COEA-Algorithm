clear;
clc;
%% 实验参数设置
CT=2000;           %设置当前时间点
timec = 10;        %修复操作相隔的代数
DT=7;              %活跃周期，用于提取活跃用户
numofinvest=50;    %单人最大投资数
maxtimeofinvest=50;
genaration=200;    %迭代次数
popsize=100;       %种群大小
crossrate=0.25;    %交叉概率
mutationrate=0.1;  %变异概率  
Strategy = {'BP','RandSelect','SingleCross','RandomMutation','NSGA2','Lenders','Borrowers'};

%% 提取市场当前时间下的可用贷款和活跃用户
[active_user,avaliable_item,item_label,investamount]=get_UI(CT,DT);
user=size(active_user,1); % user_id
item=size(avaliable_item,1); % item_id   
investacount=active_user(:,3)';
requestacount=avaliable_item(:,3)'; % 库存数量
preference=zeros(user,item,'double'); % 初始值设为0
for i=1:user % 每个玩家对每个item有一个偏好的值
    temp=avaliable_item(:,2)'/active_user(i,2);
    preference(i,:)=avaliable_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
end

for stg = 7:7
    stg
%% 初始化
population=initial_random(user,item,numofinvest,popsize);
if stg == 1
%% 进化迭代
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
