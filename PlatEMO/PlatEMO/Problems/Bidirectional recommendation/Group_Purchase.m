classdef Group_Purchase < PROBLEM
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
        stock;
        price;
        preference;
        timec;
        maxtimeofinvest;
    end
    methods
        %% Initialization
        function obj = Group_Purchase()
            % Load data
            obj.timec = 10;
            obj.maxtimeofinvest = 10;
            filename1 = ['Problems\Bidirectional recommendation\DATA\Group_Purchase\active_user.mat'];
            filename2 = ['Problems\Bidirectional recommendation\DATA\Group_Purchase\available_item.mat'];
%             filename3 = ['C:\Users\WXP\Desktop\PlatEMO-master\PlatEMO\Problems\Bidirectional recommendation\',num2str(obj.CT),'\investamount.mat'];
%             filename4 = ['C:\Users\WXP\Desktop\PlatEMO-master\PlatEMO\Problems\Bidirectional recommendation\',num2str(obj.CT),'\item_label.mat'];
            active_user = importdata(filename1);
            available_item = importdata(filename2);
            obj.user=size(active_user,1);
            obj.item=size(available_item,1); 
            obj.stock=available_item(:,2)';
            obj.price=available_item(:,3);
            obj.preference=zeros(obj.user,obj.item,'double'); 
            for i=1:obj.user
                temp=available_item(:,3)'/active_user(i,3);
                obj.preference(i,:)=exp(-1*pi*(temp-1).*(temp-1));
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
         %% Repair populations
%             if mod(obj.Global.gen,obj.timec) == 0
%                 for j = 1:size(PopDec,1)
%                     repaired=reshape(PopDec(j,:),obj.item,obj.user)';
%                     for i=1:obj.user
%                         totalacount=sum(repaired);
%                         ui=repaired(i,:);
%                         if sum(ui,2)>obj.maxtimeofinvest
%                             invested=find(ui==1);
%                             unfull=find(totalacount<obj.stock);
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
            %% Calculate objective values
            PopDec = logical(PopDec);
            PopObj = zeros(size(PopDec,1),2);
            for i = 1 : size(PopObj,1)
                individual = reshape(PopDec(i,:),obj.item,obj.user)';
            	PopObj(i,1) = 1-mean(obj.preference(logical(individual)));
                totalbuy = sum(individual);
                fundedstate=totalbuy -obj.stock;
                full_funded=find(fundedstate>=0);
                PopObj(i,2) = 1-(length(full_funded)/obj.item)*(obj.stock(full_funded)*obj.price(full_funded))/(sum(individual*obj.price));
            end
        end
    end
end