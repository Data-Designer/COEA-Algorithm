function [active_user,avaliable_item,item_label,investamount]=get_UI(CT,DT)
%% 参数介绍
%  active_user      活跃投资人信息，包括编号，利率偏好，投资金额
%  avaiable_item    可用贷款，包括贷款利率，申请金额
%  CT               当前时间点
%  DT               活跃用户时间段

%% 连接数据库
databaseurl='jdbc:mysql://localhost:3306/prosper';
driver='com.mysql.jdbc.Driver';
username='root';
password='372101';
databasename='prosper';
conn=database(databasename,username,password,driver,databaseurl);

%% 定义数据库操作语句
sqlquery1=['SELECT DISTINCT(membernumber), AVG(BorrowerRate), AVG(Amount) FROM bid20192 WHERE membernumber in (SELECT DISTINCT(membernumber) FROM bid20192 WHERE BidTime<',num2str(CT),' and BidTime>=',num2str(CT-DT),') GROUP BY membernumber'];
sqlquery2=['SELECT listingnumber, BorrowerRate, AmountRequested, label FROM listing2019 WHERE TM<=',num2str(CT),' and TM+Duration>=',num2str(CT),];
sqlquery3='SELECT listingnumber, label FROM loan2019';
sqlquery4=['SELECT SUM(Amount) FROM bid20192 WHERE listingnumber IN (SELECT DISTINCT(listingnumber) FROM listing2019 WHERE TM<=',num2str(CT),' and TM+Duration>=',num2str(CT),')'];

%% 提取数据库数据
curs=exec(conn,sqlquery1);
curs=fetch(curs);
A=curs.Data;
active_user=cell2mat(A);

curs=exec(conn,sqlquery2);
curs=fetch(curs);
B=curs.Data;
avaliable_item=cell2mat(B);
% filename1 =  ['E:\工作2\DATASET/active_user.mat'];
% save(filename1,'active_user');

curs=exec(conn,sqlquery3);
curs=fetch(curs);
C=curs.Data;
item_label=cell2mat(C);

curs=exec(conn,sqlquery4);
curs=fetch(curs);
D=curs.Data;
investamount=cell2mat(D);

close(conn);