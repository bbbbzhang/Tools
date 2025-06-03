#### 数据库

##### 介绍

```
传统，关系型，SQL数据库
MySQL		(Community+Enterprise)
Oracle		收费
SQL Server	收费

新型，非关系型，NoSQL数据库
Mongodb		收费
Redis		(Community+Enterprise)

传统型数据库的数据组织结构
数据的组织结构
数据以什么样的结构进行存储

在传统型数据库中，数据的组织结构分为
数据库(database)、数据表(table)、数据行(row)、字段(field)

往往在数据库里面设置数status，标记删除字段，状态为0表示被删除了，状态为1表示未被删除
可以发起默认请求
请求回来的时候会被浏览器的同源策略所组织

五种请求
get,没有请求体
post
put
delete
options

tinyint(1)代表布尔值

NN
not null值不允许为空

sql语句中的关键字(黄色)，对大小写不敏感

mysql绑定的端口号3306

常用密码推荐root

cmd连接数据库
mysql -u root -p
```

##### 常用操作

```
增删改查/CRUD/Create,Retrieve,Update,Delete
select
从表中查询数据，执行的结果被存储在一个结果表中（称为结果集）
-- select*from 表名称
-- select 列名称 from 表名称
通过*把user表中的所有数据都查询出来
-- select*from users;
从users表中把username和password对应的数据查询出来
-- select username,password from users;

insert into
向数据表中插入新的数据行
-- insert into 表名(列1，列2,...) values(值1，值2，...);
-- insert into users(username,password) values('aa','123456');

update语句用于修改表里面的数据
-- update 表名称 set 列名称 = 新值 where 列名称 = 某值
-- update users set password = 8888 where id = 4;
-- update users set username = aa,password = 8888 where id = 2

delete
删除表中的行
-- delete from 表名称 where 列名称 = 值
-- delete from users where id = 1

WHERE子句
限定选择的标准
在 SELECT、UPDATE、DELETE 语句中，皆可使用 WHERE 子句来限定选择的标准

查询语句中的where条件
select 列名称 from 表名称 where 列 运算符 值
更新语句中的where条件
update 表名称 set 列=新值 where 列 运算符 值
删除语句中的where条件
delete from 表名称 where 列 运算符 值

WHERE 子句中的运算符
=			等于
<>			不等于(有的版本可以写成!=)
>			大于
<			小于
>=			大于等于
<=			小于等于
between		在某个范围内
like		搜索某种模式

AND 和 OR 运算符
可在 WHERE 子语句中把两个或多个条件结合起来
AND 表示必须同时满足多个条件，(相当于 JavaScript 中的 && 运算符)
OR 表示只要满足任意一个条件即可(相当于 JavaScript 中的 || 运算符)

ORDER BY 子句
order by asc 升序,默认
order by desc 降序
根据指定的列对结果集进行排序。
可以多重排序
select*from users order by status desc,username asc

COUNT(\*) 函数
返回查询结果的总数据条数
select count(*) from 表名称
查询users表中status为0的总数据条数
select count(*) as total from user where status=0

AS
为列设置别名
select count(*) as total from user where status=0
```

##### 在项目中操作数据库的步骤

```js
① 安装操作 MySQL 数据库的第三方模块（mysql） 
② 通过 mysql 模块连接到 MySQL 数据库
③ 通过 mysql 模块执行 SQL 语句

配置 mysql 模块
npm install mysql
const mysql = require('mysql')
const db = mysql.createPool({
	host:'127.0.0.1',		//数据库的ip地址
	user:'root',
	password:'0527',
	database:'my_db01'，
	//port:3306
})

测试 mysql 模块能否正常工作
db.query('select 1',(err,results)=>{
	if(err){
		return console.log(err.message)
	}
	console.log(resules)
})
成功的结果resules，是一个含有对象的数组，里面有查询到的对象

插入数据
?表示占位符
const user = {username:'zero',password:'123456'}
const sqlStr = 'insert into users (username,password) values(?,?)'
db.query(sqlStr,[user.username,user.password],(res,results)=>{
	if(err){
		return console.log(err.message);
	}
	if(results.affectedRows===1){
		console.log("插入数据成功")
	}
})

插入数据的便捷方式
const user = {username:'zero',password:'123456'}
const sqlStr = 'insert into users set ?' 
db.query(sqlStr,user,(res,results)=>{
	if(err){
		return console.log(err.message)
	}
	if(results.affectedRows===1){
		console.log("插入成功")
	}
})

更新数据
const user = {id:7,username:'aa',password:'111'}
const sqlStr = 'update users set username = ?,password = ? where id=?'
db.query(sqlStr,[user.username,user.password],(res,results)=>{
	if(err){
		return console.log(err.message)
	}
	if(results.affectedRows===1){
		console.log("插入成功")
	}
})

更新数据的便捷方式
const user = {id:7,username:'aa',password:'111'}
const sqlStr = 'update users set ? where id = ?'
db.query(sqlStr,[user.user.id],(res,results)=>{
	if(err){
		return console.log(err.message)
	}
	if(results.affectedRows===1){
		console.log("插入成功")
	}
})

删除数据
在删除数据时，推荐根据 id 这样的唯一标识，来删除对应的数据
const sqlStr = 'delete from users where id = ?'
//如果sql语句只有一个占位符，可以省略数组
db.query(sqlStr,7,(res,results)=>{
	if(err){
		return console.log(err.message)
	}
	if(results.affectedRows===1){
		console.log("插入成功")
	}
})

标记删除
是在表中设置类似于 status 这样的状态字段，来标记当前这条数据是否被删除,
一般不真正的删除数据，互联网公司对数据的态度就是，只增不删
(物理删除，逻辑删除，分别是真正的删除和标记删除)

const sqlStr = 'update users set status = 1 where id = ?'
//如果sql语句只有一个占位符，可以省略数组
db.query(sqlStr,7,(res,results)=>{		//或者db.query(sqlStr,[1,2],(res,results)=>{
	if(err){
		return console.log(err.message)
	}
	if(results.affectedRows===1){
		console.log("插入成功")
	}
})

用指令创建和使用数据库和简单的表
create database shujuku;
use shujuku;
create table users(
id varchar(20),
username varchar(20),
password varchar(20),
status tinyint(1),
primary key (id)
);
show tables;
describe users;(或者desc users;)
```
