# jQuery

#### 介绍

```
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>

j就是 JavaScript，Query 是查询的意思

jQuery把js中的DOM操作做了封装，可以快速的查询使用里面的功能
使用webAPI中的原生js实现的，都可以使用jQuery实现

jQuery对象与DOM对象比较
jQuery对象是使用jQuery的方法获取的元素
DOM对象是使用原生js的方法获取的元素
jQuery对象是一个包含了DOM对象伪数组
DOM对象是一个标签对应的对象
jQuery对象只能调用jQuery对象的属性和方法，不能使用DOM对象的属性和方法
DOM对象只能调用DOM对象的属性和方法，不能使用jQuery对象的属性和方法

jQuery对象转化为DOM对象
jQuery对象[0]
jQuery对象.get(索引值)
DOM对象转化为jQuery对象
$(DOM对象)

jQuery的使用流程
引入jQuery的js文件：jQuery官网  github（也可以写链接，线上jquery）
写入口函数：页面加载事件，为了能在页面标签加载完成之后再执行代码  $(function(){ .... })
在入口函数中书写正式代码

jQuery方法的特性
隐式迭代
在jQuery中，可以同时操作多个标签，方法内部会隐式循环迭代
eg:
$("li").css("color","red")

链式编程
在jQuery中，"设置方法"会返回调用该方法的对象
eg:
$('#content div').eq($(this).index()).show().siblings().hide();

jQuery插件常用的网站
jQuery插件库
http://www.jq22.com/
jQuery之家
http://www.htmleaf.com/

解决多库共存问题(命名冲突)
如果$被占用，可以使用jQuery
如果$和jQuery都被占用，可以在引入冲突的库之前，用$.noConflict()转移控制权
```

#### jQuery选择元素

```
$(css选择器)
把css选择器作为字符串传入$方法中
eg:
$(".demo")  选择页面中类名有demo的元素
$("#box")  选择页面id为box的元素

$(css选择器 + 筛选选择器)
$("ul li:first"): 选择ul中第一个li
$("ul li:last"): 选择ul中最后一个li
$("ul li:eq(2)"): 选择ul中索引值等于2的li（eq中的索引值从0开始的）    
$("ul li:even"): 选择ul中索引值是偶数的li（even中的索引值从0开始的）      
$("ul li:odd"): 选择ul中索引值是奇数的li（odd中的索引值从0开始的）      
$("ul li:lt(2)"): 选择ul中索引值小于2的li
$("ul li:gt(2)"): 选择ul中索引值大于2的li
```

#### jQuery动画

```
对角线动画show/hide/toggle
show(1000,fn)
第一个参数
动画时间
第二个参数
动画完成后的回调函数
注意
如果不指定动画时长，则无动画效果

滑入滑出动画slideDown/slideUp/slideToggle
slideDown(1000,fn)
第一个参数
动画时间
第二个参数
动画完成后的回调函数
注意
即使不传入动画时间参数，也有动画效果

淡入淡出动画fadeIn/fadeOut/fadeToggle
fadeIn(1000,fn)
第一个参数，动画时间
第二个参数，动画完成后的回调函数
注意
即使不传入动画时间参数，也有动画效果

fadeTo(1000,value,fn)
淡到指定程度动画
第一个参数，动画时间
第二个参数，透明度
第三个参数，动画完成后的回调函数

自定义动画animate
jQuery对象.animate( 样式属性的键值对，动画时间，回调函数 )
以动画的形式来设置元素的样式
eg：
$("div").animate({
width:"200px"
},1000,function(){
})
只能给元素设置动画，不可以给$(document)设置动画
要给整个页面做动画，可以$("body,html").animate()

动画排队
某个元素上如果同时设置了多个动画，则这些动画会按照添加的顺序依次执行
解决方法
添加新的动画之前，可以用stop清除原来的动画
可以简单理解为把所有动画都清除
```

#### 元素方法

##### 选择元素

```css
jQuery对象.parent()
选择jQuery对象的父元素

jQuery对象.children()
选择jQuery对象的子元素
注意：如果不传入参数则选择出所有子元素
$("div").children()  选择div的所有子元素
$("div").children("p")  选择div的所有子元素中p标签

jQuery对象.find()
选择jQuery对象的后代元素
注意：必须要有参数，如果没有参数  选择不到元素

jQuery对象.siblings()
选择jQuery对象的所有兄弟元素（不包括自己哦）

jQuery对象.nextAll()
选择jQuery对象的后面的兄弟元素

jQuery对象.next()
获取后面紧挨着的兄弟元素

jQuery对象.prevAll()
选择jQuery对象的前面的兄弟元素

jQuery对象.eq(索引值)
选择jQuery对象中索引值为指定值的元素

jQuery对象.parents()
没有参数
获取祖先元素，所有上层元素（父亲、爷爷、祖爷爷。。。。）

jQuery对象.parents(选择器)
有参数
获取所有符合选择器的上层元素（有可能有多个）

jQuery对象.closest()
没有参数
获取不到任何元素

jQuery对象.closest(选择器)
有参数
获取离当前元素最近的最近的祖先元素\上层元素
```

##### 操作元素

```css
显示元素
jQuery对象.show()

隐藏元素
jQuery对象.hide()

添加类
jQuery对象.addClass()

删除类
jQuery对象.removeClass()
不写删除哪个类名，则默认删除全部类名

切换类
jQuery对象.toggleClass()

判断jQuery对象是否具有某个类
jQuery对象.hasClass(类名字符串)
返回true：具有指定类
返回false：不具有指定类

设置样式
jQuery对象.css(样式名，样式值)

jQuery对象.css({
	样式名1:样式值1,
	样式名2:样式值2,
	样式名3:样式值3
})

获取样式
jQuery对象.css(样式名)

获取表单元素值
jQuery对象.val()
$(selector).val();
对应表单元素的value属性

设置表单元素的值
$(selector).val(“具体值”);

html()对应innerHTML
text()对应innerText

获取元素内容
jQuery对象.html()

设置元素内容
jQuery对象.html(要设置的HTML内容)

获取文本内容
jQuery对象.text()

设置文本内容
jQuery对象.text(要设置的文本内容)

获取签属性
$(selector).attr(“title”);

设置签属性
$(selector).attr(“title”, “传智播客”);

操作元素属性
prop()

把数据存储到元素上，将来可以通过这个元素来获取之前存储的数据

元素上存储数据
jQuery对象.data(数据名, 数据)

元素上取数据
jQuery对象.data(数据名)

遍历元素
jQuery元素.each(function(i,domEle){
})

遍历数组和普通对象
$.each(要遍历的数据,function(索引值，遍历到的数据){
})

创建元素
$(具有标签格式的字符串)
创建的是jQuery对象

添加元素
内部添加，添加的元素 和 匹配的元素 是父子关系
外部添加，添加的元素 和 匹配的元素 兄弟关系
after后面
before前面

添加元素示例:
var li=$("<li></li>")
$("ul").append(li)添加到后面
$("ul").prepend(li)前面

删除元素
$("ul").remove()删除匹配的元素
$("ul").empty() 删除匹配元素里面的子节点
$("ul").html(“”)删除匹配元素里面的子节点

克隆元素
var copyLi = $("li").clone();
$("ul").append(copyLi);
克隆节点默认带着标签中的内容
clone(true)会把原来绑定的事件一起复制过去

获取和修改元素的尺寸
括号为空时获取，括号里面有参数是修改
width()				获得匹配元素的宽度
height()
innerHeight()		包含padding
innerWidth()
outerWidth()		包含padding和border,用的多，类似于offsetWidth
outerHeight()
outerWidth(true)	包含padding和border和margin

获取和修改元素的位置
距离文档的位置(偏移)
offset().left
offset().top

获取元素的位置
距离带有定位的父级的位置，都没定位，就以文档为定位(偏移)
position()

获取和修改滚动条相对于其顶部的偏移
scrollTop()

获取页面滚动出去上方的高度(有兼容性问题)
$(document).scrollTop()

设置页面滚动出去上方的高度(有兼容性问题)
$("body,html").scrollTop(100)


遍历元素和数组示例:
$(".itxt").each(function(i,ele){
	count+=$(ele).val()
})
$.each(arr,function(i,ele){
})

创建元素示例:
var li=$("<li></li>")

获取和修改元素的尺寸示例:
$("div")width()	获取
$("div")width(200)	修改

修改元素的位置示例:
修改，以键值对的方式
$(".son").offset({
	top:200，
	left:200
})

获取滚动条相对于其顶部的偏移示例:
获取one里面的内容超出one顶部的距离
$(".one").scrollTop()
```

#### 事件

##### 单个事件注册

```js
element.事件(function(){})

eg：
$(“div”).click(function(){  事件处理程序 })  

注意
事件处理函数中的this是DOM对象  如果要操作jQuery的方法  必须要先把this转化为jQuery对象
```

##### 事件处理on()绑定事件

以后尽量使用on方法

one绑定事件，只能触发一次

```js
绑定多个事件，可以指定多个不同的事件处理函数，也可以指定相同的事件处理函数
$(“div”).on({
	mouseover: function(){}, 
	mouseout: function(){},
	click: function(){}	
}); 

如果事件处理程序相同 
$(“div”).on(“mouseover mouseout”, function() {
	$(this).toggleClass(“current”);
});  

事件委托，比如事件绑定给父元素ul，点击子元素li触发事件，this指向触发事件的元素
li的委托事件，其实绑定到了one身上
$("ul").on("click","li",function(){
	alert('hello world!');
});

给未来创建的元素绑定事件，绑定动态事件
$(“div").on("click",”p”,function(){
	alert("俺可以给动态生成的元素绑定事件")
}); 
$("div").append($("<p>我是动态创建的p</p>"));
```

##### 事件处理off()解绑事件

```js
jQuery对象.off()
解绑所有事件

jQuery对象.off(事件类型名)
解绑指定类型事件

jQuery对象.off(事件类型名,选择器)
解绑委托事件（本身的事件还在）

eg:
<div class="one">
	<div class="two"></div>
	<div class="three"></div>
</div>

$(".one").on("click", ".two", function() {
	alert("1");
})
$(".one").on("click", ".three", function() {
	alert("1");
})

$(".one").off("click", ".three")
//不影响two的事件

$(".one").off("click")
//绑定到one上的事件都被解绑了，one自己的事件也被解绑了

$(".one").off("click", "**")
//解绑所有的委托事件，本身的事件还在
```

##### 事件类型

```js
hover()
鼠标经过事件
鼠标经过离开都会触发

jQuery对象.hover( 事件处理程序1,事件处理程序2 )
鼠标经过触发处理程序1 
鼠标离开触发处理程序2

jQuery对象.hover( 事件处理程序 )
鼠标经过、离开都会 触发处理程序

oninput()
在input标签中输入的时候，触发的事件

trigger()
自动触发事件
真的触发了事件

triggerHandler()
只是执行了事件处理函数，不是真的触发了事件，不能触发浏览器的默认行为
```

#### jQuery中的Ajax

##### $.get()

```js
用来发起 get 请求，从而将服务器上的资源请求到客户端来进行使用。
$.get(url, [data], [callback])

参数名 	 参数类型 	    是否必选 	说明
url 	   string 		是 		  要请求的资源地址
data 	   object 		否 		  请求资源期间要携带的参数
callback   function 	否 		  请求成功时的回调函数

$.get() 函数发起不带参数的请求时，直接提供请求的 URL 地址和请求成功之后的回调函数即可
$.get('http://www.liulongbin.top:3006/api/getbooks', function(res) {
 console.log(res) // 这里的 res 是服务器返回的数据
})

$.get() 函数发起带参数的请求时，res只是对应的data参数的数据，如果没有data，则获取的是地址里面包含的所有数据。
$.get('http://www.liulongbin.top:3006/api/getbooks', { id: 1 }, function(res) {
 console.log(res)
})
```

##### $.post() 

```js
用来发起 post 请求，从而向服务器提交数据。
$.post(url, [data], [callback])

参数名 	   参数类型 	是否必选 	说明
url 		 string 	是 		  提交数据的地址
data 		 object 	否 		  要提交的数据
callback 	 function 	否 		  数据提交成功时的回调函数

$post() 向服务器提交数据
$.post(
 'http://www.liulongbin.top:3006/api/addbook', // 请求的URL地址
 { bookname: '水浒传', author: '施耐庵', publisher: '上海图书出版社' }, // 提交的数据
 function(res) { // 回调函数
 console.log(res)
 }
)
```

##### $.ajax()

```js
允许我们对 Ajax 请求进行更详细的配置
$.ajax({
 type: '', 					// 请求的方式，例如 GET 或 POST
 url: '', 					// 请求的 URL 地址
 data: { },					// 这次请求要携带的数据
 success: function(res) { } // 请求成功之后的回调函数
})

使用 $.ajax() 发起 GET/POST 请求时，只需要将 type 属性的值设置为 'GET' 即可
$.ajax({
 type: 'GET', // 请求的方式, type: 'POST'则为POST请求
 url: 'http://www.liulongbin.top:3006/api/getbooks', // 请求的 URL 地址
 data: { id: 1 },// 这次请求要携带的数据
 success: function(res) { // 请求成功之后的回调函数
 console.log(res)
 }
})
```

##### 使用JQuery上传图片

````js
监听请求开始
$(document).ajaxStart(function () {}

监听请求结束
$(document).ajaxStop(function () {}

$().on("click",function(){
var files = document.QuerySelector().files
if(files.length<=0){
return
}
var fd = new FornData()
fd.append("avatar",files[0])
})

$.ajax({
	type: 'POST'

	url:url

	data: FormData对象
	这个FormData对象已经包含了文件

	processData:false
	不对数据进行urlencode编码

	contentType:false
	不改变Content-Type的值

	success:function(res){
		return res.msg
	}
})
````

#### jQuery清空表单内容

```js
$('#form')[0].reset()
```
