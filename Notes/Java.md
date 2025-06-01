### 介绍

```

```



#### DOS命令基础

```
cmd

D:
盘符号码+:
cmd切换盘符的方式

cd tuling

cd ..
返回上一层目录
../
上一级路径
./
当前路径

cd\
回退到盘符目录

exit
退出

查看文件夹下的文件
dir

md test2
echo helllo,tuling>demo.txt
del demo.txt
rmdir 目录名 只能删除空的文件夹
cls
ipconfig 以太网适配器，ipv4地址
ping www.baidu.com
exit

① 使用 ↑ 键，可以快速定位到上一次执行的命令
② 使用 tab 键，能够快速补全路径
③ 使用 esc 键，能够快速清空当前已输入的命令
④ 输入 cls 命令，可以清空终端

一个斜线是转义，两个斜线是真正的斜线
```

#### Java语言概述

```
机器语言 汇编语言 高级语言
Java 高级语言 面向对象 贴近人类思维，模拟现实世界 简单 跨平台
Java SE J2SE 面向桌面级应用
Java EE J2EE web应用开发
```

#### Java环境搭建

```
JVM Java虚拟机 JVM没有跨平台，Java语言是跨平台的
JRE Java Runtime Eviroment 运行Java环境
JDK Java Development Kit 开发者工具包
JDK>JRE>JVM
C:\Program Files\Java\jdk-17.0.1\bin，一些可执行文件
C:\Program Files\Java\jdk-17.0.1\include 一些头文件，JVM底层是C++写的
java.exe运行
javac.exe编译
.jar java程序的压缩包
src.zip源码
不配环境变量的话，得切换到C:\Program Files\Java\jdk-17.0.1\bin目录，才可以在DOS识别java命令
环境变量在系统变量下话，所有用户都可以生效
没jre和db文件夹
新版不需要配置环境变量classpath了
```

#### 第一个Java程序

```
编写程序 编译程序 JVM运行
javac，java compile，编译
public 访问修饰符
static静态
void表示这个方法没有返回值
main表示方法名，特殊的，主方法
class是类的意思，是关键字，后面的是类名，类名都是标识符
String[] args方法名参数列表，[]数组的意思，()方法的标识
System.out.println("123");打印双引号里面的内容，打印之后换行
System.out.print("123");打印之后不会换行
javac -encoding utf-8 HelloWorld.java使用该格式编译

javac Hello.java
java Hello

```

#### Java语言运行机制

```
核心机制：垃圾回收
系统线性跟踪存储空间的发脾气情况，在JVM空闲时，检查并释放那些可被释放的存储空间
C/C++由程序员负责回收无用内存
Java程序员无法精确控制和干扰垃圾回收
```

#### 基础语法

```
关键字、保留字

标识符

变量

Java基本数据类型

运算符
算术运算符

赋值运算符

关系运算符

逻辑运算符

程序流控制
选择结构(分支结构)
循环结构

输出完不换行
System.out.print("11"+a);

输出完换行
System.out.println("11"+a);
```

#### 常量

```
'Hello'
666
13.14
'A','0'
true,false
null
```

#### 计算机存储单元

```
计算机存储设备的最小信息单元
位/bit/比特位/

计算机最小存储单元
字节/byte/B/8个位组成

1B=8bit
1KB=1024B

```

#### 数据类型

```
整数默认int类型
浮点数默认double类型
long类型整数定义的时候得在后面加l
float类型浮点数定义的时候得在后面加F
```

#### 命名

```
小驼峰
方法、变量
大驼峰
类
```

#### 类型转换





Ctrl+Alt+V

Ctrl+Alt+Ins

