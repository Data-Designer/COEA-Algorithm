%% 连接数据库
databaseurl='jdbc:mysql://localhost:3306/prosper';
driver='com.mysql.jdbc.Driver';
username='root';
password='372101';
databasename='prosper';
conn=database(databasename,username,password,driver,databaseurl);

%% 定义数据库操作语句
sqlquery1=['SELECT membernumber,listingnumber FROM bid1800 limit 4000000,4000000'];

%% 提取数据库数据
curs=exec(conn,sqlquery1);
curs=fetch(curs);
A=curs.Data;
bid1800=cell2mat(A);

close(conn);