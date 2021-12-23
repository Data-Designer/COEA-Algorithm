classdef P2P_Lending < PROBLEM
% <problem> <A MOP>
% The feature selection problem
% dataNo --- 1 --- Number of dataset

%------------------------------- Reference --------------------------------
% Y. Tian, X. Zhang, C. Wang, and Y. Jin, An evolutionary algorithm for
% large-scale sparse multi-objective optimization problems, IEEE
% Transactions on Evolutionary Computation, 2019.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

% The datasets are taken from the UCI machine learning repository in
% http://archive.ics.uci.edu/ml/index.php
% No.   Name                              Samples Features Classes
% 1     MUSK1                               476     166       2
% 2     Semeion_handwritten_digit          1593     256      10
% 3     LSVT_voice_rehabilitation           126     310       2
% 4     ISOLET                             1557     617      26

    properties(Access = private)
        user;    % Input of training set
        item;   % Output of training set
        investacount;
        requestacount;
        preference;
        CT;
        timec;
        maxtimeofinvest;
    end
    methods
        %% Initialization
        function obj = P2P_Lending()
            % Load data
            obj.CT = 1800;
            obj.timec = 10;
            obj.maxtimeofinvest = 50;
            filename1 = ['Problems\Bidirectional recommendation\DATA\P2P_Lending\',num2str(obj.CT),'\active_user.mat'];
            filename2 = ['Problems\Bidirectional recommendation\DATA\P2P_Lending\',num2str(obj.CT),'\available_item.mat'];
%             filename3 = ['C:\Users\WXP\Desktop\PlatEMO-master\PlatEMO\Problems\Bidirectional recommendation\',num2str(obj.CT),'\investamount.mat'];
%             filename4 = ['C:\Users\WXP\Desktop\PlatEMO-master\PlatEMO\Problems\Bidirectional recommendation\',num2str(obj.CT),'\item_label.mat'];
            active_user = importdata(filename1);
            available_item = importdata(filename2);
            obj.user=size(active_user,1);
            obj.item=size(available_item,1);
            obj.investacount=active_user(:,3)';
            obj.requestacount=available_item(:,3)';
            obj.preference=zeros(obj.user,obj.item,'double'); 
            for i=1:obj.user
                temp=available_item(:,2)'/active_user(i,2);
                obj.preference(i,:)=available_item(:,2)'.*exp(-1*pi*(temp-1).*(temp-1));
            end
            % Parameter setting
            obj.Global.M        = 2;
            obj.Global.D        = obj.user*obj.item;
            obj.Global.lower    = zeros(1,obj.Global.D);
            obj.Global.upper    = ones(1,obj.Global.D);
            obj.Global.encoding = 'binary';
        end
        %% Calculate objective values
        function PopObj = CalObj(obj,PopDec)
%             if mod(obj.Global.gen,obj.timec) == 0
%                 for j = 1:size(PopDec,1)
%                     repaired=reshape(PopDec(j,:),obj.item,obj.user)';
%                     for i=1:obj.user
%                         totalacount=obj.investacount*repaired;
%                         ui=repaired(i,:);
%                         if sum(ui,2)>obj.maxtimeofinvest
%                             invested=find(ui==1);
%                             unfull=find(totalacount<obj.requestacount);
%                             onunfull=ismember(invested,unfull);
%                             if sum(onunfull)>=sum(ui)-obj.maxtimeofinvest
%                                 temp=invested(onunfull);
%                                 sele=randperm(sum(onunfull),sum(ui)-obj.maxtimeofinvest);
%                                 repaired(i,temp(sele))=0;
%                             else
%                                 repaired(i,invested(onunfull))=0;
%                                 ui=repaired(i,:);
%                                 invested=find(ui==1);
%                                 sele=randperm(length(invested),sum(ui)-obj.maxtimeofinvest);
%                                 repaired(i,invested(sele))=0;
%                             end
%                         end
%                     end
%                     PopDec(j,:)=reshape(repaired',1,obj.user*obj.item);
%                 end
%             end
            PopDec = logical(PopDec);
            PopObj = zeros(size(PopDec,1),2);
            for i = 1 : size(PopObj,1)
                individual = reshape(PopDec(i,:),obj.item,obj.user)';
            	PopObj(i,1) = 1-mean(obj.preference(logical(individual)));
                totalinvest=obj.investacount*individual;
                fundedstate=totalinvest-obj.requestacount;
                full_funded=find(fundedstate>=0);
                PopObj(i,2) = 1-(length(full_funded)/obj.item)*(sum(obj.requestacount(full_funded))/sum(totalinvest));
            end
        end
    end
end