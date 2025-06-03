#### CentOS7.6

`````
Linux分区
boot分区，引导，1G
交换分区，swap，与内存大小一致(2G)，用来做交换，临时充当内存，内存不足的补充机制
根分区，20G余下的所有空间(17G)

KDUMP
在内存崩溃的时候，保存信息，会占用内存

SECURITY POLICY
一般关闭，设置用户名密码或其他权限的时候需要

Root密码
root
普通用户zero密码
0527

右键 管理 克隆
右键 快照

目录
根
root home bin etc boot dev var lib usr media ...
swap交换分区

远程登录
Xshell
个人机器想连接linux公网，必须知道Linux公网的IP，使用ifconfig查看IP地址
Xshell新建会话，登录Linux公网，可以操作Linux系统

Xttp
可以在Windows PC和Linux/UNIX之间传输文件
`````

#### 常识

```
相对路径 从当前的位置来定位
绝对路径 从根目录到当前目录

who am i 查看第一次登录的用户信息
pwd 显示当前工作目录的绝对路径
which 可以查看某个指令在哪个目录下
shell相当于一个编译器
bash tcsh csh

sync 把内存中的数据同步到磁盘
clear Ctrl+L 清屏

网段
如果大家都在192.168.0打头的IP地址，则为同一个网段

网络连接的三种模式
桥接模式
虚拟系统可以和外部系统通信，容易造成IP冲突

NAT模式
网络地址转换模式，虚拟系统可以和外部系统通信，不造成IP冲突

主机
一个独立系统

cat /etc/group文件 查看所有组信息

Ctrl+BackSpace 回退

UUID 40位的唯一标识符

ping
测试主机之间网络的连通性
```

#### 一些目录

```
/etc/passwd文件 用户的配置文件
用户名 口令 用户标识符 组标识号 注释行描述 主目录 登录shell
/etc/shadow文件 口令的配置文件
登录名 加密口令 最后一次修改时间 最小时间间隔 最大时间间隔 警告时间 不活动时间 失效时间 标志
/etc/group文件 存放组的配置文件
组名 口令 组标识号 组内用户列表

/etc/profile 环境变量的配置文件
```

#### 运行级别

```
0高级
1单用户(找回丢失密码)
2多用户状态没有网络服务
3多用户状态有网络服务
4系统未使用保留给用户
5图形界面
6系统重启
init 序号
systemctl get-default 查看当前默认运行级别
systemctl set-default multi-user.target 设置默认运行级别为3
systemctl set-default graphical.target 设置默认运行级别为5
```

#### 找回密码

```
如何找回root密码
e
找到linux16，在那一行最后面输入init=/bin/sh Ctrl+X
输入 mount -o remount,rw /
passwd
新密码
touch /.autorelabel
exec /sbin/init

修改密码
passwd root
输入新密码
```

#### vi和vim

```
Linux下的文本编辑器
在终端命令行下，输入vim 文件，可切换到一般模式

一般模式(默认模式/正常模式)
上下左右 删除整行 删除字符
输入iIoOaArR任一字母，可切换到编辑模式
输入u可撤销最近操作，输入yy复制，5yy 输入p粘贴，输入dd删除，3dd
输入G到末行，gg到首行，输入20，shift+g可以将光标移动到指定行

编辑模式(插入模式)
按下esc按键，可切换到一般模式

命令行模式
一般模式下，输入:或者/，可切换到命令行模式
:wq即可以保存并退出退出窗口
:q退出
:q!强制退出，不保存
:set nu显示行号
:set nonu关闭行号
/关键字，按回车查找，按n查找下一个，N查找上一个

eg:
vim Hello.java
vim /etc/profile
```

#### history历史操作

```
查看已经执行过的指令
history 10 查看最近执行过的10条指令
!5 重新执行编号为5的指令
```

#### 时间日期类指令

```
date 显示当前日期
date +%Y 年
date +%m 月
date +%d 日
date "+%Y-%m-%d %H:%M:%S" 年月日时分秒
date -s 字符串时间 设置系统当前时间
date -s "2000-11-11 11:11:11"

cal 显示本月日历信息
cal 2020 显示2020年的年历
```

#### 帮助手册

```
man 获得帮助信息
man ls 查看ls命令的帮助信息
man cd 查看cd命令的帮助信息
q 内容显示页面回退到输入命令的状态

help 获得shell内置指令的帮助信息
help cd
```

#### 关机重启

```
shutdown -h now 立即关机
shutdown -h 1 一分钟后关机
shutdown -r now 立即重启
halt 立即关机
reboot 立即重启
```

#### ls列表

```
ls -a: (或者ls --all)显示全部文件, 包括隐藏文件
ls -l : (list)以列表形式显示
-h: (human readable)人性化形式显示文件大小

可以组合使用，比如-la,-al,-alh

ls -l /home
ls -al/root 单列显示出root下面所有的文件
```

#### cd切换目录

```
cd 切换到指定目录
cd ~ 回到自己的家目录
cd .. 回到当前目录的上一级别
eg:
cd /root 使用绝对路径切换到root目录
cd ../../root 使用相对路径切换到root目录
```

### 用户

#### 切换用户

```
su - 用户名 切换用户
su - root 切换为root账户

从权限高的用户切换回权限低的用户，不需要输入密码，反之需要
exit/logout 返回原来的用户
```

#### 注销用户

```
logout 注销账户，在运行级别3下有效
```

#### 新建用户

```
cd /home，useradd 新的用户名 添加用户
useradd -d 指定目录 新的用户名 指定目录添加用户
useradd -g 用户组 用户名 添加用户时将用户放到指定组里面
默认添加的用户，在同名组里面
```

#### 设置密码

```
passwd 用户名 设置密码
```

#### 删除用户

```
userdel 用户名 删除用户，保留用户主目录
userdel -r 用户名 删除用户以及用户主目录
```

#### 查看用户所在组

```
id 用户名 查看用户所在组
```

#### 修改用户所在组

```
usermod -g 组名 用户名 将用户转移到已存在的其他组
```

#### 删除用户

### 文件和目录

#### 创建目录

```
mkdir 创建目录
mkdir -p 创建多级目录
mkdir /home/dog
mkdir -p /home/animal/tiger
```

#### 创建文件

```
touch 创建空文件
eg:
touch 1.txt
```

#### 删除文件或目录

```
rmdir 删除空目录
rm -rf /home/animal 强制删除animal目录，不提示
rm -rf /*
rm 移除文件或目录
rm -r 递归删除整个文件夹
按y确认
```

#### 拷贝文件或目录

```
cp 拷贝文件到指定目录
cp 1.txt bbb/ 拷贝1.txt文件到aaa文件夹
cp -r /home/bbb/ /aaa/ 拷贝bbb文件夹到aaa文件夹
\cp -r /home/bbb/ /aaa/ 拷贝bbb文件夹到aaa文件夹,强制覆盖不提示
```

#### 移动文件或目录

```
mv 移动文件与目录或重命名
如果是两个文件，则把前面的文件重命名为后面的文件名称，并覆盖掉后面的文件
如果是两个目录，则将前面的目录移动到后面的目录
mv /home/aaa/ccc /home/bbb
```

#### 查看文件内容

```
cat 查看文件内容，不能修改
cat [选项] 要查看的内容
加上-n 显示行号
cat -n [选项] 要查看的内容

head 查看文件头部位内容，默认前十行
head 文件
head -5 文件 查看前五行

tail 查看文件尾部位内容，默认后十行
tail 文件
tail -5 文件 查看前五行
tail -f 文件 实时追踪文档更新 Ctrl+C退出
```

### 文本过滤

#### more 文本过滤器

```
more 文件名
可以结合cat使用，也可以独立使用
cat -n /etc/profile | more [进行交互]
空格 翻页
回车 下一行
q 离开more，不显示该文件内容
Ctrl+F 向下滚动一屏
Ctrl+B 返回上一屏
= 输入当前行的行号
:f 输出文件名和当前行的行号
```

#### less 分屏查看文件内容

```
less 文件名
比more强大，支持显示各种终端，按需加载
空格 翻页
pagedown 翻页
pageup 翻上一页
/字串 向下搜寻字串功能，n向下查找，N向上查找
?字串 向上搜寻字串功能，n向上查找，N向下查找
q 离开less
```

### echo  打印

```
输出内容到控制台
echo 选项 输出内容
echo $HOSTNAME
echo $PATH
echo "hello"
```

### 输出重定向 (>)追加(>>)

````
ls -l > 文件 列表中的内容覆盖到文件中去
ls -al >> 文件 列表的内容追加到文件末尾
cat 文件1>文件2 将文件1的内容覆盖到文件2
echo "内容" > 文件 将内容覆盖到文件中去
echo "内容" >> 文件 将内容追加到文件末尾
cal >> /home/1.txt
````

### ln快捷方式

```
ln 软链接或符号链接
类似于快捷方式
ln -s 原文件或目录 软链接名 给源文件创建一个软链接
rm /home/111 删除软连接
```

### 查找指令

#### find

```
find 从指定目录向下递归地遍历其各个子目录，满足条件的文件或目录显示在终端
find 搜索范围 选项
-name名字
-user用户名
size大小 (+n大于 -n小于 n等于，单位有k，M，G)
find /home -name 1.txt 在home下按名字查找文件1.txt
find / -size +200M 在整个linux系统下查找大于200M的文件
```

#### locate

```
locate 定位文件位置
locate基于数据库进行查询，使用前必须使用updatedb指令创建locate数据库
locate 搜索文件
```

#### grep

```
grep 过滤查找
cat 1.txt | grep "hello" 只查找出有hello的行
cat /home/hello.txt | grep "yes"
grep -n "yes" /home/hello.txt
加-i忽略大小写
加-n显示行号
```

### 压缩和解压指令

#### gzio/gunzip

```
gzio/gunzip
gzip压缩文件，gunzip解压文件
gzip 文件
gunzip 文件.gz
```

#### zip/unzip

```
zip/unzip
zip压缩文件或目录，unzip解压文件或目录
zip -r 压缩包名称 目录 递归压缩，即压缩目录
unzip -d 目录 压缩包 指定解压后文件的存放目录
zip -r myhome.zip /home/ 将home文件夹压缩，重命名为myhome
unzip -d /home/myhome /home/myhome.zip
```

#### tar

```
tar 打包指令，.tar.gz
-c 产生.tar打包文件
-v 显示详细信息
-f 指定压缩后的文件名
-z 打包同时压缩
-x 解包.tar文件

将home下的 /home/1.txt和/home/2.txt 压缩为 aa.tar.gz
tar -zcvf aa.tar.gz /home/1.txt /home/2.txt 

将 home文件夹所有文件 压缩为 myhome.tar.gz
tar -zcvf myhome.tar.gz /home/ 

将home下的 pc.tar.gz 解压到 /opt/tmp2 下面
tar -zxvf /home/pc.tar.gz -C /opt/tmp2 

-C指定解压目录
```

### 组管理和权限管理

```
Linux每个用户必须属于一个组
每个文件都有 所有者、所在组、其他组 的概念
当一个用户创建了一个文件后，文件所在组就是用户所在组

如果要对文件夹内的文件进行操作，需要有对该目录的相应权限
```

#### 创建或删除组

```
groupadd 组名 新建组
groupdel 组名 删除组
```

#### 所有者和所在组的修改

```
chown 新所有者 文件/目录 改变所有者
chown 新所有者:新所在组 文件/目录 改变所有者和所在组
chgrp 新组名 文件名/目录 修改文件/目录所在组
加上-R 如果是目录，则使其下所有子文件或目录递归生效

usermod -g 组名 用户名 改变用户所在组
usermod -d 目录名 用户名 改变用户登录的初始目录，用户需要有进入新目录的权限
```

#### 修改文件或目录的权限

```
通过+、-、=变更权限
u所有者，g所有组，o其他人，a所有人(u、g、o总和)
可以用数字表示rwx，r=4，w=2，x=1，rwx=4+2+1=7
chmod u=rwx,g=rx,o=x 文件/目录名
chmod o+w 文件/目录名
chmod a-x 文件/目录名
chmod 751 文件/目录名
绿色的文件可执行

文件夹和文件夹内文件的权限是分开的
给文件夹执行权限x，可以进入目录，比如cd，不可以ls，但不影响文件夹内的文件拥有的权限
给文件夹执行x，读r，则可以进入目录和列举出目录的内容ls
给文件夹执行x，读r，写w，则可以进入目录和ls，删除和创建文件夹里面文件的权限
```

#### ls -alh信息解释

```
-rw-r--r--. 1 zero1 root 4096 1月  28 09:41 apple.txt
解释：
-rwxrw-r-- 0-9位
第0位是文件类型(d目录,-文件,l连接,c字符设备鼠标键盘等,b块设备硬盘等)
1-3位确定文件所有者 User
4-6位确定所属组拥有该文件的权限 Group
7-9位确定其他用户拥有该文件的权限 Other

r可读，w可写，x可执行/可进入该目录
想要删除一个文件，必须对该文件所在的目录具有写的权限

1 文件：硬连接或 目录：子目录数
root 用户
root 组
1213 文件大小(字节)
最后修改的日期
文件名
```

### crond任务调度

```
指定系统在某个时间执行特定的命令或程序
任务调度分类
个别用户工作

crontab -e 编辑定时任务
crontab -l 查询
crontab -r 删除当前用户所有的crontab定时任务
service crond restart 重启任务调度

第一个一小时当中的第几分钟 0-59
第二个* 一天当中的第几小时 0-23
第三个* 一月当中的第几天 1-31
第四个* 一年当中的第几月 1-12
第五个* 一周当中的星期几 0-7(0和7都代表星期日)

*代表任何时间
,代表不连续的时间，        23 8,12,16 * * *    每天的8点23分，12点，16点执行
-代表连续的时间范围，       0 5 * * 1-6        周一到周六的五点执行
*/n代表每隔多久执行一次，   */10 * * * *       每隔十分钟执行

eg:
每小时的每分钟执行ls -l /etc/ > /tmp/to.txt命令
crontab -e
*/1 * * * * ls -l /etc/ > /tmp/to.txt，

每天凌晨两点备份数据库
crontab -e
0 2 * * * mysqldump -u root -proot testdbl > /home/db.bak
```

### at定时任务

```
at命令是一次性定时计划任务，执行完一个任务后，拿掉任务，不再执行此任务了
at的守护进程atd以后台模式运行，检查作业队列来运行，
每60秒检查作业队列，
有作业时，会检查作业运行时间，如果与当前时间匹配，则运行此作业.
在使用at命令时，要保证atd进程的启动
ps -ef 检测当前所有运行的进程
ps -ef | grep atd

at 选项 时间
Ctrl + D 结束at命令的输入，输入两次

选项
-m				指定任务被完成后，给用户发送邮件，没有标准输出
-I				atq的别名
-d				atrm的别名
-v				显示任务将被执行的时间
-c				打印任务的内容到标准输出
-V				显示版本信息
-q <队列>		   使用指定的队列
-f <文件>		   从指定文件读入任务而不是从标准输入读入
-t <时间参数>	  以时间参数的形式提交要运行的任务

时间
（1）midnight，noon，teatime
（2）today，tomorrow
（3）接受在当天的hh:mm式的时间指定，例如04:00
（4）十二小时计时制，时间后面加上AM，PM，例如12pm
（5）指定命令执行的具体日期，month day (月 日)或mm/dd/yy(月/日/年)或dd.mm.yy(日.月.年),
日期必须在时间后面，例如04:00 2021-03-1
（6）相对计时法，mow + count time - units，
mow是当前时间，time - units时间单位，minutes、hours、days、weeks，count时间的数量，几天，几小时，
例如now + 5 minutes

相对时间有+号

eg:
at 5pm + 2 days
at > 
/bin/ls /home
输入两次Ctrl + D
atq

at 5pm tomorrow
at > 
date > /root/date100.log
输入两次Ctrl + D
atq

at now + 2 minutes
at > 
date > /root/date200.log
输入两次Ctrl + D
atq

at now + 2 minutes
at > 
/root/my.sh
输入两次Ctrl + D
atq

atrm 5 拿掉编号为5的任务
```

### 磁盘分区/挂载

```
Linux无论有几个分区，发给那个目录使用，归根结底只有一个根目录，一个独立且唯一的文件结构，Linux中每个分区都是用来组成整个文件系统的一部分
"载入"，整个文件系统中包含了一整套的文件和目录，且将一个分区和一个目录联系起来，这时要载入的一个分区将使它的存储空间在一个目录下获得

Linux硬盘分IDE和SCSI，目前基本上是SCSI硬盘
IDE
hdx~
hd表明分区所在设备的类型
~代表分区
x为盘号
a为基本盘，b为基本从属盘，c为辅助主盘，d为辅助从属盘

SCSI
sdx~
sd表明分区所在设备的类型
~代表分区
x为盘号
```

#### 虚拟机添加硬盘

```
添加硬盘、分区、格式化、挂载、设置可以自动挂载

lsblk或lsblk -f 查看所有设备挂载情况

虚拟机设置里面添加硬盘，重启识别

fdisk /dev/sdb 分区命令
m 显示命令列表
p 显示磁盘分区 同fdisk -l
n 新增分区
d 删除分区
w 写入并退出
开始分区后输入n，新增分区，
然后选择p，分区类型为主分区，
两次回车默认剩余全部空间，
输入w写入分区并退出，
若不保存退出输入q

mkfs -t ext4 /dev/sdb1 格式化磁盘，ext4为分区类型

新建挂载目录newdisk，可以在任何地方，目录名称自定义

mkdir newdisk
mount /dev/sdb1 /newdisk 给磁盘sdb1挂载目录为newdisk，重启后会失效
unmount /dev/sdb1 /newdisk或者unmount /newdisk 卸载分区

永久挂载
vim /etc/fstab
添加一行
/dev/sdb1                                  /newdisk  ext4  defaults  0 0
或
UUID=a368f1fe-416d-49b0-a884-380028a40537  /newdisk  ext4  defaults  0 0
重启
```

#### 磁盘情况查询

```
df -h 查询系统整体磁盘使用情况，不显示终端交换分区swap

du -h /目录 查询指定目录的磁盘占用情况
-s 指定目录占用大小汇总
-h 带计量单位
-a 含文件
--max-depth=1 子目录深度为1
-c 列出明细的同时，增加汇总值

eg:
du -hac /opt --max-depth=1

统计/opt文件夹下文件的个数
ls -l /opt | grep "^-" | wc -l

统计/opt文件夹下目录的个数
ls -l /opt | grep "^d" | wc -l

统计/opt文件夹下文件的个数，包括子文件夹里面的
ls -lR /opt | grep "^-" | wc -l

统计/opt文件夹下目录的个数，包括子文件夹里面的
ls -lR /opt | grep "^d" | wc -l

以树状显示目录结构
yum install tree
tree /home/

grep "^-" 只列出以-开头的文件
grep "^d" 只列出以d开头的文件
加上-R 如果是目录，则使其下所有子文件或目录递归生效
wc -l wordcount，统计文件数
```

### 网络配置

```
前三位一样，就是都在同一个网段，才能够进行通信
192.168.2.

虚拟机ip
ifconfig
ens33:
inet 192.168.126.128

NAT网络配置
关闭windows防火墙，
windows可以ping通Linux虚拟机
Linux虚拟机可以ping通windows的vmnet8 ip地址
vmnet8通过无线网卡代理，找到外面的网关，网关相当于路由器
通过外面的网关，可以访问网络

vmnet8用于虚拟机和实体机通信
虚拟机的IP地址可以自动分配，也可以指定
```

### 修改IP地址

```
指定ip，直接修改配置文件
vim /etc/sysconfig/network-scripts/ifcfg-ens33

BOOTPROTO=static
#IP地址
IPADDR=192.168.200.130
#网关
GATEWAY=192.168.200.2
#域名解析器
DNS1=192.168.200.2


dhcp自动分配
static静态分配
GATEWAY网关
DNS域名解析器

重启网络服务或重启系统生效
service network restart、reboot
```

### 设置主机名和host映射

```
hostmane 查看主机名

vim /etc/hostname 修改主机名，重启生效

设置host映射
如何通过主机名能够找到某个linux系统?

windows配置主机和IP的关系
C:\Windows\System32\drivers\etchost
添加192.168.200.130 xuniji

linux配置主机和IP的关系
/etc/hosts添加
添加192.168.200.1 PC

修改后重启便可以直接ping主机

```

### 主机名解析过程

```
Host
文本文件，用来记录IP和Hostname(主机名)的映射关系

DNS
Domain Name System
域名系统
互联网上作为域名和IP地址相互映射的一个分布式数据库

eg:
用户在浏览器输入了www.baidu.com

1、浏览器先检查浏览器缓存中有没有该域名解析IP地址，
有就先调用这个IP完成解析，
没有的话，检查操作系统DNS解析器缓存，
有的话直接返回IP完成解析，
这两个缓存可以理解为 本地解析缓存

当电脑第一次成功访问某一网站后，在一定时间内，
浏览器或操作系统会缓存他的IP地址(DNS解析记录)，如在cmd窗口中输入
ipconfig /displaydns	DNS域名解析缓存
ipconfig /flushdns		手动清理DNS缓存

2、如果本地解析器缓存没有找到对应映射，检查系统中hosts文件中有没有配置对应的域名IP映射，如果有，则完成解析并返回

3、如果本地DNS解析器缓存和hosts文件中都没有找到对应的IP，
则到域名服务DNS进行解析域(根域名服务器，顶级域名服务器，权威域名服务器)

都找不到则域名不存在

域名劫持
自定义域名 知名网站
202.111.222.121 www.baidu.com
```

### 进程管理

```
每个执行的程序都是进程
都有一个ID号(pid，进程号)

每个进程都有两种方式存在，前台和后台

ps 显示系统执行的进程
ps -a 所有进程
ps -u 用户的格式
ps -x 运行参数

PID		进程识别号
TTY		终端机号
TIME	此进程所占用CPU时间
COMMAND	正在执行的命令或进程名
STAR	运行状态 S睡眠s会话的先导进程N比普通优先级更低的优先级R正在运行D短期等待Z僵死进程T被追踪或者被停止等等
START	开始时间
USER	用户名称
System	V展示风格
%CPU	进程占用cpu的百分比
%MEM	进程占用物理内存的百分比
VSZ		进程占用的虚拟内存大小(KB)
RSS		进程占用的物理内存大小(KB)
TT		终端名称
STARTED	进程的启动时间

eg:
ps -aux | grep sshd
```

### 父子进程

```
实例:以全格式显示当前所有的进程，查看进程的父进程
ps -ef	以全格式显示当前所有进程
-e 显示所有进程
-f 全格式
ps -ef | grep sshd

进程号PID越小，越先开始
```

### 终止进程

```
kill 选项 进程号

killall 进程名称

-9 强迫进程立即停止

进程名为/usr/sbin/sshd -D的进程，是Xshell启动虚拟机的进程sshd服务

终止sshd服务命令
kill sshd对应的进程号PID

启动sshd服务命令
/bin/systemctl start sshd.service

终止打开的终端
ps -aux | grep bash
找出PDI
kill -9 指定终端的进程号PID
不带-9，系统认为终端窗口正在启动，无法终止
```

### pstree进程树

````
pstree -p 显示进程的PID
pstree -u 显示进程的所属用户
````

### 服务管理

```
服务本质是进程，运行在后台，通常会监听某个端口，等待其他程序的请求，如mysql,sshd
,防火墙等，因此又称为守护进程
CentOS7多用systemctl

service 服务名 start | stop | restart | reload | status

ls -l /etc/init.d/

setup 选择系统服务界面
有*的服务，会随着linux服务器而自动启动
按空格取消*
按tab可以操作退出
```

### 服务运行级别

```
0不能正常启动
1单用户工作状态，root权限，用于系统维护，禁止远程登录
2多用户状态，没NFS，不支持网络
3完全的多用户状态，有NFS，登录后进入控制台命令行模式
4系统未使用，保留
5X11控制台，登陆后进入图形GUI模式
6系统正常关闭并重启，默认运行级别不能设为6，否则不能正常启动
 
Linux开机流程
开机 BIOS /boot systemd进程1 运行级别 运行级对应的服务

/etc/initab
multi-user.target:analogous to runlevel 3
graphical.target:analogous to runlevel 5

systemctl get-defalut
systemctl set-defalut muti-user.target

```

### 服务管理

```
chkconfig
可以给服务的各个运行级别设置自启动/关闭

chkconfig指令管理的服务在 /etc/init.d 查看
每个服务对应的启动或关闭，是针对不同级别而言的

chkconfig --list | grep xxx 查看chkconfig管理的服务有哪些
chkconfig --level 5 服务名 on/off 把某一个服务在运行级别5关闭/打开，重启生效

sysytemctl start | stop | restart | status 服务名
systemctl指令管理的服务在 /usr/lib/systemd/system 查看

ststemctl list-unit-files | grep XXX 查看服务器开机启动状态
systemctl enable 服务名 设置服务开机启动
systemctl disable 服务名 关闭服务开机启动
systemctl is-enabled 服务名 查询某个服务是否自启动

打开或关闭指定端口
firewall-cmd --permanent --add-port=端口号/协议		打开端口
firewall-cmd --permanent --remove-port=端口号/协议	关闭端口
firewall-cmd --reload							  重新载入，才能生效
firewall-cmd --query-port==端口号/协议			    查询端口是否开放
```

### 动态监控进程top

```
类似于ps，显示正在执行的进程，top在执行一段时间可以更新正在运行的进程
top -d 秒数	指定top命令每隔几秒更新，默认是三秒
top -i	使top不显示任何闲置或者假死进程
top -p	通过指定监控进程ID来仅仅监控某个进程的状态

僵尸进程，进程已经死掉了，但内存没有释放，定期清理

输入top后，按P，按cpu使用率排序
输入top后，按M，按内存使用率排序
输入top后，按N，按PID排序
输入top后，按q，退出top
输入top后，回车，按u，回车，在输入用户名			  监视特定用户
输入top后，回车，按k，回车，再输入要结束的进程ID		终止进程
```

### 监控网络状态netstat

```
netstat -an	按一定顺序排列输出
netstat -p	显示哪个进程在调用

Proto网络协议
Local Address 本地地址，在linux
Foreign Address 外部地址，在windows
TIME_WAIT 超时等待
域名协议端口号

查看服务名为sshd的服务的信息
netstat -anp | grep sshd

ping检测远程主机是否正常
```

### rpm包管理

```
互联网下载包的打包及安装工具，包含在某些Linux分发版中，
可以生成.RPM文件，RedHat PackageManager，类似于Windows的setup，
Linux的分发版都有采用

查询当前系统是否已经安装了XXX
rpm -qa | grep xxx

查询安装了所有的rpm软件包
rpm -qa

查询软件包的相关信息
rpm -qi xxx

查询文件或目录所属的软件包
rpm -qf /etc/passwd

卸载
rpm -e xxx

强制卸载
rpm -e --nodeps xxx

安装，需要提前把包下载到本地
rpm -ivh xxx
```

### yum包管理

```
互联网上有个yum服务器，提供了很多个rpm包
自动处理依赖性关系，一次安装所有依赖的软件包

查询
yum -list | grep xxx

安装
yum install xxx
```

### 搭建JAVA_EE的环境

#### 安装配置JDK

```
mkdir /opt/jdk
将安装文件通过xftp6上传到/opt/jdk下
cd /opt/jdk
解压 tar -zxvf jdk-8u261-linux-x64.tar.gz

mkdir /user/local/java
mv /opt/jdk/jkd.1.8.0_261 /user/local/java
配置环境变量的配置文件vim /etc/profile
export JAVA_HOME=/usr/local/java/jdk1.8.0_261
export PATH=$JAVA_HOME/bin:$PATH
source /etc/profile 让文件生效
测试是否安装成功
```

#### 安装配置tomcat8

```
上传文件，解压到/opt/tomcat
进入解压目录/bin，启动tomcat ./startup.sh
开放端口 8080
firewall-cmd --permanate add-query-port=8080/tcp
测试 http://linuxip:8080
```

#### 安装配置idea2020

```
解压到/opt/idea
启动idea/bin下的 ./idea.sh，配置jdk (不可以在Xshell执行)
测试，编写java程序
```

#### 安装配置mysql5.7

```
cd /opt/mysql
wget 链接 通过网络获取软件下载地址
tar -zxvf 文件.tar 解压缩

centos7.6自带mariadb，与mysql冲突，要先删除
查询
rpm -qa | grep mari
删除
rpm -e --nodeps mariadb-libs
rpm -e --nodeps marisa

rpm -ivh 安装包名-common.rpm
rpm -ivh 安装包名-libs.rpm
rpm -ivh 安装包名-client.rpm
rpm -ivh 安装包名-server.rpm

运行systemctl start mysqld.service
设置root用户密码
会自动给root用户设置随机密码，grep "password" /var/log/mysqld.log 查看当前密码
mysql -u root -p，输入密码进入，设置密码
set global validate_passwprd_policy=0 设置密码等级，密码等级012，0是最低的
set password for 'root@localhost'=password('1234')
运行flush privileges使密码生效
```

### shell脚本编程

```
进行服务器管理、维护
是一个命令行解释器
向用户提供了一个向Linux内核发送请求以便运行程序的界面系统极程序，
可以通过shell来启动、挂起、停止、编写一些程序。
 
脚本格式要求
以#!/bin/bash开头，需要有可执行权限chmod u+x hello.sh

执行方式
1、输入脚本的绝对路径或相对路径
2、sh+脚本，不用赋予脚本执行权限，直接执行即可
```

#### shell的变量

```
系统变量、用户自定义变量
要使用变量时，前面都要加$

系统变量
$HOME,$PWD,$SHELL,$USER,比如echo $HOME
显示当前shell中所有变量：set

定义变量：变量名=值
撤销变量：unset 变量
声明静态变量：readonly变量，注意：不能unset撤销

eg:
#!/bin/bash
A=100
echo A=$A或echo "A=$A"
unset A
readonly B=2
unset B
echo B=$B

变量名由数字字母下划线组成，不能以数字开头
等号两边不能有空格
变量名一般为大写，规范

将命令的返回值赋给变量
A=`date`或者A=$(date) 运行里面的命令，把结果返回给A

 #!/bin/bash是指此脚本使用/bin/bash来解释执行
```

#### 环境变量

```
环境变量/全局变量可以被多个文件共享

在/etc/profile文件里面定义的变量(export 变量名=变量值 source /etc/profile )就是环境变量，定义为环境变量后，就可以在任一shell里面调用

export 变量名=变量值 将shell变量输出为环境变量
source /etc/profile 让修改后的配置信息立即生效
echo $变量名 查询环境变量的值
```

#### shell注释

```
多行注释
:<<!
内容
!
```

#### 位置参数变量

```
在执行shell脚本时，如果希望获取到命令行的参数信息，就可以使用到位置参数变量
./myshell.sh 100 200 可以在myshell脚本中获取到参数信息

$n
n为数字，$0代表命令本身，$1-$9代表第一到第九个参数，十个以上的参数需要用大括号包含，如${10}

$*
代表命令行中所有的参数，把所有参数看成一个整体

$@
代表命令行中所有的参数，把每个参数区分对待

$#
代表命令行中所有参数的个数

eg：
vim position.sh
#!/bin/bash
echo "0=$0 1=$1 2=$2"
echo "所有$*"
echo "所有分别$@"
echo "参数个数$#"

sh position.sh 120 112 1234
```

#### 预定义变量

```:
$$
当前进程的进程号(PID)
$!
后台运行的最后一个进程的进程号(PID)
$?
最后一次执行的命令的返回状态
如果这个变量的值为0，证明上一个命令正确执行；
如果这个变量值为非0，证明上一个命令执行不正确；

以后台的方式运行脚本
脚本名称后面加 &

#!/bin/bash
echo "当前执行的进程PID为$$"
/root/shcode/myshell.sh &
echo "最后一个后台发送运行的进程PID为$$"
echo "执行结果$?==0?正确:错误"
```

#### 运算符

```
$((运算式))或$[运算式]或expr m + n
注意：expr运算符间要有空格，如果希望将expr的结果赋给某个变量，使用``
expr m - n
expr \*,/,%  乘，除，取余

RES1=$(((2+3)*4))
echo "res1=$RES1"
RES2="$[(2+3)*4]"
echo "res2=$RES2"
TEMP=`expr 2+3`
RES4=`expr$TEMP\*4`
echo "temp=$TEMP"
echo "res4=$RES4"
```

#### 条件判断

```
[ condition ] 前后有空格
非空返回true，
空[ ]返回false，
可用$?验证(0为true，>1为false)

字符串比较
=

两个整数比较
-lt小于
-le小于等于
-eq等于
-gt大于
-ge大于等于
-ne不等于

按照文件权限进行判断
-r有读的权限
-w有写的权限
-x有执行的权限

按照文件类型进行判断
-f文件存在并且是一个常规文件
-e文件存在
-d文件存在并是一个目录

eg:
vim ifdemo.sh
#!/bin/bash

if [ "ok" = "ok" ]
then
echo "equal"

fi
if [ 23 -ge 22 ]
then
echo "大于"
fi

if [ -f /root/shcode/aaa.txt ]
then
echo "存在"
fi
```

#### 流程控制if

```
if [ 条件判断式 ]
then
代码
fi

if [ 条件判断式 ]
then
代码
elif [ 条件判断式 ]
then
代码
fi

eg:
#!/bin/bash
if [ $1 -ge 60 ]
then
echo "及格了"
elif [ $1 -lt 60 ]
then
echo "不及格"
fi
```

#### 流程控制case

````
case $变量名 in
"值1")
如果变量值等于1，则执行程序1
;;
如果变量值等于2，则执行程序2
;;
...
*)
如果变量值都不是以上的值，则执行此程序
;;
esac

eg:
当命令行参数是1时，输出周一，是2时，输出周二，其他情况输出other
case $1 in
"1")
echo "周一"
;;
"2")
echo "周二"
;;
*)
echo "other..."
;;
esac
````

#### 流程控制for

```
for 变量 in 值1 值2 值3...
do
程序/代码
done

for ((初始值;循环控制条件;变量变化))
do
程序
done

eg:
for i in "$@"
do
	echo "num is $i"
done

SUM=0
for(( i=1; i<=$1; i++))
do
        SUM=$[$SUM+$i]
done
echo "$SUM"
```

#### 流程控制while

```
while [ 条件判断式 ]
do

eg：
SUM=0
i=0
while [ $i -le $1 ]
do
	SUM=$[$SUM+$i]
	i=$[$i+1]
done
echo "$SUM"
```

#### read读取控制台输入

```
read 选项 参数
-p 指定读取参数
-t 指定读取值时等待的时间(秒)，如果没有在指定的时间内输入，就不要再等待了
变量：指定读取值的变量名

eg：
read -t 10 -p "请输入" NUM1
echo "输入的是$NUM1"
```

#### 函数

##### 系统函数

```
basename
返回完整路径最后/的部分，常用于获取文件名
basename [pathname] [suffix]
basename [string] [suffix]
删掉所有的前缀，包括最后一个'/'字符，然后将字符串显示出来
如果有suffix，会将pathname或string中的suffix去掉
eg:
basename /home/aaa/test.txt
返回test.txt
basename /home/aaa/test.txt .txt
返回test

dirname
返回完整路径最后/的前面的部分，常用于返回路径部分
dirname 文件绝对路径
eg:
dirname /home/aaa/test.txt
返回/home/aaa/
```

##### 自定义函数

```
[ function ] funname[()]
{
	Action;
	[return int;]
}
调用直接写函数名：funname [值]


eg：

function getSum() {
        SUM=$[$n1+$n2]
        echo "和$SUM"
}
read -p "输入" n1
read -p "输入2" n2
getSum $n1 $n2
```

#### 案例：备份数据库

```shell
/user/sbin/mysql_db_backup.sh

#备份目录
BACKUP=/data/backuup/db
#当前时间
DATETIME=$(date +%Y-%m-%d_%H%M%S)
echo $DATETIME
#数据库地址
HOST=localhost
#数据库用户名
DB_USER=root
#数据库密码
DB_PW=1111
#备份的数据库名
DATABASE=hspedu

#创建备份目录，如果不存在就创建(-d 文件存在并是一个目录，-p 创建多级目录)
[ ! -d "${BACKUP}/${DATETIME}"  && mkdir -p "${BACKUP}/${DATETIME}"
#备份数据库(压缩为.sql.gz)
mysqldump -u ${DB_USER} -p ${DB_PW} --host=${HOST} -q -R --database ${DATABASE} | gzip > ${BACKUP}/${DATETIME}/$DATETIME.sql.gz
#将文件处理成tar.gz(压缩为.tar.gz)(find从指定目录向下递归地遍历其各个子目录)
cd ${BACKUP}
tar -zcvf $DATETIME.tar.gz ${DATETIME}
rm -rf ${BACKUP}/{DATETIME}
#删除10天前的备份文件(-atime +10 查找10天以前的文件)( -exec rm -rf {} \ 固定写法，把前面find查询到的文件进行删除)
find ${BACKUP} -atime +10 -name "*.tar.gz" -exec rm -rf {} \;
#提示
echo "备份${DATABASE}数据库成功"
#每天凌晨两点半执行(添加一个定时任务)
contab -e
30 2 * * * /usr/sbin/mysql_db_backup.sh
```

#### 面试

````
能够完成产品经理提出的需求，
遇到问题会自己debug，或在网上查资料，或者向熟悉相关知识的人请教

熟悉项目的各个流程，产品需求，测试，验收，贝塔版，正式版，项目上线，回滚等
可以和各个岗位的人友好沟通，解决实际问题，完成自己的本职工作

哪些不足之处？
不过我在IT行业的项目经验多是在上一个公司的开发岗位积累的
所以我面试该岗位的一个不足就是缺乏运维和Linux测试相关的公司经验

上一个工作为什么辞职？
上一家公司挺不错的，但中途家人想让我回去当兵，去年刚好23周岁，超过年龄后就不招收了，所以不得已辞职回去参加征兵，所有流程都通过了，但在最后复查的时候，出了点事，没能去当兵，然后在这边政府部门上了几个月班。

为什么想来我们公司？
一个朋友在你们这儿工作，他说这边挺好的，能学到不少东西，这几个月也成长了不少，他推荐我来这边，我也对linux挺感兴趣的，觉得服务器和linux的东西对自己以后的发展有帮助，于是就去学了。

未来有什么规划和发展？
未来打算一直在这一行干下去
现在的话，在做好本职工作的同时，学习前沿技术，向自动化测试发展，然后做开发，全栈工程师

期望的薪资是多少？/你还有什么想问的吗？
这边能给到的薪资范围是多少。期望薪资是13K
对新入职员工有怎样的培养计划

什么时候能来公司?
现在在陕西，三天时间在这边整理一下东西，坐火车的话，路上再花一天时间，估计四天后可以过来

监控系统性能
vmstat netstat top

HTTPS协议
超文本传输协议
TCP/IP 协议族内的其他协议, 用于客户端和服务器之间的通信

HTTPS协议是由SSL证书+HTTP协议构建的可进行加密传输、身份认证的网络协议，要比http协议安全，可防止数据在传输过程中不被窃取、改变，确保数据的完整性。

Https协议需要ca证书，费用较高。
http是超文本传输协议，信息是明文传输，https则是具有安全性的ssl加密传输协议。
使用不同的链接方式，端口也不同，一般而言，http协议的端口为80，https的端口为443
http的连接很简单，是无状态的；HTTPS协议是由SSL+HTTP协议构建的可进行加密传输、身份认证的网络协议，比http协议安全。

原理
客户使用https url访问服务器，要求web 服务器建立ssl链接。
web服务器接收到客户端的请求之后，会将网站的证书（证书中包含了公钥），返回或者说传输给客户端。
客户端和web服务器端开始协商SSL链接的安全等级，也就是加密等级。
客户端浏览器通过双方协商一致的安全等级，建立会话密钥，然后通过网站的公钥来加密会话密钥，并传送给网站。
web服务器通过自己的私钥解密出会话密钥。
web服务器通过会话密钥加密与客户端之间的通信。

https协议的优点
使用HTTPS协议可认证用户和服务器，确保数据发送到正确的客户机和服务器；
HTTPS协议是由SSL证书+HTTP协议构建的可进行加密传输、身份认证的网络协议，要比http协议安全，可防止数据在传输过程中不被窃取、改变，确保数据的完整性。
HTTPS是现行架构下最安全的解决方案，虽然不是绝对安全，但它大幅增加了中间人攻击的成本。
谷歌曾在2014年8月份调整搜索引擎算法，并称“比起同等HTTP网站，采用HTTPS加密的网站在搜索结果中的排名将会更高”。

https协议的缺点
https握手阶段比较费时，会使页面加载时间延长50%，增加10%~20%的耗电。
https缓存不如http高效，会增加数据开销。
SSL证书也需要钱，功能越强大的证书费用越高。
SSL证书需要绑定IP，不能再同一个ip上绑定多个域名，ipv4资源支持不了这种消耗。

tcp三次握手
客户端和服务端都需要直到各自可收发，因此需要三次握手。
第一次握手：S只可以确认 自己可以接受C发送的报文段
第二次握手：C可以确认 S收到了自己发送的报文段，并且可以确认 自己可以接受S发送的报文段
第三次握手：S可以确认 C收到了自己发送的报文段

A发起请求，B确认可以接收到A的请求
A确认 B收到了A发送的报文段
B确认 A收到了自己发送的报文段

- 200 请求成功
- 304 没有修改，缓冲中取
- 404 没有找到
- 403 服务器已经理解请求，但是拒绝执行它。
- 301 被请求的资源已永久移动到新位置
- 302 请求的资源临时从不同的 URI响应请求。
- 1开头 ： 消息类
- 2开头 ： 成功
- 3开头 ： 重定向
- 4开头 ： 请求错误
- 5开头 : 服务器错误



mysql
/*连接mysql*/
mysql -h 地址 -P 端口 -u 用户名 -p 密码
例如: mysql -h 127.0.0.1 -P 3306 -u root -p ****

/*退出mysql*/
exit;

create database 数据库名
show databases;
alter database 数据库名 [新的数据库选项];
drop database 数据库名;
use 数据库名;
create table；
show tables;
show create table 表名;
desc 表名;
drop table [if exists] 表名
alter table 表名 add 新列名 字段类型 [字段选项];
alter table 表名 drop 字段名;
alter table 表名 modify 字段名 新的字段类型 [新的字段选项];
alter table 表名 modify 字段名 字段类型 [字段选项] first;
alter table 表名 modify 字段名1 字段类型 [字段选项] after 字段名2;
alter table 表名 change 原字段名 新字段名 新的字段类型 [新的字段选项];
alter table 表名 表选项信息;

insert into user(id,name,age) values(1,'admin_a',50);
insert into user(name) values('admin_b');
select *[字段列表] from 表名[查询条件];
delete from 表名[删除条件];
update 表名 set 字段1=新值1,字段n=新值n [修改条件];

SPA
单页Web应用（single page web application，SPA）： SPA 是一种特殊的 Web 应用，是加载单个 HTML 页面并在用户与应用程序交互时动态更新该页面的。它将所有的活动局限于一个 Web 页面中，仅在该 Web 页面初始化时加载相应的 HTML 、 JavaScript 、 CSS 。一旦页面加载完成， SPA 不会因为用户的操作而进行页面的重新加载或跳转，而是利用 JavaScript 动态的变换 HTML（采用的是 div 切换显示和隐藏），从而实现UI与用户的交互。在 SPA 应用中，应用加载之后就不会再有整页刷新。相反，展示逻辑预先加载，并有赖于内容Region（区域）中的视图切换来展示内容。

nginx
高性能http和对web服务器反向代理，(代理tomcat)
代理服务器，自动把用户的行为转发到服务器上
给原有的服务器提供负载均衡，相当于加一层架构，统一管理
性能优化好，并发能力强
````

