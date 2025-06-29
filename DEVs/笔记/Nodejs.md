# Node.js

#### 介绍

```
不同浏览器使用不同的JavaScript解析引擎
Chrome 浏览器	 => V8
Firefox 浏览器  => OdinMonkey（奥丁猴）
Safri 浏览器	 => JSCore
IE 浏览器 		 => Chakra（查克拉）

为什么JavaScript可以操作DOM和BOM
每个浏览器都内置了 DOM、BOM 这样的 API 函数，
因此，浏览器中的 JavaScript 才可以调用它们。

浏览器中的 JavaScript 运行环境
运行环境是指代码正常运行所需的必要环境。
① V8 引擎		负责解析和执行 JavaScript 代码。
② 内置 API 	是由运行环境提供的特殊接口，只能在所属的运行环境中被调用

Node.js 是基于 Chrome V8 引擎的 JavaScript 运行环境。

注意
① 浏览器 	  是JavaScript 的前端运行环境。 
② Node.js  	是JavaScript 的后端运行环境。 
③ Node.js   中无法调用 DOM 和 BOM 等浏览器内置 API
```

####  fs文件系统模块(File System)

```
用来操作文件的模块
提供了一系列的方法和属性，用来满足用户对文件的操作需求

导入方法
const fs = require('fs')
```

##### 向指定的文件中读取/写入内容

```js
fs.readFile(path[,options],callback)
fs.writeFile(path[,options],callback)

中括号包起来的是可选参数，没被包起来的是必选参数
err：读取失败时的结果，布尔值为falses
dataStr：读取成功时的结果
读取成功时：err的值为null，dataStr的值为读取到的对象
读取失败时：err的值为错误对象，dataStr的值为underfined

重复调用 fs.writeFile() 写入同一个文件，新写入的内容会覆盖之前的旧内容
fs.writeFile() 方法只能用来创建文件，不能用来创建路径

eg:
fs.readFile("./files/11.txt","utf8",function(err,dataStr){
console.log(err)
console.log(dataStr)
})
```

##### 路径动态拼接的问题

```
在使用 fs 模块操作文件时
如果提供的操作路径是以 ./ 或 ../ 开头的相对路径时，很容易出现路径动态拼接错误的问题。
相对于执行该文件的时候，终端所处的路径。

原因
代码在运行的时候，会以执行 node 命令时所处的目录，动态拼接出被操作文件的完整路径。

解决方案
在使用 fs 模块操作文件时，直接提供完整的路径，不要提供 ./ 或 ../ 开头的相对路径，从而防止路径动态拼接的问题。
```

#### path路径模块

```
用来处理路径的模块

导入方法
const path = require('path')
```

##### 路径拼接

```
path.join([...paths])
把多个路径片段拼接为完整的路径字符串
（把字符串识别为路径，比如用+号拼接，多了一个点就不行了，path.join()没这个问题）

...paths <string> 路径片段的序列
返回值:<string>

__dirname表示当前文件所处目录

eg:
const pathStr = path.join('/a','/b/c','../','/d','/e')
console.log(pathStr)
结果是：\a\b\d\e
../会抵消掉前一个路径

const pathStr2 = path.join(__dirname,'./files/1.txt')
console.log(pathStr2)
结果是：当前文件所处目录\files\1.txt
```

##### 文件名

```
path.basename(path[,ext])
获取路径中的最后一部分，经常通过这个方法获取路径中的文件名

path <string> 必选参数，表示一个路径的字符串
ext <string> 可选参数，表示文件扩展名
返回: <string> 表示路径中的最后一部分

eg:
const fpath = '/a/b/c/index.html'
const fullName = path.basename(fpath)
console.log(fullName)
结果是：
index.html

const nameWithoutExt = path.basename(fpath,'.html')
console.log(nameWithoutExt)
结果是：
index
```

##### 文件扩展名

```
path.extname(path)
获取路径中的扩展名部分

path <string>必选参数，表示一个路径的字符串
返回: <string> 返回得到的扩展名字符串

eg:
const fpath = '/a/b/c/index.html'
const fext = path.extname(fpath)
console.log(fext)
结果是：..html
```

#### http模块

##### 介绍

```
用来创建 web 服务器的模块

通过 http 模块提供的 http.createServer() 方法，
就能方便的把一台普通的电脑，变成一台 Web 服务器，从而对外提供 Web 资源服务。

导入方法
const http = require('http')

客户端：在网络节点中，负责消费资源的电脑
服务器：负责对外提供网络资源的电脑

服务器和普通电脑的区别
服务器上安装了 web 服务器软件，例如：IIS、Apache 等。
通过安装这些服务器软件，就能把一台普通的电脑变成一台 web 服务器。

可以基于 Node.js 提供的 http 模块写一个服务器软件，
从而对外提供 web 服务。
```

##### 创建 web 服务器

```js
① 导入 http 模块
② 调用 http.createServer() 方法,创建 web 服务器实例
③ 为服务器实例绑定 request 事件，监听客户端的请求
④ 调用服务器实例的 listen() 方法，启动服务器，
端口号一般使用比1024大的，因为1024以下的端口号大多被系统占用了

eg：
const http = require('http')
const server = http.createServer()
server.on('request', function (req, res) {
  console.log('访问服务器成功')
})
server.listen(8080, function () {  
  console.log('running……')
})
```

##### req和res

```js
req请求对象
包含了与客户端相关的数据和属性

res响应对象
包含了与服务器相关的数据和属性，例如要发送到客户端的字符串

req.url
客户端请求的URL地址（可以截取域名后面的字符串）

req.method
客户端的method请求类型

res.end()方法
向客户端发送指定的内容，并结束这次请求处理的过程
调用res.end()方法向客户端发送中文内容时，会出现乱码问题，需要手动设置内容的编码格式

server.on()方法
只要服务器接收到了客户端的请求，就会调用通过server.on()为服务器绑定的request事件处理函数

如果想在request事件处理函数中，访问与客户端相关的数据或属性,可以使用如下的方式：
server.on("request",(req,res)=>{
	const str = "你的请求url是 ${req.url}，请求method类型是 ${req.method}"
    res.setHeader("Content-type","text/html;charset=utf-8")
	res.end(str)
	console.log(str)
})
```

##### 浏览器发送请求的方法

```
输入地址

通过ajax

遇到带有href和src，会自动发送请求
```

##### 案例：根据不同的url响应不同的html内容

```js
1、获取请求的 url 地址
2、设置默认的响应内容为 404 Not found
3、判断用户请求的是否为 / 或 /index.html 首页
4、判断用户请求的是否为 /about.html 关于页面
5、设置 Content-Type 响应头，防止中文乱码
6、使用 res.end() 把内容响应给客户端

server.on("request",function(req,res){
	const url = req.url
	let content = "<h1>404 Not found!</h1>"
	if (url === '/' || url === '/index .html') {
		content = '<h1>首页</h1>'
	}else if (url === '/about.html') {
	 content = '<h1>关于页面</h1>'
	}
	res.setHeader( 'Content-Type','text/html;charset=utf-8')
	res.end( content)
})
```

##### 案例：实现clock时钟的web服务器

```js
const http = require("http")
const fs = require("fs")
const path = require("path")
const { create } = require("domain")
const server = http.createServer()
server.on("request", function(req, res) {
        //会发多次请求，输入ip地址/域名的时候，遇到href时请求css，遇到script的src时请求js
        // res.setHeader("Content-type", "text/html;charset=utf-8")
        //把请求路径当作了文件路径
        fs.readFile(
            path.join(__dirname, "/code", req.url === "/" ? "/new.html" : req.url),
            "utf8",
            (err, dataStr) => err ? res.end("<h1>404 Not Found !</h1>") : res.end(dataStr)
            )
    })
    //parameter只是随便加的参数
server.listen(8888, parameter => console.log("启动啦"))
```

#### querystring 模块

```
用来处理查询字符串。
通过这个模块提供的parse()函数，可以把查询字符串，解析成对象的格式。

eg:
const qs = require("querystring")
req.body = qs.parse(mystr)
```

#### Node.js 中模块

##### 模块化

```
解决一个复杂问题时，自顶向下逐层把系统划分成若干模块的过程
对于整个系统来说，模块是可组合、分解和更换的单元
编程领域中的模块化，就是遵守固定的规则，把一个大文件拆成独立并互相依赖的多个小模块

好处
提高了代码的复用性
提高了代码的可维护性
可以实现按需加载

模块化规范
对代码进行模块化的拆分与组合时，需要遵守的那些规则

例如
使用什么样的语法格式来引用模块(模块加载)
在模块中使用什么样的语法格式向外暴露成员

好处
大家都遵守同样的模块化规范写代码，降低了沟通的成本，方便了各个模块之间的相互调用
```

##### 模块的分类

```
根据模块来源的不同，分为

内置模块
由 Node.js 官方提供的，例如 fs、path、http 等

自定义模块
用户创建的每个 .js 文件，都是自定义模块

第三方模块
由第三方开发出来的模块，使用前需要先下载

模块作用域
模块级别的访问限制，和函数作用域类似
自定义模块中定义的变量、方法等成员，
只能在当前模块内被访问，防止了全局变量污染的问题
```

##### 模块的加载\用法

```
内置模块
const fs = require('fs')
require(模块名称)

自定义模块
const xx = require('./xx.js')
require(模块路径)

第三方模块
const moment = require('moment')
require(模块名称)

使用 require()方法导入自定义模块时，可以省略后缀名
```

##### 模块加载机制

```js
优先从缓存加载
同一个包被require多次时，只会加载一次

内置模块加载机制
内置模块的加载优先级最高

自定义模块加载机制
必须指定以 `./` 或者 `../` 开头的路径标识符，否则会误认为内置模块或第三方模块
如果省略了文件的扩展名，则按照顺序分别尝试加载以下文件
确切的文件名->.js->.json->.node->失败

第三方模块加载机制
当前模块的父目录开始，尝试从 `/node_modules` 文件夹中加载第三方模块
如果没有找到对应的第三方模块，则移动到再上一层父目录中，进行加载，直到文件系统的根目录

目录作为模块的加载机制
在package.json中查找main属性指定的入口文件，作为加载入口
如果找不到入口文件，就会默认加载index.js
```

##### 向外共享模块作用域中的对象

```
module
用来描述当前模块的相关信息
每一个模块都可以访问 module 对象

module.exports 对象
相当于对外界的出口，默认为空对象
在自定义模块中，可以使用 module.exports 对象，将模块内的成员共享出去，供外界使用
外界用 require() 方法导入自定义模块时，得到的就是 module.exports 所指向的对象

exports
module.exports 的简写
默认情况下，exports 和 module.exports 指向同一个对象

最终共享的结果，还是以 module.exports 指向的对象为准
为了防止混乱，建议不要在一个文件中同时写 module.exports 和 exports
（出现了大括号，就代表创建了新的对象）
```

##### CommonJS 规定

```
CommonJS规定了模块的特性和各模块之间如何相互依赖，NodeJS是基于CommonJS的一种具体实现

① 每个模块内部，module 变量代表当前模块。
② module 变量是一个对象，它的 exports 属性（即 module.exports）是对外的接口。
③ 加载某个模块，其实是加载该模块的 module.exports 属性。require() 方法用于加载模块。
```

#### npm与包

```
Node.js 中的第三方模块又叫做包

npm
是一家公司，后面要用npm命令来下载包
npm包管理工具(Node Package Mnager)

包的来源
包是由第三方个人或团队开发出来的，免费供所有人使用
Node.js中的包都是免费且开源的，不需要付费即可免费下载使用

为什么需要包
提高开发效率，包是基于内置模块封装出来的，提供了更高级、更方便的 API
包和内置模块之间的关系，类似于 jQuery 和 浏览器内置 API 之间的关系

查看npm的版本
打开cmd窗口，输入'npm -v'
```

##### 包管理配置文件package.json

```
npm规定，在项目根目录中，
必须提供一个叫做package.json的包管理配置文件。
用来记录与项目有关的一些配置信息。

例如
项目的名称、版本号、描述等
项目中都用到了哪些包
哪些包只在开发期间会用到
那些包在开发和部署时都需要用到

创建package.json
npm init -y
npm init 的话需要自己一步一步输入
用上面的代码，可以在执行命令时所处的目录中，快速创建 package.json 这个包管理

注意
上述命令只能在英文的目录下成功运行，项目文件夹的名称一定要使用英文命名，不要使用中文、空格
运行npm install命令安装包的时候，npm包管理工具会自动把包的名称和版本号，记录到package.json中

以后把node_modules文件夹不做版本控制，排除在外(.gitignory)，
因为文件太多，较大，其他人也可以联网下载
```

##### 初次装包完成后

```
初次装包完成后，
在项目文件夹下多一个叫做 node_modules 的文件夹和 package-lock.json 的配置文件。

node_modules文件夹
用来存放所有已安装到项目中的包。require() 导入第三方包时，就是从这个目录中查找并加载包。

package-lock.json配置文件
用来记录 node_modules 目录下的每一个包的下载信息，例如包的名字、版本号、下载地址等

注意
不要手动修改 node_modules 或 package-lock.json 文件中的任何代码，npm 包管理工具会自动维护它们
```

##### npm相关指令

```
查看当前的下包镜像
npm config get registry

修改位淘宝镜像源
npm config set registry=https://registry.npm.taobao.org/

检查镜像源是否更改成功
npm config get registry

npm i nrm -g
通过npm包管理器，将nrm安装为全局可用的工具
可以快速查看下包的镜像源

nrm ls
查看所有可用的镜像源，(*表示当前正在使用的镜像源)

nrm use taobao
将下包的镜像源切换为taobao镜像

npx
依托于npm，它的作用就是观察在当前目录下有没有你想运行的命令，没有就会去上一级目录寻找。
比如npx webpack

npm init
在当前项目中创建一个package.json文件
这个文件就是维护这这个项目所依赖的一些包

npm i
读取当前目录下的package.json文件里面的dependencies, 安装这个文件中记录的依赖包
通过@符号指定具体的版本

npm i 包名 --save-dev 
把依赖写入进devDependencies对象里面

npm i 包名 --save
把依赖写入进dependencies对象里面

npm i 包名 -g
安装全局包
在命令行的任何地方都可以操作，不会提示“命令不存在等错误”

npm cache clean -f
清理缓存

npm uninstall 包名
卸载局部包
卸载不了的话，可能包与包之间有依赖，把 node_modules 文件夹删除了重新安装
除了把node modules中的包移除掉，
还会把卸载的包，自动从 package.json 的 dependencies 中移除掉。

卸载全局包
npm uninstall -g 包名

npm ls -g
查看所有全局安装的模块

npm config ls
查看npm默认设置（部分）

npm config ls -l
查看npm默认设置（全部）

npm run build
打包发布
在dist目录下可以找到发布的相关文件

删除文件夹
rm -rf node_modules
或者
使用rimraf来删除目录
npm install rimraf -g
rimraf node_modules

--save
npm 5.0.0 之前，有 --save 参数才会把模块写入到 packages.json。
现在已经是内置参数，不用额外写了

i
install的简写

node.exe地址
C:\Program Files\nodejs\node.exe

node使用者的配置文件config地址
C:\Users\用户名\.npmrc

缓存地址
C:\Users\用户名\AppData\Local\npm-cache
```

##### 包的分类

```
npm的包分为 局部包(项目包)和全局包，

局部包分为 开发依赖和运行依赖

开发需要的包\开发依赖\开发环境下的依赖
-D
只在项目开发阶段会用到的包，项目上线之后不会用到
造一辆车子, 用到了扳手,锤子
比如webpack，gulp等压缩打包工具.
记录到devDependencies节点中
npm install -D 包名(\或者npm install --save-dev 包名)

运行需要的包\运行依赖\核心依赖包\生产环境下的依赖
-S
在开发和项目上线之后都需要用到的包
造一辆车子, 用到了车轮，发动机
项目刚需的依赖在这里，
比如UI框架，字体文件等线上必需的东西.
记录到dependencies节点中

全局包
工具性质的包，因为它们提供了好用的终端命令。
判断某个包是否需要全局安装后才能使用，可以参考官方提供的使用说明即可。

局部包地址
项目根目录

全局包地址
C:\Users\用户名\AppData\Roaming\npm\node_modules 
```

##### 包的规范结构

```
一个规范的包，它的组成结构，必须符合以下 3 点要求

① 包必须以单独的目录而存在
② 包的顶级目录下要必须包含package.json这个包管理配置文件
③ package.json 中必须包含name，version，main这三个属性，分别代表包的名字、版本号、包的入口。

注意
以上3点要求是一个规范的包结构必须遵守的格式，关于更多的约束，可以参考如下网址：
https://yarnpkg.com/zh-Hans/docs/package-json
```

##### 自己开发包

```
初始化包的基本结构
初始化package.json配置文件
业务逻辑开发

格式化时间
HTML转义
HTML还原

编写使用说明文档
md文档编写
##标题
-列表
```代码

注册登录npm账号

首先要切换到npm官方地址
nrm use npm		
npm login

发布包
切换到包所在文件夹的根目录
npm publish
包名不能雷同，否则发布失败
确保已经登录，否则发布失败
同一个包，如果版本号没有发生变化，重复发布会导致失败

删除包
npm unpublish 包名 --force
```

####  md转html包

```js
i5ting_toc可以把 md 文档转为 html 页面的小工具

安装方法
npm i -g  i5ting_toc
使用方法，完成后自动在浏览器打开
i5ting_toc -f 要转换的路径 -o
```

#### Express包

```js
Express是基于Node.js平台，快速、开放、极简的Web开发框架(第三方模块/包)

为Web 网站服务器提供网页服务，html、js、css
为API接口服务器提供接口，json数据

使用express搭建基本的服务器，并监听请求，响应数据

安装
npm i express@4.17.1

三个方法介绍
app.get(请求路径， 服务器处理函数)
app.post()
res.send()
支持返回字符串，对象，数组等多种数据格式
对象和数组会自动转为json格式的字符串
自动解决中文乱码问题

1.导入 express
const express = require('express')

2. 创建 web 服务器
const app = express()

3.调用 app.listen(端口号, 启动后的回调函数)，启动服务器
app.listen(3000, () => {
  console.log('running……')
})

4. 监听客户端的 GET 和 Post 请求，并向客户端响应具体的内容
app.get('/user', (req, res) => {
// 调用 express 提供的 res.send() 方法，向客户端响应一个 JSON 对象
  res.send({ name: 'zs', age: 20, gender: '男' })
})

app.post('/user', (req, res) => {
// 调用 express 提供的 res.send() 方法，向客户端响应一个文本字符串
  res.send('请求成功')
})

eg：
app.get('/user:aa',(req,res)=>{
console.log(req.params)
})
res.send(req.params)
```

##### 获取参数

```js
查询参数
默认是一个空对象
req.query
?name=xxx&age=18
 
路径参数
通过该对象，可以访问到URL中，通过:匹配到的动态参数
req.params
/user/:id/:username
/user/110/zs

查询字符串和查询参数
查询字符串
是路径的一部分，aa是变化的值，参数的名字，随便起名字
查询参数
跟在url后面以？连接，是url的附属
```

##### 静态资源托管

```js
app.use(express.static('public'))
app.use('/static', express.static('public'))

express.static()
创建一个静态资源服务器
如果要托管多个静态资源目录，请多次调用express.static()函数
express在指定的静态目录中查找文件,会根据目录的添加顺序查找所需的文件，并对外提供资源的访问路径。
因此，存放静态文件的目录名不会出现URL中。

在托管的静态资源访问路径之前，挂载路径前缀
eg:
app.use('./static',express.static('public'))
可以通过带有 /static 前缀地址来访问 public 目录中的文件
http://localhost:3000/static/images/kitten.jpg
http://localhost:3000/static/css/style.css
http://localhost:3000/static/js/app.js
```

##### nodemon包

```js
npm i nodemon -g
自动检测代码变化，重启服务器
```

##### express路由

```
路由的概念
路由就是映射关系
本质
URL 请求地址（包含请求方法）与服务器处理函数之间的对应关系
客户端的请求与服务器处理函数之间的映射关系，对应关系

路由的基本使用
路由最简单形式
把路由直接挂载在app上

Express中的路由分3部分
请求的类型
请求的URL地址
处理函数
```

##### 创建路由模块

```
// 1. 导入 express
const express = require('express')

// 2. 创建路由对象
const router = express.Router()

// 3. 挂载获取用户列表的路由
router.get('/user/list', (req, res) => {
  res.send('用户列表')
})

// 4. 挂载添加用户列表的路由
router.post('/user/add', (req, res) => {
  res.send('添加用户')
})

// 5. 向外导出路由对象
module.exports = router
```

##### 挂载路由

```js
// 导入express
const express = require('express')
// 创建 web 服务器，命名为 app
const app = express()
// 挂载路由
app.get('/', (req, res) => {
  res.send('Hello, World')
})
app.post('/', (req, res) => {
  res.send('Hello, Tom')
})
app.listen(3000, () => {
  console.log('running……')
})
```

##### 注册路由模块

```js
导入路由模块
const userRouter = require('./router/user.js')

使用app.use()注册路由模块
app.use(userRouter)

加前缀
app.use('/api', userRouter)
```

#### 中间件(Middleware)

##### 介绍

```js
业务流程的中间处理环节

Express的中间件
本质上就是一个function处理函数
当一个请求到达Express的服务器之后，可以连续调用多个中间件，从而对这次请求进行预处理。

中间件函数的形参列表中，必须包含next参数。而路由处理函数中只包含req和res。
next函数是
实现多个中间件连续调用的关键，它表示把流转关系转交给下一个中间件或路由。

注意
① 一定要在路由之前注册中间件，除了错误级别的中间件
② 客户端发送过来的请求，可以连续调用多个中间件进行处理
③ 执行完中间件的业务代码之后，不要忘记调用next()函数
④ 为了防止代码逻辑混乱，调用next()函数后不要再写额外的代码
⑤ 连续调用多个中间件时，多个中间件之间，共享req和res对象

中间件的分类
① 应用级别的中间件（全局、局部中间件）
② 路由级别的中间件（绑定到路由实例上的中间件）
③ 错误级别的中间件
④ Express内置的中间件
⑤ 第三方的中间件
```

##### 全局生效的中间件

```js
客户端发起的任何请求，到达服务器之后，都会触发的中间件

定义多个全局中间件
可以使用app.use()连续定义多个全局中间件
客户端请求到达服务器之后，会按照中间件定义的先后顺序依次进行调用
```

##### 局部生效的中间件

```js
不使用app.use()定义的中间件，叫做局部生效的中间件
直接把中间件函数写在请求地址参数的后面

请求到达服务器之后，先交给中间件进行处理，然后将处理结果交给后面的路由处理函数进行处理

定义多个局部中间件
在路由中，用逗号分割多个中间件
也可以把多个中间件存到一个数组里面
app.get('/',mw1,mw2,(req,res)=>{
	console.log("这是路由器的get请求")
})app.get('/',[mw1,mw2],(req,res)=>{
	console.log("这是路由器的get请求")
})
```

浏览器默认发起的是get请求

想要测试post请求，需要在postman模拟

##### 错误级别的中间件

```js
必须有四个形参，分别是err,req,res,next
可以捕获项目的异常错误，从而防止程序的崩溃
发生错误后，就不会执行底下的代码，立即进入错误级别的中间件
在错误级别中间件中向客户端响应内容
错误级别的中间件必须注册在所有路由之后，这样才能捕获到前面所有的错误

人为制造错误
new Error("报错了")
抛出一个自定义的错误
throw new Error("报错了")

app.use((err,req,res,next)=>{
	console.log('发生了错误！'+err.message)
	res.send('Error'+err.message)
})
```

##### Express内置的中间件

```js
express.static
快速托管静态资源的内置中间件
eg:
app.use(express.static('public'))
app.use('/static', express.static('public'))

express.json
解析JSON格式的请求体数据
eg:
const app = express(express.json())

express.urlencoded
解析URL-encoded格式的请求体数据
eg:
const app = express(express.urlencoded({extended:false}))

form-data:乱七八糟
urlencoded:'key=value&key=value"
application/json:'{"name":"zhangsan","age":18}'
```

##### 中间件的作用

```js
多个中间件之间共享同一份req和res，在前面的中间件处理数据，可以在后面的中间件得到结果，上游挂载，下游使用
中间件为后续中间件提供服务

next()函数
把代码连接(转交)给下一个中间件

req.query
处理查询字符串所形成的对象

req.body
在服务器端，可以使用该属性，来获取/接收客户端发送过来的请求体里面的数据
默认情况下，如果不配置解析表单数据的中间件，则req.body默认为undefined

'data'
服务器端在接收到数据的时候触发该事件(如果数据特别大，要多次接受)

'end'
监听事件传输结束事件

get能传的数据比较小
```

##### CORS跨域资源共享

```js
跨域存在于网页当中
CORS设置了一系列的响应头

① 运行 npm install cors 安装中间件
② 使用 const cors = require('cors') 导入中间件
③ 在路由之前调用 app.use(cors()) 配置中间件
```

CORS响应头部Access-Control-Allow-Origin

```js
如果指定了Access-Control-Allow-Origin字段的值为通配符*，表示允许来自任何域的请求

eg:
res.setHeader('Access-Control-Allow-Origin','*')
```

CORS响应头部Access-Control-Allow-Headers

```js
默认情况下，CORS 仅支持客户端向服务器发送如下的 9 个请求头：
Accept、Accept-Language、Content-Language、DPR、Downlink、Save-Data、Viewport-Width、Width 、Content-Type （值仅限于 text/plain、multipart/form-data、application/x-www-form-urlencoded 三者之一）

如果客户端向服务器发送了额外的请求头信息，则需要在服务器端，通过Access-Control-Allow-Headers对额外
的请求头进行声明，否则这次请求会失败！

eg:
res.setHeader('Access-Control-Allow-Headers','Authorization')
```

CORS响应头部Access-Control-Allow-Methods

```js
以此支持更多的请求方式

eg:
res.setHeader('Access-Control-Allow-Methods','*')
```

CORS概括

```js
1.发起的是一个get的跨域请求,为了能够让浏览器不拦截这项数据,服务端需要在响应头中设置Access-Control-Allow-Origin

2.发起的是一个get的跨城请求,并且我再请求头中带上了自定义字段，服务端需要在响应头设置Access-Control-Alow-Origin Access-Control-Alow-Headers

3.发起的是一个put的跨域请求,为了能够让浏览器不拦截这项数据,服务端需要在响应头设置Access-Control-Alow-Origin Access-Control-Allow-Methods

4.发起的是一个put的跨域请求,并且携带了自定义请求头服务揣需要在响应头设置Acess-Contror-Alow-Origin Accss-Contror Alow-Headers Accs-contro-llw-Methods
```

option预检请求

```js
在浏览器与服务器正式通信之前，
浏览器会先发送OPTION请求进行预检，以获知服务器是否允许该实际请求，
所以这一次的OPTION请求称为“预检请求”。
服务器成功响应预检请求后，才会发送真正的请求，并且携带真实数据。

简单请求和预检请求的区别
简单请求的特点：客户端与服务器之间只会发生一次请求。
预检请求的特点：客户端与服务器之间会发生两次请求，OPTION 预检请求成功之后，才会发起真正的请求。
```

#### webpack

##### 介绍

```js
webpack\模块打包机\前端项目的构建工具\打包工具
简化开发步骤，模块化（将复杂的程序细小化）开发
分析你项目的结构，找到JavaScript模块以及其它的一些浏览器不能直接运行的拓展语言（Scss，TypeScript等），并将其打包为合适的格式以供浏览器使用，这些工具对于webpack来说，只要有合适的loader，都当做模块处理
前端工程化包括：模块化，组件化，自动化，规范化

作用
前端项目的构建工具(打包工具)
https://www.webpackjs.com/
能够帮我们处理各种网页资源(js,css,图片)的依赖关系
能够对代码进行压缩和优化
能够对less, scss等语法进行转换
能够对高级的ES语法进行转换

优点
webpack具有热更新机制:不用刷新浏览器而将新变更的模块替换掉旧的模块
能够处理各种网页资源(js,css,图片)的依赖关系
能够对代码进行压缩和优化,合并
能够对less, scss等语法进行转换
能够对高级的ES语法进行转换

grunt/gulp和webpack
grunt/gulp强调前端流程的自动化，模块化不是它的核心
webpack强调模块化开发管理，而文件压缩合并，预处理等功能，是他附带的功能
```

##### 1.安装webpack

```js
npm i webpack@4.35.3 webpack-cli@3.3.5 -D安装(目前的版本是5.x)
webpack 3中，webpack本身和它的CLI以前都是在同一个包中，
webpack 4中，他们已经将两者分开，以便更好地管理它们

全局安装webpack webpack-cli
npm install --save-dev webpack webpack-cli -g
```

##### 2.执行webpack

```js
在根目录下新建setup文件夹，在setup文件夹中新建src文件夹。
在src下新建helloWorld.js，写一个函数，通过export default默认导出printStr方法。
function printStr() {
    console.log("hello world!");
}
export default printStr;

在src下新建index.js，通过模块导入的方法，来导入printStr方法。
import printStr  from "./helloWorld.js";
printStr();

安装webpack之前需要先安装一个npm的包管理的配置文件
npm init -y
现在就可以在本地的工作目录下安装webpack了。不推荐全局安装
npm install webpack webpack-cli --save-dev
安装完成后
本地的工作目录会产生一个node_modules依赖包
和一个package-lock.json文件

执行打包命令npx webpack
npx依托于npm，
它的作用就是观察在当前目录下有没有你想运行的命令，没有就会去上一级目录寻找。
打包完成

在setup目录下生成了一个dist文件夹，里面有一个main.js文件。
此时打包工作已经完成，
可以在setup文件夹下新建一个index.html，引入打包后生成的main.js看看效果
在浏览器上打开index.html页面，可以看到"hello world"被打印出来了。
```

##### 3.配置入口出口文件

```js
1.指令设置入口文件
进入setup目录，手动删除dist文件夹。
输入指令
npx webpack --entry ./src/index.js --mode production

–entry表示设置后面路径的文件为入口文件，
–mode指定环境，production为生产环境。
运行之后发现setup目录下同样生成了dist文件夹及其子文件main.js。

到这里就会发现，使用这种命令行来打包文件，真的很不方便，也不直观，而且还不能保存我们的一些配置。因此，webpack给我们提供了通过配置文件去自定义配置参数的能力。

2.通过配置文件来配置参数
setup目录下新建webpack.config.js文件
文件名不能随便取，因为这是webpack自动读取的
这个文件是在Node.js里面运行的，
因此，定义模块的时候要使用Node.js的CommonJs模块，
所以使用module.exports来定义设置入口entry，出口output，
filename属性指定输出文件的文件名，
path属性指定输出文件的存放路径必须是绝对路径

设置mode的值，先给一个“none”，不然执行webpack命令会报警告。

使用Node.js的方法将输出路径设置为绝对路径：
参数1	__dirname表示当前webpack.config.js所在的物理路径
参数2	表示基于第一个参数的路径，将文件解析到这个路径下
执行打包命令npx webpack
执行成功后可以看到在dist文件夹下产生了一个bundle.js文件
在index.html页面中将bundle.js引入进来，然后在浏览器运行，最终同样打印出“hellow world”。
const path = require('path');
module.exports = {
	entry:'./src/index.js', // 入口文件 的名称
	output:{
        filename:'bundle.js', // 输出文件 的名称
        path:path.resolve(__dirname, './dist')
    },
     mode:'none'
}
```

##### 4.HtmlWebpackPlugin插件

```js
安装
在根目录安装
npm install html-webpack-plugin -D

配置
在根目录创建03-manage-output文件夹，
将setup文件夹下的src文件夹、index.html、webpack.config.js文件复制进来。
修改一下index.html文件的内容
打开webpack.config.js，做以下配置
1）template指定当前目录下的index.html为模板
2）filename指定输出文件的文件名
3）inject用来定义自动生成的script标签在什么位置

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
module.exports = {
    entry:'./src/index.js',
    output:{
        filename:'bundle.js',
        path:path.resolve(__dirname, './dist')
    },
    mode:'none',
    plugins:[
        new HtmlWebpackPlugin({
            template:'./index.html',
            filename:'app.html',
            inject:'body'
        })
    ]
}

进入03-manage-output目录，
执行打包命令npx webpack
打包完成后可以看到在当前目录下产生了dist文件夹以及app.html和bundle.js两个子文件

去浏览器中运行app.html，最后同样输出hello world
```

##### 5.watch mode和webpack-dev-server

```js
使用watch mode(观察模式)
在每次编译代码时，手动运行npx webpack会显得很麻烦。
我们可以在webpack启动时添加“watch参数”，如果其中一个文件被更新，代码将被重新编译，所以你不必再去手动运行整个构建。

在根目录新建04-development文件夹，将setup文件下的src文件夹、index.html、webpack.config.js文件复制进来。
进入04-development文件夹，
输入指令npx webpack --watch

现在随意修改hello-world.js的输出内容，都不用再去执行npx webpack命令进行重新编译，刷新浏览器就可以看到效果。

使用webpack-dev-server
上一步只是帮我们省去了每次修改文件，都要去重新编译的步骤，还是要自己去手动刷新浏览器，
这里我们使用webpack-dev-server来解决这个问题。

在根目录安装
npm install --save-dev webpack-dev-server

在webpack.config.js中配置一下devServer
static表示devServer指向的物理路径

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
module.exports = {
    entry:'./src/index.js',
    output:{
        filename:'bundle.js',
        path:path.resolve(__dirname, './dist')
    },
    mode:'development',
    plugins:[
        new HtmlWebpackPlugin({
            template:'./index.html',
            filename:'app.html',
            inject:'body'
        })
    ],
    devServer:{
        static:'./dist'
    }
}

进入04-development目录，执行
npx webpack-dev-server
发现有一个http://localhost:8080/的服务启动了
按住crtl点击一下这个服务，在浏览器上打开了一个页面，其实就是dist文件夹下的两个文件。

点击app.html，打开开发者工具，可以看到hello world被输出了。同时还有两个提示。
‘Hot Module Replacement enabled.’表示热模块更新替换已经生效了
‘Live Reloading enabled.’表示实时更新也生效了 
```

##### 配置常用的插件、loder

```js
loader的配置主要在module.rules中进行，
配置vue-loader，使用vue单文件组件，
template组建的模板区域，
script业务逻辑区域(data,生命周期函数，props，方法等)，
style样式区域

修改webpack的默认配置
默认情况下，vue-cli 3.0生成的项目，隐藏了webpack配置项，
如果我们需要配置webpack，需要在项目根目录中创建vue.config.js文件来配置。
修改方法
chainWebpack(链式编程)
configureWebpack(操作对象)

module.exports = {
    chainWebpack:config=>{
        //发布模式
        config.when(process.env.NODE_ENV === 'production',config=>{
            //entry找到默认的打包入口，调用clear则是删除默认的打包入口
            //add添加新的打包入口
            config.entry('app').clear().add('./src/main-prod.js')
        })
        //开发模式
        config.when(process.env.NODE_ENV === 'development',config=>{
            config.entry('app').clear().add('./src/main-dev.js')
        })
    }
}

自定义运行webpack的命令
package.json里面添加
	"scripts": {
	"test": "echo \"Error: no test specified\" && exit 1",
	"dev": "webpack"
},
比如现在就是npm run dev
运行webpack后，会自动将index.js转换为main.js, 方便浏览器加载

package.json
配置build,然后运行npm run build就可以把打包好生成的项目放到dist目录里面

排除依赖项的所有第三方包
不让他们打包，然后加载外部cdn资源
eg：
module.exports = {
  ...
  output: {
    ...
  },
  externals: {
    jquery: "jQuery"
  },
  ...
}
```

##### loader

```
loader\转化文件\加载器
用于加载某些资源文件
比如
style-loader、css-loader(处理样式表)、
less-loader(处理样式表)、sass-loader、
babel-loader(优雅降级配置ES高版本转成低版本)、
coffee-loader 、
ts-loader(TypeScript转换成JavaScript)、
raw-loader(把文本文件内容加载到代码中去）、
file-loader(打包样式表中的字体文件) 、
url-loader(打包样式表中的图片文件) 、
mocha-loader、
jshint-loader 、
eslint-loader、
postCSS(给css样式自动添加兼容性前缀)、
hread-loader(将耗时的 loader 放在一个独立的 worker 池中运行，加快 loader 构建速度)
base64-loader(能够将任何二进制数据转成字符串，可以对一些小图片进行base64编码, 直接嵌入到网页中, 从而能够减小网络请求次数, 提高性能)
vue-loader(加载单文件组件,定义方式,扩展名.vue,安装vue,初始化vue实例)
render函数加载器
会对单文件组件进行渲染, 最终将渲染的结果填充到vue控制的区域
html和js是分离开的, 不能使用这两种方式
根组件的显示会特殊一些, 需要使用render函数
其他组件的显示和以前一样,子组件、路由
```

##### plugin\插件

```
拓展webpack的功能，会在整个构建过程中生效，执行相关的任务。
在webpack打包编译过程里，在对应的事件节点里执行自定义操作，
比如
uglifyjs-webpack-plugin插件:
除所有的console.log信息(开发阶段移除，发布阶段取消移除)
webpack-bundle-analyzer插件:
分析项目编译后的文件组成，以便进行加载速度优化

webpack-dev-server插件:
实现自动打包相关的包的效果，打包完之后自动打开浏览器页面
自动启动一个8080端口的服务器
在内存中生成bundle.js文件, 从根目录就可以加载
相关配置参数
--open
自动打开浏览器
--host
配置域名
--port
配置端口号

html-webpack-plugin插件:
生成预览页面
在内存中生成index.html文件, 然后从网站根目录访问
会自动给内存中的index.html导入bundle.js文件
```

##### babel-loader模块化插件

```
ES6模块化,能够将高级的ES语法, 转换成低级的语法格式, 让更多浏览器能够兼容

安装
npm install --save-dev @babel/core @babel/cli @babel/preset-env @babel/node
npm install --save @babel/polyfill

配置
babel.config.js

运行
npx babel-node ./index.js

默认导入
import m1 from './m1.js'

按需导入
import m1, { s1, s2 as ss2, say, obj } from './m1.js'

只是为了执行模块代码,不需要返回结果
import './m2.js'
import 'xxxx.css'

默认导出
export default
只能使用一次
如果没有手动导出任何内容, 默认是{}

按需导出
export
export let s1 = 'aaa'
可以使用多次
```

##### 执行build

```js
安装一个插件（babel-plugin-transform-remove-console）
在项目build阶段移除所有的console信息

打开项目控制台，
点击依赖->开发依赖，

搜索babel-plugin-transform-remove-console，安装该插件

打开babel.config.js，编辑代码如下：

//项目发布阶段需要用到的babel插件
const productPlugins = []

//判断是开发还是发布阶段
if(process.env.NODE_ENV === 'production'){
  //发布阶段
  productPlugins.push("transform-remove-console")
}

module.exports = {
  "presets": [
    "@vue/app"
  ],
  "plugins": [
    [
      "component",
      {
        "libraryName": "element-ui",
        "styleLibraryName": "theme-chalk"
      }
    ],
    ...productPlugins
  ]
}
```

##### 懒加载 按需加载

```js
路由懒加载
1.安装 @babel/plugin-syntax-dynamic-import
打开vue控制台，点击依赖->安装依赖->开发依赖->搜索@babel/plugin-syntax-dynamic-import点击安装。
2.在babel.config.js中声明该插件，打开babel.config.js
3.将路由更改为按需加载的形式，打开router.js，更改引入组件代码

为什么需要懒加载？
像vue这种单页面应用，如果没有应用懒加载，运用webpack打包后的文件将会异常的大，
造成进入首页时，需要加载的内容过多，时间过长，会出啊先长时间的白屏，即使做了loading也是不利于用户体验，
而运用懒加载则可以将页面进行划分，需要的时候加载页面，可以有效的分担首页所承担的加载压力，减少首页加载用时

1.组件懒加载方案一 vue异步组件技术 ==== 异步加载 
vue-router配置路由 , 使用vue的异步组件技术 , 可以实现按需加载. 
但是,这种情况下一个组件生成一个js文件
{ path: '/home', name: 'home', component: resolve => require(['@/components/home'],resolve) },
{ path: '/index', name: 'Index', component: resolve => require(['@/components/index'],resolve) },
{ path: '/about', name: 'about', component: resolve => require(['@/components/about'],resolve) }

2.组件懒加载方案二 路由懒加载(使用import)
const 组件名=() => import('组件路径');
下面2行代码，没有指定webpackChunkName，每个组件打包成一个js文件。
const Home = () => import('@/components/home')
const Index = () => import('@/components/index')
const About = () => import('@/components/about')

下面2行代码，指定了相同的webpackChunkName，会合并打包成一个js文件。
把组件按组分块
const Home = () => import(/* webpackChunkName: 'ImportFuncDemo' */ '@/components/home')
const Index = () => import(/* webpackChunkName: 'ImportFuncDemo' */ '@/components/index')
const About = () => import(/* webpackChunkName: 'ImportFuncDemo' */ '@/components/about')
{ path: '/about', component: About },
{ path: '/index', component: Index },
{ path: '/home', component: Home }

3.组件懒加载方案三 webpack提供的require.ensure() 
vue-router配置路由，使用webpack的require.ensure技术，可以实现按需加载
这种情况下，多个路由指定相同的chunkName，会合并打包成一个js文件
{ path: '/home', name: 'home', component: r => require.ensure([], () => r(require('@/components/home')), 'demo') },
{ path: '/index', name: 'Index', component: r => require.ensure([], () => r(require('@/components/index')), 'demo') },
{ path: '/about', name: 'about', component: r => require.ensure([], () => r(require('@/components/about')), 'demo-01') }

// r就是resolve
const list = r => require.ensure([], () => r(require('../components/list/list')), 'list');
// 路由也是正常的写法  这种是官方推荐的写的 按模块划分懒加载
const router = new Router({
    routes: [
        {
           path: '/list/blog',
           component: list,
           name: 'blog'
        }
    ]
})
```

#### RE

```
1、node_modules 文件夹
    保存包的文件

2、package-lock.json 文件
    1）记录下载包的名称
    2）记录下载包的版本
    3）记录下载包的下载地址
    4）记录下载包的依赖项

3、package.json 文件
    1）记录项目配置信息（名称、版本.....）
    2）自定义命令
    3）记录项目的依赖包：名称、版本
        
    只要一个文件夹有了这个package.json文件，npm就会认为其是一个完整的项目
    生成package.json
        npm init
            会不断让输入项目相关配置信息
        npm init -y
            所有配置都按照默认值来书写

4、去除 node_modules 文件夹之后的项目，使用 “npm i” 安装所有的包
    “npm i” 
        会从 package.json 文件读取要安装的包、版本
        会从 package-lock.json 文件读取要安装的包的依赖、版本、下载地址
    “没有package-lock.json依然能执行npm i 下载所有包，但是下载地址无法确定，有概率出错”

5、package.json文件中的dependencies、devDependencies

    dependencies：核心包    “npm i 包名”
    devDependencies：开发包    “npm i 包名 -D”

    涉及到业务代码的就是核心包，只是用来构建项目的开发包
    
6、第三方包分类

    项目包
        核心包
        开发包

    全局包
        怎么安装？ “npm i 包名 -g”
        安装路径？ c盘
        实现功能？ 安装全局包，会得到一个终端命令，通过这个命令执行某些有用的功能
```

#### yarn

```
yarn init
yarn add webpack webpack-cli -D

设置打包指令，此时为yarn webpack
package.json的第一个花括号里面添加
"scripts": {
  "build": "webpack"
}

yarn webpack
出现了打包后的文件夹dist

配置入口文件、出口文件，在dist文件夹里面生成index.html文件
https://www.webpackjs.com/plugins/html-webpack-plugin/
指令 yarn add html-webpack-plugin -D

webpack.config.js配置
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin')
module.exports = {
    entry:'./src/index.js',
    output:{
        filename:'bundle.js',
        path:path.resolve(__dirname, './dist')
    },
    mode:'none',
    plugins:[
        new HtmlWebpackPlugin({
            template:'./public/index.html',
            filename:'app.html',
            inject:'body'
        })
    ]
}

自动执行打包并运行index.html
yarn add webpack-dev-serve -D
package.json配置
  "scripts": {
    "build": "webpack",
    "serve": "webpack serve"
  },
webpack.config.js配置
导出里面加上模式名称
mode : 'development',

loader和静态资源的配置写在module.exports的module的rules里面的单独花括号里面
plugins的配置写在module.exports的plugins数组里面的单独花括号里面

修改webpack-dev-serve的配置
https://www.webpackjs.com/configuration/dev-server/
比如改运行时的端口号
https://www.webpackjs.com/configuration/dev-server/#devserver-port
```
