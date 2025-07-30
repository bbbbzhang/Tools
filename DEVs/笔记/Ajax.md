# AJAX

##### 简介

```js
Asynchronous JavaScript And XML

AJAX的概念和特点
在不刷新页面的情况下，使用js代码发起对另外一个地址的请求(不刷新界面)
在获取到数据之后，做当前页面的局部刷新(操作dom)
异步JavaScript和XML，一种交互式网页开发技术
可以使网页实现异步(局部)更新
利用客户端的闲置的资源进行处理，减轻服务器和带宽的负担，节约空间和成本。

AJAX的原理
通过XMLHttpRequest对象向服务器发送异步请求，从服务器获取数据，利用js操作dom更新页面

AJAX的优点
局部实现无刷新更新数据
异步通信服务
更好的实现前后端分离
前后端负载平衡

AJAX的缺点
无刷新更新数据->对浏览器的back和history机制造成了破坏
数据传输的安全问题
搜索引擎支持较弱
对移动端设备支持不是很好

XMLHttpRequest对象
在网页中请求服务器上的数据资源的时候用到
XMLHttpRequest对象（简称 xhr）是浏览器提供的js成员，通过它可以请求服务器上的数据资源。
let xhrObj = new XMLHttpRequest()

URL地址
统一资源定位符
通信协议、服务器名称、资源在服务器上具体的存放位置
```

##### AJAX的实现步骤

```js
XML的基本使用步骤\Ajax的实现步骤

创建ajax对象XMLHttpRequest
告诉ajax请求方式以及请求地址
如果是get请求，请求参数放于url后面，以？进行连接，多组数据以&进行连接
url不允许出现中文，要对其进行编码和解码
如果是post请求，请求参数放于.send()中
发送请求.send()
监听.onreadystatechange时间，写一个函数
.onload获取服务端与客户端的响应数据
  
1.创建Ajax对象
var xhr = new XMLHttpRequest();

2.告诉Ajax请求地址以及请求方式
xhr.open('get','http://www.baidu.com');
请求方式	GET/POST
URL
如果是GET请求, 请求参数放于url后面, 以?进行连接,多组数据以&符号连接
URL的要求
不允许出现中文,所以有时候需要对中文进行编码和解码
编码
var str = 'abcde'
var str2 = encodeURI(str)
解码
var str3 = decodeURI('%E9%BB%91%E9%A9%AC')

3.发送请求
xhr.send();
如果是POST请求
xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
xhr.send('bookname=水浒传&author=施耐庵&publisher=上海图书出版社')

4.监听onreadystatechange事件
// 当 Ajax 状态码发生变化时将自动触发该事件
// 在事件处理函数中获取 Ajax 状态码并对其进行判断，
// 当Ajax状态码发生变化时
// 判断当Ajax状态码为4，并且响应状态码为200时
// 通过xhr.responseText获取服务器端的响应数据
xhr.onreadystatechange = function(){
	if(xhr.readyState === 4 && xhr.status ===200 ){
		console.log(xhr.responseText)
	}
}

5.获取服务端与客户端的响应数据
xhr.onload = function(){
	console.log(xhr.responseText);
}
```

#####  基于Promise发送Ajax请求

```html
  <script type="text/javascript">
    function queryData(url) {
     #   1.1 创建一个Promise实例
      var p = new Promise(function(resolve, reject){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
          if(xhr.readyState != 4) return;
          if(xhr.readyState == 4 && xhr.status == 200) {
            # 1.2 处理正常的情况
            resolve(xhr.responseText);
          }else{
            # 1.3 处理异常情况
            reject('服务器错误');
          }
        };
        xhr.open('get', url);
        xhr.send(null);
      });
      return p;
    }
	# 注意：这里需要开启一个服务 
    # 在then方法中，你也可以直接return数据而不是Promise对象，在后面的then中就可以接收到数据了
    queryData('http://localhost:3000/data')
      .then(function(data){
        console.log(data)
        #  1.4 想要继续链式编程下去 需要 return
        return queryData('http://localhost:3000/data1');
      })
      .then(function(data){
        console.log(data);
        return queryData('http://localhost:3000/data2');
      })
      .then(function(data){
        console.log(data)
      });
  </script>
```

##### AJAX状态码

````js
在创建ajax对象，配置ajax对象，发送请求，以及接收完服务器端响应数据，
每一个步骤都会对应一个数值

通过xhr.readyState获得ajax状态码(获取服务器端的响应状态)
0：请求未初始化(还没有调用open())
1：请求已经建立，但是还没有发送(还没有调用send())
2：请求已经发送
3：请求正在处理中，通常响应中已经有部分数据可以用了
4：响应已经完成，可以获取并使用服务器的响应了
````

##### 封装XMLHttpRequest函数

```js
定义一个函数fengzhuang, 接收一个对象作为参数
method
url
data
success

把data对象转成查询字符串

xhr常规操作
判断get和post
url时需要判断
设置请求头
xhr.send方法调用时

function resolveData(data) {
  var arr = []
  for (var k in data) {
    var str = k + '=' + data[k]
    arr.push(str)
  }

  return arr.join('&')
}
// var res = resolveData({ name: 'zs', age: 20 })
// console.log(res)

function itheima(options) {
  var xhr = new XMLHttpRequest()
   // 把外界传递过来的参数对象，转换为 查询字符串
  var qs = resolveData(options.data)
  if (options.method.toUpperCase() === 'GET') {
    // 发起GET请求
    xhr.open(options.method, options.url + '?' + qs)
    xhr.send()
  } else if (options.method.toUpperCase() === 'POST') {
    // 发起POST请求.
    xhr.open(options.method, options.url)
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    xhr.send(qs)
  }
	//获取服务器端的响应时，自动调用该事件
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
    //将服务器传过来的数据转化
      var result = JSON.parse(xhr.responseText)
      options.success(result)
    }
  }
}
```

##### XML和JSON数据格式

```
数据格式是数据的组织形式
zhangsan^18^男,lisi^20^女

XML数据格式
标签包裹数据
标签必须成对出现，标签名称可以自定义
缺点
元数据占用的数据量比较大
不利于大量数据的网络传输
不方便解析

JSON数据格式
JSON的本质是字符串
键值对的形式，和js中的对象很类似
JSON数据中的键必须用双引号包括
JSON比XML更小、更快，更易解析
解析
xhr.responseText
JSON.parse
JSON.stringify

服务器端大多数情况下会以JSON对象作为响应数据的格式

包含对象和数组两种结构，通过这两种结构的相互嵌套，可以表示各种复杂的数据结构
JSON是一种数据格式，在实际开发中，JSON 总是以配置文件的形式出现。
也可以在计算机与网络之间存储和传输数据

小程序项目中有4种 json 配置文件，分别是： 
项目根目录的 app.json 配置文件 
项目根目录种的 project.config.json 配置文件 
项目根目录中的 sitemap.json 配置文件
每个页面文件夹中的 .json 配置文件
```

##### XMLHttpRequest Leave2

```js
设置 HTTP 请求的时限
监听超时时间
xhr.timeout = 3000
超时后触发的回调函数
xhr.ontimeout = function(){}

FormData 对象管理表单数据
var fd = new FormData()
fd.append('uname', 'zs')
快速从表单中填充FormData
var fd = new FormData(form)
xhr.send(fd)
注意
FormData只是数据提交的一种方式而已
使用FormData发起的POST请求要服务端支持才可
同一个名称可以设置多个值
打印可以看到它的方法

上传文件
1.选择文件标签
<input type="file" id="file1" />
2.得到用户选择的文件
input元素.files
3.将文件放入FormData中
var files = document.querySelector('#file1').files
var fd = new FormData()
fd.append('avatar', files[0])
4.将FormData对象传入到请求体中
xhr.send(fd)
5.监听xhr的readystatechange事件
xhr.readyState === 4 && xhr.status === 200

获取数据传输的进度信息
xhr.upload.onprogress = function (e) {}
e.lengthComputable
e.loaded
e.total
xhr.upload.onload = function(){}
```

#### form表单

##### 介绍

```js
<form>标签用来采集数据
<form>标签的属性则是用来规定如何把采集到的数据发送到服务器

form标签的属性

action
需要提交到的地址

target
在何处打开页面
	_blank 新窗口打开
	_self   默认。在相同的框架中打开。
	_parent  在父框架集中打开。（很少用）
	_top  在整个窗口中打开。（很少用）
	framename  在指定的框架中打开。（很少用）

method
提交方式
	GET
	数据跟在URL后面,只能提交较少、简单的数据,不设置时此为默认值
	POST
	数据放在请求体中，可以提交大量数据	

两种方法提交格式类似，提交的数据放的位置不同
GET请求不能提交JSON对象数据格式，传统网站的表单提交也不支持JSON对象数据格式。

enctype
发送表单数据之前如何对数据进行编码

表单的提交不涉及到文件上传操作，
enctype 的值设置为application/x-www-form-urlencoded 在发送前编码所有字符（默认）
在涉及到文件上传的操作时，
enctype 的值设置为multipart/form-data 不对字符编码

text/plain
空格转换为 “+” 加号，但不对特殊字符编码。（很少用）

Content-Type
属性的值是 application/json，
告诉服务器端当前请求参数的格式是 json。
JSON.stringify() // 将json对象转换为json字符串

用户提交的数据是以键值对的方式提交的，
表单域内的标签的name属性，就是key。
```

##### form表单的同步提交

```
通过点击表单内的<button></button>或<input type="submit"/>
触发表单提交的操作，
从而使页面跳转到action URL的行为

缺点
整个页面会跳转到 action URL 所指向的地址，用户体验很差。
页面之前的状态和数据会丢失。

解决方案
表单只负责采集数据，Ajax负责将数据提交到服务器。
不跳转页面，阻止表单默认提交行为
1.监听表单提交事件submit
2.阻止表单提交:e.preventDefault()
3.在表单提交之前:收集数据	$(表单).serialize()
4.使用ajax提交数据给服务器

获取表单中所有的数据：
必须为每个表单元素添加 name 属性
jQuery中的serialize()函数
$(selector).serialize()

eg：
$('#form1').submit((e) => {
	e.preventDefault()
	let res = $('#form1').serialize()
	console.log(res)
})
```

##### 

```js

```

#### IP地址

```
互联网上每台计算机的唯一地址
IP地址的格式
通常用“点分十进制”表示成（a.b.c.d）的形式，其中，a,b,c,d 都是 0~255 之间的十进制整数。
例如：
用点分十进表示的IP地址（192.168.1.1）
以192.168开头的都是私有ID

注意
互联网中每台 Web 服务器，都有自己的 IP 地址，
例如：大家可以在 Windows 的终端中运行 ping www.baidu.com 命令，即可查看到百度服务器的 IP 地址。
开发期间，自己的电脑既是一台服务器，也是一个客户端，
为了方便测试，可以在自己的浏览器中输入 127.0.0.1 （代表本机）这个IP 地址，就能把自己的电脑当做一台服务器进行访问了。

	公网IP
		14.215.177.38
		ping www.baidu.com
	局域网IP
		192.168.21.82
		ipconfig
		192.168.xx.xx
	预留IP
		127.0.0.1
		本机地址
	IPv4
		255.255.255.255
	IPv6
		2001:0db8:3c4d:0015:0000:0000:1a2f:1a2b
		可以代表地球上的每一粒沙子
```

#### 域名和域名(解析)服务器

```
域名（Domain Name）地址
字符型的地址方案（由于IP地址是一长串数字，不直观，不便于记忆）

域名服务器(DNS，Domain name server)
提供 IP 地址和域名之间的转换服务的服务器，存的是域名和ip地址的对应关系

IP地址和域名是一一对应的关系，
域名服务器就是用来存放这种对应关系的电脑
通过域名访问对应的服务器即可，对应的转换工作由域名服务器实现。

单纯使用 IP 地址，互联网中的电脑也能够正常工作。但是有了域名的加持，能让互联网的世界变得更加方便。
127.0.0.1对应的域名是localhost，代表我们自己的这台电脑，在使用效果上没有区别
```

#### 端口号

```
在一台电脑中，可以运行成百上千个 web 服务。每个 web 服务都对应一个唯一的端口号。
通过端口号，可以将客户端发送过来的网络请求，准确地交给对应的 web 服务进行处理。

注意
每个端口号不能同时被多个 web 服务占用。
在实际应用中，URL 中的 80 端口可以被省略。

https默认端口号是443
http默认端口号是80
提供mysql数据库服务3306
```

#### 同源、跨域

````
同源策略/SOP（Same origin policy）
是一种约定
同源是指 协议+域名+端口 三者相同，即便两个不同的域名指向同一个ip地址，也非同源。
它是浏览器最核心也最基本的安全功能，如果缺少了同源策略，浏览器很容易受到XSS、CSFR等攻击。
阻止从一个域上加载的脚本获取或操作另一个域上的文档属性， 浏览器不能执行其他网站的脚本。防止他人恶意攻击网站
JS只能与同一个域中的页面进行通讯

一定要明白是谁和谁同源
当前页面的地址 和 使用ajax发起请求的地址 同源

哪些方式会产生同源策略
端口号不同，域名不同，协议不同，域名和域名对应的ip之间

为什么会产生跨域
是因为浏览器的同源策略
Ajax直接请求普通文件存在跨域无权限访问的问题，
甭管你是静态页面、动态网页、web服务、WCF，
只要是跨域请求，一律不准。

同源策略是浏览器的安全策略
ajax
当前页面的地址,如果和发起ajax请求的地址不同源
请求会发送出去,但是数据回来的时候,浏览器会阻止将数据传递给ajax的success函数

cookie
A网页设置的 Cookie，B网页不能打开，除非这两个网页"同源"。
Cookie 是服务器写入浏览器的一小段信息，只有同源的网页才能共享。
但是，两个网页一级域名相同，只是二级域名不同，浏览器允许通过设置document.domain共享Cookie。
举例来说，
A网页是http://w1.example.com/a.html，
B网页是http://w2.example.com/b.html，
那么只要设置相同的document.domain，两个网页就可以共享Cookie。
domain 属性可返回下载当前文档的服务器域名。
语法：document.domain

storage

注意
当前页面的地址和link标签的href属性
当前页面的地址和script标签的src属性
当前页面的地址和img标签的src属性
这些是不受同源策略限定的
````

#### 解决跨域方案

```
JSONP跨域解决方案
本质：script引入外部文件，这个文件的内容就是一个方法调用
静态script标签，
script标签中的src属性
动态script标签，
document.createElement("script");，指定src属性，加到head标签中
由服务器返回一个函数调用，函数名称通过url参数确定

JSONP非正式传输协议
允许在服务器端集成script tags返回至客户端，通过js callback的形式实现跨域访问，

在Web页面上调用js文件是不受浏览器同源策略的约束的，
凡是拥有”src”这个属性的标签都拥有跨域的能力，比如<\script>、<\img>、<\iframe>。

客户端通过调用脚本的方式，来调用跨域服务器上动态生成的js格式文件（一般以JSON为后缀），获取数据，
允许用户传递一个callback参数给服务端，
然后服务端返回数据时会将这个callback参数作为函数名来包裹住JSON数据，
客户端就可以随意定制自己的函数来自动处理返回数据。

JSON这种纯字符数据格式可以简洁的描述复杂数据，还被js原生支持。
所以服务器就把数据装进json文件，骗过同源策略，传输给浏览器。

JSONP跨域解决方案的底层实现原理
利用script标签的src属性不受浏览器同源策略的限制来请求第三方内容
使用script标签的src指向线上的一个路径，
这个线上的路径给我们的一段函数调用的代码，
而数据就在这个函数的参数中调用

JSONP跨域解决方案的缺点
只能支持get，现在JSONP已经被淘汰了

自己实现JSONP的封装
JSONP只支持get
创建script标签
配置script标签的src属性
传递JSONP
传递jsonpCallback
给window增加一个方法，方法的名称就是jsonpCallback的值

CORS跨域解决方案
W3C标准，跨域资源共享（Cross-origin resource sharing）
服务端解决，服务端告诉浏览器: 兄弟, 放松警惕, 没事
需要浏览器和服务器同时支持，所有浏览器都支持该功能，IE浏览器不能低于IE10。
浏览器向跨源服务器，发出XMLHttpRequest请求，从而克服AJAX只能同源使用的限制。
只要服务器实现了CORS接口，就可以跨源通信。

对于开发者来说，CORS通信与同源的AJAX通信没有差别，代码完全一样。
浏览器一旦发现AJAX请求跨源，就会自动添加一些附加的头信息，有时还会多出一次附加的请求，但用户不会有感觉。

jQuery实现跨域
dataType:jsonp			//必须得写
jsonp:"cb"			 	//一般不用
jsonpCallback:"hello"	 //一般不用
```

#### 通信协议

##### 介绍

```
（Communication Protocol）
通信双方采用约定好的格式来发送和接收消息，这种事先约定好的通信格式
常见的计算机协议HTTP，HTTPS，FTP，SMTP，SSH
```

##### HTTP通信协议

```js
超文本传送协议 (HyperText Transfer Protocol) 
规定了客户端与服务器之间进行网页内容传输时，所必须遵守的传输格式。
互联网上应用最为广泛的一种网络协议，
是一个客户端和服务器端请求和应答的标准（TCP），
用于从WWW服务器传输超文本到本地浏览器的传输协议，
可以使浏览器更加高效，使网络传输减少。

例如：
客户端要以HTTP协议要求的格式把数据提交到服务器
服务器要以HTTP协议要求的格式把内容响应给客户端

HTTP缓存机制
根据是否需要重新向服务器端发起请求可以分为强缓存和协商缓存
可以同时存在，且强缓存优先级高于协商缓存，
请求资源时会先比较强缓存字段，如果成功则不会再执行协商缓存
强缓存：
强缓存与时间期限有关，浏览器会查看缓存中的资源是否过期，过期则重新请求数据，未过期则取得缓存资源做下一步处理
协商缓存：
会和服务器做交互，取得缓存会先向服务器确认缓存是否可以使用，如果可以，服务器会返回可用信号，如果不可以，则返回新的资源
```

##### HTTPS

```js
以安全为目标的HTTP通道，HTTP的安全版
即HTTP下加入SSL层，HTTPS的安全基础是SSL，因此加密的详细内容就需要SSL
ssl加密在传输层实现

作用
建立一个信息安全通道，来确保数组的传输，确保网站的真实性。

和http的区别
Https协议需要ca证书，费用较高。
http是超文本传输协议，信息是明文传输，https则是具有安全性的ssl加密传输协议。
使用不同的链接方式，端口也不同，一般而言，http协议的端口为80，https的端口为443
http的连接很简单，是无状态的；
HTTPS协议是由SSL+HTTP协议构建的可进行加密传输、身份认证的网络协议，比http协议安全。

原理
客户端在使用HTTPS方式与Web服务器通信时有以下几个步骤，如图所示。
客户使用https url访问服务器，则要求web 服务器建立ssl链接。
web服务器接收到客户端的请求之后，会将网站的证书（证书中包含了公钥），返回或者说传输给客户端。
客户端和web服务器端开始协商SSL链接的安全等级，也就是加密等级。
客户端浏览器通过双方协商一致的安全等级，建立会话密钥，然后通过网站的公钥来加密会话密钥，并传送给网站。
web服务器通过自己的私钥解密出会话密钥。
web服务器通过会话密钥加密与客户端之间的通信。

优点
使用HTTPS协议可认证用户和服务器，确保数据发送到正确的客户机和服务器；
HTTPS协议是由SSL+HTTP协议构建的可进行加密传输、身份认证的网络协议，要比http协议安全，可防止数据在传输过程中不被窃取、改变，确保数据的完整性。
HTTPS是现行架构下最安全的解决方案，虽然不是绝对安全，但它大幅增加了中间人攻击的成本。
谷歌曾在2014年8月份调整搜索引擎算法，并称“比起同等HTTP网站，采用HTTPS加密的网站在搜索结果中的排名将会更高”。

缺点
https握手阶段比较费时，会使页面加载时间延长50%，增加10%~20%的耗电。
https缓存不如http高效，会增加数据开销。
SSL证书也需要钱，功能越强大的证书费用越高。
SSL证书需要绑定IP，不能再同一个ip上绑定多个域名，ipv4资源支持不了这种消耗。
```

##### HTTP请求\响应报文

```js
报文
在HTTP请求和响应的过程中传递的数据块
包括要传送的数据和一些附加信息
这些数据和信息要遵守规定好的格式

请求报文
1、请求行（request line）
GET / HTTP/1.1

2、请求头（header）
Host:127.0.0.1:8080
Content-Type: application/x-www-form-urlencoded
Accept-Language: zh-CN,zh;q=0.9
3、空行

4、请求体
get请求没有请求体
bookname=水浒传&author=施耐庵&publisher=上海图书出版社

响应报文
1、响应行
HTTP/1.1 200 OK

2、响应头
Connection: Keep-Alive
Content-Type: text/html;charset=utf-8
Content-Length:200

3、空行

4、响应体
服务器响应给浏览器的数据
```

##### HTTP请求方式

```js
GET
获取，不安全，限制长度(4K)，通过地址栏，有缓存
POST
传输，安全，理论上不限制的(2M)，通过send和设置请求头，没有缓存
PUT
修改
DELETE
删除

GET和POST区别
GET在浏览器回退时是无害的，而POST会再次提交请求。
GET产生的URL地址可以被Bookmark，而POST不可以。
GET请求会被浏览器主动cache，而POST不会，除非手动设置。
GET请求只能进行url编码，而POST支持多种编码方式。
GET请求参数会被完整保留在浏览器历史记录里，而POST中的参数不会被保留。
GET请求在URL中传送的参数是有长度限制的，而POST么有。
对参数的数据类型，GET只接受ASCII字符，而POST没有限制。
GET比POST更不安全，因为参数直接暴露在URL上，所以不能用来传递敏感信息。
GET参数通过URL传递，POST放在Request body中
```

##### HTTP响应状态码

```js
（HTTP Status Code）
表示网页服务器超文本传输协议响应状态的3位数字代码。

1开头（消息）

2开头（成功）
200，获取数据成功了
201，新增数据成功了
204，删除数据成功了

3开头（重定向）
301，被请求的资源已永久移动到新位置
302，请求的资源临时从不同的 URI响应请求
304，未修改
告诉浏览器: 你之前已经得到过这个数据了, 这个数据在你获取之后没有修改过, 你可以从你的缓存中获取这部分数据

4开头（前端的操作错误造成请求失败）
400，请求有误
401，需要登录
403，没有权限
404，找不到

5开头（服务器的问题）
500，服务器错误
501，服务器不支持
503，服务器维护
```

#### TCP三次握手

```js
客户端和服务端都需要直到各自可收发，因此需要三次握手。
三次握手可以简化为：C发起请求连接S确认，也发起连接C确认
第一次握手：S只可以确认 自己可以接受C发送的报文段
第二次握手：C可以确认 S收到了自己发送的报文段，并且可以确认 自己可以接受S发送的报文段
第三次握手：S可以确认 C收到了自己发送的报文段
```

#### 接口

```
使用Ajax请求数据时，被请求的URL地址，就叫做数据接口（简称接口）。
同时，每个接口必须有请求方式
```

#### WebSocket通信协议

````
一种在单个[TCP]连接上进行[全双工]通信的协议
WebSocket通信协议于2011年被[IETF]定为标准RFC 6455，并由RFC7936补充规范
WebSocket [API]被[W3C]定为标准
来源：https://baike.baidu.com/item/W3C

HTTP协议的缺陷
通信只能由客户端发起(单向请求)
每次HTTP请求都需要做一次tcp链接，只能从客户端发起通信请求，服务端不能主动推送信息
特点，如果服务器有连续的状态变化，客户端要获知的话比较麻烦
解决办法：使用"轮询"：每隔一段时候，就发出一个询问，了解服务器有没有新的信息，比如聊天室。
轮询的缺点：效率低，浪费资源（因为必须不停连接，或者 HTTP 连接始终打开）。所以就有了WebSocket 

WebSocket的特点
WebSocket使得客户端和服务器之间的数据交换变得更加简单，允许服务端主动向客户端推送数据
在WebSocket API中，浏览器和服务器只需要完成一次握手，两者之间就直接可以创建持久性的连接，并进行双向数据传输
服务器可以主动向客户端推送信息，客户端也可以主动向服务器发送信息，双向平等对话，属于服务器推送技术的一种。
是长连接状态，客户端可以向服务端请求数据，服务端也可以向客户端推送数据

WebSocket 对象
WebSocket 对象作为一个构造函数，用于新建 WebSocket 实例。
var ws = new WebSocket('ws://localhost:8080');
执行上面语句之后，客户端就会与服务器进行连接。

webSocket.readyState
readyState属性返回实例对象的当前状态，共有四种。
CONNECTING：值为0，表示正在连接。
OPEN：值为1，表示连接成功，可以通信了。
CLOSING：值为2，表示连接正在关闭。
CLOSED：值为3，表示连接已经关闭，或者打开连接失败。

实例对象的onopen属性，用于指定连接成功后的回调函数。
如果要指定多个回调函数，可以使用addEventListener方法。
实例对象的onclose属性，用于指定连接关闭后的回调函数。
实例对象的onmessage属性，用于指定收到服务器数据后的回调函数。
实例对象的send()方法用于向服务器发送数据
````

#### 前后端身份认证

##### Web 开发模式

```
① 基于服务端渲染的传统 Web 开发模式
服务器发送给客户端的 HTML 页面，是在服务器通过字符串的拼接，动态生成的。
因此，客户端不需要使用 Ajax 这样的技术额外请求页面的数据。
优点 
前端耗时少。因为服务器端负责动态生成 HTML 内容，浏览器只需要直接渲染页面即可。尤其是移动端，更省电。
有利于SEO。因为服务器端响应的是完整的 HTML 页面内容，所以爬虫更容易爬取获得信息，更有利于 SEO。
缺点
占用服务器端资源。即服务器端完成 HTML 页面内容的拼接，如果请求较多，会对服务器造成一定的访问压力。
不利于前后端分离，开发效率低。使用服务器端渲染，则无法进行分工合作，尤其对于前端复杂度高的项目，不利于
项目高效开发

② 基于前后端分离的新型 Web 开发模式
依赖于Ajax技术的广泛应用。
即后端不提供完整的 HTML 页面内容，而是提供一些 API 接口，使得前端可以获取到 json 数据；然后前端通过 Ajax调用后端提供的 API 接口，拿到 json 数据之后再在前端进行 HTML 页面的拼接，最终展示在浏览器上。
简而言之，前后端分离的 Web 开发模式，就是后端只负责提供 API 接口，前端使用 Ajax 调用接口的开发模式。
优点
开发体验好。前端专注于UI页面的开发，后端专注于api的开发，且前端有更多的选择性。
用户体验好。Ajax技术的广泛应用，极大的提高了用户的体验，可以轻松实现页面的局部刷新。
减轻了服务器端的渲染压力。因为页面最终是在每个用户的浏览器中生成的。
缺点
不利于SEO。因为完整的HTML页面需要在客户端动态拼接完成，所以爬虫对无法爬取页面的有效信息。
解决方案
利用Vue、React等前端框架的SSR(server side render)技术能够很好的解决SEO问题
```

##### 如何选择 Web 开发模式

```
根据不同的业务场景来选择何种开发模式

比如企业级网站，主要功能是展示而没有复杂的交互，并且需要良好的 SEO，则这时我们就需要使用服务器端渲染；
而类似后台管理页面，交互性比较强，不需要 SEO 的考虑，那么就可以使用前后端分离的开发模式。

另外，为了同时兼顾了首页的渲染速度和前后端分离的开发效率，一些网站采用了首屏服务器端渲染，
即对于用户最开始打开的那个页面采用的是服务器端渲染，而其他的页面采用前后端分离开发模式。
```

##### 身份认证

```
又称 ”身份验证“，”鉴权“，是指通过一定的手段，完成对用户身份的确认
为了确认当前所声称为某种身份的用户，确实是所声称的用户。

服务端渲染 推荐使用 Session认证机制
前后端分离 推荐使用 JWT认证机制
```

##### HTTP协议无状态性

```
每次的HTTP请求都是独立的，连续多个HTTP请求之间没有直接的关系，
服务器不会主动保留每次HTTP请求的状态。

如何保持状态？
在登录成功之后, 存储一些数据, 
在发起新请求的时候, 将上一次登录成功存储下来的数据,带到新的请求中去即可
```

##### Cookie

```
Cookie存储在浏览器中，
而浏览器也提供了读写Cookie的API，
因此Cookie很容易被伪造，不具有安全性，
因此不建议服务器将重要的隐私数据，通过Cookie的形式发给浏览器

存储在用户浏览器中的一段不超过4KB的字符串。
它由一个名称（Name）、一个值（Value）和其它几个用于控制Cookie有效期、安全性、使用范围的可选属性组成。
不同域名下的Cookie各自独立，当客户端发起请求时，会自动把当前域名下所有未过期的Cookie一同发送到服务器。

Cookie的几大特性
自动存储
自动发送
域名独立，不支持跨域
过期时限
4KB限制

客户端在第一次请求服务器的时候，
服务器是通过响应头的形式，向客户端发送一个身份认证的Cookie，
客户端会自动将Cookie保存在浏览器中
随后，当客户端浏览器每次请求服务器的时候，
浏览器会自动将身份认证相关的Cookie，通过请求头的形式发给服务器，服务器即可验明客户端的身份
```

#####  Session

```
session存储在服务器端的一段字符串，
相当于字典的key，用户不能直接修改

Session认证机制需要配合Cookie才能实现。
由于Cookie默认不支持跨域访问，所以，当涉及前端跨域请求后端接口的时候，
需要做很多额外的配置，才能实现跨域Session认证。

使用Session进行身份认证流程
1. 用户登录
2. 服务器在Session中保存用户信息，然后将SessionID以Cookie形式写入浏览器，在浏览器中存的是session的id
3. 用户下次请求，自动携带Cookie
4. 服务器从Cookie中提取SessionID，然后从Session中查询，如果查到相关信息，说明用户已经登录过了
	
注意
当前端请求后端接口不存在跨域问题的时候，推荐使用 Session 身份认证机制。
当前端需要跨域请求后端接口的时候，不推荐使用 Session 身份认证机制，推荐使用 JWT 认证机制。
```

##### JWT 认证机制

```
JWT（英文全称：JSON Web Token）是目前最流行的跨域认证解决方案。

JWT 是一个很长的字符串，中间用英文的点（.）分隔成三个部分。
JWT 的三个组成部分，从前到后分别是 Header（头部）、Payload（有效荷载）、Signature（签名）。

Payload 保存用户信息,是用户信息经过加密之后生成的字符串
Header 保存配置信息(加密算法，token类型等)
Signature 签名信息，保证安全

解析过程
1. 提取Authorization请求头中的token信息
2. 对token进行解析，提取出用户相关信息
3. 将用户信息挂载到req.user属性身上，供下游中间件和路由进行使用
4. 如果解析失败，会抛出异常，由错误中间件进行捕获

使用方式
用户的信息通过Token字符串的形式，保存在客户端浏览器中。
服务器通过还原Token字符串的形式来认证用户的身份

客户端收到服务器返回的 JWT 之后，通常会将它储存在 localStorage 或 sessionStorage 中。
此后，客户端每次与服务器通信，都要带上这个 JWT。
推荐的做法是把 JWT 放在 HTTP 请求头的 Authorization 字段中

客户端每次在访问那些有权限接口的时候，
都需要主动通过请求头中的 Authorization 字段，将 Token 字符串发送到服务器进行身份认证。
```

##### secret 密钥

```
加密和解密 JWT 字符串
保证 JWT 字符串的安全性，防止 JWT 字符串在网络传输过程中被别人破解

① 当生成 JWT 字符串的时候，需要使用 secret 密钥对用户的信息进行加密，最终得到加密好的 JWT 字符串
② 当把 JWT 字符串解析还原成 JSON 对象的时候，需要使用 secret 密钥进行解密
```

####  fetch

##### 简介

```html
Fetch API是新的ajax解决方案 Fetch会返回Promise
fetch不是ajax的进一步封装，而是原生js，没有使用XMLHttpRequest对象
fetch(url, options).then()

<script type="text/javascript">
    /*
      Fetch API 基本用法
      	fetch(url).then()
     	第一个参数请求的路径   Fetch会返回Promise   所以我们可以使用then 拿到请求成功的结果 
    */
    fetch('http://localhost:3000/fdata').then(function(data){
      // text()方法属于fetchAPI的一部分，它返回一个Promise实例对象，用于获取后台返回的数据
      return data.text();
    }).then(function(data){
      //   在这个then里面我们能拿到最终的数据  
      console.log(data);
    })
  </script>
```

#####  fetch API中的HTTP请求

```html
fetch(url, options).then(）
HTTP协议，它给我们提供了很多的方法，如POST，GET，DELETE，UPDATE，PATCH和PUT
默认的是 GET 请求
需要在 options 对象中 指定对应的 method(method:请求使用的方法)
post和普通请求的时候需要在options中设置请求headers和body

<script type="text/javascript">
        /*
              Fetch API 调用接口传递参数
        */
       #1.1 GET参数传递 - 传统URL  通过url  ？ 的形式传参 
        fetch('http://localhost:3000/books?id=123', {
            	# get 请求可以省略不写 默认的是GET 
                method: 'get'
            })
            .then(function(data) {
            	# 它返回一个Promise实例对象，用于获取后台返回的数据
                return data.text();
            }).then(function(data) {
            	# 在这个then里面我们能拿到最终的数据  
                console.log(data)
            });

      #1.2  GET参数传递  restful形式的URL  通过/ 的形式传递参数  即  id = 456 和id后台的配置有关   
        fetch('http://localhost:3000/books/456', {
            	# get 请求可以省略不写 默认的是GET 
                method: 'get'
            })
            .then(function(data) {
                return data.text();
            }).then(function(data) {
                console.log(data)
            });

       #2.1  DELETE请求方式参数传递      删除id  是  id=789
        fetch('http://localhost:3000/books/789', {
                method: 'delete'
            })
            .then(function(data) {
                return data.text();
            }).then(function(data) {
                console.log(data)
            });

       #3 POST请求传参
        fetch('http://localhost:3000/books', {
                method: 'post',
            	# 3.1  传递数据 
                body: 'uname=lisi&pwd=123',
            	#  3.2  设置请求头 
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            })
            .then(function(data) {
                return data.text();
            }).then(function(data) {
                console.log(data)
            });

       # POST请求传参
        fetch('http://localhost:3000/books', {
                method: 'post',
                body: JSON.stringify({
                    uname: '张三',
                    pwd: '456'
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(function(data) {
                return data.text();
            }).then(function(data) {
                console.log(data)
            });

        # PUT请求传参     修改id 是 123 的 
        fetch('http://localhost:3000/books/123', {
                method: 'put',
                body: JSON.stringify({
                    uname: '张三',
                    pwd: '789'
                }),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(function(data) {
                return data.text();
            }).then(function(data) {
                console.log(data)
            });
    </script>
```

#####  fetchAPI中的响应格式

```js
用fetch来获取数据，如果响应正常返回，我们首先看到的是一个response对象，其中包括返回的一堆原始字节，这些字节需要在收到后，需要我们通过调用方法将其转换为相应格式的数据，比如JSON，BLOB或者TEXT等等   
/*
      Fetch响应结果的数据格式
    */
    fetch('http://localhost:3000/json').then(function(data){
      // return data.json();   //  将获取到的数据使用 json 转换对象
      return data.text(); //  //  将获取到的数据 转换成字符串 
    }).then(function(data){
      // console.log(data.uname)
      // console.log(typeof data)
      var obj = JSON.parse(data);
      console.log(obj.uname,obj.age,obj.gender)
    })
```

####  axios网络请求库

##### 简介

```js
轻量的网络请求库，一个http库，通过axios可以像服务器发起请求。通常和VUE搭配使用

基于promise用于浏览器和node.js的http客户端
支持浏览器和node.js
支持promise
能拦截请求和响应
自动转换JSON数据
能转换请求和响应数据

特性
在浏览器中创建 XMLHttpRequests
在 node.js 则创建 http 请求
支持 Promise API
支持拦截请求和响应
转换请求和响应数据
取消请求
自动转换 JSON 数据
客户端支持防御 XSRF

直接用axios发起请求的话，就是axios.get('url'{params}).then()
VUE 里面是先导入axios模块，然后直接$http.get 就可以发起请求
如果想要简化操作，避免回调地域,可以使用async/await
除了axios还有fetch，和react搭配更多

axios手动取消请求
axios提供了一个cancelToken的构造函数，
把他放在vuex中，在组件中调用this.$store.state.status.cancelaxiosfn()
```

##### axios基础用法

```js
get和delete请求传递参数
通过传统的url以?的形式传递参数
restful形式传递参数 
通过params形式传递参数 

post和put请求传递参数
通过选项传递参数
通过URLSearchParams传递参数 

1.发送get 请求 
	axios.get('http://localhost:3000/adata').then(function(ret){ 
      #  拿到 ret 是一个对象      所有的对象都存在 ret 的data 属性里面
      // 注意data属性是固定的用法，用于获取后台的实际数据
      // console.log(ret.data)
      console.log(ret)
    })
    
2.get 请求传递参数
    # 2.1  通过传统的url  以 ? 的形式传递参数
	axios.get('http://localhost:3000/axios?id=123').then(function(ret){
      console.log(ret.data)
    })
    # 2.2  restful 形式传递参数 
    axios.get('http://localhost:3000/axios/123').then(function(ret){
      console.log(ret.data)
    })
	# 2.3  通过params  形式传递参数 
    axios.get('http://localhost:3000/axios', {
      params: {
        id: 789
      }
    }).then(function(ret){
      console.log(ret.data)
    })
        
3 axios delete 请求传参 (传参的形式和 get 请求一样)
    axios.delete('http://localhost:3000/axios', {
      params: {
        id: 111
      }
    }).then(function(ret){
      console.log(ret.data)
    })

4  axios 的 post 请求
    # 4.1  通过选项传递参数
    axios.post('http://localhost:3000/axios', {
      uname: 'lisi',
      pwd: 123
    }).then(function(ret){
      console.log(ret.data)
    })
	# 4.2  通过 URLSearchParams  传递参数 
    var params = new URLSearchParams();
    params.append('uname', 'zhangsan');
    params.append('pwd', '111');
    axios.post('http://localhost:3000/axios', params).then(function(ret){
      console.log(ret.data)
    })

5  axios put 请求传参   和 post 请求一样 
    axios.put('http://localhost:3000/axios/123', {
      uname: 'lisi',
      pwd: 123
    }).then(function(ret){
      console.log(ret.data)
    })

axios统一函数
axios({
	method:"请求类型",
	url："请求的URL地址",
	data:{/*POST数据*/},
	params:{/*GET参数*/}
}).then(callback)
```

##### axios全局配置

```js
配置公共的请求头
axios.defaults.baseURL = 'https://api.example.com';
配置 超时时间
axios.defaults.timeout = 2500;
配置公共的请求头
axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
配置公共的 post 的 Content-Type
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
```

#####  axios拦截器

```js
请求拦截器
请求拦截器的作用是在请求发送前进行一些操作
例如在每个请求体里加上token，统一做了处理如果以后要改也非常容易
	axios.interceptors.request.use(function(config) {
      console.log(config.url)
      # 1.1  任何请求都会经过这一步   在发送请求之前做些什么   
      config.headers.mytoken = 'nihao';
      # 1.2  这里一定要return   否则配置不成功  
      return config;
    }, function(err){
       #1.3 对请求错误做点什么    
      console.log(err)
    })

响应拦截器
响应拦截器的作用是在接收到响应后进行一些操作
例如在服务器返回登录状态失效，需要重新登录的时候，跳转到登录页
    axios.interceptors.response.use(function(res) {
      #2.1  在接收响应做些什么  
      var data = res.data;
      return data;
    }, function(err){
      #2.2 对响应错误做点什么  
      console.log(err)
    })
```

##### axios的封装

```js
超时时长设置
请求的基准路径
统一进行数据转换
请求拦截器
响应拦截器

const request = axios.create({
  baseURL: '',
  // 自定义后端返回的原始数据
  // data: 后端返回的原始数据，说白了就是 JSON 格式的字符串
  transformResponse: [function (data) {
    // axios 默认会在内部这样来处理后端返回的数据
    return JSON.parse(data)
  }]
})

// 请求拦截器
request.interceptors.request.use(function (config) {
  // 请求发起会经过这里
  // config：本次请求的请求配置对象
  const { user } = store.state
  if (user && user.token) { 
    config.headers.Authorization = `Bearer ${user.token}`
  }
  // 注意：这里务必要返回 config 配置对象，否则请求就停在这里出不去了
  return config
}, function (error) {
  // 如果请求出错了（还没有发出去）会进入这里
  return Promise.reject(error)
})

request.interceptors.response.use(function(response) {
    return response;
  }, function(error) {
    //如果token失效了, 需要刷新token
    return Promise.reject(error);
  }
);

二次封装axios
// 导入Nprogress对应的js和css
import Nprogress from 'nprogress'
// 配置请求的根路径
axios.defaults.baseURL = 'http://127.0.0.1:8888/api/private/v1/'
// request时请求拦截器
axios.interceptors.request.use(config => {
  Nprogress.start()
  // console.log(config)
  config.headers.Authorization = window.sessionStorage.getItem('token')
  return config
})
axios.interceptors.response.use(config => {
  Nprogress.done()
  return config
})
```

####  