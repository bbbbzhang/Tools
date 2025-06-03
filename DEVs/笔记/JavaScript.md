# JS

#### 简介

```
js是高级语言\脚本语言\解释型语言\面向对象\ECMAScript

脚本语言\解释型语言
是指源代码不需要预先进行编译，在运行时，要先进行解释再运行。解释型语言执行效率低，但跨平台性好。

编译型语言
是指程序在执行之前需要一个专门的编译过程，把程序源文件编译为机器语言的文件，运行时不需要重新编译，执行效率高，但缺点是，编译型语言依赖编译器，跨平台性差。

JS组成的三部分:
ECMAScript简称es
标准，规定了JS的基础语法规范
DOM
页面文档对象模型，可以操控网页
BOM
浏览器对象模型，可以操控浏览器

书写位置
行内式：了解就好
内嵌式：用script标签包起来
外部JS文件：script标签中间不可以写代码

数字可以加引号，也可以不加
汉字、英文文本要加单引号
打印变量时，输的变量名称，不加引号

每行代码写完，加分号（;）,表示一行代码结束，比较标准
不加分号时，换行也行，不标准

JS多行注释默认快捷键：Shift+Alt+A
JS单行注释默认快捷键：Ctrl+/

JS多行注释：/* */
JS单行注释：//
CSS注释：/* */
HTML注释<!-- -->

V8引擎，JS引擎
```

#### 执行机制

````js
JavaScript的执行环境是单线程
JS引擎中负责解释和执行JavaScript代码的线程只有一个，同一时间只能做一件事

JavaScript的任务
分为同步任务和异步任务。对于异步任务队列来说，又分为宏任务和微任务

JavaScript执行顺序：
进入整体代码后，开始第一次循环。
先执行主线程的任务(微任务)，
每当执行函数的时候，就把函数推入执行栈中
有异步的操作就让浏览器的线程（webAPI）去处理，处理完放到任务队列里，
当主线程（执行栈）执行完毕时，如果任务队列里有任务，再次从其中的一个任务队列开始(宏任务)，再执行(微任务)，

也就是一次只能完成一项任务，这个任务执行完后才能执行下一个，它会「阻塞」其他任务，这个任务可称为主线程
如果之间某一行出错，则直接停在那里，不往下执行
微任务的优先级高于宏任务，宏任务和微任务是交替进行的，
宏任务中有可能产生微任务，微任务中有可能产生宏任务

JavaScript为什么是单线程呢？
作为浏览器脚本语言，JavaScript的主要用途是与用户互动，以及操作DOM。
这决定了它只能是单线程，否则会带来很复杂的同步问题。
假设JavaScript同时有两个线程，
一个线程在某个DOM节点上添加内容，另一个线程删除了这个节点，这时浏览器应该以哪个线程为准？

单线程
就意味着，所有任务需要排队，前一个任务结束，才会执行后一个任务。
如果前一个任务耗时很长，后一个任务就不得不一直等着。
多线程
可以将任务放到不同的线程中去处理。
CPU的调度单位是线程，它会在不同的线程之间切换，任务是隶属于线程的。

同步操作/调用/代码/任务/非耗时任务
在主线程上排队执行的任务，只有前一个任务执行完毕，才能执行后一个任务，
从上到下执行
Promise构造函数中的代码是同步的

异步操作/调用/代码/任务/耗时任务
分为宏任务和微任务
不进入主线程，而进入“任务队列”的任务，
在同步代码执行完成之后，“任务队列”通知主线程，某个异步任务可以执行了，该任务才会进入主线程执行。

Event Loop（事件轮询）
主线程从“任务队列”中读取事件，循环不断的，运行机制
这个“任务队列”都是已经完成的异步操作

宏任务:
定时器
事件绑定（事件处理函数）
ajax通常使用异步（也可以设置为同步）
回调函数
generator
async和await
script标签内的代码

微任务:
Promise.then\catch\finally
process.nextTick
````

#### 输入输出语句

```
prompt('请输入你的年龄');
弹出输入框，可以输入，学习阶段用，取的值是字符型的

alert('恭喜');
弹出警示框，输出框，学习阶段用

console.log('我是程序员才能看到')
控制台输出（打印），给程序员看的 ，F12，开发阶段用

console.dir(window)
可以显示一个对象的所有属性和方法
```

#### 变量

```js
白话：一个装东西的盒子
通俗：用于存放数据的容器，通过变量名获取数据，可以更改数据
本质：变量是程序在内存中申请一块用来存放数据的空间

pai=3.14
意思是把3.14存到pai里面来进行保存，（因为这样更加方便快捷）

全局变量
在全局作用域中声明的变量、未声明即赋值的变量（变量在函数内部直接赋值，没有声明，就是全局变量）
在全局作用域的任何位置都可以使用

局部变量
在局部作用域中声明的变量、形参
在当前局部作用域中使用（或者说是一个大括号内）

命名规定
由字母(A-Z a-z)、数字(0-9)、下划线(_)、美元符号($)组成
区分大小写
不能以数字开头
不能是关键字或者保留字(有特殊意义的单词，比如var for while if等)
不能用name、top，虽然既不是关键字也不是保留字，但其在某些浏览器里面有特殊意义
（name为Windows的默认属性，top为Windows的固有属性，上层窗口的窗口对象）

命名规范
变量名必须有意义
遵循驼峰命名法，首字母小写，后面单词首字母都大写

先声明，后赋值
变量之间可以相互赋值

声明
或者说是创建变量
var关键字+空格+变量名+;
var age;

赋值
把值存入这个变量中
变量名+空格+等于号+空格+值+;
多次给变量赋值，则以最后一次的赋值为准
age = 18;

声明多个变量
只写一个var，多个变量名之间用英文逗号隔开，最后加分号
var name = zero;
var age = 10;
var gz = 2000;
等同于
var name = zero,
	age = 18，
	gz = 2000;
	
只声明，不赋值
结果是undefined，未定义的
var sex;
console.log(sex);

不声明，不赋值
直接使用某个变量，会报错
console.log(sex);

不声明
直接赋值使用，可以使用，不过不提倡，因为会变成全局变量，会影响变量的作用域
qq=110;
console.log(qq);

更新变量
后面的新的值会把老的给覆盖掉

输出结果
一种打印方法：console.log(age);

初始化
声明和赋值一起执行，声明一个变量，并赋值
var myname = 'zero';
console.log(myname);
声明了一个叫myname的变量，赋了一个叫zero的值

用户输入数据（比如姓名），存储到一个myname变量里面，prompt提供输入框，
然后用alert弹出小框，输出该变量名里面的值
var myname = prompt('请输入你的名字');
alert(myname);
```

#### 声明变量的三种方法

```js
var       声明变量   没有块级作用域           有声明提升
let	      声明变量   有块级作用域\暂时性死区   没声明提升   
const     声明常量   有块级作用域\暂时性死区   没声明提升   要赋初始值(初始化),高效

let和const不允许重复声明变量，var允许重复声明同一变量，在同一作用域内

常量
内存地址\栈中的值，不可更改的量

eg：
let arr = [];
for (let i = 0; i < 2; i++) {
	arr[i] = function () {
	console.log(i);
	}
}
arr[0]();
arr[1]();

每次循环都会产生一个块级作用域，每个块级作用域中的变量都是不同的
函数执行时输出的是自己上一级（循环产生的块级作用域）作用域下的i值
```

#### 作用域(变量)

```
变量在某个范围内起效果

全局作用域
一整个页面

局部作用域(函数作用域)
仅限于‘函数体’内部声明的变量，只有在函数调用的时候才能产生局部作用
在函数体(大括号内部)，无论使用什么关键字声明var/let/const都是局部作用域
函数内部可以读取外部的全局变量，外部无法读取内部的局部变量；
函数内部声明变量的时候，一定要使用var命令。如果不用的话，实际上是一个全局变量。

块级作用域
JS在ES6新增的，花括号
局部作用域优先级 > 块级作用域

作用域链
采取链式查找方式的访问机制，就近原则
操作某个变量时，
会从当前作用域开始依次向上层作用域中查找该变量
若全局作用域中也没有该变量，
赋值操作则把当前变量当做全局变量，取值操作则报错

预解析(变量和函数)
浏览器执行js代码时，让当前作用域中的声明部分先执行
先提升var，再提升function
只提升声明，不提升赋值
函数重名，则下边的会覆盖掉上边的
声明变量: var 变量
声明函数: function 函数名(){}
```

#### 数据类型

`````
为什么需要数据类型？
由于计算机中，不同数据所占用的存储空间不同
为了便于把数据分成所需内存大小不同的数据，充分利用存储空间，所以定义了不同的数据类型
`````

##### 字面量

````js
字面量
是数据的格式特征，变量的字符串表示形式。它不是一种值，而是一种变量记法。

eg:
var a = 1  　		 　//1是字面量
var b = 'css'　　		  //css是字面量
var c = [5,6,7] 　　     //567是字面量
var d = {"my","box"} 　　//{"my","box"}是字面量
{}					   对象的字面量
````

#### 简单数据类型

```
简单数据类型\基本数据类型\值类型
在变量（栈空间）中存储真实的数据
number，string，boolean，null，undefined，symbol，bigInt

传参
函数的形参也可以看做是一个变量，
当把一个值类型变量作为参数传给函数的形参时，
其实是把变量在栈空间里的值复制了一份给形参，
那么在方法内部对形参做任何修改，都不会影响到的外部变量。
```

数字型Number

```
整数、小数(浮点数)
八进制前面加0，十六进制前面加0x
最大值：Number.MAX_VALUE,1.7976931348623157e+308
最小值：Number.MIN_VALUE,5e-324
无穷大：Infinity
无穷小：-Infinity
非数值：NaN(意思是Not a number)
eg：
<script>
    console.log("ABC"-123);
</script>
结果是：NaN

isNaN()方法
判断一个变量是否为非数字类型，是否为纯数字
不是用来检测是否为数字型的，比如输入NaN则返回为true
isNaN(x),x是数字，返回false；x不是数字，返回true
eg：
<script>
    console.log(isNaN(12));
</script>
结果是：false
<script>
    console.log(isNaN('二'));
</script>
结果是：true

NaN == NaN 的执行结果是 false。
因为JavaScript规定，NaN表示的是非数字，但是这个非数字也是不同的，
因此 NaN 不等于 NaN，两个NaN永远不可能相等。
```

字符串型String

```
遇到引号嵌套关系时，遵循：外双内单，或外单内双
引号中间什么都不写，也是字符串，空字符串

\要转义的字符     字符串转义，都是\开头，要写到引号里面
\n				换行符，n是newline的意思			
\\				斜杠\
\`				‘单引号
\t				tab缩进
\b				退格符，b是blank的意思，想要空格直接打空格

字符串长度
length属性
可以获取整个字符串的长度
eg：
var strMsg = "百度 一下！";
alert(strMsg.length);
结果是：6
console.log('aa'.length);
结果是：2

拼接字符串
多个字符串之间可以使用+进行拼接，
拼接方式：字符串+任何类型=新字符串
数值相加，字符相连，从左往右加

eg：
console.log(12+12+'12');
结果是：2412
console.log('12'+13+14);
结果是：121314

引引加加
var age = 19;
console.log('我' + age +'岁了');
结果是：我19岁了

使用alert语句弹出警示框(输出结果)
var age = prompt('请输入你的年龄');
var str = ('你今年'+age+'岁了');
alert(str);

字符串具有不可变性
多次拼接，会多次占用内存资源，尽量少拼接

字符串为什么可以调用属性和方法?
在字符串调用属性和方法时，
浏览器内部使用基本包装类型，
把字符串包装成对象之后，再去调用的属性和方法
var str = "demo"
str.length

var temp = new String("demo")
temp.length
```

布尔型Boolean

```js
true、false，等价于1和0
参与数学运算时，当做1和0来看
```

未定义Underfined

```js
未赋值的变量
如果一个变量声明了，但未赋值，则输出Underfined
underfined和字符相加，结果是undefined和字符相连
underfined和数字相加，结果是NaN

eg:
var variable = undefined;
console.log(variable + 'pink');
结果是：undefinedpink
var str;
console.log(str + 'pink');
结果是：undefinedpink

打印(输出)Undefined
变量被声明了，但没有赋值时，会（输出）打印undefined
调用函数时，应该提供的参数没有提供，该参数（输出）打印undefined
对象没有赋值的属性，该属性的值为undefined 
函数没有返回值时，默认返回undefined 
```

空值Null

````
null和字符相加，结果是null和字符相连
null和数字相加，结果是数字本身

对象原型链的终点
````

唯一标识符Symbol

````js
ES6新增的一种基本数据类型

建Symbol类型值
let id = Symbol();

注意
没有关键字new,id是Symbol的实例化对象。

Symbol()的参数是Symbol的描述
let id = Symbol("ID");
意思是：id是描述为ID的Symbol
Symbol是唯一的，即使描述相同的Symbol值也不相等，描述只是一个标签

显示Symbol
console.log(id.toString())

获取Symbol的属性
console.log(id.description)

使用Symbol创建隐藏属性
代码的其他任何部分都不能访问该属性，从而防止第三方代码更改我们的代码
let idz=Symbol("id");
let user={
	name:"Join";
	age:31;
	[id]:1//Symbol是一个键，不是属性，所以要加中括号[]
}
console.log(user[id]);//1

Symbol不参与for..in循环
for(let key in user ){
	console.log(key)//name、age,没有Symbol的描述：[id]
}

Object.assign()能够同时复制字符串和Symbol属性
let obj=Obj.assign({},user);
console.log(obj[id])//1

Symbol.for(key)
创建相同的Symbol实体
let id = Symbol.for("id");
let idAgin = Symbol.for("id");
console.log(id == idAgin);//true

Symbol.toPrimitive
将object转换为原始值

Symbol.iterator
迭代操作

Symbol.getOwnPropertyStymbols(obj)
获取对象所有的Symbol属性

Reflect.ownKeys(obj)
返回对象包括Symbol键在内所有属性和方法

let idw=Symbol("id");
let idx=Symbol("id2");
let user={
	name:"Join",
	age:31,
    sayHi(){
		console.log( this.name);
	},
[idw]:1,
[idx]:2
};
console.log(Object.getOwnPropertySymbols(users));
console.log(Reflect.ownKeys(users));

注意
对象中Symbol键不是Symbol的描述，而是Symbol的名字
````

#### 复杂数据类型

````
复杂数据类型\引用数据类型
在堆中存储 真实的数据，在栈中存储 真实数据在堆中的地址
通过 new 关键字创建的对象（系统对象、自定义对象），如 Object、Array、Date、RegExp、Function等

内存分配
引用类型变量（栈空间）里存放的是地址，真正的对象实例存放在堆空间中

传参
函数的形参也可以看做是一个变量，
当我们把引用类型变量传给形参时，
其实是把变量在栈空间里保存的堆地址复制给了形参，
形参和实参其实保存的是同一个堆地址，所以操作的是同一个对象

注意
变量之间相互赋值，传递的是栈中的值，复杂数据类型的变量相互赋值之后会相互影响

栈（操作系统）
存放函数的参数值、局部变量的值等，由操作系统自动分配释放，其操作方式类似于数据结构中的栈
简单数据类型存放到栈里面

堆（操作系统）
存储复杂类型(对象)，一般由程序员分配释放，若程序员不释放，由垃圾回收机制回收
复杂数据类型存放到堆里面
````

#### 数据类型转换

````
把一种数据类型的变量转换成另外一种数据类型
````

##### 转换为字符串型

```js
toString()						 转换成字符串
String()强制转换				  转换成字符串
加号拼接字符串					   和字符串拼接,隐式转换，推荐

eg:
var num = 1; 
var str = num.toString();
console.log(str);
console.log(typeof(str));
结果是：黑色字符串1
var num = 1; 
console.log(String(num));
结果是：黑色字符串1
var num = 1;
alter(num+"我是字符串");
结果是：黑色字符串1
```

##### 转换为数字型

```js
parseInt(变量)
把字符型转换为数值型，整数，取从首字符开始的第一个整数，如果没有，结果是是NaN

parseFloat(变量)
把字符型转换为数值型，得到小数、浮点数

Number(变量)
把对象参数转换为表示对象值的数字
如果该值无法转换为合法数字，则返回 NaN

字符串转换为数值
1.console.log(parseInt(age))
转换为整数且不会进位
可以去除单位，首字符需要为数值
2.console.log(parseFloat('3.14'))
也会去除单位
3.console.log(Number('123.23'))
可以取小数点后
带了单位会显示NaN
4.字符型的减去0就可以转换，或者乘1
不要用+

浮点数精度问题
0.1 + 0.2 == 0.3
console.log(0.1 + 0.2 == 0.3);结果是false
编译器是转化为二进制进行计算的
由于浮点数精度问题造成的，不仅是JavaScript，所有采用IEEE754的64位双精度的语言都是如此。
```

##### 转换为布尔型

```js
'' 0 -0 NaN(数字类型) null undefined false
这七个转换为Boolean值为false
其他的都会转换为true

console.log(Boolean(0));
结果是：false
```

##### 隐式转换

```
字符串转数字*1 -0 /1 字符串前面加+

-、+、/、*：数字和字符串互相隐式转换
alert将所有类型都强转为string类型输出
prompt接收到的数据是string类型的

不同类型的值进行比较
if(a==1&a==2&a==3){console.log("OK")}

JavaScript中当遇到不同类型的值进行比较时，会根据类型转换规则试图将它们转为同一个类型再比较。
比如 Object 类型与 Number 类型进行比较时，Object 类型会转换为 Number 类型。
转换时会尝试调用 Object.valueOf 和 Object.toString 来获取对应的数字基本类型。
```

#### 运算符

**算术运算符**

```
+	-	*	/	%
不能直接拿浮点数进行运算、比较                                    
```

**自增自减运算符**

```
++	--
必须和变量配合使用

++num
自增1之后再运算	相当于num=num+1
num++
运算完之后自增1	先返回原值进行运算，运算完，再自增1
```

**比较运算符**

```
返回布尔值
只能两两比较
<
>
>=
<=
=			赋值
==			等于，等号会默认转换数据类型，会把字符型数据转换为数字型
!=			不等于
===			全等,要求两侧的数据值和数据类型完全一致
!==			全不等于

不要比较字符串，因为字符串之间会一位一位比数值
eg:
console.log('6'>'15');
结果是：true
因为6比1大

等于和全等的区别
等于（==）值相等就可以返回true
全等于（===）值和类型都相同返回true
eg:
console.log(18 == '18');
结果是：true;
console.log(18 === '18');
结果是：false;
```

**逻辑运算符**

```
&&	   逻辑与		 and
||	   逻辑或		 or
!	   逻辑非		 not

与布尔值有关系，一般返回布尔值

eg：
表达式1 && 表达式2 
返回
表达式1 或者是 表达式2 的值

表达式1  ||  表达式2 
返回
表达式1 或者是 表达式2 的值

!表达式1
返回
表达式1的boolean值取反后的结果 

短路运算(逻辑中断)
逻辑中断逻辑与
如果表达式1结果为真，则返回表达式2，如果表达式1为假/空字符串，则返回表达式1/空字符串

逻辑中断逻辑或
如果表达式1结果为真，则返回表达式1，如果表达式1为假/空字符串，则返回表达式2

eg:
123 && 456
因为123为true，所以会返回456
0 && 456 
返回0，0为false，所以不会到下一步
123 || 456
返回123
0 || 456
返回456

结果为假的表达式
转换为Boolean值后为false
```

**赋值运算符**

```
=	+=	-=	*=	/=	%=

赋值表达式的值是等号右边的值
num += 2相当于num=num+2
```

**运算符优先级**

```
小括号			 ()
一元运算符		++ 	-- 	!
算术运算符		先*/% 后+-
关系运算符		> 	>= 	< 	<=
相等运算符		==	 !=	 ===	 !==
逻辑运算符		先&& 后||
赋值运算符		= 	+=	 -=	 *=	 /=	 %=
逗号运算符		，
```

#### 逻辑语句

````
流程控制
让代码按照不同的结构顺序来执行
顺序结构、分支结构、循环结构
````

if**语句**

```js
if(条件表达式){
	//执行语句1
}
else{
	//执行语句2
}
如果条件表达式(转换为boolean值后)结果为真，则执行语句1，如果表达式为假，则执行语句2
```

**if else if  多分支语句**

```js
多分支，既多选一
if(条件表达式1){
	//执行语句1
}
else if(条件表达式2){
	//执行语句2
}
else if(条件表达式3){
	//执行语句3
}
else{
	//当以上条件都不满足时执行该语句
}

如果条件表达式1满足，则执行语句1，
如果条件表达式1不满足，则判断条件表达式2，执行语句2
如果使用条件表达式都不满足，则执行最后的else里面的语句
最后的else可以不写
```

**三元表达式**

```js
简化版的if/else

var num = 10;
var result = num > 5 ? '是的' : '不是的';
console.log(result);
结果是：是的
```

**switch分支语句**

```js
switch(条件表达式){
    case value1:
    	执行语句1;
    	break;
    case value2:
    	执行语句2;
    	break;
    ...
    default:
    执行最后的语句;
}
case是小例子或选项
break可以退出循环
表达式和哪个value相匹配，执行哪个语句
如果都没匹配上，执行default下面的语句
最后的default可以不写，是默认执行语句
分支多了用switch
```

**for循环语句**

```js
for循环比while和do while完整规则一些，用的多

初始化变量：用var声明的一个普通变量，通常用于作为计数器使用
条件表达式：用来决定每一次循环是否继续执行，就是终止条件，可以写true，死循环，得加个中断条件
操作表达式：每次循环最后执行的代码，经常用于我们计数器变量进行更新(递增或递减)

可以重复执行某些代码,让程序变得更简单高效
i是index(索引)首字母

for(初始化变量;条件表达式;操作表达式){
	//循环体
}

for循环可以重复执行不同的代码
for(var i = 1;i <= 100; i++){
	console.log('这个人今年' + i + '岁了');
}

没有终点的for循环
for（var i = 1; true; i++){

}
```

**while循环语句**

```js
当...的时候
当条件表达式结果为true，则执行循环体，为false则，退出循环
计数器，初始化变量，操作表达式

确定循环次数的时候，用for
不知道循环次数的时候，用while

while (条件表达式) {
	//循环体
}

var num = 1;
while (num <= 100) {
    console.log('你好');
    num++;
}
```

**do while循环语句**

```js
比while简单一些
先执行一次循环体，再去判断，
当条件表达式结果为true，则执行循环体，为false则，退出循环

do {
	//循环体
} while (条件表达式)

var sum = 0;
var j = 1;
do {
    sum += j;
    j++
} while(j <=100)
colsole.log(sum);
```

**continue关键字**

```js
continue退出本次循环，继续下一次循环，不影响后面的循环

for(var i =1; i <=5; i++){
	if(i == 3){
        continue;
    }
    console.log('我正在吃第'+i+'个包子');
}
结果是：我正在吃第1个包子
	   我正在吃第2个包子
	   我正在吃第4个包子
	   我正在吃第5个包子
```

**break关键字**

```
结束当前层循环，立即跳出整个循环（循环结束）
```

#### 数组

```js
一组数据的集合，其中每个数据被称作元素

作用
保存记录信息用变量，变量太多不方便，数组是为了更加方便快捷的记录信息，起变量名也会更加方便

数组元素：数组里面存储的数据
数组的索引：用来访问数组元素的序号，从0开始

数组里面的数据要用逗号分隔
数组里面的数据类型没有限制，甚至可以存放一个数组

创建数组(利用new关键字)
var 数组名 = new Array();	//创建一个新的空数组
参数：
一个参数，设置数组的长度    var arr = new Array(2)
多个参数，设置数组的内容    var arr = new Array(2,3,4,5)

创建数组(利用数组字面量)
var 数组名 = [];
var arr = [];
var arr1 = [1,2,'小李',true]

获取数组元素
数组名[索引号]
var arr = ['小马','小李','小周'];
console.log(arr[2]);
结果是：小周

数组长度
数组名.length
动态检测数组元素的个数，可读写的
设置的长度比原来的长度大，会产生空位置
如置的长度比原来的长度小，会删除多出来的元素
var arr = ['red', 'green', 'blue', 'pink'];
arr.length = 5;
console.log(arr);

遍历数组
把数组的元素从头到尾访问一次

创建数组
let a = Array.from(Array(101), (v, k) => k)
等同于
let b = Array.from(Array(101).keys())

let b = Array.from(Array(101).keys()).reduce((prev, cur) => {
    return cur + prev
})
console.log(b);

新增数组元素
1.通过修改索引号
	索引号相同，原数据可以被替换
2.直接给数组名赋值，会覆盖掉数组元素
	如果给新数据设置的索引值，过大，则会产生空位置，过小，则会覆盖之前的元素
	新添加的元素的索引值，应该比当前数组的最后一个元素的索引(即当前数组长度)值大1
3.直接以数组的长度为索引值，刚好比数组本来的索引值大1，刚好在数组的后面添加一个新元素
var arr = ['red', 'green', 'blue', 'pink'];
arr[5] = 'pink';
console.log(arr);

var arr = ['red', 'green', 'blue', 'pink'];
arr[arr.length] = black;
```

#### 函数

##### 简介

````js
一段可被重复执行的代码块
声明函数的关键字function

函数不调用，自己不执行

函数名
一般是动词，与变量名的命名规则一致

函数的参数
可有可无，多个实参、形参的时候，参数间用逗号隔开

函数的封装
把一个或多个功能通过函数的方式封装起来

函数名(实参1,实参2,实参3....);
对象.方法名();
new 函数名();
(函数体)()

利用函数关键字声明函数
function fu(){
}

利用函数表达式声明函数
var fun = function foo(){
}
foo()会报错，foo只是fun变量指向的函数的内部标识符

创建对象的函数（构造函数的名称一般第一个字母大写）
模具 说明书

function Star(starName, starAge, starSex) {
	this.name = starName;
	this.age = starAge;
	this.sex = starSex;
	}
new Star("刘德华",20,"男")

new Function('参数1','参数2', '函数体');
var f = new Function('a', 'b', 'console.log(a + b)');
f(1, 2);

调用函数
函数名(实参1,实参2,实参3....);
对象.方法名();
new 函数名();
(函数体)()

注意
利用函数关键字声明函数，在声明前后都可以调用
利用函数表达式声明函数，只能在声明之后调用

打印函数
console.log(函数名);

返回值return
return后面什么都不写 或者 函数后面没有return时，返回underfined
函数遇到return，就会把return后面的结果，返回给函数的调用者，return只能返回一个值
return后面的代码不会被执行，return应该出现在函数的最后面，一般用来结束函数。终止当前函数并返回当前函数的值

浏览器认为return后面的换行是结束当前代码

形参
默认值是underfined
形式上的参数
类似于一个变量
在定义声明函数的小括号里面，声明函数的时候括号里的参数
用来接收实参

实参
实际的参数
类似于一个变量的值
在调用函数的小括号里面，调用函数的时候形参所对应位置的参数
实参是传递给形参的

函数形参和实参个数不匹配的问题
如果实参的个数多于形参的个数，会取到形参的个数，多出来的实参无形参接收(丢弃)
如果实参的个数少于形参的个数，多余的形参定义为underfined
````

##### new操作符

```js
new操作符的工作流程
创建一个空对象，把this指向该对象（隐式），同时还继承了该函数的原型
给该空对象动态添加属性和方法
隐式的返回this（创建和返回都是隐式的）

// 代码实现
function newFactory(constructor){
    var obj = {}
    obj.__proto__=constructor.prototype
    constructor.apply(obj.Array.prototype.slice.call(arguments,1));
    return obj
}
function Test(name){
    this.name = name
}
var t = newFactory(Test,'tom')
console.log(t.name) // 'tom'
```

##### 立即执行函数

```
自执行函数
(function(){ 代码 })()
(function(){ 代码 }())

作用
独立创建了一个作用域, 里面所有的变量都是局部变量 不会有命名冲突的情况

使用场景
当页面引入了多个功能独立的js文件时（a.js-页面交互  b.js-登录功能  c.js-上传文件功能），
可以把不同js文件的代码封装在不同的立即执行函数中
```

##### 箭头函数

```js
ES6中新增的定义函数的方式
用来简化函数定义语法
function去掉，小括号和大括号之间加箭头
() => {} //()：代表是函数； =>：必须要的符号，指向哪一个代码块；{}：函数体

箭头函数与普通函数的区别
1. 箭头函数是普通函数的简洁表示
2. 箭头函数不能作为构造函数使用，也就是不能使用new关键字
3. 箭头函数没有原型属性
4. 箭头函数不能做generator函数，不能使用yield关键字
5. 箭头函数的this是他所在的作用域的this，不会受到call、bind、apply的影响

const fn = x =>  ({uname})    箭头函数还可以返回对象，但是必须用小括号包含

var fn = function (num) {
	console.log(num+10)
}
fn(1)
结果是：11

var fn = (num) => {
	console.log(num+10)
}
fn(1)
结果是：11
```

关于大括号

```
如果函数体中只有一句代码，并且代码的执行结果就是函数的返回值，函数体大括号(和return)可以省略
返回对象的时候，用小括号包起来
```

关于小括号

```
如果形参只有一个，形参外侧的小括号也是可以省略的

var fn = num => console.log(num + 10);
fn(1)
结果是：11
```

箭头函数的this

```js
箭头函数没有自己的this关键字
定义箭头函数中的作用域的this指向谁，箭头函数中的this就指向谁
解决了匿名函数this指向的问题(匿名函数的执行环境具有全局性)
包括setTimeout和setInterval中使用this所造成的问题

function fn () {
	console.log(this);
	return () => {
		console.log(this)
	}
}
const obj = {name: 'zhangsan'};
const resFn = fn.call(obj);
resFn();
结果是：{name: 'zhangsan'}{name: 'zhangsan'}

var age = 100;
var obj = {
	age: 20,
	say: () => {
		alert(this.age)
	}
}

obj.say();
对象不能产生作用域，所以箭头函数指向window
结果是：100
```

#### 对象

##### 简介

```js
属性和方法的集合，给每一个存储的数据起一个名字

自定义对象、内置对象、浏览器对象
前面两种对象是JS基础内容，属于ECMAScript
第三个浏览器对象属于JS独有的

字面量创建一个空对象
var obj = {}; 

通过new关键字创建对象(对象的实例化)
所有对象都可以通过new的方式来创建
var obj = new Object(); 

调用对象的属性和方法
对象名.属性名
对象名['属性名']
对象.方法名()

修改对象的属性和方法
对象.原属性名 = 新数据
对象.原方法名 = 新函数体

为对象添加新属性和方法
对象.新属性名 = 新数据
对象.新方法名 = 新函数体
把每个数据都存储给对象，如果对象没有以该数据命名的属性时，就为1

删除对象的属性
delete 对象.要删除的属性名

遍历对象
for(var 变量名 in 对象){
    变量表示对象属性名（是一个字符串）
    对象[变量名]
    console.log(key)
	console.log(obj[key])
    }
变量名一般起k或key

类和对象
类：模板，用来创建一类对象
对象：用类创建出来的一个对象（实例对象）
创建类：创建一个用来创建对象的模板

类抽象了对象的公共部分，泛指某一大类(class)
对象特质某一个，通过实例化一个具体的对象
eg:
Star是一个类，一个创建对象的模板
ldh是一个对象，由一个类创建出来的对象

in
判断对象中是否有该属性，有则返回true
eg：
var obj = {
        id: 1,
        name: 'haha',
        price: 100,
    };
console.log('haha' in obj)

属性的简洁表示
如果对象的键和值一样，只需写一个 就行了
```

#### 内置对象

```js
JS 语言自带的一些对象，这些对象供开发者使用，并提供了一些常用的或是最基本而必要的功能（属性和方法）
优点：帮助我们快速开发

Math、 Date 、Array、String等
内置对象很多，用的时候查文档，推荐查MDN
```

##### arguments

`````js
调用一个没有设置形参的方法时，传入的参数会被存在arguments类数组（伪数组）对象里

函数内部内置对象
其中包括了所有传入的实参
可以通过索引值取出来其中的实参
可以按照数组的方式遍历argument
伪数组，像数组，但是不是数组，具有数组的某些特性
有长度，可以通过索引值取出来其中包括的数据

求输入数值的最大值
function getMax(a, b, c) {
        var max = arguments[0]
        for (var i = 1; i < arguments.length; i++) {
            if (arguments[i] > max) {
                max = arguments[i];
            }
        }
        return max;
    }
console.log(getMax(1, 2, 22));
`````

##### arguments的callee属性 

```js
先把factorial()函数保存到newFactorial变量中，
然后将factorial设置为null，
结果指向原始函数的引用只剩下一个。
在接下来调用newFactorial()时，由于必须执行factorial(),而factorial已经不再是个函数，
所以就会导致错误。
//递归函数
function factorial(num){
    if( num <= 1){
        return 1
    }else {
        return num * factorial(num - 1)
    }
}
var newFactorial = factorial
factorial = null //内存释放
// console.log(newFactorial) //一个函数
// console.log(factorial) //null
console.log( newFactorial(4) ) //报错

arguments.callee()可以返回正被执行的 Function 对象，
消除 函数的执行 与 函数名factorial 紧密耦合的现象
有利于匿名函数的递归或者保证函数的封装性。
这样，无论引用函数时使用的是什么名字，都可以保证正常完成递归调用。
function factorial(num){
    if( num <= 1){
        return 1
    }else {
        return num * arguments.callee( num - 1 )
    }
}
var newFactorial = factorial 
factorial = null
console.log( newFactorial(4)) //24

现在已经不推荐使用arguments.callee()
原因：
访问 arguments 是个很昂贵的操作，因为它是个很大的对象，每次递归调用时都需要重新创建。
影响现代浏览器的性能，还会影响闭包。

现在的解决办法
给内部函数一个名字即可
function factorial(num) {
    return (function fn(num) {
        if (num <= 1) {
            return 1
        } else {
            return num * fn(num - 1)
        }
    })(num)
}
```

##### Math对象

```js
对象里面的方法：
Math.PI：圆周率
Math.max(参数): 求最大值
Math.min(参数): 求最小值
Math.abs(参数参数): 取绝对值
Math.floor(参数): 向下取整  往最小了取值  取更小的整数
Math.ceil(参数): 向上取整  往最大了取值  取更大的整数
Math.round(参数): 四舍五入  其他数字都是四舍五入  .5 特殊 取更大的数
Math.random(): 取随机值 返回值是 0-1之间的小数  [0,1)  取不到1
参数.toFixed(指定小数位数): 可把 Number 四舍五入为指定小数位数的数字

获取指定区间的随机整数
function getRandom(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

Math.floor(1.1)，向下取整1 
Math.ceil(1.1),向上取整

floor是地板的意思
ceil是天花板的意思
```

##### Date构造函数

创建日期对象：new Date(日期参数)

```
1、如果创建的时候没有设置参数，得到的日期对象记录的是当前时间
2、可以传入一个时间格式的字符串  得到记录指定时间的日期对象
3、可以传入若干数字  注意：月份从0开始，0是1月，1是2月

参数示例(2022年1月1日)
2022,0,1
'2022-0-1 10:30:10'
```

日期对象的方法：

```js
日期对象.getFullYear()			获取当前/指定年
日期对象.getMonth()				获取当前/指定月
日期对象.getDate()				获取当前/指定日
日期对象.getDay()				获取当前/指定星期
日期对象.getHours()				获取当前/指定小时
日期对象.getMinutes()			获取当前/指定分钟
日期对象.getSeconds()			获取当前/指定秒钟
日期对象.toLocaleString()		获取当前/指定时区时间
日期对象.valueOf()				返回自 1970 年 1 月 1 日 00:00:00 (UTC) 到当前日期对象的总毫秒数
日期对象.getTime()				同上
Date.now()					   同上，不能传参
+new Date()					   同上

倒计时案例:
function countDown(time) {
    var now_time = Date.now()
    var input_time = +new Date(time)
    var times = input_time - now_time
    var day = parseInt(times / 1000 / 24 / 60 / 60)
    var hov = parseInt(times / 1000 / 60 / 60 % 24)
    var min = parseInt(times / 1000 / 60 / 60 % 60)
    var sec = parseInt(times / 1000 % 60)
    day = day < 10 ? '0' + day : day
    hov = hov < 10 ? '0' + hov : hov
    min = min < 10 ? '0' + min : min
    sec = sec < 10 ? '0' + sec : sec
    return `${day}天${hov}小时${min}分${sec}秒`
}
console.log(
    countDown('2022-5-6 12:0:0')
);
//01天00小时24分16秒
```

##### 类型识别typeof

```js
typeof 数据 或 typeof(数据)
检测简单类型，除了null返回是object
JS是弱类型或动态语言
在代码运行时，变量的数据类型由JS引擎根据=右边变量值的数据类型来判断
JS也有动态类型，相同的变量可用作不同的类型
typeof "John"                // 返回 string
typeof 3.14                  // 返回 number
typeof false                 // 返回 boolean
typeof [1,2,3,4]             // 返回 object
typeof {name:'John', age:34} // 返回 object

var num = null;
console.log(typeof num);
结果是：object
var num = prompt('请输入：');
console.log(typeof num);
结果是：string

弊端
typeof不能确定obj是否是一个对象
var  obj = {};
var  arr = [];
console.log(typeof obj === 'object');  //true
console.log(typeof arr === 'object');  //true
console.log(typeof isNAN == 'object');  //true
console.log(Object.prototype.toString.call(obj));  //[object Object]
console.log(Object.prototype.toString.call(arr));  //[object Array]
console.log(Object.prototype.toString.call(null));  //[object Null]
```

##### 类型识别instanceof

```js
检测构造函数的prototype属性是否出现在某个实例对象的原型链上

判断一个对象是否是某个构造函数的实例，返回布尔值

数据 instanceOf Array/Function/Object

eg:
s instanceof Student
[1,2,3] instanceof Array
```

##### toString()

```js
返回反应这个对象的字符串

【1】undefined和null没有toString()方法
undefined.toString();//错误
null.toString();//错误

【2】布尔型数据true和false返回对应的'true'和'false'
true.toString();//'true'
false.toString();//'false'
Boolean.toString();//"function Boolean() { [native code] }"

【3】字符串类型原值返回
'1'.toString();//'1'
''.toString();//''
'abc'.toString();//'abc'
String.toString();//"function String() { [native code] }"
 
【4】数值类型的情况较复杂
Number.toString();//"function Number() { [native code] }"

1、正浮点数及NaN、Infinity加引号返回
1.23.toString();//'1.23'
NaN.toString();//'NaN'
Infinity.toString();//'Infinity'

2、负浮点数或加'+'号的正浮点数直接跟上.toString()，相当于先运行toString()方法，再添加正负号，转换为数字
+1.23.toString();//1.23
typeof +1.23.toString();//'number'
-1.23.toString();//-1.23
typeof -1.23.toString();//'number'

3、整数直接跟上.toString()形式，会报错，提示无效标记，因为整数后的点会被识别为小数点
0.toString();//Uncaught SyntaxError: Invalid or unexpected token

因此，为了避免以上无效及报错的情况，数字在使用toString()方法时，加括号可解决
(0).toString();//'0'
(-0).toString();//'0'
(+1.2).toString();//'1.2'
(-1.2).toString();//'-1.2'
(NaN).toString();//'NaN'

此外，数字类型的toString()方法可以接收表示转换基数(radix)的可选参数，如果不指定此参数，转换规则将是基于十进制。同样，也可以将数字转换为其他进制数(范围在2-36)
var n = 17;
n.toString();//'17'
n.toString(2);//'10001'
n.toString(8);//'21'
n.toString(10);//'17'
n.toString(12);//'15'
n.toString(16);//'11'

【5】对象Object类型及自定义对象类型加括号返回[object Object]
{}.toString();//报错，Unexpected token .
({}).toString();//[object Object]
({a:123}).toString();//[object Object]
Object.toString();//"function Object() { [native code] }"
function Person(){
    this.name = 'test';
}
var person1 = new Person();
person1.toString();//"[object Object]"

类型识别（最好的类型识别方法）
常常使用Object.prototype.toString()来进行类型识别，返回代表该对象的[object 数据类型]字符串表示
[注意]Object.prototype.toString()可以识别标准类型及内置对象类型，但不能识别自定义类型

console.log(Object.prototype.toString.call("jerry"));//[object String]
console.log(Object.prototype.toString.call(12));//[object Number]
console.log(Object.prototype.toString.call(true));//[object Boolean]
console.log(Object.prototype.toString.call(undefined));//[object Undefined]
console.log(Object.prototype.toString.call(null));//[object Null]
console.log(Object.prototype.toString.call({name: "jerry"}));//[object Object]
console.log(Object.prototype.toString.call(function(){}));//[object Function]
console.log(Object.prototype.toString.call([]));//[object Array]
console.log(Object.prototype.toString.call(new Date));//[object Date]
console.log(Object.prototype.toString.call(/\d/));//[object RegExp]

function Person(){};
console.log(Object.prototype.toString.call(new Person));//[object Object]

function type(obj){
    return Object.prototype.toString.call(obj).slice(8,-1).toLowerCase();
}
console.log(type("jerry"));//"string"
console.log(type(12));//"number"
console.log(type(true));//"boolean"
console.log(type(undefined));//"undefined"
console.log(type(null));//"null"
console.log(type({name: "jerry"}));//"object"
console.log(type(function(){}));//"function"
console.log(type([]));//"array"
console.log(type(new Date));//"date"
console.log(type(/\d/));//"regexp"
function Person(){};
console.log(type(new Person));//"object"

封装检测类型的函数
function detectType(type){
	return function(obj){
		return {}.toString.call(obj) === `[object ${type}]`
	}
}

识别arguments或DOM元素
(function(){
    console.log(Object.prototype.toString.call(arguments));//[object Arguments]
})()
console.log(Object.prototype.toString.call(document));//[object HTMLDocument]

【6】函数Function类型返回函数代码
对自定义函数调用toString()方法时，会得到该函数的源代码；
对内置函数使用toString()方法时，会得到一个'[native code]'字符串。
因此，可以使用toString()方法来区分自定义函数和内置函数

function test(){
    alert(1);//test
}
test.toString();/*"function test(){
                    alert(1);//test
                  }"*/
Function.toString();//"function Function() { [native code] }"
 
【7】数组Array类型返回由数组中每个值的字符串形式拼接而成的一个以逗号分隔的字符串
[].toString();//''
[1].toString();//'1'
[1,2,3,4].toString();//'1,2,3,4'
Array.toString();//"function Array() { [native code] }"

【8】时间Date类型返回表示当前时区的时间的字符串表示
(new Date()).toString();//"Sun Jun 05 2016 10:04:53 GMT+0800 (中国标准时间)"
Date.toString();//"function Date() { [native code] }"
 
【9】正则表达式RegExp类型返回正则表达式字面量的字符串表示
/ab/i.toString();//'/ab/i'
/mom( and dad( and baby)?)?/gi.toString();//'mom( and dad( and baby)?)?/gi'
RegExp.toString();//"function RegExp() { [native code] }"
 
【10】错误Error类型
Error.toString();//"function Error() { [native code] }"
RangeError.toString();//"function RangeError() { [native code] }"
ReferenceError.toString();//"function ReferenceError() { [native code] }"
SyntaxError.toString();//"function SyntaxError() { [native code] }"
TypeError.toString();//"function TypeError() { [native code] }"
URIError.toString();//"function URIError() { [native code] }
```

##### valueOf()

```js
返回对象的原始值
对象类型转换常用两个方法是toString()和valueOf()
这两个方法可以包装类型。

如果存在任意原始值，默认将对象转换为表示它的原始值
对象是复合值，大多数对象无法真正表示为一个原始值，因此默认的valueOf()方法将返回对象本身，而不是返回一个原始值

【1】undefined和null没有valueOf()方法
undefined.valueOf();//错误
null.valueOf();//错误
 
【2】布尔型数据true和false返回原值。布尔型数据的包装对象返回 true 或 false
true.valueOf();//true
typeof true.valueOf();//'boolean'
false.valueOf();//false
typeof false.valueOf();//'boolean'
Boolean.valueOf();//Boolean() { [native code] }
typeof Boolean.valueOf();//'function'

【3】字符串类型原值返回。字符串类型的包装对象返回字符串值
'1'.valueOf();//'1'
''.valueOf();//''
'abc'.valueOf();//'abc'
String.valueOf();//String() { [native code] }
typeof String.valueOf();//'function'

【4】数值类型分为整数和浮点数进行处理。数值类型的包装对象返回数值类型值
Number.valueOf();//Number() { [native code] }
typeof Number.valueOf();//'function'
1、整数直接跟.valueOf()形式，会报错，提示无效标记，因为整数后的点被识别为小数点，所以尽量加括号

0.valueOf(); //Uncaught SyntaxError: Invalid or unexpected token
(0).valueOf(); //0
+0.valueOf(); //Uncaught SyntaxError: Invalid or unexpected token
(+0).valueOf(); //0
-0.valueOf(); //Uncaught SyntaxError: Invalid or unexpected token
(-0).valueOf(); //-0
[注意]-0的valueOf()值是-0，而-0的toString()值是'0'

2、浮点数原值返回

1.23.valueOf();//1.23
+1.23.valueOf();//1.23
-1.23.valueOf();//-1.23
NaN.valueOf();//NaN
Infinity.valueOf();//Infinity
-Infinity.valueOf();//-Infinity
[注意]和toString()不同的是，valueOf()不可以接收转换基数

【5】对象Object类型及自定义对象类型返回原对象
{}.valueOf();//报错，Unexpected token .
({}).valueOf();//Object{}
typeof ({}).valueOf();//'object'
({a:123}).valueOf();//Object{a:123}
Object.valueOf();//Object() { [native code] }
typeof Object.valueOf();//'function'

function Person(){
    this.name = 'test';
}
var person1 = new Person();
person1.valueOf();//Person {name: "test"}
 
【6】函数Function类型返回原函数
function test(){
    alert(1);//1
}
test.valueOf();/*function test(){
                    alert(1);//1
                  }*/
Function.valueOf();//Function() { [native code] }
 
【7】数组Array类型返回原数组
[].valueOf();//[]
[1].valueOf();//[1]
[1,2,3,4].valueOf();//[1,2,3,4]
Array.valueOf();//Array() { [native code] }


【8】和其他对象不同，时间Date类型返回一个数字值，它是当前时间值
Date.now();//1465115123742
(new Date()).valueOf();//1465115123742
typeof (new Date()).valueOf();//'number'
Date.valueOf();//Date() { [native code] }
 
【9】正则表达式RegExp类型返回原正则对象
/ab/i.valueOf();///ab/i
/mom( and dad( and baby)?)?/gi.valueOf();//mom( and dad( and baby)?)?/gi
RegExp.valueOf();//RegExp() { [native code] }

【10】错误Error类型
Error.valueOf();//Error() { [native code] }
RangeError.valueOf();//RangeError() { [native code] }
ReferenceError.valueOf();//ReferenceError() { [native code] }
SyntaxError.valueOf();//SyntaxError() { [native code] }
TypeError.valueOf();//TypeError() { [native code] }
URIError.valueOf();//URIError() { [native code] }

总结
1、toString()和valueOf()的主要不同点在于，toString()返回的是字符串，而valueOf()返回的是原对象
2、由于undefined和null不是对象，所以它们toString()和valueOf()两个方法都没有
3、数值Number类型的toString()方法可以接收转换基数，返回不同进制的字符串形式的数值；而valueOf()方法无法接受转换基数
4、时间Date类型的toString()方法返回的表示时间的字符串表示；而valueOf()方法返回的是现在到1970年1月1日00:00:00的数值类型的毫秒数
5、包装对象的valueOf()方法返回该包装对象对应的原始值
6、使用toString()方法可以区分内置函数和自定义函数
```

#### 数组方法

##### 识别isArray

```
Array.isArray(数据)
返回值是true——是数组   返回值是false——不是数组
```

##### 添加/删除(前)

 ```
unshift
使用方式：数组.unshift(新数据1,新数据2...)
功能：把新数据放到数组的前面 可以放入多个数据
返回值：添加数据之后新数组的长度
shift
使用方式：数组.shift()
功能：把数组第一个数据删除
返回值：删除的数据
 ```

##### 添加/删除(后)

```
push
使用方式：数组.push(新数据1,新数据2...)
功能：把新数据放到数组的后面,可以放入多个数据
返回值：添加数据之后新数组的长度

pop
使用方式：数组.pop()
功能：把数组最后一个数据删除
返回值：删除的数据
```

##### 删除\插入splice

```
数组.splice()
返回值是删除的数组元素

删除元素
数组.splice(开始删除的索引值,删除的元素的数量)

插入元素
数组.splice(开始插入的索引值,0,新数据1,新数据2)

用新的元素替换被删除的元素
数组.splice(开始删除的索引值,删除的元素的数量,新数据1,新数据2)
```

##### 数组翻转reverse

```
数组.reverse()
```

##### 排序sort

```js
arr.sort()
或
arr.sort((a, b) => a - b)
或
arr.sort(function(a, b) {
    return  a - b
})
//默认是a-b升序，可不写，b-a则是降序
```

##### 数组转字符串join

```
数组.join(分隔的标志符)
eg:
arr.join("&")
```

##### 遍历forEach

````
遍历，无返回值
数组.forEach((item, index, arr) => { })
````

##### 遍历map

```
遍历，返回值是一个新数组，新数组中的元素为原始数组元素调用函数处理后的值
数组.map((item, index, arr) => { })

item：数组项 index：数组项索引 arr：遍历的数组

eg：
	let result =  arr.map((item,index,arr)=>{
        console.log(item,index,arr);
        return item*2
      })
```

##### 过滤filter

```
过滤数组，返回一个新数组
数组.filter((item, index, arr) => { })

回调函数返回一个布尔值
```

##### 判断some

```js
判断，返回true或false，有一个值成立就为真，遇到return true；会终止迭代/遍历
数组.some((item, index, arr) => { })
    let flag = arr.some(function(item, index) {
        return item > 10
    })
    console.log(flag);
```

##### 判断every

```js
判断，返回true或false，所有的值都成立才为真，遇到return false；会终止迭代/遍历
数组.every((item, index, arr) => { 
    	return item !== 3;
    })
```

##### 索引元素find

```js
找到数组中符合某个条件的第一个元素
返回该元素
数组.find(item => item.name == "李四")

var arr = [{id: 1,name: '张三'}, {id: 2,name: '李四'}];
arr.find(item => item.name == "李四")
```

##### 查找索引findIndex

```js
findIndex()
找到数组中符合某个条件的第一个元素的索引
返回该元素的索引
数组.findIndex(item => item.name == "李四")
```

##### 递归reduce

```js
reduce从左到右
reduceRight从右到左
归并方法，给每个数组元素执行回调函数
数组.reduce(callback,[initialValue])
为数组中的每一个元素依次执行回调函数，不包括数组中被删除或从未被赋值的元素，
initialValue，可写可不写，作为第一次调用 callback 的第一个参数previousValue。
reduce里面的回调函数callback的四个参数
	previousValue 上一次调用回调函数所返回的值，有初始值则是初始值initialValue
	currentValue 数组中当前被处理的元素(从第二项开始)
	index 当前元素在数组中的索引
	array 调用 reduce 的数组

eg：
var arr = [1, 2, 3, 4, 5];
let result = arr => arr.reduce((prev, cur, index, arr) => 
// console.log(prev, cur, index))
// prev + cur)
// prev * cur)
prev.concat(Array.isArray(cur) ? result(cur) : cur), [2])
console.log(result(arr))
```

##### 判断包含includes

```
判断一个数组是否包含一个指定的值，
如果是则返回 true，否则false
数组.include(998)
includes()也适用于字符串

var arr = ["a","b","c"]
console.log(arr.include("a")) //true
```

##### 伪数组转数组Array.from()

```
伪数组转数组
伪数组：有数组所对应的序号，属性值是序号，有length属性，的一个对象
返回转换后的数组
Array.from(伪数组,item => item * 2)

var arr = {"0": "11", "1": "22", "2": "33", "length":3}
var arr1 = Array.from(arr,item => item * 2)
console.log(arr1); //[22, 44, 66]
```

##### 值转换为数组Array.of()

```
将一组值，转换为数组
返回数组
Array.of(3, 11, 8)
```

##### 扁平化数组flat()

```
数组.flat()

Infinity

var arr = [1,2,3,1,[4,2,12,3,[8,9,],5],8]
console.log(arr.flat(Infinity))
```

#### 字符串方法

##### 截取substring

```
字符串.substring(start, stop);
stop 取不到，可写可不写，不写就是全部。
start 比 stop 大，会先交换这两个参数
start 和 stop 相等，会返回一个空的字符串
start 或 stop 为负数，会先将负数变为0
(觉得substring不如slice)
```

##### 截取substr

```
字符串.substr(start, length);
length 可写可不写，不写就是全部。
start 为 负数，则被看作 字符串长度+负数
length 为负数或者0，则返回空字符串
```

##### 替换replace

```
字符串.replace(旧字符,新字符)
返回值：
替换旧字符之后的结果
注意：
只替换第一个匹配的目标

replaceAll全部替换
```

##### 去除头尾空格trim

````
trim() 

eg:
var str = "       Runoob        ";
alert(str.trim());;
````

##### 获取索引值的字符

```
字符串.charAt(索引值)
字符串[索引值]  IE8+支持
```

##### 获取字符的ASCII码值

```
字符串.charCodeAt(索引值)
```

##### 转换大小写

```
toUpperCase()
toLowerCase()

eg:
<form method="get"></form>
option.method.toUpperCase()==="GET"
```

##### URL编码与解码

```
encodeURI()
decodeURI()
浏览器会自动对url进行编码、解码

eg：
var str = "杰洛特"
var newStr = encodeURI(str)
console.log(newStr);
```

##### 字符串转数组split

  ```
字符串.split(separator,howmany) 

返回值：
一个包含了分隔开的字符串的数组

separator 必需
字符串或正则表达式，从该参数指定的地方分割 str

howmany 可选
该参数可指定返回的数组的最大长度。如果设置了该参数，返回的子串不会多于这个参数指定的数组。如果没有设置该参数，整个字符串都会被分割，不考虑它的长度。

let str = 'www.baidu.com?value=456'
str.split('?') 返回 ['www.baidu.com',''value=456]
str.split('?',1) 返回 ['www.baidu.com']
  ```

##### 判断字符串是否存在

```
includes() | startsWith() | endsWith()
判断字符串是否在某个字符串参数之中/开头/尾部
如果是则返回true，否则false
includes()也适用于数组

let str = 'hello world';
let r1 = str.startsWith('hello')
let r2 = str.endsWith('22')
console.log(r1)
console.log(r2)
结果是：true false
```

##### 重复repeat

```
repeat()
把原字符串重复n次，次数写在括号里面

let str = 'zero';
let str2 = str.repeat(5)
console.log(str2)
```

##### Unicode码点返回对应字符

```js
String.fromCodePoint()
从 Unicode 码点返回对应字符
```

#### 字符串\数组方法

##### 截取slice

```
字符串\数组.slice(start, stop); 
stop 取不到，可写可不写，不写就是全部。
start 比 stop 大，则截取为空
start 比 stop 相等，则截取为空
start 或 stop 为负数，则被看作 字符串长度+负数
(从数组尾部开始算起的位置，最后一个数字为-1，倒数第二个数字为-2，依次类推)
```

##### 获取索引号indexOf

```
从前往后查找indexOf
从后往前查找lastIndexOf
找到则返回索引号，找不到则返回-1

eg:
var str = "abcdefgd";
str.indexOf("d",4)
在字符串str中查找d，从索引值4开始查找
```

##### 拼接concat

```
字符串\数组.concat(参数1,参数2....)
把字符串和参数1、参数2....拼接成新字符串
(不如直接用+号方便)
```

#### 对象方法

##### 获取键名键值

```
Object.keys()
对象的键名

Object.values()
对象的键值

var obj = {
    name: 'aero',
    age: 11
}
console.log(Object.keys(obj));
```

##### 比较Object.is()

```
比较两个值是否相等
其运算逻辑与“===”基本相似
但是有两个不同
Object.is(+0,-0)//false 原生显示true
Object.is(NaN,NaN) //true 原生显示false
```

##### 合并Object.assign()浅拷贝

```js
Object.assign(tartget,source1,...)
对象的合并，将源对象的所有可枚举属性复制到目标对象中
可以实现浅拷贝
只把复杂类型数据的第一层做复制操作，深层次数据依然会相互影响，深层次的数据只拷贝地址
把source1第一层的数据拷贝一份给tartget，深层次的数据新、老对象依然会相互影响
https://juejin.im/post/6872765382898221064
```

##### 遍历对象为数组Object.entries()

```
返回一个数组，成员是参数对象自身的（不含继承的）所有可遍历（enumerable）属性的键值对数组
```

##### 新建属性Object.defineProperty()

```js
通过Object.defineProperty 新建的对象的属性，
默认writable: false
    enumerable: false            
    configurable: false
最后一个特性：不能删除这个对象属性，并且不能修改这个对象属性的另外两个特性的值,如果修改的话，会报错


value 			修改值，默认undefined
writeable 		允许修改true，默认false
enumerable 		允许遍历/枚举true，默认false
configurable 	允许删除或者再次修改true，默认false
```

##### 基本包装类型

```
基本数据类型可以通过以下进行包装后，可以当成对象，点出来属性，比如.length属性

new String()

new Number()

new Boolean()

JavaScript在设计的时候，模仿Java引入了两套类型机制：基本类型和对象类型
基本类型包括undefined、number、boolean、string、function、object。
除undefined外，JavaScript绝大部分数据都是对象。
JavaScript中的每个对象，都是从Object.prototype对象这个空对象克隆而来的，
Object.prototype是js的根对象，也是它们的原型
故number、boolean、string这些基本类型数据也可以通过“包装类”的方式变成对象类型数据来处理。也可以点出来方法
```

#### webAPI

```
浏览器提供的一套工具（若干对象、方法、函数），用来操控网页和浏览器
API就是方法，使用别人写好的方法
```

#### BOM

##### 简介

````
BOM（browser object model）把浏览器中的内容翻译成对象
独立于内容而与浏览器窗口进行交互的对象。描述了与浏览器进行交互的方法和接口，
可以对浏览器窗口进行访问和操作，譬如可以弹出新的窗口，改变状态栏中的文本，
对Cookie的支持    

window对象
JS所有对象的根（顶级对象），其他BOM对象都是window对象的属性；
全局变量、函数都可以当成window对象的属性
window对象的属性可以作为全局变量
window对象的方法可以作为全局函数
对象在编写时可不写window这个前缀

其他BOM对象
document对象，文档对象；
location对象，浏览器当前URL信息；
navigator对象，浏览器本身信息；
screen对象，客户端屏幕信息；
history对象，浏览器访问历史信息；
````

##### 获取BOM对象

```
获取window顶级对象
var a = window

获取window顶级对象的窗口宽高
window.innerWidth
window.innerHeight

获取页面滚动的高度
window.pageYOffset

让页面滚动
window.scroll(x滚动距离，y轴滚动距离)

location对象
location对象的属性都是可读取也可设置的，使用赋值语句就可以造成地址栏中的信息发生变化

location.href = 新地址
返回整个界面的URL，地址栏中的地址，
所以如果想让整个界面跳转，只需要将location.href使用赋值语句重新赋值即可

location.assign(新地址)
和href一样，可以跳转界面
注意：跳转后可后退

location.replace(新地址)
跳转页面，替换当前界面的地址
注意：跳转后不可后退

location.reload(布尔值)
刷新页面
重新加载界面
不写参数或者参数为false，代表的是正常刷新，使用缓存刷新
参数为true，强制刷新，不使用缓存刷新，重新加载所有资源
Ctrl+F5也可以让界面刷新

location.search
获取?后面的字符
search 属性是一个可读可写的字符串，可设置或返回当前 URL 的查询部分（问号 ? 之后的部分）

a标签也有href属性
我们改变完a标签的href属性值之后，还需要手动再点击一下a标签才能让界面跳转。

history对象
history.forward()  		与在浏览器中点击向前按钮相同
history.back()  		与在浏览器中点击后退按钮相同
history.go() 		    1前进1步，-1后退1步，0刷新
history.pushState() 	 修改URL但是又不刷新页面
history.replaceState() 	 修改URL但是又不刷新页面

navigator对象
包含浏览器相关的信息,计算机系统,浏览器内核,浏览器版本

navigator.userAgent
userAgent 属性是一个只读的字符串，声明了浏览器用于 HTTP 请求的用户代理头的值
console.log(navigator.userAgent);
```

#### DOM

##### 简介

```
DOM（document object model）把文档中的内容翻译成对象
DOM和文档有关，这里的文档指的是网页，也就是HTML文档。
网页是由服务器发送给客户端浏览器的，无论用什么浏览器，接收到的HTML都是一样的，
所以DOM和浏览器无关，它关注的是网页本身的内容。
由于和浏览器关系不大，所以标准就好定了。

DOM树
DOM对象之间由结构关系联系在一起，形成树状结构

一个DOM对象为一个节点
页面中的内容:对应的对象\节点
浏览器把所有内容的特征翻译成对象的属性

标签
标签节点（元素）

文本
文本节点

注释
注释节点
```

##### 获取DOM对象

```
getElementById
通过id名查找元素,获取到的是一个元素（单个DOM对象）

getElementsByTagName
通过标签名查找元素
获取到的是一堆元素（若干个DOM对象的集合）
具有数组的某些特性（有索引值，有length属性），所以称为伪数组
即使只有一个元素，也是一个伪数组
动态的集合：删除、添加标签之后会自动改变

getELementsByClassName
通过类名查找元素
获取到的是一堆元素（若干个DOM对象的集合）伪数组

querySelector(CSS选择器)
CSS选择器匹配到元素中第一个，一个DOM对象，一个元素

querySelectorAll(CSS选择器)
CSS选择器匹配到所有元素，一堆DOM对象，多个元素，伪数组
即使只有一个元素，也是一个伪数组

获取整个页面
eg：
var a = document

获取html标签
html标签对应的DOM对象就是document.documentElement
eg:
var a = document.documentElement

获取body标签
body标签对应的DOM对象就是document.body
简便写法，因为这些标签是唯一的
eg:
var a = document.body
var a = document.head
var a = document.title

eg:
var div = document.queryselectorAll("div")
```

##### 操作DOM对象的属性

```
元素.innerText
可以点出选中的标签中的文本
修改之前的文本内容，标签里面的文本内容对应的是属性这个对象，可读写
去除换行和空格

元素.innerHTML
可以点出选中的标签中的HTML标签
可以识别HTML标签，可读写
保留空格和换行
是标准，用的最多

元素.src
标签的src属性

元素.href
标签的href属性

元素.title
标签的title属性

元素.alt
标签的alt属性

元素.value属性
表单标签的value属性（用户输入的值）

元素.type
input标签的type属性

元素.disabled
表单标签的disable属性 是否禁用  true-禁用  false-可用

元素.checked
表单标签的checked属性，单选框、复选框是否被选中  true-被选中  false-不被选中

元素.style
标签的style属性， 只能获取行内样式，适合修改元素大小

元素.className
标签的class属性
因为class是关键字，所以用了className

元素.classList.add(新类名)
添加元素类名
不会覆盖之前的类名

元素.classList.remove(新类名)
删除元素类名
不会删除其他类

元素.classList.toggle(新类名)
切换元素类名
如果有当前类，则删除该类
如果没有当前类，则添加该类

修改样式的方式
元素.style.样式名 = 样式值
样式名要使用驼峰命名法，把“-”去掉，把“-”后面的字母大写
样式值和样式表中的一模一样
```

##### offset系列属性

```
元素的偏移量
获取标签的 大小 和 位置
都是只读属性（只能获取 不能设置）
包含了border和滚动条

元素.offsetParent
最近的有定位的上层元素，如果找不到就是body
有定位：position: relative\absolute\fixed...

offsetLeft
当前标签的左侧和其offsetParent的左侧之间的距离(两个标签左边框之间的距离)

offsetTop
当前标签的上侧和其offsetParent的上侧之间的距离(两个标签上边框之间的距离)

offsetWidth\offsetHeight 
width\height + padding + border（标签的大小）

window.pageYoffset
获取页面滚动出去上方的高度

元素.style只能获得行内样式表中的样式
```

##### client系列属性

```
元素的可视区，client是客户端的意思
获取 标签的容纳范围 的大小和位置
不包含边框border和滚动条

clientLeft\clientTop
左边框\上边框的宽度

clientWidth\clientHeight
width\height + padding  （比offsetWidth少了一个border）
```

##### scroll系列属性

```
元素滚动
获取 标签内容的 大小、位置

scrollLeft
标签的内容超出标签本身左侧的宽度

scrollTop
标签内容超出标签本身上侧的高度\滚动后被隐藏的高度
对象相对于由offsetParent属性指定的父坐标(css定位的元素或body元素)距离顶端的高度

scrollWidth、scrollHeight
如果标签的内容没有超出标签的容纳范围，即等于标签的容纳范围的宽度\高度
如果标签的内容超出标签的容纳范围，即等于标签内容的真实宽度\高度

可以设置\赋值
windos.scroll(x,y)
使页面滚动到指定位置

pageYoffset监听整个窗口的滚动
```

##### 节点分类

```
标签 -- 标签节点\元素\元素节点
文本 -- 文本节点
注释 -- 注释节点

ndoe type 1	元素节点
ndoe type 2	属性节点
ndoe type 3	文本节点
```

##### 获取节点

```
通过节点属性获取节点

parentNode属性
获取最近的父节点，找不到则返回为空null
获取根部document节点时，parentNode获取的是节点，返回#document子代
parentElement属性
获取父元素
获取根部document节点时，parentElement获取的是元素，报错null

childNodes属性
获取(一层)子节点，返回所有节点的数组，只返回 文本 和 元素 节点，对于属性节点直接无视
children属性
获取(一层)子元素，只返回 元素 节点

firstChild属性
获取第一个子节点
firstElementChild属性
获取第一个子元素

lastChild属性
获取最后一个子节点
lastElementChild属性
获取最后一个子元素

nextSibling属性
获取下一个兄弟节点
nextElementSibling属性
获取下一个兄弟元素

previousSibling属性
获取上一个兄弟节点
previousElementSibling属性
获取上一个兄弟元素

注意
这些属性可以连续调用，但是一定是DOM对象调用
```

##### 节点操作

```js
创建元素\DOM对象
document.createElement("标签名")

插入元素
位置，父元素的最后一个子节点的位置上
父元素.appendChild(DOM对象)

插入元素
位置，父元素的指定参考元素的前面
父元素.insertBefore(要插入的DOM对象, 参考对象)
参考对象为空，则插入到第一个

插入元素的新方法
元素.insertAdjacentHTML('位置', 插入的内容)
位置参数
beforeBegin:插入到标签开始前，变成了上一个兄弟
afterBegin:插入到标签开始标记之后，变成了第一个儿子
beforeEnd:插入到标签结束标记前，变成了最后一个儿子
afterEnd:插入到标签结束标记后，变成了下一个兄弟
支持追加字符串里面的元素，可以使用模板字符串

删除元素
父元素.removeChild(要删除的子元素)
或
要删除的元素.remove()

克隆元素
被克隆的元素.cloneNode(参数)
参数
true，把当前元素中的内容一同复制
false或为空，只复制元素的外壳，不复制元素中的内容，默认false

替换元素
父元素.replaceChild(新对象,老对象)

注意
创建元素方法createElement的返回值，
是一个标签节点（DOM对象），可以按照操作DOM对象的方式来操作（绑定事件、设置内容）
只是创建，在页面中不显示，没被添加到页面中
首先创建节点，然后把节点添加到父节点中
父元素只能删除子元素

eg:
var li = document.createElement("li")
ul.insertBefore(li, ul.childNodes[0])
意思是给ul的第一个li之前插入一个新li
eg:
var a = document.querySelector(".box")
var c = document.querySelector(".box ul")
var b = document.createElement("h1")
a.replaceChild(b,c)
```

##### 自定义属性

```js
标签自定义属性是w3c规定外的标签属性，不会被翻译成DOM对象的属性

获取标签自定义属性(获取到的是字符型)
元素.getAttribute(属性名)

设置标签自定义属性
元素.setAttribute(属性名,属性值)

移除标签自定义属性
元素.removeAttribute(属性名)

data自定义属性
在HTML5的规范中，
凡是使用了data-开头的自定义属性，
都会被记录到DOM对象的dataset属性中，
并通过dataset来获取、设置、添加、删除
元素.dataset是一个对象
eg:
<input class="example_input" type="text" name="zero" id="" placeholder="请输入">
var c = document.querySelector(".example_input")
c.getAttribute("type")
c.setAttribute("data-index","abc")
c.getAttribute("data-index")
c.dataset['index']
c.dataset.index
c.removeAttribute("data-index")
```

##### 创建元素的三种方法对比

```js
document.write() （了解）
当页面加载完成之后，再调用该对象会把整个页面的内容覆盖

innerHTML（会把设置的具有标签格式的字符串识别为标签）
当给一个DOM对象的innerHTML属性赋值的时候会有以下两步
第一步：字符串赋值
第二步：重新渲染整个页面(非常消耗时间)
注意
使用的时候尽量把字符串拼接好之后，再去进行innerHTML赋值（减少第二步的执行次数）
不同浏览器下，innerHTML 效率要比 creatElement 高

createElement
document.createElement(标签名)

eg：
<ul>
	<li></li>
</ul>

var strat = new Data();
var str = "";
for(var i = 0; i<1000; i++){
	str+="<li>"+i+"</li>"
}
ul.innerHTML = str;
var end = new Data();
console.log(end - start);
```

#### 事件

##### 简介

```
事件是设置元素满足某种条件时执行某个操作（机关），触发-响应机制
事件三要素：
事件源：事件发生的主体
事件类型：事件触发的不同条件
事件处理程序：事件触发的时候执行的操作，事件源.事件类型 = 事件处理程序

普通事件 和 事件绑定 的区别
普通事件重复绑定后面的会覆盖前面的，事件绑定可以对同一个事件绑定多个事件处理函数

事件绑定在 标准浏览器 和 非标准浏览器 的区别
参数不一样，标准三个，非标准两个，差最后的一个是否冒泡
事件类型不一样，是否有‘on’
执行顺序不一样，IE浏览器先执行后面的，标准浏览器按顺序执行
this指向不一样，标准浏览器事件处理函数里面的this当前的操作的元素，但是非标准浏览器的this指向window
```

##### 事件类型

```
元素的onclick事件
触发条件：点击元素
onclick()是绑定事件：作用执行函数代码
click()本身是方法：作用是触发调用click方法元素onclick()事件

元素的onmouseover、onmouseout事件
触发条件：鼠标进入和离开元素
会事件冒泡（会引起很多逻辑问题）

元素的onmouseenter、onmouseleave事件
触发条件：鼠标进入和离开元素
不会事件冒泡

元素的mousemove事件
只要我们鼠标移动1px 就会触发这个事件

元素的ondblclick事件
触发条件：双击元素

元素的onfocus事件
触发条件：获取元素的焦点
无冒泡

元素的onblur事件
触发条件：失去元素的焦点
无冒泡

元素的change事件
监测input的checked改变的状态

键盘的onkeydown事件
触发条件：键盘按下（能识别功能键，但不区分大小写）
最先

键盘的onkeypress事件
触发条件：键盘按下（不能识别功能键，但区分大小写）

键盘的onkeyup事件
触发条件：键盘抬起

禁止鼠标右键contextmenu事件
+e.preventDefault()

禁止选中文字selectstart事件
+e.preventDefault()

手指开始摁下touchstart事件

手指移动touchmove事件

手指抬起touchend事件
document对象的DOMContentLoaded事件
触发条件：页面结构(DOM结构)加载完成，执行的更早

window对象的onload事件
触发条件：所有资源（页面结构、css代码、js代码、图片...）都加载完成

window对象的onpageshow事件
页面显示事件
触发条件：页面跳转的时候、前进后退、刷新页面时
onpageshow和onload类似
onload事件在火狐浏览器中 不会被前进后退触发，onpageshow事件可以

window对象的onunload事件
触发条件：窗口关闭时

window对象的onresize事件
触发条件：窗口的大小被改变时

window对象的onscroll事件
触发条件：窗口滚动的时候

window.οnlοad=function(){}
或
window.addEventListener("load",function(){})
是对界面的加载事件进行了监听，当html所有内容都加载完成之后，会调用function中的代码。
所以在这个function中可以大胆的写查找元素的方法，比如querySelector，而不需要关心代码书写的位置。
在function中的代码使用了var进行声明，那么他就是一个局部变量，这个和是否是入口函数无关。

eg:
var btn = getElementById('btn');
btn.onclick = function(){
	alert('百度一下');
}
window.onload = function () {
	console.log("第二快");
}
window.addEventListener('DOMContentLoaded',function(){
	console.log("最快");
})
window.onpageshow = function () {
	console.log("第二快");
}
document.querySelector("input").onkeydown = function(e){
     console.log("e",e);
     console.log("e.target", e.target);
     console.log("e.keyCode",e.keyCode);
     console.log("按下了");
}
```

##### 事件对象e

```
记录了事件触发的时候跟事件相关信息的对象
浏览器创建了这个对象
主流浏览器，通过实参的形式传入事件处理程序中
事件触发时，浏览器调用事件处理程序，并传入一个实参，这个实参就是事件对象。

事件对象e的属性和方法
e.target
真正触发事件的源头（引起事件冒泡的标签 --- 导火索）
e.target点击哪个元素就返回哪个元素，this是事件源，绑定事件的元素

e.preventDefault()
阻止浏览器默认行为
例如：a标签点击跳转、提交按钮点击提交表单

e.stopPropagation()
阻止浏览器事件冒泡

e.clientX、e.clientY
鼠标在浏览器窗口\可视区中的坐标

e.pageX、e.pageY
鼠标在页面文档中的坐标

e.screenX、e.screenY
鼠标在电脑屏幕中的坐标

e.keyCode
获取键盘的唯一编码，console.log(event.keyCode)

获取手指对象
e.targetTouches：在目标元素上的手指列表
e.touches：在屏幕上的手指列表
e.changedTouches：改变状态的手指列表

获取手指坐标
e.targetTouches[0].pageX
e.targetTouches[0].pageY
```

##### 普通事件

```js
绑定\注册事件
事件源.on事件类型 = 事件处理程序

解绑\删除事件(传统方式)
元素.事件类型 = null;

注意
只能给一个DOM对象绑定事件(不能给伪数组绑定事件)，for循环可以给多个元素绑定事件
事件处理程序只在事件触发的时候执行
不能重复的注册，如果重复注册，后面的事件会覆盖前面的事件

eg:
box.onclick = function(){  }
```

##### 事件监听

```js
绑定\注册事件(添加事件监听)
一般方法
事件源.addEventListener( 事件类型-不带on，事件处理程序函数名，使用捕获 )
function 事件处理程序函数名(){
}

绑定\注册事件(添加事件监听)
匿名函数方法
事件源.addEventListener( 事件类型-不带on，事件处理程序，使用捕获 )
该方式无法解绑，因为是匿名函数

解绑\删除事件(移除事件监听)
事件源.removeEventListener( 事件类型-不带on，事件处理程序)

addEventListener(event,function,useCapture)
事件类型-不带on：event必须。要执行的事件
事件处理程序函数名：function必须。事件处理函数/事件触发时执行的函数
useCapture：可选。默认false-事件在冒泡阶段执行。true-事件在捕获阶段执行

注意
绑定多个事件的时候，先绑定的先触发
通过事件监听可以为同一个元素多次注册同一个事件
如果注册的事件将来要解绑，一定要用函数名作为事件处理程序
注册事件/绑定，在IE9以前，支持attachEvent，不支持addEventListener

eg:
box.addEventListener( "click" , fn )
function fn(){
    alert(1);
}
btn[1].addEventListener('click',function(){
	alert(1);
})
box.removeEventListener("click",fn)
```

##### 事件流的三个阶段

````
网页元素接收事件的顺序

为了让事件的触发情况更符合人类的思维逻辑

捕获阶段
从上往下，直到找到事件源，从大范围到小范围，事件监听的第三个参数是true
目标阶段
事件源，触发事件处理程序
冒泡阶段
从下往上，从小范围到大范围，注册事件第三个参数是false，默认值

eg：
联合国要抓我回联合国
当前的事件被触发之后，会从当前开始向上遍历所有的上级，触发同名事件

修改事件的执行阶段
通过addEventListener的第三个参数设置触发阶段
元素的事件，默认的事件是在冒泡阶段被触发
true，捕获阶段执行(触发)
false（默认值），冒泡阶段执行(触发)
````

##### 事件委托

````
事件委托/事件代理/事件委派
给上层标签绑定事件，让下层标签触发(事件冒泡)

概念：
利用冒泡原理，将子元素事件委托给父元素

优点：
为未来标签预定事件（新元素也可以通过事件冒泡让上层标签的事件执行）
减少事件注册（事件绑定）的次数，节约内存，提升性能

缺点：
所有的事件都用事件委托可能会出现事件误判
````

##### 阻止事件的默认行为和冒泡

```
阻止事件的默认行为
比如a标签的跳转，form表单的提交事件

给a标签的href加javascript:;可以阻止a标签跳转

return false;
在事件处理函数中，得写在onclick里面
仅仅是在HTML事件属性 和 DOM 0级事件处理方法中 才能通过返回 return false 的形式阻止事件宿主的默认行为。

e.returnValue=false
低版本浏览器适用

e.preventDefault()

e.stopPropagation()
阻止事件冒泡

e.cancelBubble()
阻止事件冒泡，兼容性方案
```

#### 定时器

```js
setTimeout(调用函数,延迟的毫秒数)
延迟某个时间执行函数中的操作
只执行一次，返回值是一个编号
setTimeout设定一个定时器之后会返回一个数值作为定时器的编号，以此来标识不同的定时器

setInterval(函数,时间)
间隔某个时间执行函数中的操作
一直执行，重复调用，直到关闭页面或清除定时器，返回值是一个编号
setInterval设定一个定时器之后会返回一个数值作为定时器的编号，以此来标识不同的定时器

清理方式
clearTimeout(定时器编号/名称)
clearInterval(定时器编号/名称)

定时器具有叠加效果，应该在开启新定时器之前，清理掉老的定时器

eg：
   const t = () => console.log(233333);
   const a = setInterval(t,1000);
   console.log(a);	返回值，定时器编号
   clearInterval(a)

定时器里面是回调函数，回调函数是异步任务
```

#### 面向对象

```
封装性，继承性，多态性
适合复杂，较大的程序
万物皆对象：
所有的事物都可以抽象为对象，但不是所有的数据都是对象，比如一个字符串就是一个字符串，它不是对象

面向过程：把问题分解为一个一个步骤，每个步骤用函数实现，依次调用
面向对象：把属性、行为等封装成对象，然后基于这些对象的能力，通过不同的调用来解决问题
```

#### 类class

```js
通过class关键字创建的类来创建对象                                                                       
类的基本使用
创建类
class 类名 {
	//为创建的对象添加属性和方法
	constructor(){
		this.属性名 = 属性值;
	}
	// 书写共用的方法
	方法名(){
	}
}
使用类创建对象
new 类名()

eg:
class创建一个明星类
class Star{
	constructor(uname,age){
		this.uname = uname;
		this.age = age;
		//实例中自己的方法
		this.sing(song){
			console.log("啊哈哈);
		}
	}
	//公共的方法
	sing(song){
	console.log(this.uname+song);
	}
}
var ldh = new Star('刘德华',18);
var zxy = new Star('张学友',12);
console.log(ldh);
console.log(ldh.age);
console.log(ldh.uname);

注意
类里面的所有函数不需要写function
多个函数方法之间不需要添加逗号分隔
在new生成实例的时候，会自动执行constructor函数
公共的方法不属于任何一个实例对象，但是可以所有实例对象都可以调用
公共的方法中的this指向调用该方法的实例对象
```

#### 类的继承

```js
1.子类继承父类（利用父类构建子类）
eg:
class Father{
	constructor(x,y){
		this.x = x;
		this.y = y;
	}
}
class Son extends Father{
	constructor(x,y){
	super(x,y);//借用（调用）父类的函数（构造函数/普通函数），
			   //为子类的实例添加属性和方法,利用父类来完善子类
			   //相当于this.x = x;this.y = y;
	}
	say(){
	return '我是'
	}
}
var obj = new Son(1,2)

注意
必须使用super关键字才可以调用父类的构造函数constructor为子类的实例添加属性和方法 
在子类的constructor中，为子类的实例添加属性和方法之前，必须要在代码第一行调用super
实例调用方法时候的顺序:自身的方法,公共的方法,父类的公共方

2.通过原型链继承
优点：可以访问父类的属性和方法和原型上的属性和方法
缺点：继承如果是引用类型，其中一个子类进行修改，全部都会受到影响，造成实例共享
eg:
	function Parent(){
		this.arr = [ 1, 2 ]
	}
	function Child(){
		this.name = ['kebi']
	}
	Child.prototype = new Parent()
	var person1 = new Child()
	person1.arr.push('kuli')
	console.log(person1.arr) //[1,2,'kebi','kuli']
	var person2 = new Child()
	console.log(person2.arr) // [1,2,'kebi',kuli]

3.通过call继承
优点：可以保证每个子类维护自己的属性
缺点：不影响访问原型链上的属性和方法
eg:
function Parent(){
    this.lastName = 'wang'
    this.hobby = ['a','b']
}
Parent.prototype.asset = ['house','car']
function Child(){
    Parent.call(this)
}
var child = new Child()
var child1 = new Child()
child.hobby.push('c')
console.log(child.lastName) // 'wang'
console.log(child1.hobby) // ['a','b']
console.log(child1.asset) //undefined

4.组合继承
将两个结合
优点：既可以访问原型上的属性和方法，又可以每个子类维护自己属性
缺点：每次创建一个子类实例，父类都会被执行一次

function Parent(){
    this.lastName = 'wang'
    this.hobby = ['a','b']
}
Parent.prototype.asset = ['house','car']

function Child(){
    Parent.call(this)
}
Child.prototype = new Parent()

var child = new Child()
var child1 = new Child()
child.hobby.push('c')

console.log(child.lastName) // 'wang'
console.log(child.hobby) // ['a','b','c']
```

#### this

```js
总的来说，this指向方法的调用者

在事件处理函数中，this指向事件源
在对象的方法中，this指向该对象
在独立的函数、定时器中、对象，this指向window对象
在构造函数、构造函数原型对象、原型对象的方法，this指向构造函数创建出来的实例

在严格模式下，this是undefined
箭头函数的this是他所在的作用域的this，不会受到call、bind、apply的影响

修改this指向
call
函数名.call(目标对象,参数1,参数2,参数3)
1、函数调用
2、this被修改为“目标对象”，不传目标对象默认指向window
参数是修改this指向后，给函数传的参数
函数本身不受影响，当不使用call的时候，函数恢复之前的功能

apply
函数名.apply(目标对象,[参数1,参数2,参数3])
1、函数调用
2、this被修改为“目标对象”
参数写null则不改变this指向

bind
函数名.bind(目标对象,参数1,参数2,参数3)
1、转化函数：把this指向目标对象，参数依次替换
2、返回值是原函数改变this后产生的新函数
原函数不会被改变
参数被指定之后，不会被改变值
参数没有被指定，可以被改变值

call/apply：改变了函数的this上下文后马上执行该函数，返回函数的执行结果
bind：返回改变了上下文后的函数，不执行该函数，返回函数的拷贝，并指定了函数的this指向，保存了函数的参数。

eg:
function fn(a,b){
    // var i=1
  console.log(this.name);
  console.log(a,b);
}
var o = {
	name:'andy'
}
fn.call(o,1,2)
此时this指向o

function fn(a, b) {
    console.log(this.name);
    console.log(a, b);
}
var o = {
    name: 'andy'
}
fn.bind(o, 1, 2)()
```

#### 静态成员与实例成员

```
把函数当成构造函数， 把创建出来的对象称之为实例。

实例成员
实例的属性
由构造函数创建出来的对象能直接访问的属性和方法，包括：对象本身 以及原型中的所有的属性和方法。

静态成员
构造函数的属性
由构造函数直接访问到的属性和方法。大家注意是直接访问的属性和方法，间接获取就不是了。
```

#### 原型链

```js
原型
是一个对象，为实例保存共用的方法、属性
原型对象和构造函数同时产生，创建函数的时候就会产生一个相关联的原型对象
原型对象上的方法中的this，指向调用该方法的实例(对象)

为什么公共方法往原型对象上写？
可以节省内存

原型链
实例调用方法、属性的时候，
先去调用自身的方法、属性，
自身没有，就会根据__proto__向它的原型对象进行查找，
如果都没有，则向它的原型对象的原型对象继续查找，
直到查到 Object.prototype.__proto__为 null。

[[prototype]]和__proto__意义相同

重新指定原型对象
constructor:

构造函数—>实例对象
new 构造函数()

实例对象—>构造函数
实例.constructor

构造函数—>原型对象
构造函数.prototype

实例对象—>实例对象的原型对象
实例.__proto__（会污染原型对象）

             prototype
构造函数    ————————————>     原型对象
     \ 	   <———————————     ^
      \	     constructor  /	  __proto__
 new   \			   /
	    v			 /
		   实例对象

function Person(name){
    this.name = name
}
var p = new Person()
// p -->Person.prototype
                                                                                                                                          
原型链案例
function Father(uname, age) {
        this.uname = uname;
        this.age = age;
}
Father.prototype.money = function() {
        console.log(100);
}

function Son(uname, age, score) {
        Father.call(this, uname, age);
        this.score = score;
}

Son.prototype = new Father();
Son.prototype.constructor = Son;
// Son.prototype.__proto__ = Father.prototype;

Son.prototype.exam = function() {
    console.log('考试');
}
var son = new Son('aa', '11', '99')
var Father = new Father('baba', '80')
son.exam();
son.money();
Father.exam();

原型模式
如果我们想要创建一个对象，一种方法是先指定它的类型，然后通过类来创建这个对象。
原型模式选择了另外一种方式，不再关心对象的具体类型，而是找到一个对象，然后通过克隆来创建一个相同的对象。

原型模式的实现关键
语言本身是否提供了clone方法。
ES5提供了Object.create方法，可以用来克隆对象。

原型继承的本质
基于原型链的委托机制
JavaScript也同样遵守这些原型编程的基本规则。
所有的数据都是对象。
要得到一个对象，不是通过实例化类，而是找到一个对象作为原型并克隆它。
对象会记住它的原型。
如果对象无法响应某个请求，它会把这个请求委托给它自己的原型。
```

#### 闭包

   ```js
函数套函数，里面的子函数依附于外面的父函数，要用里面的函数的话，外面的函数就不会被销毁
内部函数访问了外部函数中的变量

特点
内部函数可以访问到它外部函数的局部变量
这个被访问的局部变量会始终保存在内存中，不会随着函数执行完毕被销毁。

好处/用途
一个变量可以常驻内存中，延长了变量的作用范围，外部可以访问到内部的局部变量
避免全局变量的污染
实现数据的私有化

缺陷
变量常驻内存，更占内存
使用不当会造成内存泄漏

产生的原因
函数在执行的时候遇到一个变量，
会先看看自己的作用域里有没有该变量，
没有的话就会向上从父级作用域里去查找，
直到找到位置，
否则报错undefined

eg：
function f1(){
    var a = 1;
    function f2(){
        console.log(a)
    }
    return f2
}
f1() // 1
   ```

#### 递归

```js
在函数体内调用本函数
注意函数终止条件避免死循环，栈溢出

eg：
递归求阶乘
function fn(n){
    if(n == 1) return n = 1
    return n * fn(n-1)
}
fn(4)
```

#### 异常

```js
try,catch,finally,throw
try{
	可能出错的代码
} catch (error) {
    throw new Error('参数！')
	console.log(error);
}
finally{
    
}
```

#### JS的垃圾回收机制

```js
引用计数法
垃圾回收器 会定期扫描内存，当某个内存中的值被 引用为零 时就会将其回收。
引用计数法有bug，相互引用、闭包导致当前变量已经使用完毕但依然被引用，导致垃圾回收器无法回收这就造成了内存泄漏

标记清除法
从根部出发，定时扫描内存中的对象，找得到就标记，找不到就清除
```

#### 内存泄漏

```js
部分内存一直被占用而得不到释放
写的代码浏览器的垃圾回收机制回收不了，内存泄漏如果特别多就会造成内存溢出

引起内存泄漏的几个情况
闭包
意外的全局变量
被遗忘的定时器或者回调
没有清理的DOM元素引用(获取了一个DOM元素的引用，然后删除了这个DOM元素，但保留了这个元素的引用)

内存溢出
内存越界。数据存储的空间超出了实际分配的内存，典型如栈溢出 - 递归函数

定位问题
开发者窗口里有个memory,点击开始记录，再加载页面的时候，它会帮你去分析谁占内存占得多，就可以依据它去进行分析
还有一个performance，和memory搭配使用，里面通过图表展示了一下解析不同文件都花了多少时间，可以依据这个去分析
```

#### 严格模式

```js
开启严格模式：
书写 "use strict";
在作用域开始位置书写开启严格默认则 该作用域中的代码要遵循严格模式

严格模式的部分规则：
  1) 变量名必须先声明再使用（重点）
  2) 不能随意删除已经声明的变量
  3) 独立函数中的 this 是 undefined（重点）
  5) 定时器执行函数中的 this 还是指向 window 
  6) 函数里面的参数不允许有重名
  
严格模式的目的
1. 消除Javascript语法的一些不合理、不严谨之处，减少一些怪异行为
2. 为未来新版本的Javascript做好铺垫。
3. 消除代码运行的一些不安全之处，保证代码运行的安全。
4. 提高编译器效率，增加运行速度。

严格模式下语法和行为改变
1. 变量必须声明(变量提升不再存在)
2. 禁止使用with语句
3. 禁止this关键字指向全局(window)
4. 函数参数不能重名
5. 禁止八进制表示法 - 017 常规输出15，严格模式下报错
6. 不允许对arguments赋值
7. 禁止使用arguments.callee/arguments.caller(禁止了使用arguments的方法)
```

#### 解构赋值

```js
ES6中允许从数组中提取值，按照对应位置，对变量赋值。对象也可以实现解构

数组解构
按照一一对应的关系从数组中提取值，然后将值赋值给变量
按顺序解构，如果变量没有对应的值，则输出undefined

eg：
// let arr = ['zero', 'boy', 12]
// let [name, sex, age] = arr
let [name, sex, age] = ['zero', 'boy', 12]
let [name, sex, age] = ['zero', 'boy'] 
let [name, sex, age = 20] = ['zero', 'boy']
let [name, sex, ...arr] = ['zero', 'boy',12,22,1]

对象解构
使用变量的名字匹配对象的属性，匹配成功，将对象属性的值赋值给变量
按属性名解构，如果对象没有对应的属性名，则输出undefined

eg：
得到a的name，sex，age
let a = { name: 'zero', sex: 'girl', age: 14 }
let { name, sex, age } = a
let { name:demo, sex, age } = a 
等同于
(let name = a.name;
let sex = a.age;
let age = a.sex;)

console.log(name);
console.log(sex);
console.log(age);
```

#### 剩余参数

```js
符号：...
接受没有形参接受的实参

eg:
const sum = (a, b, ...args) => {
	// let total = 0;
	// args.forEach(item => total += item)
	// return total;
	console.log(a);
	console.log(b);
	console.log(args);
}
var a = sum(10, 20, 30, 1, 2, 3)
	// console.log(a);
```

#### 展开运算符

```js
符号：...
将数组拆分成以逗号分隔的参数序列

let ary = ["a", "b", "c"];
console.log(...ary)
console.log("a", "b", "c")

var arr = [1, 2, 3, 5, 66, 2, 4]
var max = Math.max(...arr)
console.log(max);

合并数组
var arr1 = [1,2,3]
var arr2 = [4,5,6]
var arr3 = [...arr1,...arr2]
console.log(arr3)
或
var arr4 = [1,2,3]
var arr5 = [4,5,6]
arr4.push(...arr5)
console.log(arr4)

利用扩展运算符将伪数组转换为真正的数组
var oDivs = document.getElementsByTagName('div');
console.log(oDivs)
var ary = [...oDivs];
ary.push('a');
console.log(ary);
```

#### 模板字符串

```js
`${表达式}`
可以根据程序员指定的模板结构和数据，自动生成一个完整的HTML页面
隐藏了拼接字符串的过程
使代码结构更清晰，更易于阅读与维护
将数据和模板结构结合起来, 通过特定的语法结构, 它内部会自动的生成好我们想要的HTML字符串
数据导入模板
模板生成字符串

eg:
console.log(`年龄是${star.age}`);
div.innerHTML(`<span>${star.age}</span>`);没有注释
div.append(`<span>${star.age}</span>`);会有注释

渲染UI结构的旧方法
加号拼接字符串
缺点
如果UI结构比较复杂，则拼接字符串的时候需要格外注意引号之前的嵌套。
且一旦需求发生变化，修改起来也非常麻烦。
```

#### Set数据结构

```js
Set类似于数组，但是成员的值都是唯一的，没有重复的值，会自动丢弃存进去的重复元素
Set本身是构造函数，用来生产Set数据结构
const s = new Set()
Set函数可以接受一个数组作为参数，用来初始化
const set = new Set([1, 2, 3, 4, 4])

set.size()
获取数组长度

set.add(新数据)
向set结构中添加值

set.delete(数据)
从set结构中删除值

set.has(数据)
判断某一个值是否是set数据结构中的成员

set.clear(数据)
清空set数据结构中的值

eg：
数组去重
var arr = ['1', '1', '5', '2', '3']
var b = [...new Set(arr)]
var c = Array.from(new Set(arr))
console.log(b);
console.log(c);

eg：
从set结构中删除值
const arr = ['1', '1', '5', '2', '3']
const s1 = new Set(arr)
s1.delete('5');
console.log(s1)
console.log(arr);
结果是：
{"1", "2", "3"}
["1", "1", "5", "2", "3"]

eg：
遍历set数据结构 从中取值
const s5 = new Set(['a', 'b', 'c']);
	s5.forEach(value => {
	console.log(value)
})
```

#### 深拷贝

```js
深拷贝Object.deepCopy(新对象, 老对象)
把复杂类型数据中包含的所有数据都做复制操作，赋值之后不会相互影响

1.项目中最常用的方法
JSON.stringfy(JSON.parse())

缺点
如果对象里有函数，函数无法被拷贝下来
无法拷贝undefined
无法拷贝对象原型链上的属性和方法
当数据的层次很深，会栈溢出

2.lodash是javascript库 _.cloneDeep(value)可以实现深拷贝

3.递归实现深拷贝

hasOwnProperty方法
表示是否有自己的属性
会查找一个对象是否有某个属性，但是不会去查找它的原型链。

eg:
function deepCopy(obj) {
	if (typeof obj !== 'object') return
	let newObj = obj instanceof Array ? [] : {}
	for (let k in obj) {
		if (obj.hasOwnProperty(k)) {
			newObj[k] = typeof obj[k] === 'object' ? deepCopy(obj[k]) : obj[k]
		}
	}
	return newObj
}

let arr = [1,2,3]
let obj = {a:1,b:2}
let arrNew = deepCopy(arr)
let objNew = deepCopy(obj)
```

#### 防抖和节流

```js
降低频率，提高性能

如何实现节流和防抖，
节流和防抖的区别，什么情况使用节流什么情况使用防抖

防抖debounce
官方解释：
当持续触发事件时，一定时间段内没有再触发事件，事件处理函数才会执行一次，如果设定的时间到来之前，又一次触发了事件，就重新开始延时。

在事件触发一段时间后才执行，
如果在一个事件触发的一段时间内，又触发了该事件，
以新的事件的时间为准，再过相同的一段时间后才执行

使用场景：
搜索提示

let timer = null
document.querySelector('button').addEventListener('click', (e) => {
	clearTimeout(timer)
	timer = setTimeout(() => console.log(e.target.value), 1000)
})

节流throttling
官方解释：
当持续触发事件时，保证一定时间段内只调用一次事件处理函数。

持续触发事件时，每隔一段时间只执行一次函数

使用场景：
监听滚动条滚动加载数据，即边滚动边加载
跟随鼠标移动的小天使

let flag = true
document.querySelector('button').addEventListener('click', () => {
	if (flag) {
		flag = false
		console.log(666)
		setTimeout(() => flag = true, 1000)
	}
})
```

#### Promise

##### 简介

```js
Promise对象代表了未来将要发生的事件

创建承诺，兑现承诺

特点
1.对象的状态不收外界影响。promise对象代表一个异步操作，有三种状态
	1.pending：初始状态（进行中）
	2.fulfilled：操作完成（resolve已成功）
	3.rejected：操作失败（已失败）
2.一旦状态改变，就不会再变，任何时候都可以得到这个结果。
promise对象的状态改变只有两种可能：从pending变为resolved 和pengding变为rejected。

优点
API简洁，更易于异步操作，可将异步操作队列化，以同步操作的流程表达出来，
按照期望的顺序执行，返回符合预期的结果，避免了异步深层嵌套的回调地狱。
可以在对象之间传递和操作promise，帮助我们处理队列
代码风格更加容易理解和维护

缺点
一旦新建promise就会立即执行，无法取消promise
如果不设置回调函数，promise内部抛出错误，不会反应到外部
当处于pending状态时，无法得知目前进展到哪一阶段

使用
使用new来构建一个Promise
Promise的构造函数接收一个参数，是函数，
函数传入两个参数：resolve，reject， 
分别表示 异步操作执行成功后的回调函数 和 异步操作执行失败后的回调函数

<script type="text/javascript">
    var p = new Promise(function(resolve, reject){
      //2. 这里用于实现异步任务  setTimeout
      setTimeout(function(){
        var flag = false;
        if(flag) {
          //3. 正常情况
          resolve('hello');
        }else{
          //4. 异常情况
          reject('出错了');
        }
      }, 100);
    });
    //  5 Promise实例生成以后，可以用then方法指定resolved状态和reject状态的回调函数 
    //  在then方法中，可以直接return数据而不是Promise对象，在后面的then中就可以接收到数据了  
    p.then(function(data){
      console.log(data)
    },function(info){
      console.log(info)
    });
  </script>

eg:
const STATUS = {
  PENDING: 'PENDING',
  FULFILLED: 'FULFILLED',
  REJECTED: 'REJECTED',
}

class Promise {
  constructor(executor) {
    this.status = STATUS.PENDING
    this.value = undefined // 成功的值
    this.reason = undefined // 失败原因
    this.onResolvedCallbacks = [] // 存放成功的回调
    this.onRejectedCallbacks = [] // 存放失败的回调

    const resolve = val => {
      if (this.status === STATUS.PENDING) {
        this.status = STATUS.FULFILLED
        this.value = val
        this.onResolvedCallbacks.forEach(fn => fn())
      }
    }

    const reject = reason => {
      if (this.status === STATUS.PENDING) {
        this.status = STATUS.REJECTED
        this.reason = reason
        this.onRejectedCallbacks.forEach(fn => fn())
      }
    }

    try {
      executor(resolve, reject)
    } catch (e) {
      console.log(e)
    }
  }

  then(onFulfilled, onRejected) {
    if (this.status === STATUS.FULFILLED) {
      onFulfilled(this.value)
    }
    if (this.status === STATUS.REJECTED) {
      onRejected(this.reason)
    }
    if (this.status === STATUS.PENDING) {
      this.onResolvedCallbacks.push(() => {
        onFulfilled(this.value)
      })
      this.onRejectedCallbacks.push(() => {
        onRejected(this.reason)
      })
    }
  }
}
```

##### Promise基本API 实例方法

```html
实例方法是实例化后加载

Promise.then()

得到异步任务正确的结果
Promise.catch()
获取异常信息
Promise.finally()
成功与否都会执行（不是正式标准） 

  <script type="text/javascript">
    // console.dir(Promise);
    function foo() {
      return new Promise(function(resolve, reject){
        setTimeout(function(){
          // resolve(123);
          reject('error');
        }, 100);
      })
    }
    // 或
    foo()
      .then(function(data){
        # 得到异步任务正确的结果
        console.log(data)
      },function(data){
        # 获取异常信息
        console.log(data)
      })
      # 成功与否都会执行（不是正式标准） 
      .finally(function(){
        console.log('finished')
      });
  </script>
```

##### Promise基本API 静态方法

```js
静态方法在编译时就加载了

Promise.all()方法
接收一个数组作参数，数组中的对象（p1、p2、p3）均为promise实例
（如果不是一个promise，该项会被用Promise.resolve转换为一个promise)。
它的状态由这三个promise实例决定
用于将多个 Promise 实例，包装成一个新的 Promise 实例，接受一个数组作为参数，
只有数组里面的每个状态都变成resolve，则新的 Promise 实例状态才会变成resolve.

Promise.race()方法
接收一个数组作参数。当p1, p2, p3中有一个实例的状态发生改变
（变为fulfilled或rejected），
p的状态就跟着改变。并把第一个改变状态的promise的返回值，传给p的回调函数

<script type="text/javascript">
    // console.dir(Promise)
    function queryData(url) {
      return new Promise(function(resolve, reject){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
          if(xhr.readyState != 4) return;
          if(xhr.readyState == 4 && xhr.status == 200) {
            // 处理正常的情况
            resolve(xhr.responseText);
          }else{
            // 处理异常情况
            reject('服务器错误');
          }
        };
        xhr.open('get', url);
        xhr.send(null);
      });
    }

    var p1 = queryData('http://localhost:3000/a1');
    var p2 = queryData('http://localhost:3000/a2');
    var p3 = queryData('http://localhost:3000/a3');
    Promise.all([p1,p2,p3]).then(function(result){
       // all 中的参数[p1,p2,p3]和返回的结果一一对应["HELLO TOM", "HELLO JERRY", "HELLO SPIKE"]
       console.log(result) //["HELLO TOM", "HELLO JERRY", "HELLO SPIKE"]
     })
    Promise.race([p1,p2,p3]).then(function(result){
      // 由于p1执行较快，Promise的then()将获得结果'P1'。p2,p3仍在继续执行，但执行结果将被丢弃。
      console.log(result) // "HELLO TOM"
    })
  </script>
```

#### art-template.js模板引擎

##### 简介

```js
简约、超快的模板引擎。
中文官网首页为 http://aui.github.io/art-template/zh-cn/index.html

CDN
https://unpkg.com/art-template/lib/template-web.js

注意
这个东西是个js文件，需要导入目标页面中来使用

基本原理
找到位置	正则表达式	test
					  exec
				     小括号()

替换字符串	replace	  多次replace		while true

模板引擎的使用步骤
1.导入art-template	
2.准备好数据
这个数据有可能是通过ajax从服务器获取到的
3.定义模板
定义script标签
type:text/html
id:
4.调用template函数
template(模板的id, 数据)
5.渲染UI

简易模板的实现
1.定义模板结构
2.预调用模板引擎
3.封装 template 函数
4.导入并使用自定义的模板引擎
```

##### 语法

```js
大胡子表达式 {{}}
在 {{ }} 内可以进行变量输出，或循环数组等操作，
这种 {{ }} 语法在 art-template 中被称为标准语法

条件输出
{{value}} 		变量输出
{{obj.key}}		对象输出
{{obj['key']}}	对象输出
{{a ? b : c}}	三元表达式输出
{{a || b}}		运算输出
{{a + b}}		运算输出

循环输出
{{each arr}}
	{{$index}} {{$value}}
{{/each}}
通过 each 语法循环数组，
当前循环的索引使用 $index 进行访问，
当前的循环项使用 $value 进行访问。

原文输出
{{@ value }}
如果要输出的value值中，包含了HTML标签结构，则需要使用原文输出语法，才能保证HTML标签被正常渲染。

条件输出
{{if value}} 按需输出的内容 {{/if}}
{{if v1}} 	 按需输出的内容 {{else if v2}} 按需输出的内容 {{/if}}

过滤器
{{value | filterName}}//将value参数传入|后面的函数进行处理，并返回一个处理后的值
过滤器的本质，就是一个function处理函数，
参数传入过滤器，过滤器处理后，返回值，
过滤器语法类似管道操作符，它的上一个输出作为下一个输入

定义过滤器的基本语法：
template.defaults.imports.filterName = function(date){/*return处理的结果*/}

一定要记得给template.defaults.imports增加一个属性
这里的dateFormat是自定义的函数名，data是形参

eg:
定义格式化时间的过滤器dateFormat
template.defaults.imports.dateFormat = function(date) {
	var y = date.getFullYear()
	var m = date.getMonth() + 1
	var d = date.getDate()
	return y + '-' + m + '-' + d // 注意，过滤器最后一定要 return 一个值
}
```

#### 关键字和保留字

````
标识符：开发人员为变量、属性、函数起的名字
关键字：JS本身已经使用了的字
保留字：预留的，未来可能会成为关键字

ECMA-262描述了一组具有特定用途的关键字。这些关键字可用于表示控制语句的开始或结束，或者用于执行特定操作等。按照规则，关键字也是语言保留的，不能用作标识符。以下就是ECMAScript的全部关键字（带*号上标的是第5 版新增的关键字）
case				 else             	new	   		        var
catch			     finally	      	return	     	    void
continue		     for			    switch	     	    while
debugger*             function	  	     this		         with
default			     if				  	throw	            delete
in				  	try

ECMA-262还描述了另外一组不能用作标识符的保留字。尽管保留字在这门语言中还没有任何特定的用途。但它们有可能在将来被用作关键字。以下是ECMA-262 第3 版定义的全部保留字：
abstract			enum			    int				   short
boolean		         export			     interface		     static
byte				extends			    long			    super
char				final				native		 	   synchronized
class				float				package	 	        throws
const			  	goto				private	 	        transient
debugger		    implements	          protected  	      volatile
double			    import			     public

第5版把在非严格模式下运行时的保留字缩减为下列这些：
class				enum			  	extends		       super
const				export			 	import

在严格模式下，第5版还对以下保留字施加了限制：
implements	         package			  public			interface
private			    static				 let			   protected
yield
````

#### 断点调试

```
浏览器 F12 Sourse 想在哪停，就在哪个行号那里点一下,然后刷新

观测数据变化：选中文本，鼠标右键，点击Add selected text  to watchs，把表达式添加到watch中，鼠标选中观察的表达式后悬浮其上
```

#### 延迟加载

````
将js脚本放在文档底部，使js脚本尽量最后加载
给js脚本添加defer属性，使js脚本与文档解析同步执行，这样可以使页面渲染不被阻塞
给js脚本添加async属性，使js脚本异步解析，不阻塞页面渲染
动态创建DOM标签的方式，对文档的加载事件进行监听，文档加载完成后动态创建script标签来引入js脚本
````

#### 模块规范

```
commonJS 
- Node.js就是使用此规范 - 适用于服务端
- require引入模块，module.exports暴露模块，一个文件就是一个模块
- 模块的调用是同步的
建立模块依赖是在运行时，
导入的是值拷贝

AMD 
- 适用于浏览器端 - require.js使用此规范
- define定义模块，require加载模块
- 模块的调用是异步的
- 推崇依赖前置，在定义时就声明依赖模块
- 模块加载完成后执行依赖模块

CMD 
- sea.js使用此规范
- define定义模块，require加载模块
- 模块调用是异步的
- 推崇就近依赖，使用时声明模块
- 下载所有依赖模块不执行，遇到require是执行对应依赖

ES6module
- import导入模块，export导出模块
在编译时在模块导入方面，
导入的是只读的变量映射
通过其静态特性可以进行编译过程中的优化，并且具备处理循环依赖的能力
```

#### 正则表达式

##### 简介

````
用于匹配字符串中字符组合的模式。
在JavaScript中，正则表达式也是对象（RegExp对象）

作用
检索、替换那些符合某个模式（规则）的文本，
例如验证表单：
用户名表单只能输入英文字母、数字或者下划线， 昵称输入框中可以输入中文(匹配)。
此外，正则表达式还常用于过滤掉页面内容中的一 些敏感词(替换)，
或从字符串中获取我们想要的特定部分(提取)等 。

特点
可以迅速地用极简单的方式达到字符串的复杂控制

正则表达式的组成
简单的字符构成
简单和特殊字符的组合(特殊字符又叫元字符)

元字符
( [ { \ ^ $ | ) ? * + .

创建正则表达式
通过调用 RegExp 对象的构造函数创建
var 变量名 = new RegExp(/表达式/);
通过字面量创建
var 变量名 = /表达式/;
````

##### 或符号|

```
设置文本的内容遵守的规则|
或

注意
该符号如果没有括号限制，会把正则表达式分割成多个部分

eg:
/^a|b$/
要么以a为开头  要么以b为结尾
/^(a|b)$/
要么是a   要么是b
```

##### RegExp 对象

```
直接量语法
/pattern/attributes

创建 RegExp 对象的语法
new RegExp(pattern, attributes);

参数 pattern 是一个字符串，指定了正则表达式的模式或其他正则表达式。
参数 attributes 是一个可选的字符串，包含属性 "g"、"i" 和 "m"，分别用于指定全局匹配、区分大小写的匹配和多行匹配。ECMAScript 标准化之前，不支持 m 属性。如果 pattern 是正则表达式，而不是字符串，则必须省略该参数。
```

##### 字符类

```
简单类，反向类，范围类，组合类，预定义类

表示有一系列字符可供选择，只要匹配其中一个即可
所有可供选择的字符都放在方括号内

简单类
var re = /[abc123]/;		将匹配abc123这6个字符中一个   

反向类   
re = /[^abc]/;将匹配除abc之外的一个字符   

范围类   
方括号内部添加范围符-
re = /[a-z]/;将匹配小写a-z 26个字母
re = /[^0-9]/;将匹配除0-9 10个字符之处的一个字符

组合类
re = /[a-z0-9A-Z_]/;
将匹配所有字母，0到9的数字和下划线

预定义类(简写方式)
\d    [0-9]                  			   匹配一个数字字符 
\D    [^0-9]                  			   非数字字符

\s    [\n\r\t\f\x0B]         			   空白字符(换行符、制表符、空格符等) 
\S    [^ \n\r\t\f\x0B]        			   非空白字符

\w    [a-zA-Z0-9_]           		        字母数字下划线 
\W    [^a-zA-Z0-9_]                     	除字母数字下划线之外的字符

\b	  它的前一个字符和后一个字符不全是\w	   单词边界
\B										 非单词边界

\0										 NUL字符
\n										 换行符
\f										 换页符
\r										 回车符
\t										 制表符
\v										 垂直制表符
\xxx									 以八进制数xxx规定的字符
\xdd									 以十六进制数dd规定的字符
\uxxxx									 以十六进制数xxxx规定的Unicode字符
转义字符\								  当要匹配特殊字符时候需要对其转义

eg：
var re = /\d/;	匹配数字
var a = re.test('123');
console.log(a);
结果是:true

eg：
匹配以n开头以e结尾的单词
var rg = /\bnice\b/
var a = rg.test('a nice')
var b = rg.test('anice')
console.log(a);
console.log(b);
结果是：
true
false
```

##### 量词

```js
下表量词单个出现时皆是贪婪量词

边界符，是用来提示字符所处的位置
^以什么开头，是正则表达式匹配字符串开始位置
$以什么结尾
^ 和 $ 一起使用，表示精确匹配

.
匹配任何单个字符任意次,除了换行
例如，/r.t/可以匹配：rat、rut、r t，但不匹配root。

*
匹配前面的子表达式零次或多次。
例如，zo* 能匹配 "z" 以及 "zoo"。 
* 等价于{0,}。

+
匹配前面的子表达式一次或多次。
例如，'zo+' 能匹配 "zo" 以及 "zoo"，但不能匹配 "z"。
+ 等价于 {1,}。 

?
匹配前面的子表达式零次或一次。
例如，"do(es)?" 可以匹配 "do" 或 "does" 中的"do" 。
? 等价于 {0,1}。 

{n}
n 是一个非负整数。匹配确定的 n 次。
例如，'o{2}' 不能匹配 "Bob" 中的 'o'，但是能匹配 "food" 中的两个 o。 

{n,}
n 是一个非负整数。至少匹配n 次。
例如，'o{2,}' 不能匹配 "Bob" 中的 'o'，但能匹配 "foooood" 中的所有 o。
'o{1,}' 等价于 'o+'。'o{0,}' 则等价于 'o*'。 

{n,m}
m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次。
例如， "o{1,3}" 将匹配 "fooooood" 中的前三个 o。'o{0,1}' 等价于 'o?'。
注意在逗号和两个数之间不能有空格。 

n$
匹配任何结尾为 n 的字符串。

^n
匹配任何开头为 n 的字符串。

?=n
匹配任何其后紧接指定字符串 n 的字符串。

?!n
匹配任何其后没有紧接指定字符串 n 的字符串。

eg：
let code = httpRequest.responseText.match(/code">.*?\</)[0].match(/\d/g).join('')
```

##### 修饰符

```
i	执行对大小写不敏感的匹配							   ignoreCase
g	执行全局匹配（查找所有匹配而非在找到第一个匹配后停止）       global
m	执行多行匹配 										   multiline
gi   组合写法
```

##### 方法

**test()**

```js
检测字符串是否符合该规则，返回 true 或 false，其参数是测试字符串。

regexObj.test(str)

regexObj 是写的正则表达式
str 我们要测试的文本
检测str文本是否符合我们写的正则表达式规范

eg：
var str = 'abc';
var re = /[a-z]/g;
console.log(re.test(str)) //true
```

**replace()**

```js
替换字符串
用来替换的参数可以是一个字符串或是一个正则表达式。

stringObject.replace(regexp/substr,replacement)

stringObject 是写的正则表达式
第一个参数regexp/substr: 被替换的字符串 或者 正则表达式
第二个参数replacement: 替换为的字符串
返回值是一个替换完毕的新字符串

eg:
var str = 'abc';
var a = str.replace(/[a-z]/g, 'z');
console.log(a) //zzz
```

**exec()**

```js
检索字符串中的正则表达式的匹配

RegExpObject.exec(string)

参数string里面写的是要检索的字符串
返回值是一个数组，其中存放匹配的结果。如果未找到匹配，则返回值为 null

eg：
var str = 'abcdef123456';
var re = /\d\d\d\d\d\d/;
var result = re.exec(str);
console.log(result) //[ '123456', index: 6, input: 'abcdef123456', groups: undefined ]
```

**match()**

```js
在字符串内检索指定的值，或找到一个或多个正则表达式的匹配

stringObject.match(searchvalue)
stringObject.match(regexp)

searchvalue规定要检索的字符串值。
regexp规定要匹配的模式的 RegExp 对象。
如果该参数不是 RegExp 对象，则需要首先把它传递给 RegExp 构造函数，将其转换为 RegExp 对象。
返回值是存放匹配结果的数组。该数组的内容依赖于 regexp 是否具有全局标志 g。

eg:
var str = "1aa2aa2"
var a = str.match(/\d+/g)
console.log(a);
结果是：1,2,2
```

##### 字符串操作案例

```js
1、分组
正则表达式中()包起来的内容表示一个分组，通过分组提取自己想要的内容
小括号把正则表达式中的某一部分给分组出来，可以得到分组中的内容(exec匹配结果的第二项)
从外到里，从左到右

var str = '<div>我是{{name}}</div>'
var pattern = /{{([a-zA-Z]+)}}/
var patternResult = pattern.exec(str)
console.log(patternResult) //得到 name 相关的分组信息
["{{ name }}", "name", index: 7, input: "<div>我是{{ name }}</div>", groups: undefined]

2、replace替换
var str = '<div>我是{{ name }}</div>'
var pattern = /{{([a-zA-Z]+)}}/
var patternResult = pattern.exec(str)
str = str.replace(patternResult[0], patternResult[1]) 
console.log(str) //<div>我是name</div>

3、多次replace
var str = '<div>{{ name }}今年{{ age }}岁了</div>'
var pattern = /{{\s*([a-zA-Z]+)\s*}}/
var patternResult = pattern.exec(str)
str = str.replace(patternResult[0], patternResult[1])
console.log(str) // <div>name今年{{ age }}岁了</div>
patternResult = pattern.exec(str)
str = str.replace(patternResult[0], patternResult[1])
console.log(str) // <div>name今年age岁了</div>
patternResult = pattern.exec(str)
console.log(patternResult) // null

4、使用while循环replace
var str = '<div>{{ name }}今年{{ age }}岁了</div>'
var pattern = /{{\s*([a-zA-Z]+)\s*}}/
var patternResult = null
while(patternResult = pattern.exec(str)) {
     str = str.replace(patternResult[0], patternResult[1])
}
console.log(str) //<div>name今年age岁了</div>

5、replace替换为真值
var data = { name: '张三', age: 20 }
var str = '<div>{{ name }}今年{{ age }}岁了</div>'
var pattern = /{{\s*([a-zA-Z]+)\s*}}/
var patternResult = null
while ((patternResult = pattern.exec(str))) {
	str = str.replace(patternResult[0], data[patternResult[1]])
}
console.log(str) //<div>张三今年20岁了</div>
```

#### 前端性能优化(未整理)

```
1 尽量减少HTTP请求
CSS中的精灵图
小图片用base64,减少请求次数
如果图片资源特别多，可以单独放到第三方服务器存储
图片懒加载

2 使用压缩组件
压缩代码，减少HTML中的CSS和JS体积，减少网络传输（一般使用插件）

3 使用浏览器缓存
少用location.reload()
用location.reload()会刷新界面，刷新页面时，页面所有资源（CSS，JS，img等）会重新请求服务器
建议使用location.href = '当前页url' 代替location.reload()，使用location.href浏览器会读取本地缓存资源

4 图片、JS 的预加载
延迟加载能让用户更快的看到页面效果，针对那些不需要一开始就显示出来的图片，例如图片滚动，可以延迟加载
png，体积最大，尽量使用体积小的图片格式，
jpg，webp，如果图片太大，可以使用第三方压缩工具进行压缩

5 将JS脚本放在底部，将CSS样式文件放在页面顶部
CSS写在头部，是因为浏览器预先加载CSS后，可以不必等待HTML加载完就可以开始渲染页面了。
JS写在底部，是因为JS主要扮演事件处理的功能，这样的话，页面渲染的时候就和JS没有关系，放在后面慢慢加载，不要影响更重要的CSS和HTML
但如果JS要渲染页面的话，不要放最后面？

6 使用外部的JS和CSS，不要用行内式
尽量将JS代码合并成一个文件
尽量将CSS合并成一个文件
合并脚本和CSS文件，可以减少HTTP请求

7 精简代码
CSS：可以使用与处理语言sass或者less，利用变量可以减少代码使用量，也更易扩展和维护
JS：封装重复使用的函数，用高效的代码解决业务逻辑，如使用三元运算符，箭头函数，表单时候用正则等等

优化项目
打包时移除所有console
路由懒加载，核心思想: 将一个js文件拆分成多个js文件, 需要哪个加载哪个
代码压缩，去掉空格和换行
代码混淆、压缩

Vue 应用运行时性能优化措施
（1）引入生产环境的 Vue 文件
（2）使用单文件组件预编译模板
（3）提取组件的 CSS 到单独到文件
（4）利用Object.freeze()提升性能
（5）扁平化 Store 数据结构
（6）合理使用持久化 Store 数据
（7）组件懒加载
Vue 应用加载性能优化措施
（1）服务端渲染 / 预渲染
（2）组件懒加载

合理选用v-if和v-show
v-if 是真正的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建；也是惰性的：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。
v-show 就简单得多， 不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 的 display 属性进行切换。
所以，v-if 适用于在运行时很少改变条件，不需要频繁切换条件的场景；v-show 则适用于需要非常频繁切换条件的场景

区分computed和watch的使用场景
computed： 是计算属性，依赖其它属性值，并且 computed 的值有缓存，只有它依赖的属性值发生改变，下一次获取 computed 的值时才会重新计算 computed 的值；
watch： 更多的是「观察」的作用，类似于某些数据的监听回调 ，每当监听的数据变化时都会执行回调进行后续操作；
运用场景：
当我们需要进行数值计算，并且依赖于其它数据时，应该使用 computed，因为可以利用 computed 的缓存特性，避免每次获取值时，都要重新计算；
当我们需要在数据变化时执行异步或开销较大的操作时，应该使用 watch，使用 watch 选项允许我们执行异步操作 ( 访问一个 API )，限制我们执行该操作的频率，并在我们得到最终结果前，设置中间状态。这些都是计算属性无法做到的。

长列表性能优化
Vue 会通过 Object.defineProperty 对数据进行劫持，来实现视图响应数据的变化，然而有些时候我们的组件就是纯粹的数据展示，不会有任何改变，我们就不需要 Vue 来劫持我们的数据，在大量数据展示的情况下，这能够很明显的减少组件初始化的时间，那如何禁止 Vue 劫持我们的数据呢？可以通过 Object.freeze 方法来冻结一个对象，一旦被冻结的对象就再也不能被修改了。
Vue 组件销毁时，会自动清理它与其它实例的连接，解绑它的全部指令及事件监听器，但是仅限于组件本身的事件。 如果在 js 内使用 addEventListene 等方式是不会自动销毁的，我们需要在组件销毁时手动移除这些事件的监听，以免造成内存泄露，如：

created() {
 addEventListener('click', this.click, false)
},
beforeDestroy() {
 removeEventListener('click', this.click, false)
}

Vue 是单页面应用，可能会有很多的路由引入 ，这样使用 webpcak 打包后的文件很大，当进入首页时，加载的资源过多，页面会出现白屏的情况，不利于用户体验。如果我们能把不同路由对应的组件分割成不同的代码块，然后当路由被访问的时候才加载对应的组件，这样就更加高效了。这样会大大提高首屏显示的速度，但是可能其他的页面的速度就会降下来。

for循环设置key值

前端优化
1. 减少HTTP请求 - 根据IP建立TCP链接请求数据
2. 减少DNS查询 - 域名解析为IP地址 - DNS解析数据会缓存一段时间，因此影响首次解析速度
3. 避免页面跳转，客户端收到服务器的跳转回复时，会再次执行页面跳转，跳转次数过多，可能会造成看不到任何页面内容的效果
4. 延迟加载
5. 避免页面主体布局中使用table
6. 减少DOM元素数量
7. 根据域名划分下载内容
8. 减少iframe数量
9. 使用CDN
10. 压缩传输文件
11. 避免空的图片src
12. css样式表放在顶部
13. link代替@import
14. 避免滤镜
15. JavaScript脚本置底
16. 使用外部JavaScript和css文件
17. 减少DOM操作次数
18. 图片懒加载

前端优化
压缩代码：利用webpack的一些plugin来压缩代码，比如：UglifyJsPlugin
利用CDN：将部分静态资源路径改为CDN路径
删除无用的代码
提出公共代码（重复代码）
SPA页面采用keep-alive缓存组件
在更多的情况下，使用v-if代替v-show
第三方模块按需导入
服务端渲染SSR
压缩代码
服务端开启gzip压缩

1.使用服务端渲染
客户端渲染: 获取 HTML 文件，根据需要下载 JavaScript 文件，运行文件，生成 DOM，再渲染。
服务端渲染：服务端返回 HTML 文件，客户端只需解析 HTML。

优点：首屏渲染快，SEO 好。
缺点：配置麻烦，增加了服务器的计算压力。

参考资料：
vue-ssr-demo
Vue.js 服务器端渲染指南

2.静态资源使用 CDN
内容分发网络（CDN）是一组分布在多个不同地理位置的 Web 服务器。我们都知道，当服务器离用户越远时，延迟越高。CDN 就是为了解决这一问题，在多个位置部署服务器，让用户离服务器更近，从而缩短请求时间。

3.将 CSS 放在文件头部，JavaScript 文件放在底部
所有放在 head 标签里的 CSS 和 JS 文件都会堵塞渲染。如果这些 CSS 和 JS 需要加载和解析很久的话，那么页面就空白了。所以 JS 文件要放在底部，等 HTML 解析完了再加载 JS 文件。

那为什么 CSS 文件还要放在头部呢？

因为先加载 HTML 再加载 CSS，会让用户第一时间看到的页面是没有样式的、“丑陋”的，为了避免这种情况发生，就要将 CSS 文件放在头部了。

另外，JS 文件也不是不可以放在头部，只要给 script 标签加上 defer 属性就可以了，异步下载，延迟执行。

4.使用字体图标 iconfont 代替图片图标
字体图标就是将图标制作成一个字体，使用时就跟字体一样，可以设置属性，例如 font-size、color 等等，非常方便。并且字体图标是矢量图，不会失真。还有一个优点是生成的文件特别小。
使用 fontmin-webpack 插件对字体文件进行压缩（感谢前端小伟提供）。

问题：
  --编译的框架包太大
  --框架初始加载数据过多，逻辑繁琐
  --初始化加载了所有资源
  --服务端返回数据过于庞大且冗余
  --前端没有使用服务缓存
  
方案：
1. 初始化页面加loding图
2. 减少http请求和冗余数据
  前端在初始化编辑窗口时分别通过了4个接口请求了不同资源。通过和后端协商将4个接口改为一个接口，同时对返回的数据进行删减，只返回前端使用到的数据。
3.组件，路由懒加载
  拆分页面。分担加载压力
4. 配置nginx优化
   -压缩文件
   开启gzip 可以在vue-cli2脚手架中把config/index.js 中的productionGzip设置为true
   -优化缓存分配
    nginx使用缓存存储请求和返回数据，优化缓存分配可以节约内存空间以及减少cpu的使用。可以将常用的js，CSS和图片设置在浏览器本地长时间缓存，这样用户第一次打开页面后，会在本地缓存上述内容，提高了以后打开的页面加载速度，节省服务端大量带宽。
   -配置白名单
5. 优化wepack打包机制
   使用插件件webpack-bundle-analyzer查看项目所有包及体积大小
    --精简打包代码,压缩代码
      purifyCS打包优化去重去无效代码
      UglifyJsPlugin对js文件进行压缩，从而减小js文件的大小，加速load速度。 注意此插件会拖慢webpack的编译速度，建议在开发阶段将其关闭，部署的时候再开启。
      Tree Shaking 删除没用到的代码。这样的功能对于构建大型应用时是非常好的 
    --依赖按需引入 去除冗余依赖
      如：iview ui采用按需引入
    --代码分包
    --去除非必要文件  
6.使用CDN
   CDN主要功能是在不同的地点缓存内容，通过负载均衡技术，将用户的请求定向到最合适的缓存服务器上去获取内容
7.预渲染 
   预渲染相对于SSR比较简单，预渲染可以极大的提高网页访问速度。无需服务器实时动态编译，采用预渲染，在构建时针对特定路由简单的生成静态HTML文件
   使用prerender-spa-plugin 插件
8.ssr 
9.图片转base64
   wepack中的url-loader对未设置或者小于limi设置的图片进行转换，以base64的格式被img的src所使用；而对于大于limit byte的图片用file-loader进行解析。
10.后台分布式部署，负载均衡 
  Nginx (engine x) 是一个高性能的HTTP和反向代理web服务器，同时也提供了IMAP/POP3/SMTP服务。

Nginx
轻量级的Web 服务器/反向代理服务器及电子邮件（IMAP/POP3）代理服务器，
在BSD-like 协议下发行。
占有内存少，并发能力强，
nginx的并发能力在同类型的网页服务器中表现较好，
中国大陆使用nginx网站用户有：百度、京东、新浪、网易、腾讯、淘宝等。
```

#### 浏览器的搜索

````
1. 浏览器向 DNS 服务器请求解析该 URL 中的域名所对应的 IP 地址 - 做域名解析
2. 解析出 IP 地址后，根据该 IP 地址和默认端口 80，和服务器建立TCP连接 - 发起HTTP请求，建立TCP链接
3. 浏览器发出读取文件(URL 中域名后面部分对应的文件)的HTTP 请求，该请求报文作为 TCP 三次握手的第三个报文的数据发送给服务器 - 浏览器发起读取文件请求
4. 服务器对浏览器请求作出响应，并把对应的 html 文本发送给浏览器 - 服务器做出回应，返回对应资源（HTML文件）
5. 释放TCP链接
6. 浏览器解析资源（HTML文件）
````

#### 浏览器的渲染

```
将HTML文档解析为DOM树
将css样式表解析为cssOM(css对象模型规则树)
根据DOM树与CSSOM树生成渲染树render tree
布局render树，然后对渲染树的每一个节点进行布局处理，确定其在屏幕上的显示位置
绘制Render树，将每个节点绘制出来
遇到<script>则暂停渲染，优先加载并执行js代码
直至把Render Tree渲染完成

渲染引擎尽可能快的把结果显示给用户，不会等到所有HTML都被解析完才创建并布局渲染树
它会从网络层获取文档内容的同时把已经接收到的局部内容先展示出来
```

#### 服务端渲染

```
早期的时候，由于页面比较简单，前后端分离也不够完善，所以当时的页面渲染还是

在服务端完成HTML文件拼接，然后浏览器接收这个文件解析展示。

优点：更好的SEO，更快的内容到达时间（首屏渲染速度更快），无需占用客户端资源
缺点：更高的开发要求，更高的服务器要求，不利于前后端分离，占用服务端资源
```

#### 浏览器存储

```js
Cookie
一般由服务器生成，可设置失效时间。如果在浏览器端生成Cookie，默认是关闭浏览器后失效
4K左右
每次都会携带在HTTP头中，如果使用cookie保存过多数据会带来性能问题
需要程序员自己封装，原生的Cookie接口不友好

localStorage和sessionStorage
H5 Web 存储
相当于一个5M大小的针对前端页面的数据库，拓展了cookie的4K限制、节约带宽
仅在客户端（即浏览器）中保存，不参与和服务器的通信
遵循同源策略，不同站点不能共享同一个H5 Web存储
原生接口可以接受，亦可再次封装来对Object和Array有更好的支持
IE9及以上支持。限定存储的数据类型为string，需要在存储对象类型的数据时进行转换。
存在字符串写读时消耗内存的缺点。
其数据不能被抓取。
sessionStorage，针对一个session的数据存储，只能保存同一窗口（或标签页）的数据，在关闭页面或浏览器后会被清空
localStorage，除非被清除，否则数据永久性存储在浏览器中，以键值对的方式存储，它本身是一个对象

只能存储字符串的数据格式
数组对象转换为字符串数据
JSON.stringify(数组对象)
字符串数据转换为数组对象
JSON.parse(字符串数据)

创建
window.localStorage.key = value;
window.localStorage["key"] = value;
window.localStorage.setItem = ("key", "value");

修改
重新赋值

读取(查看对象)
localStorage.a;
localStorage["b"];
localStorage.getItem("key");

删除
全部删除：localStorage.clear();
删除单个键值对：localStorage.removeItem("key");

eg：
var ipt = {
	val:123456
}
sessionStorage.setItem('pwd', ipt.val);
sessionStorage.getItem('pwd');
sessionStorage.removeItem('pwd');
sessionStorage.clear();
```

#### 版本号

```
版本号是以“点分十进制”形式进行定义的，总共有三位数字，例如2.24.0

其中每一位数字所代表的的含义如下
第1位数字：大版本
第2位数字：功能版本
第3位数字：Bug修复版本

版本号提升的规则
只要前面的版本号增长了，则后面的版本号归零。
```

#### 缓存

````
缓存
可以进行高速数据交换的存储器，它先于内存与CPU交换数据，因此速率很快。

L1 Cache(一级缓存)是CPU第一层高速缓存。
内置的L1高速缓存的容量和结构对CPU的性能影响较大，不过高速缓冲存储器均由静态RAM组成，结构较复杂，在CPU管芯面积不能太大的情况下，L1级高速缓存的容量不可能做得太大。一般L1缓存的容量通常在32—256KB。

L2　Cache(二级缓存)是CPU的第二层高速缓存，分内部和外部两种芯片。
内部的芯片二级缓存运行速率与主频相同，而外部的二级缓存则只有主频的一半。L2高速缓存容量也会影响CPU的性能，原则是越大越好，普通台式机CPU的L2缓存一般为128KB到2MB或者更高，笔记本、服务器和工作站上用CPU的L2高速缓存最高可达1MB-3MB。由于高速缓存的速度越高价格也越贵，故有的计算机系统中设置了两级或多级高速缓存。紧靠内存的一级高速缓存的速度最高，而容量最小，二级高速缓存的容量稍大，速度也稍低。

缓存的工作原理
当CPU要读取一个数据时，首先从CPU缓存中查找，找到就立即读取并送给CPU处理；没有找到，就从速率相对较慢的内存中读取并送给CPU处理，同时把这个数据所在的数据块调入缓存中，可以使得以后对整块数据的读取都从缓存中进行，不必再调用内存。正是这样的读取机制使CPU读取缓存的命中率非常高（大多数CPU可达90%左右），也就是说CPU下一次要读取的数据90%都在CPU缓存中，只有大约10%需要从内存读取。这大大节省了CPU直接读取内存的时间，也使CPU读取数据时基本无需等待。总的来说，CPU读取数据的顺序是先缓存后内存。
````

#### 浏览器缓存

```
http缓存、websql、indexDB、cookies、localstorage、sessionStorage、appliction cache、cacheStorage、flash缓存

cacheStorage，它用来存储 Response 对象的。也就是说用来对 HTTP ，响应做缓存的。虽然 localStorage也能做，但是它可能更专业。
具体使用的话，在 caches 上调用 open 方法就可以异步地得到一个 Cache 对象的引用。在这个对象上我们可以把 Response 对象 put 进去
（参数是一个 URL 和一个 Response 对象）、用 match 方法取出（传入一个 URL 取出对应的 Response 对象）。

websql
也是前端数据库，命令和mysql差不多，但是应该是只有谷歌支持，火狐和IE都不支持，这个也不怎么用

indexDB
是H5以后新增的浏览器端的数据库
随着浏览器的功能不断增强，越来越多的网站开始考虑，把更多的数据储存在客户端，这样可以减少从服务器获取数据的请求次数，直接从本地获取数据。这样性能更好

现有的浏览器数据储存方案，都不适合储存大量数据：Cookie 的大小不超过4KB，且每次请求都会发送回服务器；LocalStorage 在 2.5MB 到 10MB 之间（各家浏览器不同），而且不提供搜索功能，不能建立自定义的索引。
所以，需要一种新的解决方案，这就是 IndexedDB 诞生的背景。
IndexedDB 允许储存大量数据，一般来说不少于 250MB

要用的话， IndexedDB 有一个indexedDB.open()方法，打开数据库，接下来就是有一些事件，这个我没有用过，要用的话查查文档应该也是可以用起来的

讲都有什么缓存，然后讲例子，比如浏览器向服务器请求一张图片a,服务器找到了图片a,并把这张图片的信息返回给浏览器，如果浏览器在次请求这张图片a的话，如果没有还存机制的情况下，服务器会再次发送完整的信息给浏览器，这样每次都会返回原始文件，浪费宽带，但是如果单纯的有了缓存
没有更新也是不行的，还是一张图片a，如果浏览器向服务器请求了这张图片a,服务器会给浏览器返回完整的信息，然后浏览把这完整的信息保存到本地，这样如果下次浏览器在访问这张图片的话，可以直接从本地获取，但是这样有个缺点就是服务器上的a图片的内容发生了变化，浏览器是没有办法读取到新的文件，所有用了到了浏览器的缓存+更新的机制，浏览器如果再次向服务器请求图片a的话，浏览器会把这张图片的信息和额外信息（过期时间和对图片进行编码）保存到本地，浏览器如果在这个时间内再次访问这张图片的话，会直接从缓存中获取，如果过了这个设置的时间，浏览器就会发现这个文件已经不新鲜了，就会重新向服务器发送请求，在发送请求的时候带上刚刚保存的哪个编码，服务器接收到请求后，用刚才哪个编码和当前文件作比较，如果两个不等，则重新发送新的文件和编码给浏览器
```

#### restful

````
网络应用程序，分为前端和后端两个部分。
当前的发展趋势，就是前端设备非常多（手机、平板、桌面电脑、其他专用设备......）

所以必须有一种统一的规范，方便不同的前端设备与后端进行通信
RESTful API是目前比较成熟的一套互联网应用程序的API设计标准。
标准方法有：.get、.post、 .put、.delete。

拼接参数的时候是个/不是问号了
````

#### link和@import

````
link										@import
引用样式文件、图片等资源文件                 	    只引用样式文件
引用CSS时，在页面载入时同时加载 			       需要页面网页完全载入以后加载
XHTML标签，无兼容问题    				        CSS2.1提出的，低版本浏览器不支持
支持使用Javascript控制DOM去改变样式  	          不支持

https://blog.csdn.net/weixin_42554191/article/details/135897846
````

#### src和href

```
href
Hypertext Reference，超文本引用
建立当前元素和文档之间的链接

src
指向外部资源的位置，替换当前内容

当浏览器遇到href会并行下载资源并且不会停止对当前文档的处理
建议使用link方式加载CSS，而不是使用@import方式
当浏览器解析到src，会暂停其他资源的下载和处理，直到将该资源加载或执行完毕。
```

#### template编译原理

````
简而言之，就是先转化成AST树，再得到的render函数返回VNode（Vue的虚拟DOM节点）

详情步骤：
首先，通过compile编译器把template编译成AST语法树（abstract syntax tree 即 源代码的抽象语法结构的树状表现形式），compile是createCompiler的返回值，createCompiler是用以创建编译器的。
另外compile还负责合并option。
然后，AST会经过generate（将AST语法树转化成render funtion字符串的过程）得到render函数，render的返回值是VNode，VNode是Vue的虚拟DOM节点，里面有（标签名、子节点、文本等等）
````

#### typescript(ts)

```
1. 不是一门新语言，是用来规范js的语言，是js的超集，常用在大型项目中，使得代码更规范，维护更加方便
2. 不需要去浏览器中浏览效果，就能知道编译错误
3. 类型就是最好的注释，看类型我们就知道这个是什么
4. 即使ts中有编译报错，tsc依旧可以将其编译成js
5. 特点：
   - 增加静态检查，增加代码健壮性
   - 多人协作，提高生产力，降低维护成本
6. interface和type区别
   - 是ts中定义类型的两种方式
   - 都可以描述一个对象或者函数
   - interface只能定义对象类型
   - interface能够声明合并，type不行
   - type 可以声明基本类型别名，联合类型，元组等类型
```

#### Immutable

````
Immutable Data
一旦创建，就不能再被更改的数据。
对 Immutable 对象的任何修改或添加删除操作都会返回一个新的 Immutable 对象

Immutable 实现原理
Persistent Data Structure（持久化数据结构），也就是使用旧数据创建新数据时，要保证旧数据同时可用且不变

````

#### 三种工作环境

```
开发环境
专门用于程序员开发的环境，一般打开全部错误报告和测试工具，是最基础的环境

测试环境
通常克隆一份生产环境配置，让程序在测试环境工作，是从开发到生产环境的过渡环境，主要测试是否存在bug

生产环境
正式对外提供服务的，一般关掉错误报告。真实的环境，提供给用户的环境
```

#### IE特性

````
IE的排版引擎是Trident
Trident内核的大量bug等安全性问题没有得到及时的解决
js上它有他自己的想法，有它自己的独立方法，比如事件绑定：attachEvent、比如创建事件：creatEventObject
css上也有自己的处理方式，如设置透明，低版IE使用滤镜
````

#### 常见的设计模式

```
1. 单例模式
   这种设计模式的思想是确保一个类只有唯一实例，一般用于全局缓存，比如全局window，唯一登录浮窗等。

2. 工厂模式
   工厂模式是创建对象的常用设计模式，为了不暴露创建对象的具体逻辑，将逻辑封装在一个函数中，这个函数就称为一个工厂。本质上是一个负责生产对象实例的工厂。工厂模式根据抽象程度的不同可以分为：简单工厂，工厂方法和抽象工厂。通常用于根据权限生成角色的场景

3. 策略模式
   策略模式的本意将算法的使用与算法的实现分离开来，避免多重判断调用哪些算法。适用于有多个判断分支的场景，如解决表单验证的问题。你可以创建一个validator对象，有一个validate()方法。这个方法被调用时不用区分具体的表单类型，它总是会返回同样的结果——一个没有通过验证的列表和错误信息。

4. 代理模式
   代理模式是为其他对象提供一种代理，也就是当其他对象直接访问该对象时，如果开销较大，就可以通过这个代理层控制对该对象的访问。常见的使用场景为懒加载，合并http请求和缓存。

5. 观察者模式
   也叫发布订阅模式，在这种模式中，一个订阅者订阅发布者，当一个特定的事件发生的时候，发布者会通知（调用）所有的订阅者

6. 模块模式
   模块模式可以指定类想暴露的属性和方法，并且不会污染全局。采用闭包的形式

7. 构造函数模式

8. 混合模式
   构造函数和混合模式就是js中继承的两种实现方式，前者通过构造函数的形式定义类，通过new新增实例。而后者是将构造函数的引用属性和方法放到其原型上，子类是父类原型的一个实例。
```

#### 如何定位问题

````
1 console.log
（对象和数组等尽量不要直接console,因为直接log 引用类型的话浏览器会帮你把后面求值的结果先log出来，可能你log的这类的object并不是这样的，比如说你在后面对object的amount进行了+2的操作，你在前面的地方log出来的就是+2之后的结果，而不是当下的状态值。想要log出当下的状态值需要把它转变下类型，比如 JSON.stringify一下：console.log(JSON.stringify(object)),这样就可以输出当下的object的状态值了）

2 断点调试

3 看报错报的是什么
引用错误：referenceError 所引用的类型不存在 – 变量未声明
语法错误：syntaxError 使用的语法有错误 – 关键字写错
范围错误：rangeError 使用的值范围有错误 — 栈溢出
类型错误：typeError 使用的类型有错误 – 调用的对象不对 – a（）：a不是一个函数

4 百度报错

5 项目上线后  如果遇到问题 
(1). 如果上线的这个版本的功能模块不算大，也不太涉及到其他模块，
那么可以先回退到之前的版本先进行发布，
然后再从master分支创建一个hot-fix分支(用于修复线上的bug)，
(2). 如果线上的这个版本的功能模块比较大，涉及到其他模板，
可以进行从master分支创建一个hot-fix分支(用于修复线上的bug)，
修复完、测试通过后，在master分支进行合并操作，发布。
````

#### 小知识点

````
语法糖
计算机语言中添加的某种语法，
这种语法对语言的功能并没有影响，但是更方便程序员使用。
通常来说使用语法糖能够增加程序的可读性，从而减少程序代码出错的机会。

去掉li前面的小圆点：list-style:none;
input输入框鼠标移上去变颜色：input:focus {outline:none}
favicon.ico一般用于作为缩略的网站标志，它显示在浏览器的地址栏或者标签上
title写：网站名（产品名）-网站的介绍，尽量不要超过30个汉字
浏览器会依次找标签，依次执行样式
相对定位的元素会压住其他标准流
加了绝对定位的盒子可以直接给定宽度高度 
z-index只对定位元素起作用
浮动的元素呈行内块元素状态
标签都是对象，选中后可以点出来它的一些属性

除Chrome和Safari外,
在其它浏览器中,如果将文本设置为-ms-*user*-*select*:*none*;,则用户将无法在该文本块中开始选择文本
英文强制换行word-break:break-all;

@import
可以把一个样式文件导入到另一个样式文件中，是css语法，可以导入css文件,中间有空格
@import "1.css";
在index.less中导入common.less，中间有空格
@import "common";

input是单标签，单标签不能加伪元素

宽高度设置100%，就是父级高度的100%
给body设置高度100%，必须得给html高度也设置为100%，因为html没有高度

添加索引新方法
this.lis[i].index = i;

选中文本框中的文字
input.select();

伪元素和伪类选择器写在一起的规范
.tudou:hover::before{
}

兄弟元素之间的控制
ul li:nth-child(n):hover + ul li:nth-child(n+1) {
}

in
判断对象中是否有该属性，有则返回true
eg：
var obj = {
        id: 1,
        name: 'haha',
        price: 100,
    };
    console.log('haha' in obj);
    
将对象转换成原始值
toPrimitive(input,preferedType?)

vue的发布订阅模式（Publish/Subscribe）

classList 下并不存在 toggleClass() 方法
localStorage 下不存在 push() 方法

禁用按钮
禁用btn.disabled = true;
取消禁用btn.disabled = false;
this.disabled = true;

禁止双击选定文字
window.getSelection ? window.getSelection().removeAllRanges() : document.getSelection.empty();

$("div")[2] 获取的是第 3 个 DOM 元素对象，而不是 jQuery 元素对象
````

#### diff算法

```
只要涉及到虚拟dom，都会用到diff算法

vue中一个组件只有一个watcher，当界面中多个key出现变化时，执行一次diff算法，进行一次新旧dom的比较，就可以比较出来变化的地方
vue中watcher力度降低，为了精确的知道哪些地方发生了变化，所以执行diff算法

diff算法：深度优先，同层比较

只比较同一层级，不跨级比较
标签名不同，直接删除，不继续深度比较
标签名相同，key相同，就认为是相同节点，不继续深度比较

diff算法是虚拟dom的必然产物，通过新旧虚拟dom做对比，将变化的地方更新在真实dom上，
diff过程整体遵循深度优先，同层比较的策略
为了降低diff算法的时间复杂度，优化后的diff算法，是只比较同一层级，不跨级比较；
标签名不同，直接删除，不继续深度比较；标签名相同，key相同，就认为是相同节点，不继续深度比较
优化之前，1000个节点，比较1000的3次方次；优化后的diff算法，1000个节点，只比较100次

diff算法的时间复杂度
两个数的完全的diff算法是一个时间复杂度为o(n3)， Vue进行了优化O(n3)复杂度的问题转换成O(n)复杂度的问题(只比较同级不考虑跨级问题)在前端当中，你很少会跨级层级地移动Dom元素，所以Virtual Dom只会对同一个层级地元素进行对比
```

#### 组件和模块

```
组件
把重复的代码提取出来合并成为一个个组件，组件最重要的就是重用（复用），位于框架最底层，其他功能都依赖于组件，可供不同功能使用，独立性强。

模块
分属同一功能/业务的代码进行隔离（分装）成独立的模块，可以独立运行，以页面、功能或其他不同粒度划分程度不同的模块，位于业务框架层，模块间通过接口调用，目的是降低模块间的耦合，由之前的主应用与模块耦合，变为主应用与接口耦合，接口与模块耦合。
模块就像有多个USB插口的充电宝，可以和多部手机充电，接口可以随意插拔。复用性很强，可以独立管理。

区别
组件：就像一个个小的单位，多个组件可以组合成组件库，方便调用和复用，组件间也可以嵌套，小组件组合成大组件。

模块：就像是独立的功能和项目（如淘宝：注册、登录、购物、直播...），可以调用组件来组成模块，多个模块可以组合成业务框架。

为什么要使用组件化和模块化
开发和调试效率高：随着功能越来越多，代码结构会越发复杂，要修改某一个小功能，可能要重新翻阅整个项目的代码，把所有相同的地方都修改一遍，重复劳动浪费时间和人力，效率低；使用组件化，每个相同的功能结构都调用同一个组件，只需要修改这个组件，即可全局修改。
可维护性强：便于后期代码查找和维护。
避免阻断：模块化是可以独立运行的，如果一个模块产生了bug，不会影响其他模块的调用。
版本管理更容易：如果由多人协作开发，可以避免代码覆盖和冲突。

组件化和模块化一般情况是一起出现的
如“我的淘宝”页调用了会员模块、物流模块、充值模块和运动模块，
而且他们调用了同一个组件在“我的淘宝”来展示各自的 模块。
```

####  服务端渲染SSR 

```
后端直接将渲染好的HTML返回给前端，这个渲染不是浏览器完成的，而是直接在服务器就渲染好了。

好处
前端不用再调接口了。
这在当页面信息量特别大的时候，比如过淘宝首页，要调接口的地方太多了，有可能就会加载得很慢，
这个时候使用服务器端渲染就会大大提升用户体验。
有利于SEO优化 
 一般只有首页或者访问频率非常高的页面使用SSR，其他的没有必要

服务端渲染 SSR or 预渲染
服务端渲染
Vue 在客户端将标签渲染成的整个 html 片段的工作在服务端完成，服务端形成的 html 片段直接返回给客户端这个过程

服务端渲染的优点
更好的 SEO： 
因为 SPA 页面的内容是通过 Ajax 获取，而搜索引擎爬取工具并不会等待 Ajax 异步完成后再抓取页面内容，所以在 SPA 中是抓取不到页面通过 Ajax 获取到的内容；而 SSR 是直接由服务端返回已经渲染好的页面（数据已经包含在页面中），所以搜索引擎爬取工具可以抓取渲染好的页面；
更快的内容到达时间（首屏加载更快）： SPA 会等待所有 Vue 编译后的 js 文件都下载完成后，才开始进行页面的渲染，文件下载等需要一定的时间等，所以首屏渲染需要一定的时间；SSR 直接由服务端渲染好页面直接返回显示，无需等待下载 js 文件及再去渲染等，所以 SSR 有更快的内容到达时间；

服务端渲染的缺点
更多的开发条件限制： 
例如服务端渲染只支持 beforCreate 和 created 两个钩子函数，这会导致一些外部扩展库需要特殊处理，才能在服务端渲染应用程序中运行；并且与可以部署在任何静态文件服务器上的完全静态单页面应用程序 SPA 不同，服务端渲染应用程序，需要处于 Node.js server 运行环境；
更多的服务器负载：
在 Node.js 中渲染完整的应用程序，显然会比仅仅提供静态文件的 server 更加大量占用CPU 资源，因此如果你预料在高流量环境下使用，请准备相应的服务器负载，并明智地采用缓存策略。
如果你的项目的 SEO 和 首屏渲染是评价项目的关键指标，那么你的项目就需要服务端渲染来帮助你实现最佳的初始加载性能和 SEO，具体的 Vue SSR 如何实现，可以参考作者的另一篇文章《Vue SSR 踩坑之旅》。如果你的 Vue 项目只需改善少数营销页面（例如 /， /about， /contact 等）的 SEO，那么你可能需要预渲染，在构建时 (build time) 简单地生成针对特定路由的静态 HTML 文件。优点是设置预渲染更简单，并可以将你的前端作为一个完全静态的站点，具体你可以使用 prerender-spa-plugin 就可以轻松地添加预渲染 。
```

#### 模块化

```
传统开发模式的问题
命名冲突
每个模块间的变量都是全局变量, 会相互影响
文件依赖
两个文件产生关系, 必须要有html文件作为中介
		
什么叫模块化
单独的功能封装到一个文件中
文件之间相互隔离,独立
文件可以对外暴露功能
件可以引入别的文件的功能
一个文件就相当于一个模块

模块化规范
浏览器端 AMD
require.js

浏览器端 CMD
sea.js

服务端 CommonJS
NodeJS
require
module.exports

大一统 ES6模块化
每个js文件都是一个独立的模块
导入模块成员使用 import
暴露模块成员使用 export
```

#### 依赖注入(Provide/Inject)

```js
https://www.jianshu.com/p/6651dccd282c
官网中有明确的提出该问题
```
