# HTML

#### 简介

````
网站
使用一定规则，使用HTML编写的网页的集合2

网页
使用HTML标签编写的一个文件（.html）

HTML
超文本标记语言（**Hypertext Markup Language**）

WEB的标准
结构（**Structure**）HTML：毛坯房
表现（**Presentation**）CSS：精装修
行为（**Behavior**）JavaScript：有人住

页面骨架
html：该标签是页面的根标签
head：该标签主要用于页面的头部设置
body：该标签主要用于页面的身体设置
title：该标签主要用于页面的标题设置
<html>
	<head>
		<title></title>
	</head>
	<body></body>
</html>

<!DOCTYPE> 
声明页面使用哪个HTML 版本

标签所具备的东西:
标签名,标签的属性,标签的内容
<标签名 标签的属性=“ ”>
	标签的内容
</标签名>
````

#### 文件路径

```
正斜线/:一般用在绝对路径和Windows系统的路径

反斜线\：一般用在相对路径和MAC系统的路径

. 表示当前目录
.. 表示当前目录的上一级目录
./表示当前目录下的某个文件或文件夹，视后面跟着的名字而定，可写可不写
../表示当前目录上一级目录的文件或文件夹，视后面跟着的名字而定

相对路径（正斜线，分三种）
eg:
.	./
html文件和jpg文件在相同的目录下：
<img src="./1.jpg"/>

html文件在外面，jpg文件在image文件夹里面： 
<img src="./image/1.jpg"/>

html文件在html文件夹里面，jpg文件在image文件夹里面：
<img src="../image/1.jpg"/>

绝对路径（反斜线）
eg:
<img src="C:\Users\19654\Desktop\Web前端学习\1.jpg"/>
```

#### 锚点定位

```html
当前页面锚点链接
为需要跳转的部分加入id，在<a>标签的href内写入#id。
id不可以以数字开头，尽量使用字母开头。

其它页面锚点链接
href内不再只是#id，而是先写上地址，再写上跳转到的页面内设置的id。
    
当前页面
<h5 id="aa"></h5>
<a href=#aa></a>
其他页面
z1.html
<h5 id="aa"></h5>
<a href=z1.html#aa></a>
```

#### 常用标签

##### HTML无语义标签

```
div和span
div就是一个盒子
div是块级元素，它包含的元素会自动换行，独占一行
span是行内元素，在它的前后不会换行，多个span会一行显示，显示不	下了会换行
```

##### h1-h6标题标签

```html
放在表格的<th></th>中会居中

<h1>最大</<h1>
<h2>依次变小变细</h2>
<h3>次变小变细</h3>
<h4>变小变细</h4>
<h5>小变细</h5>
<h6>变细</h6>
```

##### p段落标签

```html
<p>这是一个段落</p>
```

##### br换行标签

```html
<p>这段落在<br/>标签换行</p>
```

##### 文字相关标签

```html
strong（加粗），em（斜体），del（删除线），ins（下划线），b（加粗）,i（斜体）,s（删除线）,u（下划线）文本格式化标签

<strong>可以</strong>给<em>这</em>段<del>话</del>加<ins>一些</ins>特效
```

##### img图片标签

```html
属性				    					 值
src										  路径
alt										  图片不能加载时的提示文字
title									  鼠标停留在图片时显示的信息
border									  边框，以像素（px）为单位
width									  设置图片的宽，宽高只设置一个最好，图片比例不会变，以像	
										  素（px）为单位，width改变后，height会随之改变
height								      设置图片的高

<img src="../image/1.jpg" alt="这是杰罗" title="不是杰洛特" width="160" height="90" border="10">
```

##### a超链接标签                                                                                               

```html
属性											值
href										  需要跳转的资源
target										  self（默认值）_blank（在新的选项卡打开）
默认颜色蓝色，带下划线      

空链接：<a href="#">内容</a>
下载链接：<a href="1.zip">内容</a>
其他元素超链接：<a href="http://www.baidu.com"><img src="1.jpg"/></a>
外部链接   <a href="http://www.baidu.com" target="_blank">百度</a>
给图片加超链接：<a href="http://www.baidu.com"><img src="1.jpg"/></a>
```

##### table表格标签

```html
属性：
	align
	border
	cellpadding单元格边距
	cellspacing单元格间距
	width
	height

caption表格标题标签
thead表单头 
tbody表单体 
tfoot表单底
tr表单行 
th表单头
td表单元素（列）
	colspan  跨列合并，合并一列的表单元素,完了删除多余的单元格
	rowspan 跨行合并，合并一行的表单元素
	
eg:	
<table>
	<thead>
    	<tr>
			<th rowspan="1"></th>
            <th></th>
            <th></th>
    	</tr>
	</thead>
	<tbody>
   	 	<tr>
        	<td colspan="1"></td>
        	<td></td>
            <td></td>
            <td></td>
    	</tr>
	</tbody>
	<tfoot>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </tfoot>
</table>
```

##### 列表标签

```html
ul无序列表（order list）（最重要）
ol有序别表（unorder liat）（用的比较少）
dl定义列表 dd列表中的项目 dt描述列表中的项目（define list）（重要）dldtdd

eg:
<ul>
    <li></li>
    <li></li>
</ul>
<ol>
    <li></li>
    <li></li>
</ol>
<dl>
   <dt>电器</dt>
   <dd>电饭锅</dd>
   <dd>微波炉</dd>
   <dt>水果</dt>
   <dd>苹果</dd>
   <dd>香蕉</dd>
</dl>
```

##### form表单域标签

```html
属性       				 值
action					  用于指定需要将采集的数据提交给服务器的哪一个资源
method					  get：不安全，提交的参数可以在地址栏看到，地址栏最多存放2K大小的文件						               post：在地址栏看不到
 name					  自定义名称，为了区分页面中不同的表单，随便起一个

<form action="#" method="get" name="abc">
</form>
```

##### input输入

````
表单元素（控键）

属性       				 值

type					text                     输入文本的时候用
						radio                    单选框，若要单选，几个框的名字name必须一样
						password            	密码，加密显示
						checkbox              	复选框
						submit      		    提交按钮，点击后可把表单域里面的表单元素的值传给后台
					     reset            	    重置按钮，可以还原表单元素初始的默认状态
						button                 普通按钮，后期结合JS搭配使用
						file           		   文件域,上传文件使用
						hidden                 隐藏的文本框
						image                  图片样式的按钮
						date              	   日期栏
						name                   随便起名字
						value                   默认在表单框显示东西
						number                 限制用户输入必须为数字类型，后面有个上下+-号
						search				 搜索框，后面有个小x号
						tel					 手机号码,移动端弹出数字键盘
					   	email				      限制
						url						 限制
						time					 限制
						month					 限制
						week					 限制
						color					 颜色选择表单
						range                      滑块
required                 required				表单拥有该属性表示其内容，不能为空
placeholder             提示文本               占位符，表单的提示信息       
autofocus               autofocus            页面加载完，自动聚焦到指定表单
autocomplete            off/on(默认)         搭配name属性，当开始输入时，显示浏览器以前输的文字
multiple                 multiple				可以多选文件提交
accesskey			   自定义键盘按键     按住alt+ 自定义键盘按键，可以锁定光标
maxlength               数字                         可以设置最大输入的文本字数
minlength                数字                         可以设置最小输入的文本字数
checked			       checked                   当页面打开时，可以默认选中按钮
````

得在form表单里面验证，还要有submit提交按钮，除了前三个，其他的都不重要，一般不用，后期用插件做

**修改提示文本的颜色**

```
input::placeholder  {color:red} 
或
::placeholder  {color:red} 


placeholder属性提供可描述输入字段预期值的提示信息
该提示会在输入字段为空时显示
并会在用户输入任意文本后消失
::-webkit-input-placeholder{color:red;}
```

去除input边框

```
border:0;
```

去除input输入框

```
outline: none;
```

清除search的小x号，清除+-号，在百度上搜

```html
<form action="#" method="get" name="abc">
    <input type="radio" checked="checked" name="abc" maxlength="8" value="请输入姓名">
	<input type="image" src ="images/button.gif" width ="60" height="19">
</form>
```

##### select下拉列表

表单元素（控键）

属性       				 值

selected				selected

option

```
<form action="#" method="get" name="abc">
	<select>
		<option>山东<option>
		<option>北京<option>
		<option>天津<option>
		<option selected="selected">南京<option>
	</select>
</form>
```

##### textarea文本域

表单元素（控键）

属性       				 值

cols						每行显示多少字符，实际开发不会使用

rows					  显示多少行，实际开发不会使用

```html
<form action="#" method="get" name="abc">
	留言：
	<textarea cols="20" rows="5">
	</textarea>
</form>
```

##### label标签

````html
<label> 标签为 input 元素定义标签（label）。

label 元素不会向用户呈现任何特殊的样式。不过，它为鼠标用户改善了可用性，因为如果用户点击 label 元素内的文本，则会切换到控件本身。方便鼠标点击使用，扩大可点击的范围，增强用户操作体验

<label> 标签的 for 属性应该等于相关元素的 id 元素，以便将它们捆绑起来。

为input元素定义标注，当点击label标签内的文本时，浏览器会自动将焦点移到对应的表单元素

选择的时候，点文字作用和点文本框/小圆点等一样

eg:
<label for="user_name">用户名：<label> <input type="text" id="user_name">
or
<label>用户名：<input type="text"></label>
````

##### audio音频标签

属性                         		   值                                 描述

src                     		          url                               声音路径

controls                             controls                      显示播放控件                 

loop                 		           loop                             设置音乐循环播放  

autoplay                 		   autoplay                      音乐自动播放

##### video视频标签

属性                         		   值                                 描述

autoplay                 		   autoplay                      视频自动播放

controls                             controls                       显示播放控件                      

width                 		         pixel像素					

height								 pixe像素					

loop                 		           loop                             设置视频循环播放  

preload           		           auto(预加载) none       是否预加载

src                     		          url                                声音路径

poster            			 	    imgurl                          视频加载前的画面(图片的路径)

muted               		          muted		                  静音播放，可解决chrome不可以自动播放

可以在video标签中间写文字，当视频无法播放时显示

可以在video/audio标签中间多加几个source标签，填写视频/音频路径，存放不同的

视频/音频格式，当浏览器不支持一些视频格式时，更换其他的路径。chrome不支持音频

自动播放

```
一般写法：
<video src="视频地址" controls autoplay muted loop width="" height="" preload="auto" poster="./图片地址">

兼容性写法：
<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
您的浏览器不支持Video标签。
</video>
```

##### H5语义化

````
H5新增语义化标签：
header：定义页面或文章头部，通常包含logo、页面标题等
nav：定义只包含导航链接的章节
section：定义文档中的一个章节/部分
aside：定义和页面内容关联度较低的内容（即使删除，剩下的内容仍然合理）
footer：定义页面或章节的尾部，通常包含版权信息、法律信息和反馈建议等有效链接地址
article：定义的内容本身必须是有意义的且必须是独立于文档的其余部分
媒体标签：audio、video
功能性标签：SVG、canvas
input新类型：email、URL、date、datetime、number、range、color、tel、search…
input新属性：placeholder、min/max、list、outline
绘画：canvas
表单控件：calender  date  time  email  url  search

HTML语义化
用正确的标签做正确的事情

HTML语义化优点
搜索引擎的爬虫也依赖于HTML标记来确定上下文和各个关键字的权重，利于SEO
让页面的内容结构化，结构更加清晰
使阅读代码的人对网站更容易将网站分块，便于阅读维护理解，无障碍阅读
即使在没有样式CSS情况下也以一种文档格式显示，并且是容易阅读的，增强了可读性
搜索引擎可根据标签的语言确定上下文和权重问题
移动设备能更完美的展示页面
便于维护开发
语义化更强
便于对浏览器渲染，搜索引擎解析(在浏览器重绘重排的时候不会像div一样过多的解析css)
````

# CSS

#### 简介

```
层叠样式表（Cascading Style Sheets），找到标签（选择器），设置标签（大括号里的内容）

CSS选择器的作用
根据不同需求把不同的标签选择出来，就是用来选择标签的

标签元素的类名
就是引号里面的：class=“ ”，一个标签元素可以有多个类名，用空格隔开

CSS书写规范
把一个属性和属性值写在一行上，属性后面的冒号后面加一个空格，都写成小写
选择器（标签）和大括号中间保留空格

CSS便捷操作
直接输入CSS属性和值的第一个单词字母，如：tdn=text-decoration:none;

CSS三大特性
层叠性\覆盖
相同的选择器给设置了相同的样式属性，就近原则，离结构近的先执行
继承性
子标签会继承父标签的某些样式，文本颜色和字号相关的样式
line-height属性有特殊情况，font:24px/2 "宋体-简";即font-size:24px，line-height:2，如果子元素没有设置行高，则子元素行高为子元素文字大小（font-size）的2倍，如果没有设置子元素文字大小，则为16px的两倍
优先级
选择器相同，执行层叠，选择器不同，看权重
继承的权重是零；复合选择器权重叠加，权重可以叠加但不会进位

CSS引入方式
外部引入：head标签中
内部引入：head标签中，书写style标签，将CSS样式写在该标签内
行内引入：在标签内，写styles属性，里面写CSS样式
当多种引入一同出现时，谁离得近，选择谁
eg：<link rel="stylesheet" href="css/a.css">

CSS属性书写顺序
1.布局定位属性
display/position/float/clear/visibility/overflow
（建议display第一个写，毕竟关系到模式）
2.自身属性
width/height/margin/padding/border/background
3.文本属性
color/font/text-decoration/text-align/vertical-align/white-
space/break-word
4.其他属性（CSS3）
content/cursor/border-radius/box-shadow/text-
shadow/background:linear-gradient...
```

#### css单位

```
- em：相对长度单位，相对于当前元素内部的文本尺寸
- rem：css3新增的相对长度单位，相对的是根元素HTML的文本尺寸
- vw：相对视窗宽度的百分比（1vw代表视窗宽度1%）
- vh：相对视窗高度的百分比
- vmax：当前vw和vh中较大的值
- vmin：当前vw和vh中较小的值

- px：常用的绝对长度单位，相对与显示器分辨率而定位的单位，兼容性较好
- 百分比：常用相对长度单位，相对于父元素的尺寸取值
- pt：绝对长度单位 1px = 0.75pt

rem
rem是全部的长度都相对于根元素<html>元素。通常做法是给html元素设置一个字体大小，然后其他元素的长度单位就为rem。

em
子元素字体大小的em是相对于父元素字体大小
元素的width/height/padding/margin用em的话是相对于该元素的font-size

px
px像素（Pixel）。相对长度单位。像素px是相对于显示器屏幕分辨率而言的。
```

#### SCSS与LESS

```
less和scss是预处理语言，
它并没有裁剪css原有的特性，更不是用来取代css的，
是对css的一种扩展，他增加了变量，作用域scope,大大减化了css的编写，
并且降低了css的维护成本，less和scss就是用更少的代码做了更多的事情
样式穿透  >>>  /deep/

作为一门标记性语言，CSS 的语法相对简单，对使用者的要求较低，
问题：
CSS 需要书写大量看似没有逻辑的代码，不方便维护及扩展，不利于复用，
尤其对于非前端开发工程师来讲，往往会因为缺少 CSS 编写经验而很难写出组织良好且易于维护的 CSS 代码，
造成这些困难的很大原因源于 CSS 是一门非程序式语言，没有变量、函数、SCOPE（作用域）等概念。

LESS
是一门 CSS 预处理语言，它扩充了 CSS 语言，增加了诸如变量、混合（mixin）、函数等功能，让 CSS 更易维护、方便制作主题、扩充。Less 可以运行在 Node 或浏览器端。

LESS 在 CSS 的语法基础之上，引入了变量，Mixin（混入），运算以及函数等功能，简化了 CSS 的编写，降低了 CSS 的维护成本，就像它的名称所说的那样，LESS 可以让我们用更少的代码做更多的事情。
LESS 并没有裁剪 CSS 原有的特性，更不是用来取代 CSS 的，而是在现有 CSS 语法的基础上，为 CSS 加入程序式语言的特性。

SCSS
即是SASS的新语法，是Sassy CSS的简写，是CSS3语法的超集，也就是说所有有效的CSS3样式也同样适合于SASS。

SASS是CSS3的一个扩展，增加了规则嵌套、变量、混合、选择器继承，作用域等等。通过使用命令行的工具或WEB框架插件把它转换成标准的、格式良好的CSS代码。

追问，你在开发中除了用过嵌套还用过什么
定义变量  @变量名：变量值，变量计算

@width:1000px;

.div1{
  width: @width;
  height: @width/2;
  margin-top: @width*pi();    //pi()为less函数，详细请查看API
  border: 1px solid #000;
}
```

#### 选择器

##### 基础选择器

````
标签选择器
标签名 {
	属性1: 属性值1;
	...
}
用标签名作为选择器
优点：可以选取页面中所有的该元素进行修饰
缺点：不能进行差异化的设置
开发中用得较多
使用场景：将同名标签共同的样式设置在该选择器中。标签名一样的标签，一起设置

类选择器
.类名 {
	属性1:属性值1;
	...
}
通过给标签元素取class属性来调用，
可以根据类名，选择一个或多个标签进行设置，
不能以标签名字作为类名、纯数字或中文进行命名，
类命名有相关规则，最好使用该规则进行命名，实在不行就用拼音（完整的）
开发中用得非常多，用于修改样式
使用场景：多个页面的标签元素可以共享同一个样式

ID选择器
#id {
	属性1:属性值1;
	...
}
通过给标签元素取id属性来调用，
不能以数字开头
只能被调用一次，用于页面唯一元素，以后配合js使用
使用场景：选择修饰的该元素样式是页面唯一的

通配符选择器
* {
	属性1:属性值1;
}
*的意思是选择所有的元素（标签）
用于修改所有的元素（标签），特殊情况下才使用
使用场景：全网变灰；页面的外边距和内边距设为零

复合选择器
对基础选择器进行组合而形成的

后代选择器
eg：选择器2是选择器1的子标签
选择器1 选择器2 选择器n {  
	样式
}

子选择器
亲儿子，元素2是离元素1最近的子元素
选择器1 > 选择器2 > 选择器n {
	样式
}

并集选择器
选择多组标签，同时为他们定义相同的样式
用英文逗号(,)分开，尽量竖着来写
选择器1，选择器2，选择器n {
	样式
}

交集选择器（了解）
选择器1选择器2选择器n{  }

伪类选择器
:link	:visited	:hover	:active
得按LVHA顺序来写，主要针对于a标签
想给a标签指定样式，一定要单独指定
:focus 当获取鼠标焦点时起作用，主要针对于表单控件元素
````

##### C3新增选择器

```
属性选择器
标签名写在前面，接着跟英文中括号，里面写属性(和属性值)，这样就可以选择
指定标签里面有指定属性(和属性值)的元素。当出现一些奇怪的符号时，尽量给属性
值加引号。主要用于input和img标签
eg:
input[type=text]{
	color:red;
}
<input type="text" name="" id="">
<input type="password" name="" id="">

选择符					 			 描述
E[att]							    选择具有att属性的E元素
E[att="val"]					    选择具有att属性且值等于val的E元素
E[att^="val"]					    开头
E[att$="val"]					    结尾
element元素，attribute属性，value值

结构伪类选择器
:last-child							最后一个
:first-child						第一个
:nth-child(even)					偶数选择器
:nth-child(odd)						奇数选择器
:nth-child(3)						写几就是找第几个
:not(:nth-child(3))					除过第二个
:nth-child(n)						代表选中所有的
:nth-child(2n)						选中2的倍数
:nth-child(2n+1)					奇数
:nth-child(-n+5)					前五个
:nth-child(n+5)			  			第五个开始往后
:nth-last-child(1)           		 最后一个
:nth-child(n+13):nth-child(-n+19)	  选择第十三到第十九个
:nth-of-type()						比nth-child()多了一个元素类型的限制
:first-of-type ()               	  找第一个要找的元素类型
 n∈[0,+∞)
公式里面n要写前面，比如2n+1

伪元素选择器
::before
::after
用CSS方式创建一个盒子，放在父盒子里面的前面/后面
减少HTML的代码结构
content是必写属性
双标签才有伪元素选择器，
伪元素是行内元素
两个冒号叫伪元素，一个冒号叫伪类
伪元素的意义：省去再写一个标签的功夫
eg：
div::after{
	content:"百度一下"；
	width:20px;
	height:20px;
	backgroundcolor:red;
}
```

##### 各选择器的权重

```
通配符选择器、	继承											    0000
伪元素/标签选择器             				 					  0001
类/伪类/结构伪类/属性选择器         		  					   0010
ID选择器             			  	   	 						  0100
内联样式表													   1000
！important          		 								   无限大

复合选择器：后代选择器  子选择器  并/交级选择器	   					基础选择器权重相加，无进位
```

#### 属性继承

````
可继承的样式： font-size font-family color;
不可继承的样式：border padding margin width height;
````

#### 元素的三种类型

```
浏览器对html标签元素显示的方式不同，
比如h1-h6就是独占一行的显示，而a就是多个显示在一行。
根据显示模式的不同，可以将html的标签元素分为三类

块级元素
独占一行，会自动换行
可以设置宽高度，margin，padding
如果没有指定宽度，默认宽度和父容器一样
块级元素可以包含其他块级元素和行内元素
纯文本类的块元素内不能包含块级元素，比如p标签和h1标签里面不能放div标签

行内元素
一行可以放（显示）多个，不会自动换行
不能直接设置宽高
默认宽度就是本身内容宽度
行内元素只能包含一些文本信息
超链接除外，超链接里面不能再放超链接，超链接中可以包含块元素（可以扩大单击范围）,但转为块级元素比较安全
margin设置仅左右有效，padding设置上下左右都有效

行内块元素
一行可以放（显示）多个，不会自动换行
可以设置宽高度，margin，padding
默认宽度就是本身内容宽度
（同时具有行内元素和块级元素的特点）
块元素：div ，h1-h6，p，table，ul，ol ...
行内元素：span，a，button，strong ，::before，::after ...
行内块元素：input，img，td，th ...

模式转换属性
能不转换就不转换
转换为块级元素：display：block；
转换为行内元素：display：inline；
转换为行内块元素：display：inline-block；
```

#### 网页布局

```
传统网页布局的三种方式
标准流、浮动、定位

页面布局第一准则
分析页面的中的行模块，以及每个行模块中的列模块

页面布局第二准则
一行中的列模块经常浮动布局，先确定每个列的大小，之后确定列的位置

网页布局两个原则
多个块级元素，如果想多行排列（一行一行的）用标准流；如果想多列排列用浮动
先定义盒子大小，再定义盒子位置
```

##### 标准流

```
普通流/文档流
标签按照规定好默认方式排列，最基本的布局方式
```

##### 浮动float

```
将页面中的元素脱离标准流左右动起来排列

为什么要浮动?
有很多网页布局效果，标准流没有办法完成

属性值：
none元素不浮动（默认值）
left元素左浮动
right元素右浮动

所有的浮动都是贴着另一个浮动，并连在一起的

浮动的元素会压住后面的盒子，但是不会压住标准流中的图片，文字和图片会环绕浮动元素

浮动的特性
1.浮动元素会**脱离标准流**，脱离标准流普通流的控制（浮）移动到指定位置（动），俗称（脱标），
2.浮动的盒子不再保留原先的位置，不占标准流中的位置（不占空间）
3.浮动元素会**显示在一行**上，如果超过了父元素的宽度，会自动换行进行显示
4.浮动元素**具有行内块元素的特点**（行内块元素之间有间隙，浮动没有），行内元素有
了浮动之后，则不需要转换为块级/行内元素就可以直接给高度和宽度
5.浮动元素**一般结合标准流的父元素进行使用，这样可以控制浮动元素的浮动范围**
6.在一个父盒子里面，如果一个元素浮动，尽量让所有元素都浮动
7.浮动的盒子会影响后面的标准流，不会影响前面的标准流
```

##### 清除浮动


	为什么要清除浮动（清除浮动元素造成的影响）？
	
	有的父盒子不方便给高度，子盒子又设置了浮动，
	导致父盒子高度变为零（上下边框重合在一起了），导致下面的标准流盒子往上跑
	父盒子不能设置高度，因为有些开发时候不能指定盒子的具体高度
	父盒子中有多个浮动的子盒子
	影响了后面的标准流盒子的布局
	
	1.父级元素(clearfix)添加单伪类元素after
	.clearfix:after {
		content: "";
		display: block;
		clear:both;
		height: 0;
		visibility: hidden;
	}
	.clearfix {	/* IE6、7专有 */
		zoom: 1;
	}
	
	2.父级元素(clearfix)添加双伪元素after，before
	.clearfix:before,
	.clearfix:after {
		content: "";
		display: table;
	}
	.clearfix:after {
		clear: both;
	}
	.clearfix {	/* IE6、7专有 */
		zoom: 1;
	}
	
	3.额外标签法（一般不用）
	在最后一个浮动元素后面加一个空标签<div></div>，给该块元素加 clear: both;
	缺点：添加了一个无关元素，代码阅读受影响。
	
	4.父级元素(clearfix)添加overflow：hidden（触发bfc）
	缺点：
	内容增多的时候容易造成不会自动换行导致内容被隐藏掉，无法显示要溢出的元素
	.clearfix {
		overflow:hidden/auto/scoll
	}
	
	5.给父元素添加display：flow-root；
	是新增的方法，无论是内联还是块级元素，使用后都会变成块级元素，
	同时，该元素会建立一个新的BFC，并且不会给元素带来任何的副作用，但是有兼容问题
	
	6.给父元素添加高度
	
	7.给父元素添加浮动

##### 定位position

```
定位=定位模式+边偏移

position属性的值：

static静态定位（了解）
就是无定位的意思

relative相对定位
相对的是自己在标准文档流中的位置
没有脱离标准文档流，会继续占有自己在标准文档流中的位置
使用场景：移动自己的位置，子绝父相

absolute绝对定位
如果定位的盒子父级都没有定位，那么绝对定位的盒子按照浏览器的左上角进行偏移
如果父元素指定了定位，那么子盒子使用绝对定位的时候会以父盒子为准进行移动
会脱离标准流，浮在标准流的上面，不占有原先的位置

fixed固定定位
相当于一种特殊的绝对定位
相对的是浏览器的可视区域移动
会脱离标准流，浮在标准流的上面，不占有原先的位置

sticky粘性定位（了解）
相对的是浏览器的可视区域移动（固定定位特点）
并没有脱离标准文档流，会继续占有自己在标准文档流中的位置（相对定位特点）
必须添加top、left、right、bottom其中一个才有效
兼容性很差
```

##### 边偏移

```
定位之后可以设置边偏移

top定位元素相对于其父亲元素上边距的距离
bottom
right
left
top和left比另外两个优先级高
```

##### 定位叠放次序z-index

```
z-index

数值可以是正整数、负整数，默认是auto，数值越大，盒子越靠上
如果属性值相同，则按照书写顺序，后来居上
数值后面不能加单位
只有定位的盒子才有z-index属性
```

##### 定位盒子的特征

```
行内元素：直接可以指定宽高度，类似display：block
块元素：默认的宽度和高度是内容的宽度和高度

注意
定位的盒子不会有外边距塌陷的问题存在

定位的盒子会压住后面的盒子以及盒子中的文字，
浮动的盒子会压住后面的盒子但是文字会环绕浮动元素

绝对定位的盒子
不能使用margin:auto进行居中，居中方式为：
移动父容器50%，如left：50%；
使用外边距回退盒子的宽度的一半，如1：margin-left：-200px；
```

#### 盒子模型box-sizing

```
IE盒模型（怪异）
box-sizing:content-box;(默认,以前默认的盒子大小为width，padding，border)

C3盒模型（标准）
box-sizing:border-box;(盒子最终的大小就是width的大小)
```

##### 边框border

```
border-width
给页面元素添加的边框的宽度（粗细）
属性值：像素px

border-style
属性值：solid实线，dashed虚线，dotted点线

border-color
属性值：颜色

简写
border:border-width border-style border-color
eg：border:1px solid red；

border-radius
属性值：length半径为该数值的圆的弧度； 使用%定义宽和高的百分比，50%就是宽和高的一半
可简写，简写方式类似于内外边距的简写方式

border-collapse
合并相邻的边框，指定边框不进行叠加，而进行合并（相当于给表格添加细边框）
属性值：collapse
```

##### 内边距padding

```
盒子里面内容与边框之间的距离

padding会影响盒子的实际大小，会撑大盒子
如果没有指定盒子的宽（高）度，则padding不会撑宽（高）盒子
当子元素没有显示指定的宽（高）度，则子元素的padding不会撑宽（高）自己的盒子
```

##### 外边距margin

```
盒子和盒子之间的距离

1.相邻的块元素外边距垂直合并问题
当margin-bottom遇到margin-top时，取了二者间最大的一个值（取最大值使用）
尽量只给一个盒子指定margin值

2.嵌套的块元素垂直外边距的塌陷问题
对于两个嵌套关系的块元素，
给里面的盒子添加margin-top的时候，父级盒子也会同时下移
如果父元素同时设置了上外边距，那么父元素会选择较大的值进行整体的下移
给父级元素定义上边框（border：1px solid transparant；）
给父级元素定义上内边距（padding：1px；）
给父级元素添加overflow：hidden；

3.居中的方式
块级盒子元素水平居中：margin：npx auto；前提是盒子是必须有宽度
如果要将一个盒子中的文本水平居中：text-align：center；
如果要将一个盒子中的文本垂直居中：lint-height=height
行内元素和行内块元素水平居中：设置父元素text-align：center
```

##### 清除内外边距

```
浏览器会给HTML标签元素设置不同的内外边距，因此开发之前需要清除所有元素内外边距
*{
	margin：0px；
	padding：0px；
}
行内元素不能给垂直方向的内外边距，可以给左右的
不要给行内元素进行设置上下内外边距，因为有些浏览器支持
```

##### 内外边距的简写

```
padding（margin）:5px;上下左右都是5像素的内（外）边距
padding（margin）:5px 10px;上下内（外）边距是5像素，左右内（外）边距是10像素
padding（margin）:5px 10px 20px;上内（外）边距是5像素，左右内（外）边距是10像素，下内（外）边距是20像素
padding（margin）:5px 10px 20px 30px;上内（外）边距是5像素，右内（外）边距是10像素，下内（外）边距是20像素，左内（外）边距是30像素，顺时针

边框和内外边距单独设置上下左右
border-top/right/bottom/left
padding-top/right/bottom/left
margin-top/right/bottom/left
```

##### 盒子的阴影效果box-shadow

```
属性值：
h-shadown在X轴水平移动，单位px
v-shadown在Y轴上下移动，单位px
blur模糊距离，阴影的虚实，数值越大越模糊，单位px
spread阴影的尺寸大小，单位px

color阴影的颜色，一般都设置半透明效果

inset内阴影，默认是outset外阴影，但是outset不写

eg：box-shadow：10px 10px 10px 10px rgba(0,0,0,0.2)
```

#####  min-width

```
当盒子内部元素宽度小于 min-width的值时，盒子宽度为 min-width的值，
当盒子内容宽度大于 min-width的值时，盒子随着内容的增加而被撑大，没有上上限，
但是 盒子宽度的最小值是 设置的 min-width 的值。
```

#### 常用属性

##### 字体font

```
font-family属性
用于定义字体

如果有多个字体，用逗号分隔，单/双引号进行包含每个字体,浏览器优先使用第一个字体，如果没有的话，依次使用右边的字体，如果都没有的话，使用浏览器默认字体。
微软雅黑的英文:Microsoft Yahei

font-size属性
用于定义字体大小，标题标签比较特殊，需要单独指定文字大小

默认浏览器是16px的字号

font-weight属性
用于定义文字的粗细，数字后面不要跟单位，

400代表正常normal，700代表加粗bold

font-style属性
用于定义风格，normal代表正常，italic代表斜体

line-height属性
设置行间的距离（行高）

normal					默认。设置合理的行间距。
number				设置数字，此数字会与当前的字体尺寸相乘来设置行间距。
length					设置固定的行间距。
% 							基于当前字体尺寸的百分比行间距。

字体的复合属性
font：font-style font-weight font-size/line-height font-family
顺序不可以颠倒，必须保留font-size和font-family
eg：
font：italic 700 20px “Microsoft Yahei”
```

##### 文本颜色color

```
属性值eg：
blue
#cc00ff(用的最多，16进制颜色表示法，两两字母分别代表红、绿、蓝颜色的深度)
rgb(255,255,0)或(100%,0%,0%)
rgba(255,0,0,0.5),最后一个值为透明值，0-1，全透明-不透明，可以把0.5写成.5
```

##### 文本对齐text-align

```
指定文本对齐方式（水平）

属性值：
left
center
right
justify两端对齐
```

##### 文本装饰text-decoration

````
属性值：
none：默认，没有装饰线（最常用）
underline：下划线，超链接a标签自带（常用）
line-through：删除线
overline：上划线
````

##### 文本首行缩进text-indent

```
属性值：
em：当前元素文字大小，是相对单位，相对于当前元素，2em就是当前元素两个文字大小
px：像素单位
```

##### 行间距line-height

```
用于设置行间距，控制文字行与行之间的距离，包括上间距、下间距、文本高度

属性值：
px：像素单位

背景颜色
background
```

##### 文本阴影text-shadow

```
文本不可以设置阴影的大小

属性值：
offset-y
blur-radius
color

eg:
text-shadow:offset-x: 5px; 阴影水平移动，负值时向左偏移
text-shadow: 1px 1px 2px green;
```

##### 背景background

背景颜色

**background-color**

属性值：

颜色，默认是transparent(透明色)

背景图片

页面元素既可以添加背景颜色也可以添加背景图片,只不过背景图片会压住背景颜色

一般适用于logo，装饰性的小图片，超大图片，便于控制图片的位置

**background-image**

属性值：

url(images/logo.png) 指定背景图片

none 没图片

背景图片平铺方式

**background-repeat**

属性值：

no-repeat 背景图片不平铺

repeat   默认值，背景图片是平铺的

repeat-x  沿着x轴平铺        

repeat-y  沿着Y轴平铺        

固定背景图片

**background-attachment**

属性值：

scroll	默认值，背景图像会随着页面其余部分的滚动而移动。

fixed	当页面的其余部分滚动时，背景图像不会移动。

inherit	规定应该从父元素继承 background-attachment 属性的设置

背景图片起始位置

**background-position**

属性值：

​	精确单位length：20px 50px，距离左侧边缘20像素，距离上侧边缘50像素                           

百分数，eg：background-position:20px 50px;

​	方位名词（X Y）

top left

top center

top right

center left

center center

center right

bottom left

bottom center

bottom right

前后顺序没有关系

只写一个参数，第二个参数省略，则第二个参数默认为center

方位名词和精确单位可以混合，第一个值是X轴坐标，第二个值是Y轴坐标

上 左右中；中 左右中；下 左右中

**background-size**

调整背景图片大小

属性值：					  描述

width height			   宽高度，只写一个参数，则高度会等比例缩放，单位可以跟百分比，相对于父盒子

cover							背景图片等比例缩放，使背景图片完全铺满盒子，可能有部分背景图片显示不全

contain						背景图片等比例缩放，当宽度或者高度铺满盒子，便不再拉伸，可能有部分空白区域

**background-image:linear-gradient**

背景渐变色（本质是背景图）

规范写法

background-image:linear-gradient((左上开始)to 终点，颜色1，颜色2，...，颜色n)

兼容写法

    background-image: -webkit-linear-gradient(起始位置, 颜色1, 颜色2, ..., 颜色n)
    background-image: -moz-linear-gradient(起始位置, 颜色1, 颜色2, ..., 颜色n)
    background-image: -ms-linear-gradient(起始位置, 颜色1, 颜色2, ..., 颜色n)
    background-image: -o-linear-gradient(起始位置, 颜色1, 颜色2, ..., 颜色n)

```
background-image: linear-gradient(to right,red,green)
等同于
background-image: -webkit-linear-gradient(left,red,green)
```

**背景的复合属性**

颜色 图片地址 平铺方式 固定方式 图片起始位置

background: color images repeat attachment position/size

eg：background: black url(images/bg.jpg) no-repeat fixed top center/150px 150px;

##### 滤镜filter

属性值：						描述

blur    						     模糊程度，默认是0，单位是像素

```html
eg:
filter:blur(5px);
```

##### 过渡transition

属性值：						描述

要过渡的属性				width height background-color top left...(都是数值)

花费时间						秒s

运动曲线						ease默认 linear匀速 

何时开始						延迟，默认0s

谁做过渡给谁加transition

过渡多个属性用逗号分割

过渡属性写all，代表所有的意思，不写all也可以，建议写

display: none; 不可以过渡，因为不是数值

##### 透明度opacity

```html
可以调整盒子的透明度
属性值							描述
value						   数值0-1

eg:
transition all .5s;
transition width 1s;
opacity:0
```

##### 鼠标样式cursor

```
属性值：

url()
需使用的自定义光标的 URL。
注释：请在此列表的末端始终定义一种普通的光标，以防没有由 URL 定义的可用光标。

default	默认光标（通常是一个箭头）
text	此光标指示文本。
pointer	光标呈现为指示链接的指针（一只手）
move	此光标指示某对象可被移动。
not-allowed	禁止样式

auto	默认。浏览器设置的光标。
crosshair	光标呈现为十字线。
e-resize	此光标指示矩形框的边缘可被向右（东）移动。
ne-resize	此光标指示矩形框的边缘可被向上及向右移动（北/东）。
nw-resize	此光标指示矩形框的边缘可被向上及向左移动（北/西）。
n-resize	此光标指示矩形框的边缘可被向上（北）移动。
se-resize	此光标指示矩形框的边缘可被向下及向右移动（南/东）。
sw-resize	此光标指示矩形框的边缘可被向下及向左移动（南/西）。
s-resize	此光标指示矩形框的边缘可被向下移动（南）。
w-resize	此光标指示矩形框的边缘可被向左移动（西）。
wait	此光标指示程序正忙（通常是一只表或沙漏）。
```

##### 轮廓outline、resize

```
outline
给input或textarea文本框标签设置outline:none
消除当鼠标停留在输入框的时候显示的粗边框特效

resize
给textarea文本框标签设置resize:none
消除右下角的调节窗口按钮
其他属性值：
none用户无法调整元素的尺寸
both用户可调整元素的高度和宽度
horizontal用户可调整元素的宽度
vertical用户可调整元素的高度


```

##### 垂直对齐vertical-align

```
与行内块元素搭配居多，块级元素无该属性
图片/文本框默认与文字的基线baseline对齐，可以给图片/文本框设置为其他线对齐
给行内块元素加vertical-align:middle，可以使文字垂直居中


baseline	默认。元素放置在父元素的基线上
top	        把元素的顶端与行中最高元素的顶端对齐
middle		把此元素放置在父元素的中部
bottom	     把元素的顶端与行中最低的元素的顶端对齐
sub	        垂直对齐文本的下标
super	    垂直对齐文本的上标
text-top	把元素的顶端与父元素字体的顶端对齐
text-bottom	 把元素的底端与父元素字体的底端对齐 


使用 "line-height" 属性的百分比值来排列此元素。允许使用负值
inherit	规定应该从父元素继承 vertical-align 属性的值
```

##### 显示和隐藏

```
display
显示：display：block；
隐藏：display：none：
隐藏的元素不占有原先的位置，后面的标准流元素会上走，脱标

visibility
显示：visible
隐藏：hidden
隐藏之后元素依然占据原有的位置

overflow
显示：visible
隐藏：hidden
滚动：scoll；显示水平和垂直的滚动条
自动：auto；根据实际的内容显示滚动条
隐藏之后元素依然占据原有的位置，可以让元素溢出隐藏
```

##### clear

```
属性规定元素的哪一侧不允许其他浮动元素

值		    描述
left		在左侧不允许浮动元素。
right		在右侧不允许浮动元素。
both		在左右两侧均不允许浮动元素。
none		默认值。允许浮动元素出现在两侧。
inherit		规定应该从父元素继承 clear 属性的值。
```

#### 2D转换

````
移动 translate
网页二维坐标：以左上角为零点，往右是x正轴，往下是y正轴
x和y都不可以省略，以像素为单位
写百分比的话，是相对于自身元素的宽高
translate对行内标签没有效果
优点：不会影响其他元素的位置，不会丢失原来的位置
transform:translateX(n);
transform:translateY(n);
transform:translateX(n),translateY(n);
transform:translate(x,y);

错误写法,样式会覆盖掉
transform:translateX(50px);
transform:translateY(50px);

只移动x坐标的两种写法
transform:translate(100px,0);
transform:translateX(100px);

旋转rotate
transform：rotate(50deg);
尽量放在位移的后面，英文旋转会改变位移的坐标轴向

缩放scale
里面写的是数字，不跟单位，就是倍数的意思
scale里面只写一个值，可同时修改宽高度
写小于1的数值，就是缩放的意思
默认中心缩放
优点：不会影响其他元素的位置，不会丢失原来的位置，可以设置缩放的中心点
transform:scaleX(n);
transform:scaleY(n);
transform:scale(n);
transform:scale(x,y);
transform:scale(5,5);

旋转/缩放的中心点transform-origin
默认50% 50%等价于center center 即中心旋转，
值：百分比、英文单词、像素位置

html
transform-origin:5px 5px;
注意书写位置，给哪个元素左旋转，就给哪个元素加

2D转换综合写法
同时使用多个转换，格式为：transform:translate() rotate() scale()...
其顺序会影响转换的效果（先旋转会改变坐标轴的方向）
当同时有位移和其他属性时，要将位移放到最前
````



#### 3D转换

````
3D移动
transform:translateX(n);
transform:translateY(n);
transform:translateZ(n);
transform:translate3d(x,y,z);

3D旋转
transform:rotateX(angle);
transform:rotateY(angle);
transform:rotateZ(angle);
transform:rotate3d(x,y,z，angle) xyz为基点可设置数值，取0-1，自定义旋转轴去转，基本不用

3D缩放
transform:scaleX(n);
transform:scaleY(n);
transform:scaleZ(n);
transform:scale3d(x,y,z);

3D转换元素的透视视图
perspective(n)
模拟人眼睛到屏幕的距离
单位是像素
给上层标签设置
一般设置800px-1200px

视距原点
perspective-origin:x-axis y-axis;
浏览器默认观察位置是perspective盒子的正中心，即50%

3D呈现
控制子元素是否保留3D空间
给父盒子设置

默认
transform-style: flat;

3D空间
transform-style: preserve-3d;


Z轴往屏幕外面是正轴
·  —  >
|
v

先旋转，再移动
translateZ一般以px为单位
````

#### 动画

```css
先定义动画，再使用
动画不需要事件触发，过渡需要，过渡只有开始和结束两个关键帧，动画可以设置多个关键帧

0%是动画的开始，100%是动画的完成。这样的规则是动画序列。0%可以省略
动画是使元素从一种样式逐渐变化为另一种样式的效果，可以改变人一多的样式任意多的次数
用百分比来规定变化发生的时间，或用关键词“from”和“to",等同于0%和100%
百分比就是总的时间的划分，整数，可以做多个状态的变化keyframes

@keyframes
规定动画
animation-name
动画的名称(必须的)
animation-duration
动画完成一个周期所花费的时间，默认是0s(必须的)
animation-timing-function
动画的运动速度曲线，默认先慢后快再慢ease，匀速linear，分几步来完成动画steps()
animation-delay
何时开始，单位是秒(2s,即两秒后开始动画)
animation-iteration-count
重复播放次数，默认是1，循环播放infinite（设置infinite时animation-fill-mode无效）
animation-direction
是否反方向播放  默认不反向播放normal，反方向alternate跑马灯
animation-fill-mode
结束后的状态，默认回到起始状态backwards，停在结束状态forwards
animation-play-state
动画正在运行或暂停，不能写在简写里面，默认播放running，暂停paused

简写
animation：动画名称 持续时间 运动曲线 何时开始 播放次数 是否反方向  结束后的状态

定义并使用关键帧动画示例
@keyframes 动画名称{
	0%{	
	width:100px;
	}
	100%{
	width:200px;
	}
}

div{
	width:200px;
	height:200px;
	background-color:aqua;
	margin:100px auto;
	/*调用动画*/
	animation-name:动画名称;
	/*持续时间*/
	animation-duration:持续时间;
}
```

#### 文字溢出解决

```
单行文字溢出隐藏
white-space: nowrap;	 	    强制一行内显示文本，不换行
overflow: hidden;		  	    超出部分隐藏
text-overflow:ellipsis;	   		 用省略号替代文字超出的部分

多行文字溢出隐藏
overflow: hidden;				超出部分隐藏
text-overflow: ellipsis;		 用省略号替代文字超出的部分
display: -webkit-box;			 弹性伸缩盒子模型显示
-webkit-line-clamp: 2;			 限制在一个块元素显示的文本的行数，在第二行显示省略号
-webkit-box-orient: vertical;	  设置或检索伸缩盒对象的子元素的排列方式

浏览器会把英文数字识别为一个整体
word-break: break-all;			 强制换行
```

#### 精灵图sprites

```
将背景图设置为一个大背景，然后通过background-position来移动背景图，从而显示出我们想要显示出来的部分。

优点：
减少服务器接受和发送请求的次数,提高页面的加载速度
```

#### CSS字体图标使用方法

```
IcoMoon
点击右上角的IcoMoon App，选择想要的图标，
选好之后点击右下角的Generate Font，把<link>标签复制到自己的html文件中，
再次点击右下角的Download即可图标文件下载，
下载好之后解压，
将font文件夹复制到项目根目录，
style.css文件里面的@font-face复制到自己的CSS文件里面，然后想用哪个图
标，在IcoMoon的网页中复制指定的方框，或者反斜+字母，然后在css写font-family
更新自己的图标文件，在网站点击顶部的Import Icon，
导入自己图标文件夹里面的selection.json，再次选择想要添加的图标即可

阿里iconfont字库
http://www.iconfont.cn/ 
登录，添加项目，选择图标加入项目，在项目界面
1在线引入，更新链接，复制到style并补全http:，给标签添加样式font-family:"iconfont" 
2本地引入，引入icon文件夹里面的iconfont.css文件
可设置字体颜色大小风格
给标签添加类名iconfont和图标名字，标签间写字体图标代码
```

#### Emmet语法

```
HTML语法

！ 					生成的是页面的骨架
直接写标签名 			 生成的是成对或者单个标签
div+p                  生成的是并列的div和p标签元素
div*4                  生成四个div
ul>li*4                生成的是ul下面有4个li
.nav                   生成的是一个<div class="nav"></div>
p#p_01                 生成的是一个<p id="p_01"></p>
.nav_0$*4              生成的是四个<div class="nav_0n"></div> n=1~4
div{$}*4               生成的是四个div <div>n</div> n=1~4
```

#### calc函数

可以在声明CSS属性的时候使用+-*/执行一些计算

```
eg:
width:calc(100% - 30px);
```

#### 浏览器适配相关

```
-moz-		  火狐
-webkit-	  chrome
-ms-		  IE
```

#### CSS3新增内容

```
盒模型的组成
由里向外content,padding,border,margin

标准盒子模型，W3C盒子模型(默认)
box-sizing: content-box
width指content部分的宽度

IE盒子模型
box-sizing: border-box
width表示content+padding+border这三个部分的宽度

盒子阴影：box-shadow
边框圆角：border-radius
图片边框：border-image
文字阴影：text-shadow
文字换行，超出省略
颜色:新增 RGBA,HSLA 模式 
过渡:transition,可实现动画 
渐变:linear-gradient、radial-gradient 
自定义动画：animation
媒体查询，多栏布局 
栅格
多列
CSS3新增伪元素 ::selection(匹配被用户选取的选取是部分，就是鼠标按下滑动选中的部分)
2D 3D转换:transform:translate(x,y) rotate(x,y) skew(x,y) scale(x,y) 
背景图片的尺寸:background-size 设置背景图片的尺寸 
背景图片的原点:background-origin 设置背景图片的原点
背景图片的裁切区域:background-clip 设置背景图片的裁切区域,以”,”分隔可以设置多背景,用于自适应布局 

css3新增伪类
:first-of-type(n)
：last-of-type(n)
：only-of-type(n)
：only-child(n)
:nth-child(n)
:nth-first-child(n)
:nth-last-child(n)
:nth-of-type(n)
：nth-last-of-type(n)
：nth-first-of-type(n)

浏览器存储方式
sessionstorage
不是永久性的本地存储，他只是一种会话的数据存储，如果会话结束后，他的数据也会立即销毁的，

localstorage
只要不手动清除数据，数据会一直存在的，

cookier
存储是有会限制大小的，而且每次发送请求都会把cookier携带过去，这样无形中就浪费了宽带，而且还需要指定作用域，不能跨域调用，更方便的是web storage有封装好的方法，比如getitem，setitem，cookier就得自己封装，比较麻烦

新的技术
webworker,websocket,Geolocation

fetch请求方式
```

#### 居中相关

```
使绝对定位的盒子水平居中显示
加了绝对定位的盒子不能通过 margin:0 auto 水平居中，但是可以通过定位+2D变形实现水平和垂直居中。

弹性盒
父元素：display：flex；
子元素：margin：auto；

父元素：display：flex；justify-content：center；align-item：center；

定位
父元素：position：relative；
子元素：position：absolute；left：0；right：0；bottom：0；top：0；margin：auto；

定位+2D变形
父元素：position：relative；
子元素：position：absolute;top:50%;left:50%;transform：translate（-50%，-50%）
```



````
0411
字体图标
平面转换
渐变

本地引入、在线引入、伪元素引入
本地引入iconfont
引入iconfont.css
使用
<i class="iconfont icon-favorites-fill"></i>
字体大小需要选择iconfont来设置
````

#### 视口-屏幕宽度


    视口的作用
    实现网页宽度与设备宽度一致
    
    物理分辨率 逻辑分辨率  
    设计人员设计的时候，参考的是物理分辨率
    写代码的时候，参考的是逻辑分辨率
    
    布局视口
    移动设备的默认宽度（980px）
    缺点，此宽度让移动端显示的事物物理大小过小，不容易分辨
    
    理想视口
    最合适的设备的宽度（decive-width）
    同样px大小的事物，在PC端和移动端显示的物理大小相同
    meta视口标签:（设置viewport）
    <meta name="viewport" content="width=device-width,
    initial-scale=1.0, user-scalable=no,maximum-scale=1.0,minimum-scale=1.0">
    
    width:可视区域的宽度，值可为数字或关键词device-width
    height:同width
    intial-scale:页面首次被显示是可视区域的缩放级别，取值1.0则页面按实际尺寸显示，无任何缩放
    maximum-scale=1.0, minimum-scale=1.0;可视区域的缩放级别
    maximum-scale用户可将页面放大的程序，1.0将禁止用户放大到实际尺寸之上
    user-scalable:是否可对页面进行缩放，no 禁止缩

##### Link标签按需引入

```
利用媒体查询实现
功能：设置设备的宽度
目的：让同样px大小的事物，在PC端和移动端显示的物理大小相同
注意：meta标签设置视口  只在移动端起作用  PC端不起作用

当屏宽大于等于320PX时，引入style320.css样式
<link rel="stylesheet" href="style320.css" media="screen and (min-width: 320px)"> 

当屏宽大于等于640PX时，引入style320.css样式
<link rel="stylesheet" href="style640.css" media="screen and (min-width: 640px)">
```

##### 二倍图

````
宽高不能被继承，块级元素没有设置宽高，默认宽高为父级元素的100%，
文字类的属性可以被继承

在移动端使用的图片都要使用二倍图（三倍图  四倍图）
如
需要展示100px*200px的图片，就需要使用200色彩像素点*400色彩像素点的图片，通过css代码缩放为100px*200px

img标签
引入 200色彩像素点400色彩像素点 的图片
设置宽高（width、height）是100px*200px

背景图
通过背景图引入200px*400px的图片
使用background-size: 100px 200px;来缩放背景图;

注意
background-size是background的分写属性，
所以先写background再写background-size
````

##### 二倍精灵图

````
使用fireworks把图片整体变成之前尺寸的二分之一
画出切片，覆盖目标小图片，通过左下角的信息的到切片大小、位置(目标小图标的位置、大小) 
把大小、位置信息设置盒子的大小、背景图的位置(加负号) 
使用background-size把图片变为之前尺寸的二分之一
定位之后，一定要设置边偏移top，left
text-align: center;
能让当前标签中的文本，行内，行内块水平居中
尽量不用行内块，行内块有缝隙，可以用块元素+浮动/margin

总结
大小 位置 修饰

注意：
一行一个用块级，一行多个用浮动
测量前缩放图片时，一定要缩放整张图片，不要只缩放部分
绝对定位和固定定位的边偏移默认值不是0，谷歌浏览器会默认把盒子放在定位之前的位置
````

#### flex布局

```
弹性布局
得设置给父容器

优点：不脱标
```

##### 开启flex布局

```
display:flex;
开启后，子标签便可以设置宽高
```

##### 常见父项属性

```
flex-direction
确定主轴方向
值
row：默认值，从左往右，x轴为主轴，y轴为侧轴
row-reverse：从右往左，翻转
column：从上往下，y轴
column-reverse：翻转

justify-content
设置主轴上的子项排列方式
值
flex-start：默认值，从头部开始排列，沿着主轴开始排列，如果主轴是x轴，则从左往右
flex-end：从尾部开始
center：让子项在主轴居中对齐，如果主轴是x轴，则水平居中
space-around：把剩余空间平均分配到子项的两侧，如果主轴是x轴，平均分配到左右两侧 eg：每个子盒子的margin-left和margin-right相等
space-between：先使两边的子项贴边，再给其他子项平均分配剩余的空间
space-evenly：给每个子项平均分配剩余的空间

align-items
设置侧轴上的子项的排列方式(单行，不换行的情况下才能起作用)
值
center：让子项在侧轴居中对齐
flex-start
flex-end
stretch：默认值，拉伸，子项未设置宽高则拉伸至父项宽高

flex-wrap
设置元素是否换行
flex布局中默认的子元素不换行，如果装不开，会缩小子元素的宽度，放到父元素里面
值
nowrap：默认值，不换行
wrap：另起一行
wrap-reverse：换行，第一行在下方

align-content
设置侧轴上的子项的排列方式(多行，换行的情况下才能起作用，如果项目只有一根轴线，该属性不起作用。
可以理解为，把每一行当作一个单元
值
flex-start：与交叉轴的起点对齐。
flex-end：与交叉轴的终点对齐。
center：与交叉轴的中点对齐。
space-between：与交叉轴两端对齐，轴线之间的间隔平均分布。
space-around：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍。
stretch（默认值）：轴线占满整个交叉轴。

flex-flow
flex-direction和flex-wrap的复合属性子容器
eg:
flex-flow: row-reverse wrap;
```

##### 常见子项属性

````
order
定义项目的排列顺序
值
数字，默认值是0，越小越靠前，可以有负数

align-self
允许单个项目有与其他项目不一样的对齐方式，可覆盖align-items属性。
值
auto：默认值，表示继承父项的align-items属性，如果没有父项，则等同于stretch。

flex-grow
定义项目的放大比例，默认为0
默认为0时，如果存在剩余空间，也不放大。

flex-shrink
定义了项目的缩小比例，默认为1，
如果空间不足，子项将按照设置的flex-shrink按比例缩放。

flex-basis
在分配多余空间之前，项目在主轴空间占据的大小。
浏览器根据这个属性，计算主轴是否有多余空间。
它的默认值为auto，即项目的本来大小。
单位是像素

flex
flex-grow, flex-shrink和flex-basis的简写
分配父元素的剩余空间
值
数字，默认值是0 1 auto。后两个属性可选。
百分比
一个子元素设置flex:1则剩余空间都给该子元素
一个子元素设置flex:1，一个子元素设置flex:2，则剩余空间按照1:2分给两个子元素
剩余空间：有剩余空间就分配，没有剩余就不分配了

主轴空间：水平width/竖直height
设置了flex之后，子标签表示主轴空间的样式就不起作用了(行width,列height )
总份数：按照比例来分配剩余空间
````

#### 媒体查询

```js
检测设备的宽度
当满足的查询条件A的时候，样式A才会起作用（样式A要与其他冲突的样式比较权重）

@media screen and (查询条件A){
	样式A
}

eg:
@media screen and (max-width: 400px) {
            body {
                background-color: blue;
            }
        }
        @media screen and (min-width: 400px) {
            body {
                background-color: green;
            }
        }
        @media screen and (min-width: 500px) {
            body {
                background-color: red;
            }
        }
```

#### less语句

```css
功能
写css代码

使用方法
首先安装easyless插件,然后新建.less文件，当保存less文件的时候，会自动生成同名css文件
所有css样式都在less里面写，在页面中使用css文件

变量
@变量名: 变量值;
自定义名称，前面加@，后面用的时候，直接引入这个名称
在less文件里面书写：
@color:black;
@font12:14px;
div {
	color:@color;
	font-size:@font12;
	}

嵌套
一般后代选择器，直接嵌套在上级，符合“儿子住在家里面”
选择器前面加“>”表示子代
伪类、伪元素选择器都写在a的里面，前面加&，&表示上一级
交集选择器也写在a的里面
css
a{
	&:hover{
		color:red;
	}
    &::before{
        content:"";
    }
}

运算
less可以进行+-*/运算，运算符的左右两侧必须用一个空格隔开
两个参数，如果只有一个数有单位，以这个单位为准
如果都有单位，以第一个为准
img{
	width:50px + 5;
}

禁止导出
在第一行写// out:false

在less中导入文件
@import "./base.css";
@import "./normaliza.css";
```

#### rem适配方案

```css
rem单位：参考HTML标签的字体大小，root em
1rem = 1个HTML标签的文字大小
一个页面有一个HTML标签，rem只有唯一的参考标准
补充：1em == 1个当前标签的字体大小

目标
页面的宽度和设备的宽度相同的
在页面的宽度跟随设备宽度的变化的过程中，让页面中的内容等比例变化

原理
把页面中的样式都换成rem为单位
通过媒体查询，在不同的屏幕状态下，设置不同的HTML标签的字体大小，来适配不同的屏幕
如设计稿750px，假设设计稿是15rem宽，那么1rem=50px，750px是人类体验最为舒适的分辨率
把测量出的大小转化为rem
如：量出来是100px宽  应该设置为2rem
经过第1步之后，得到了一个完整的样式A，该样式A可以把页面变成15rem宽
那么，如果设备的宽度也是15rem，样式A就可以完美适配
如何把设备变成15rem宽？媒体查询，把HTML标签的字体大小设置为屏幕宽度的15分之1

rem适配流程
1.选标准尺寸
2.自定义划分份数
3.得到网页文字大小，该数值为1rem
4.页面元素的rem为页面元素的px除以网页文字大小

无论页面尺寸是多大，都是相同的等分，比如都是十五分，320px宽是十五份，750px宽也是十五份

一般flex布局换行的时候，才适合用百分比
绝对定位和固定定位会把盒子变成类似于行内块的元素，从而可以设置宽高
所谓的传统方式布局，既是使用margin、padding和position布局
行内块元素尽量转换为块级元素
浏览器默认给文字有一个行高，最好自己设置一个
flexible.js文件，可以把页面变成固定10rem宽的原理
使用js把html标签的字体大小设置为窗口宽度的十分之一
如果不想让页面一直和设备一样宽，想给它设置一个最大、最小宽度，则

eg:
当设备宽度大于等于750px时，让页面宽度保持在750px
当设备宽度小于等于320px时，让页面宽度保持在320px
@media screen and (max-width:320px){
    html{
        font-size:37.5px !important;
    }
}
@media screen and (min-width:750px){
    html{
        font-size:75px !important;
    }
}
```

#### 响应式布局

```
原理
在不同的屏幕宽度下，给页面设置不同的样式，让页面正常显示(媒体查询)

屏幕分类
把屏幕的变化分为几个阶段，给每个阶段设置不同的适配样式即可
[0,768)  100%
[768,992)  750
[992,1200)  970
[1200,...)  1170

响应式布局容器
版心，随着浏览器窗口宽度变化而变化的版心
在页面中居中，跟随页面宽度的变化而变化

百分比布局
比较差的响应式布局，古老的布局方案，也叫流式布局
往往多用于列表渲染方面，以及其他简单活动界面，阅读界面等，用响应式的话就有些耗费精力
一般是宽度百分百，高度自适应
```

#### vw和vh

```
viewHeight
1vm = 1/100视口宽度

比如设计稿是宽375px 高667px
写less的时候可以
width: (80 / 3.75vw);
height: (45 / 3.75vw);
或者
width: (80 / 6.67vh);
height: (45 / 6.67vh);

以后只用vw或者vh布局就行了
```

#### Bootstrap

##### 使用方式

```
在页面中引入bootstrap的样式文件
抄：套用Bootstrap中的代码
改：对套用的部分进行修改（权重：bootstrap的样式权重多是一个类名）

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
```

**布局容器**

```
container（版心）
固定宽度、水平居中

超小屏 [0,768)  100%
小屏 [768,992)  750
中屏 [992,1200)  970
大屏 [1200,...)  1170

container-fluid（通栏）
和屏幕宽度一致
```

##### 栅格系统原理

```
把布局容器分成了12列（等份），通过类名来分配列数、移动盒子
通过类名来给盒子分配列数（宽度）
eg:
col-md-3
在中屏状态下分配3列

注意
分配列之前一定要设置行 类名为row的盒子
向上兼容
较小屏幕分配的列数也能在较大屏幕下起作用（前提在较大屏幕没有分配列数的时候）
```

##### 通过类名分配列数来移动盒子

```
列偏移
col-屏幕宽度-offset-列数，（只能）向右移动盒子
col-sm-offset-3 在小屏状态下向右移动3列

特点
会影响后面的标签（内部使用margin来移动盒子）

列排序
col-屏幕宽度-push-列数   向右移动盒子
col-屏幕宽度-pull-列数   向左移动盒子

特点
不会影响后面的标签（内部使用相对定位来移动盒子）
```

##### 响应式工具

```
visible-lg visible-sm visible-xs
在大屏、小屏、超小屏下会显示,快被废弃了

hidden-lg hidden-sm hidden-xs
在大屏、小屏、超小屏下会隐藏，推荐使用
```

#### 重绘和回流

```
回流
当render tree中的一部分(或全部)因为元素的规模尺寸，布局，隐藏等改变而需要重新构建
在页面第一次加载的时候，一定会发生回流，因为要构建render tree
回流的性能消耗大于重绘
重绘是某个DOM元素进行重绘
回流是整个页面进行重排，也就是页面所有DOM元素渲染

重绘
浏览器重新绘制受影响的部分到屏幕中
当render tree中的一些元素需要更新属性时，而这些属性只是影响元素的外观、风格而不会影响布局的时候
比如background-color，文字颜色、边框颜色等

回流的触发场景：
页面第一次渲染
元素的任何涉及长、宽、行高、边框、display等样式的更改
动画，:hover等伪类引起的元素表现改动
1.改变字体
2.增加或者移除样式表
3.内容变化（input框输入文字）
4.激活css伪类（例如 :hover）
5.计算offsetWidth、offsetHeigth属性（浏览器的可见高度）
6.设置style属性的值
回流一定伴随着重绘。

重绘的触发场景：
1、页面首次渲染
2、添加或者删除可见的DOM元素
3、元素位置改变；
4、元素尺寸改变——边距、填充、边框、高度和宽度
5、内容改变——比如文本改变或者图片大小改变而引起的计算值宽度和高度改变
6、浏览器窗口尺寸改变——resize事件发生时
修改背景颜色、字体颜色等不影响布局的行为都只引发重绘。

减少重绘或回流
1.使用transform做形变和位移替代定位top
2.使用visibility替换display:none, 因为前者只会引起重绘，而后者会引起回流
3.不要使用table布局，可能很小的一个改动会造成整个table的重新布局
4.动画实现的速度选择，动画速度越快，回流次数越多，也可以选择使用requestAnimationFrame
5.CSS选择符会从右往左匹配查找，因此要避免层级过多,避免在CSS中使用运算式
6.将频繁重绘或回流的节点设置为图层，图层能够阻止该节点渲染行为影响别的节点。比如video标签，浏览器会自动将该节点变为图层
7.避免多次读取某些属性
8.合并多次对DOM和样式的修改，然后一次处理掉
```

#### 浏览器兼容问题

```
css兼容
一些新的css属性不被支持，有的可以通过添加前缀解决，不能通过前缀解决的可以使用其他的css属性模拟

JavaScript兼容
一些新的语法和API，比如es6语法，可以使用babel做转码，转为合适的版本，针对API方面的兼容，需要检测浏览器是否支持相关API，再选择使用
```

#### FOUC（无样式内容闪烁）

```
文档样式短暂失效FOUC（Flash of Unstyled Content）
使用import方式来导入css文件，导致某些页面在windows下的IE出现奇怪的现象，以无样式显示页面内容的瞬间闪烁

原因
当css样式表晚于HTML结构加载时，
加载到此样式表时，页面将停止之前的渲染，
样式表被下载和解析后，重新渲染页面，就出现了短暂的闪屏现象。

解决
使用Link标签，将css样式表放在head中
```

#### BFC

```
块级格式化上下文

触发BFC
根元素HTML就是一个BFC
float值不为none
overflow的值不为visible
display的值为inline-block/ table-cell/ table-caption/ flex/ inline-flex
position的值为absolute或fixed

BFC特性
盒子垂直方向的距离由margin决定，属于同一个BFC的两个相邻盒子的margin会发生重叠
计算BFC的高度时，浮动元素也参与计算
BFC的区域不会与浮动的盒子发生重叠
BFC内部的盒子会在垂直方向，一个接一个的放置
每个元素的margin的左边会与包含块border的盒子左边相接触（对于从左到右的格式化，否则相反），即使存在浮动也会如此
BFC就是页面上的一个独立容器，容器里面的元素不会影响到外面的元素
```

#### 移动端适配

```
1. 手机淘宝方案：flexible.js，rem适配
2. less或者sass的预编译的mixin混合功能，带参数计算
3. 使用最新的postcss - npm install postcss-pxtorem --save-dev
```

#### width: 0;

```
溢出的时候显示省略号
因为弹性盒子的尺寸可以被内容撑开, 不换行的文字可以撑开这个盒子的尺寸

.orders .goods .txt {
    flex: 1;
    width: 0;
}
.orders .goods .txt h5 {
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
```

#### margin-top: -1px; 

使其边框与上面设置为1px的边框合并

#### 含有table的页面，表格可以随着浏览器窗口的变化而变化

未设置table的宽度，给table加上width=“ ”就好了

#### textarea文本域框的大小不能设定

应该先设置table的宽度（一般600px或800px），然后rows是一行的字数，cols是行数，以后用CSS修改

#### 表单和表格一起写先写哪个

表单和表格一起写的时候，要先写表单form，在表单form里面写表格table

#### 图片不能居中

```
可以给图片加个父盒子p，给p标签加修饰text-align：center；加个div也可以，

超链接和图片都不能直接设置居中
```

#### 字体上下边距调整有误

```
font: italic 400 16px/20px “Microsoft Yahei”;

line-height: 25px;

注意这两行代码的书写规范。两个都写的话，上面的样式会被下面的给覆盖掉
```

#### 立体盒子效果

```html
eg：
li:hover,
	.box .nav_02:hover {
	transition: all 0.4s;
	transform: translate3d(4px, 4px, 2px);
	box-shadow: 4px 4px 6px 4px rgba(0, 0, 0, 0.4);
   }
```

#### 行内块元素有间隙

```
本来就有间隙，目前只能设置margin为负数才能取消间隙，使元素都浮动也可以解决间隙
```

#### css父级元素margin-top:20px;子元素margin-top:10px;最后显示结果margin值是多少？

```
20px
嵌套元素设置上外边距（margin-top）出现塌陷问题

解决
方法一：给父元素设置上边框（border-top）
方法二：可以给父元素设置上内边距（padding-top）
方法三：给父元素设置（overflow：hidden）
```

#### 用伪元素去设置icon图标（精灵图）的时候不能显示

```
是因为伪元素是行内元素，设置宽高不显示。可以通过定位或者display去改变。
```

#### div+css的布局较table布局有什么优点?

```
改版的时候更加方便，只需要改动css文件即可
页面加载速度更快，结构化清晰，页面显示简洁
表现与结构相分离
易于SEO
```

#### 清除图片间隙

````
清除图片左右间距
1. 两张图片挨着写（img标签挨在一起）
2. 父元素的font-size设置为0
3. 给图片设置浮动

清除图片上下间距
1. 图片设置为display：block
2. 给图片设置vertical-align：top/bottom/middle
````

#### 移动端页面两边有缝隙

```css
@media screen and (min-width:320px){
	html{
	font-size:32px !important;
	}
}
@media screen and (max-width:750px){
    html{
        font-size:75px !important;
    }
}
和
body{
    min-width:320px;
    max-width:750px;
}
产生了冲突，目前，删掉上面的媒体查询，就好了
尽量写100%，不要写750px
.less文件比较好用
```

#### @basefont:"37.5";报错

````
尽量这样写@BaseFont : 37.5;
不加引号，双驼峰命名，后面数值不加引号，不加单位
````

#### 图片太大

```css
图片要单独设置宽，高可以不用设置，会等比例放大，给父级元素设置了宽后，图片宽设置为100%就把盒子撑满了
即使给body设置了宽，body底下的div没宽，div底下的img宽为100%，图片宽度也能和body一样宽
图片宽度尽量给100%

caa:
body{
	width:400px;
}
div{
	background-color:pink;
}
img{
    display:block;
    width:100%;
}
html:
<body>
    <div>
        <img src="./images/upload/banner.jpg" alt="">
    </div>
</body>
此时图片宽度为400px
```

#### 给a标签的before加字体图标，字体图标没对齐

```
给::before加vertical-align:middle；然后加个padding-right:5px；
```
