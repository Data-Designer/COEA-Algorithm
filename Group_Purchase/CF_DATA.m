%% �������ݿ�
databaseurl='jdbc:mysql://localhost:3306/prosper';
driver='com.mysql.jdbc.Driver';
username='root';
password='372101';
databasename='prosper';
conn=database(databasename,username,password,driver,databaseurl);

%% �������ݿ�������
sqlquery1=['SELECT UserID,ItemID FROM trainset'];

%% ��ȡ���ݿ�����
curs=exec(conn,sqlquery1);
curs=fetch(curs);
A=curs.Data;
userbuy=cell2mat(A);

close(conn);