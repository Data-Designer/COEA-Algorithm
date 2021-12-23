function [active_user,avaliable_item,item_label,investamount]=get_UI(CT,DT)
%% ��������
%  active_user      ��ԾͶ������Ϣ��������ţ�����ƫ�ã�Ͷ�ʽ��
%  avaiable_item    ���ô�������������ʣ�������
%  CT               ��ǰʱ���
%  DT               ��Ծ�û�ʱ���

%% �������ݿ�
databaseurl='jdbc:mysql://localhost:3306/prosper';
driver='com.mysql.jdbc.Driver';
username='root';
password='372101';
databasename='prosper';
conn=database(databasename,username,password,driver,databaseurl);

%% �������ݿ�������
sqlquery1=['SELECT DISTINCT(membernumber), AVG(BorrowerRate), AVG(Amount) FROM bid20192 WHERE membernumber in (SELECT DISTINCT(membernumber) FROM bid20192 WHERE BidTime<',num2str(CT),' and BidTime>=',num2str(CT-DT),') GROUP BY membernumber'];
sqlquery2=['SELECT listingnumber, BorrowerRate, AmountRequested, label FROM listing2019 WHERE TM<=',num2str(CT),' and TM+Duration>=',num2str(CT),];
sqlquery3='SELECT listingnumber, label FROM loan2019';
sqlquery4=['SELECT SUM(Amount) FROM bid20192 WHERE listingnumber IN (SELECT DISTINCT(listingnumber) FROM listing2019 WHERE TM<=',num2str(CT),' and TM+Duration>=',num2str(CT),')'];

%% ��ȡ���ݿ�����
curs=exec(conn,sqlquery1);
curs=fetch(curs);
A=curs.Data;
active_user=cell2mat(A);

curs=exec(conn,sqlquery2);
curs=fetch(curs);
B=curs.Data;
avaliable_item=cell2mat(B);
% filename1 =  ['E:\����2\DATASET/active_user.mat'];
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