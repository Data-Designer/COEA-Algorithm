%% 连接数据库
databaseurl='jdbc:mysql://localhost:3306/prosper';
driver='com.mysql.jdbc.Driver';
username='root';
password='372101';
databasename='prosper';
conn=database(databasename,username,password,driver,databaseurl);

%% 定义数据库操作语句
sqlquery1=['SELECT UserID,ItemID FROM trainset'];

%% 提取数据库数据
curs=exec(conn,sqlquery1);
curs=fetch(curs);
A=curs.Data;
userbuy=cell2mat(A);

close(conn);