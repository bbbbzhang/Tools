# Vue

#### 简介

```js
<!-- vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<!-- vue-router.js -->
<script src="https://unpkg.com/vue-router@3.0.0/dist/vue-router.js"></script>
<!-- vuex.js -->
<script src="https://unpkg.com/vuex@4.0.0/dist/vuex.global.js"></script>

国产,作者尤雨溪
面向数据进行编程，不建议操作DOM
易用：熟悉HTML、CSS、JavaScript知识后，可快速上手Vue
灵活：在一个库和一套完整框架之间自如伸缩
高效：20kB运行大小，超快虚拟DOM

声明式渲染→组件系统→客户端路由→集中式状态管理→项目构建

Vue的基本使用步骤
需要提供标签用于填充数据
引入Vue.js库文件
使用Vue的语法做功能
把Vue提供的数据填充到标签里面，
用双大括号，插值表达式，里面可以直接计算，字符串拼接

Vue代码运行原理
编译过程，Vue->原生语法

声明式渲染
Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统：
一旦一个DOM元素被Vue对象所托管,这个元素的内部就可以使用vue对象中的数据和方法
<div id="app">
  {{ message }}
</div>
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})
```

#### Vue实例中的参数

```
el
元素的挂载位置（值可以是CSS选择器或者DOM元素）

data
模型数据（值是一个对象）
是个函数，返回一个对象

methods
方法

data为什么是一个函数？
因为组件是可以复用的，js里对象是引用关系，如果组件data是一个对象，与子组件中的data属性值会互相污染，所以组件的data必须是一个函数。

this指向export default的{}
data函数会把对象挂到当前组件对象上
```

#### MVVM设计思想

````
js操作html的三个历程
原生js
jquery
mvvm

MVC是后端的分层开发概念； 
MVC：model、view、control | view -> control -> model -> view
MVVM是前端视图层的概念，主要关注于 视图层分离，
MVVM把前端的视图层，分为了三部分Model,View,VM ViewModel

MVVM由 Model、View、ViewModel 三部分构成
Model 代表数据模型，也可以在 Model 中定义数据修改和业务逻辑；Vue中数据层都放在data里面
View 视图，Vue 中 view，就是我们的HTML页面
ViewModel 控制器，是一个同步View和Model的对象；将数据和视图层建立联系

MVVM解决了
开发者在代码中大量调用相同的 DOM API, 处理繁琐 ，操作冗余，使得代码难以维护。
大量的DOM 操作使页面渲染性能降低，加载速度变慢，影响用户体验。
当 Model 频繁发生变化，开发者需要主动更新到View ；当用户的操作导致 Model 发生变化，开发者同样需要将变化的数据同步到Model 中，这样的工作很繁琐，而且很难维护复杂多变的数据状态。

MVVM模式不需要用户操作dom元素，
将数据绑定到viewModel层上，会自动将数据渲染到页面中，视图变化会通知viewModel层更新数据。

MVVM的核心
ViewModel层，就像是一个中转站（value converter）
在这一层，前端开发者对从后端获取的Model数据进行转换处理，做二次封装，以生成符合View层使用预期的视图数据模型，
ViewModel层向上与View进行双向数据绑定，向下与Model层通过接口请求进行数据交互，
这样View层展现的不是 Model 层的数据，而是 ViewModel 的数据，由 ViewModel 负责与 Model 层交互，
这就完全解耦了 View 层和 Model 层。
````

#### Vue两大核心

```
数据驱动&组件系统

数据驱动
数据的双向绑定

组件系统
模板（template）
初始数据（data）
外部参数（props）
方法（methods）
生命周期钩子函数（hooks）
私有资源（assets）
```

#### 生命周期

`````
Vue 实例从创建到销毁的过程
这些过程中会伴随着一些函数的自调用，这些函数被称为钩子函数，让我们控制Vue实例过程更加清晰。
从开始创建、初始化数据、编译模板、挂载Dom→渲染、更新→渲染、销毁等一系列过程，称之为 Vue 的生命周期。

创建前/后： 
在beforeCreate阶段，vue实例的挂载元素el和数据对象data都为undefined，还未初始化。
在created阶段，vue实例的数据对象data有了，vue实例的挂载元素el还没有

载入前/后：
在beforeMount阶段，vue实例的$el和data都初始化了，但还是挂载之前为虚拟的dom节点，data.message还未替换。
在mounted阶段，vue实例挂载完成，data.message成功渲染。

更新前/后：
当data变化时，会触发beforeUpdate和updated方法

销毁前/后：
在执行destroy方法后，对data的改变不会再触发周期函数，说明此时vue实例已经解除了事件监听以及和dom的绑定，但是dom结构依然存在。

常用的钩子函数
初始化阶段：
beforeCreate
在实例初始化之后，数据观测和事件配置之前被调用 
此时data 和 methods 以及页面的DOM结构都没有初始化
初始化事件和生命周期
created
在实例创建完成后被立即调用
此时data 和 methods已经可以使用
页面还没有渲染出来
数据挂载，数据可以获取，也可以更改数据，绑定事件
beforeMount
组件或实例查找对应模板，生成vDOM
在挂载开始之前被调用
此时页面上还看不到真实数据,只是一个模板页面而已
可以获取数据，和事件绑定
mounted
el被新创建的vm.$el替换，并挂载到实例上去之后调用该钩子。  
数据挂载完毕,数据已经真实渲染到页面上
在这个钩子函数里面我们可以使用一些第三方的插件
虚拟dom已经生成，初始化渲染操作，可以操作domi

运行中阶段：
beforeUpdate
数据更新时调用，vDOM会重新渲染，发生在虚拟DOM打补丁之前。
页面上数据还是旧的
updated
由于数据更改导致的虚拟DOM重新渲染和打补丁，
DOM更新完成，可以操作更新后的DOM
在这之后会调用该钩子。 
页面上数据已经替换成最新的

销毁阶段：
beforeDestroy
实例销毁之前调用
当执行$destroy方法，也就是销毁组件时，就会执行这个函数，在这里可以做清除定时器，事件等操作
可能在当前页面中使用了$on方法，那需要在组件销毁前解绑
清除自己定义的定时器
解绑事件的绑定srcollmousemove....
destroyed
实例销毁后调用
只剩下DOM空壳，做善后操作

activated
和上面的beforeDestroy和destroyed用法差不多，
但是如果需要一个实例，在销毁后再次出现的话，用beforeDestroy和destroyed的话，就太浪费性能了。

deactivated
实例没有被激活时

第一次页面加载触发的钩子
beforeCreate  created beforeMount mounted

哪个生命周期内调用异步请求
在钩子函数 created、beforeMount、mounted 中进行调用，
因为在这三个钩子函数中，data 已经创建，可以将服务端端返回的数据进行赋值。
在 created 钩子函数中调用异步请求的优点：
能更快获取到服务端数据，减少页面 loading 时间；
ssr 不支持 beforeMount 、mounted 钩子函数，所以放在 created 中有助于一致性；

父组件和子组件生命周期钩子函数执行顺序
生命周期调用顺序：
组件的调用顺序都是先父后子
渲染完成的顺序是先子后父
组件的销毁操作是先父后子
销毁完成的顺序是先子后父

父组件和子组件生命周期钩子函数执行顺序 
1.加载渲染过程 
父 beforeCreate -> 父 created -> 父 beforeMount -> 子 beforeCreate -> 子 created -> 子 beforeMount -> 子 mounted -> 父 mounted  
2.子组件更新过程 
父 beforeUpdate -> 子 beforeUpdate -> 子 updated -> 父 updated  
3.父组件更新过程 
父 beforeUpdate -> 父 updated  4.销毁过程 父 beforeDestroy -> 子 beforeDestroy -> 子 destroyed -> 父 destroyed

父组件监听子组件的生命周期
父组件引用子组件时通过@hook来监听，核心是@hook:mounted="doSth"的写法
假如我们有父组件Parent和子组件Child，
如果在父组件中需要监听子组件的mounted这个生命周期函数，并做一些逻辑处理

<Child @hook:mounted="doSth" />  

methods:{
    doSth(){
        //some codes here
    }
}

activated使用场景
在实例被激活时使用，用于重复激活一个实例的时候
   components:{
       cmpsize:{
          template:'<div>这是一个子组件</div>',
          activated(){  
              console.log('实例被激活时');
          },
      　}
  　}

mounted使用场景
将界面的dom元素和某些第三方库绑定的时候需要使用到
1.echarts
    mounted() {
        var myChart = echarts.init(this.$refs.main)
    }
2.cropperjs
	mounted () {
        const image = this.$refs.img
        this.cropper = new Cropper(image, {})
    }
    
destroyed使用场景
资源回收, 否则可能会造成内存泄漏
created() {
	this.timerId = setInterval(function(){}, 1000)
	window.addEventListener('scroll', this.handleScroll)
},
destroyed() {
	clearInterval(this.timerId)
	window.removeEventListener('scroll', this.handleScroll)
}
`````

#### 数组方法(Vue中用)

```
在 Vue 中，直接修改对象属性的值无法触发响应式。
当你直接修改了对象属性的值，你会发现，只有数据改了，但是页面内容并没有改变

变异数组方法
即保持数组方法原有功能不变的前提下对其进行功能拓展
push()
往数组最后面添加一个元素，成功返回当前数组的长度
pop()
删除数组的最后一个元素，成功返回删除元素的值
shift()
删除数组的第一个元素，成功返回删除元素的值
unshift()
往数组最前面添加一个元素，成功返回当前数组的长度
splice()
有三个参数，第一个是想要删除的元素的下标（必选），第二个是想要删除的个数（必选），第三个是删除 后想要在原位置替换的值
sort()
使数组按照字符编码默认从小到大排序,成功返回排序后的数组
reverse()
将数组倒序，成功返回倒序后的数组

替换数组
不会改变原始数组，但总是返回一个新数组
filter()
创建一个新的数组，新数组中的元素是通过检查指定数组中符合条件的所有元素。
concat()
用于连接两个或多个数组。该方法不会改变现有的数组

slice()
可从已有的数组中返回选定的元素。该方法并不会修改数组，而是返回一个子数组

动态数组响应式数据
Vue.set(a,b,c)    让 触发视图重新更新一遍，数据动态起来
a是要更改的数据 、   b是数据的第几项、   c是更改后的数据
```

#### VNode虚拟DOM

```javascript
虚拟DOM
本质上就是用一个原生js对象描述的DOM节点，他比创建一个DOM的代价小很多。通过diff算法，对比两颗虚拟DOM树的差异，
去除了不必要的DOM操作，最后把差异更新到真正的DOM树，从而提高了性能。
js只操作虚拟dom，最终把变更写入到真实的dom中，
用一个JS对象来描述一个DOM节点，用来描述一段HTML片段的
如果有大量，频繁的数据更新，能够对视图进行合理，高效的更新。
Vue是数据驱动视图的，数据发生变化视图就要随之更新，在更新视图的时候要操作DOM,而操作真实DOM非常耗费性能
v-for中的key的其中一个作用是为了高效的更新虚拟DOM树，提高查找的效率，一次性定位到要修改的元素

虚拟dom的作用
虚拟dom的最终目标是将虚拟节点渲染到视图上，如果直接使用虚拟节点覆盖旧节点，就会有很多不必要的dom操作，
为了避免不必要的dom操作，虚拟dom在虚拟节点映射到试图的过程中，
将虚拟节点与上一次渲染视图所使用的旧虚拟节点做对比，找出真正需要更新的节点来操作dom操作，
从而避免操作其他不需要的dom元素

何时创建虚拟DOM树
1.当页面准备渲染的时候, Vue会创建一颗虚拟DOM树
2.当数据发生改变时, Vue会再创建一颗新的虚拟DOM树
3.前后两颗新旧虚拟DOM树进行对比，Vue通过diff算法，去记录差异的地方
4.将有差异的地方更新到真实的DOM树中

VNode在Vue的整个虚拟DOM过程起的作用
在视图渲染之前，把写好的template模板先编译成VNode并缓存下来，等到数据发生变化页面需要重新渲染时，
把数据发生变化后生成的VNode与前一次缓存下来的VNode进行对比，找出差异，
然后有差异的VNode对应的真实DOM节点就是需要重新渲染的节点，
最后根据有差异的VNode创建出真实的DOM节点再插入到视图中，完成一次视图更新。
说白了就是以JS的计算性能来换取操作真实DOM所消耗的性能。

从源码角度
在Vue中是通过VNode类来实例化出不同类型的虚拟DOM节点，并且学习了不同类型节点生成的属性的不同，
不同类型的节点其本质是一样的，都是VNode类的实例，只是在实例化时传入的属性参数不同。
最后探究了VNode的作用，有了数据变化前后的VNode，我们才能进行后续的DOM-Diff找出差异，
最终做到只更新有差异的视图，从而达到尽可能少的操作真实DOM的目的，以节省性能。

最大的价值
让react脱离了浏览器环境运行，让react跨平台有了保障
在render()调用之后触发（render并不代表浏览器重新渲染）

简单的虚拟树的例子:
var virtualTree = {
	tagName: 'div',
	type: 'node',
	properties: {
    	id: 'mydiv',
    	className: 'myclass'
	},
	children: [
		{
			tagName: 'span',
			type: 'node'
			properties: {
				id: 'myspan'
			},
			children: [
				{
					tagName: null,
					type: 'text',
					content: '我是span'
				}
			]
		}
	]
}
```

#### 单页Web应用SPA

```
单页 Web 应用 (single-page application 简称为 SPA) 
一种特殊的 Web 应用。它将所有的活动局限于一个Web页面中，仅在该Web页面初始化时加载
相应的HTML、JavaScript 和 CSS。一旦页面加载完成了，SPA不会因为用户的操作而进行页面的重新加载或跳转。
取而代之的是利用 JavaScript 动态的变换HTML的内容，从而实现UI与用户的交互。
由于避免了页面的重新加载，SPA 可以提供较为流畅的用户体验。

单页面：就是指一个系统只加载一次资源，之后的操作交互、数据交互是通过路由、ajax来进行，页面并没有刷新
多页面：一个应用中有多个页面，页面跳转是整页刷新
```

##### SPA优点

```
无刷新界面，页面片段切换快，给用户体验原生的应用感觉
节省原生app开发成本
提高发布效率，无需每次安装更新包
内容改变不需要加载整个页面，对服务器压力小

良好的交互体验
前端进行的是局部的渲染，避免了不必要的跳转和重复的渲染。
前后端职责业分离（前端负责view，后端负责model），架构清晰
单页web应用可以和RESTful规约一起使用，通过REST API提供接口数据，并使用Ajax异步获取，这样有助于分离客户端和服务器的工作。

减轻服务器的压力
服务器只需要提供数据，不需要管前端的展示逻辑和页面合成，提高了 性能
SPA应用中服务器可以先将一份包含静态资源（HTML CSS JS等）的静荷数据（payload）发送给客户端，之后客户端只需要获取渲染页面或视图数据即可，

共用一套后端程序代码
不用修改后端程序代码就可以同时用于web界面、手机、平板灯多种客户端
```

##### SPA缺点

```
效果和性能和原生的有较大差异
各个浏览器的版本兼容性不一样
业务随着代码的增加而增加，不利于首屏优化
不利于seo优化（搜索引擎抓取），SEO难度高，初次加载耗时

由于所有内容都在一个页面中进行动态的替换，也就是利用hash片段实现路由，而利用hash片段不会作为HTTP请求中的一部分发送给服务器，所以在SEO上有着天然的弱势
而SPA使用哈市片段的目的是;片段内容发送变化时，浏览器不会像URL发送变化时那样发送请求，这样就可以只请求页面或渲染所需的数据，而不是每一个页面获取并解析整份文档

首次加载时间过长
为实现单页Web应用功能及显示效果，需要在加载页面使将js、CSS统一加载，部分页面按需加载。

页面复杂都提高，复杂逻辑程度成倍
由于后端只提供数据而不再管前端的展示逻辑和页面合成，所以这些展示逻辑和页面合成都需要在前端进行编写（前进、后退等），所以会大大提高页面的复杂性和逻辑的难度
```

#### 使用数据

##### 插值表达式

```
{{}}

模板语法(模板之中可以使用的语法)
将数据填充到HTML标签中
支持基本的计算操作
```

##### 指令

```
本质就是自定义属性
Vue中指定都是以 v- 开头 

v-text
开始标签和结束标签所包裹的内容
填充文本，比插值表达式更加简洁
<div v-text="msg">
会覆盖插值表达式

v-html
开始标签和结束标签所包裹的内容
填充html片段
存在安全问题
只可以显示本网站内部的数据，来自第三方的数据不可用
会覆盖插值表达式

v-cloak
解决“闪动”的问题

v-pre
填充原始的信息，跳过编译过程

v-once
只编译一次
造成的效果，禁用了数据响应的功能
显示内容之后不再具有响应式，可以提高性能

v-model
双向数据绑定
表单元素标签能让用户造成界面的变化，需要用到双向数据绑定
底层实现原理
<input :value="bb" @input="bb = $event.target.value">
```

##### 自定义全局指令

```js
Vue.directive  注册全局指令
使用自定义的指令，只需在对用的元素中，加上'v-'的前缀形成类似于内部指令'v-if'，'v-text'的形式。
注意：
1、 在自定义指令中  如果以驼峰命名的方式定义 如  Vue.directive('focusA',function(){}) 
2、 在HTML中使用的时候 只能通过 v-focus-a 来使用
<input type="text" v-focus>
    
<script>
// 注册一个全局自定义指令 v-focus
Vue.directive('focus', {
// 当绑定元素插入到 DOM 中。 其中 el为dom元素
  	inserted: function (el) {
    		// 获取元素的焦点
    		el.focus();
 	}
});
new Vue({
　　el:'#app'
});
</script>

Vue.directive  注册全局指令 带参数
自定义指令-带参数
bind - 只调用一次，在指令第一次绑定到元素上时候调用
<input type="text" v-color='msg'>
    
<script type="text/javascript">
    Vue.directive('color', {
      // bind声明周期, 只调用一次，指令第一次绑定到元素时调用。在这里可以进行一次性的初始化设置
      // el为当前自定义指令的DOM元素
      // binding为自定义的函数形参，通过自定义属性传递过来的值，存在binding.value里面
      bind: function(el, binding){
        // 根据指令的参数设置背景色
        // console.log(binding.value.color)
        el.style.backgroundColor = binding.value.color;
      }
    });
    var vm = new Vue({
      el: '#app',
      data: {
        msg: {
          color: 'blue'
        }
      }
    });
</script>

使用Vue.directive注册全局自定义指令，也可以添加选项directives注册组件内自定义指令
全局定义
Vue.directive("change-color",function(params){
	//执行代码块
})

注册让表单自动获取焦点的全局自定义指令
通过Vue.directive 自定义指定
通过v-自定义属性名 调用自定义指令
<input type="text" id="id" v-model='id' :disabled="flag" v-focus>

<script>
    # 2.1   通过Vue.directive 自定义指定
	Vue.directive('focus', {
      inserted: function (el) {
        el.focus();
      }
    });
</script>
```

##### 自定义局部指令

```js
局部指令，需要定义在directives的选项，用法和全局用法一样 
局部指令只能在当前组件里面使用
当全局指令和局部指令同名时以局部指令为准

<input type="text" v-color='msg'>
<input type="text" v-focus>
    
<script type="text/javascript">
    var vm = new Vue({
      el: '#app',
      data: {
        msg: {
          color: 'red'
        }
      },
      directives: {
        color: {
          bind: function(el, binding){
            el.style.backgroundColor = binding.value.color;
          }
        },
        focus: {
          inserted: function(el) {
            el.focus();
          }
        }
      }
    });
</script>
```

#####  数据响应式

```
html5中的响应式（屏幕尺寸的变化导致样式的变化）
数据的响应式（数据的变化导致页面内容的变化）
数据变了,造成界面的刷新
原理
界面变化-->数据的更新
	监听界面的变化, 在事件处理函数中, 修改数据就可以了
数据变化-->界面的更新
	如何监听  = 号赋值  这件事情
	
什么是数据绑定
数据绑定：将数据填充到标签中
 
1.Vue 无法检测 property 的添加或移除。
由于 Vue 会在初始化实例时对 property 执行 getter/setter 转化，
所以 property 必须在 data 对象上存在才能让 Vue 将它转换为响应式的。
var vm = new Vue({
	data:{
		a:1
	}
})
vm.b = 2
// `vm.a` 是响应式的
// `vm.b` 是非响应式的

2.Vue 不能检测以下数组的变动：
利用索引直接设置一个数组项，例如：vm.items[indexOfItem] = newValue
修改数组的长度，例如：vm.items.length = newLength

可以使用 Vue.set(object, propertyName, value) 方法向嵌套对象添加响应式 property
Vue.set(vm.someObject, 'b', 2)
Vue.set(vm.items, indexOfItem, newValue)

    var str = 'zs'
    var obj = {
      name: str,
      age: 18
    }
    
Vue2.x的做法:
    Object.defineProperty(obj, 'name', {
      set(newValue){
        str = newValue
        console.log('zs 的name属性发生了变化...')
      },
      get(){
        return str
      }
    })
   obj.name = 'lisi' // 这行代码会触发set方法的调用
   
// 数据劫持
// 观察者设计模式
   
Vue3的做法:
   obj = new Proxy(obj, {
      get(target, key) {
        return target[key]
      },
      set(target, key, value) {
        target[key] = value
        console.log('zs 的name属性发生了变化...')
      }
    })
```

##### 单向数据绑定

```
单向数据绑定
数据发生变化，触发界面也跟着变化（数据绑定）
差值表达式
v-text
v-html
v-model
v-bind
```

##### 双向数据绑定

```
界面发生变化，触发数据同步更新（事件监听）
数据发生变化，触发界面也跟着变化（数据绑定）
差值表达式
v-model

双向数据绑定的底层实现原理
观察者设计模式
Object对象的defineProperty方法可以监测到对象属性值的变化
Object.defineProperty的第三个参数是个对象，里面有set和get
通过set可以监测到数据被修改,通过get可以监测到数据被读取
VUE底层通过该方法来监听数据的修改，通过数据劫持来通知DOM进行更新
VUE 3.0已经换了，proxy

为什么不能实现对象新增属性的双向数据绑定
vue双向数据绑定原理是，
当你把一个普通的 JavaScript 对象传给 Vue 实例的 data 选项，
Vue 将遍历此对象所有的属性，
并使用 Object.defineProperty 把这些属性全部转为 getter/setter。

所以当你给一个对象新增属性的时候时候是没有挂载到vue实例身上，也没有进行watcher收集。
给对象新增属性应该使用 $set方法

为什么表单元素需要双向数据绑定
为了收集用户输入的数据
```

##### 闪动的问题

```
刷新页面，先显示插值表达式（{{msg}}），然后再显示里面的东西

v-cloak指令消除闪动

提供样式
[v-cloak]{
	display:none;
}
在插值表达式所在的标签添加 v-clock指令
自定义属性就是指令

原理
先通过样式隐藏内容
然后在内存中进行值的替换，替换好后再显示最终的结果
```

##### v-model和.sync修饰符

```
v-model的本质
v-bind:value和v-on:input

v-model语法糖的写法
<my-component type="text" v-model="value">

v-model展开语法糖后的写法
<my-component type="text"
  :value="value"
  @input="value = $event.target.value"
>

默认针对原生组件input事件，
但是如果子组件定义了针对事件
model: {
        prop: "value",
        event: "update"
},
则编译为
<my-component type="text"
  :value="value"
  @update="(val) => value = val"
>

.sync本质
语法糖
<my-component :value.sync="value" />
编译后的写法
<my-component 
  :value="msg" 
  @update:value="(val) => value = val"
>
    
两者本质都是一样，并没有任何区别： “监听一个触发事件”="(val) => value = val"。 

细微之处的区别:
1.v-model默认对应的是input或者textarea等组件的input事件，如果在子组件替换这个input事件，其本质和.sync修饰符一模一样。
比较单一，不能有多个。
2.一个组件可以多个属性用.sync修饰符，可以同时"双向绑定多个“prop”，而并不像v-model那样，一个组件只能有一个。

总结功能作用场景：`
1.v-model针对更多的是最终操作结果，是双向绑定的结果，是value，是一种change操作。
比如：输入框的值、多选框的value值列表、树结构最终绑定的id值列表（ant design和element都是）、等等...

2..sync针对更多的是各种各样的状态，是状态的互相传递，是status，是一种update操作。
比如：组件loading状态、子菜单和树结构展开列表（状态的一种）、某个表单组件内部验证状态、等等....
```

#### 事件 

##### 事件绑定

```
v-on或@
绑定事件监听器
事件类型由参数指定
表达式可以是一个方法的名字或一个内联语句，如果没有修饰符也可以省略
用在普通元素上时，只能监听原生 DOM 事件
用在自定义元素组件上时，也可以监听子组件触发的自定义事件
方法中的this就是当前的vue的实例对象,可以在方法中访问数据

eg：
<div v-on:click="sayHello"></div>
<div v-on:click="sayHello()"></div>
<div @click="sayHello"></div>
<div @click="sayHello()"></div>
<button v-on:click='num++'>点击</button>

eg:
e.target.style.color =  "red"
```

##### 事件修饰符

```
事件修饰符
可以简化操作,可以连着写，有先后顺序
    .stop - 调用 event.stopPropagation()。
    .prevent - 调用 event.preventDefault()。
    .capture - 添加事件侦听器时使用 capture 模式。
    .self - 只当事件是从侦听器绑定的元素本身触发时才触发回调。
    .{keyCode | keyAlias} - 只当事件是从特定键触发时才触发回调。
    .native - 监听组件根元素的原生事件。
    .once - 只触发一次回调。
    .left - (2.2.0) 只当点击鼠标左键时触发。
    .right - (2.2.0) 只当点击鼠标右键时触发。
    .middle - (2.2.0) 只当点击鼠标中键时触发。
    .passive - (2.3.0) 以 { passive: true } 模式添加侦听器

自定义按键修饰符
全局config.keyCodes对象
Vue.config.keyCodes.f1 = 112
名字是自定义的，对应的值必须是按键对应event.keyCode值

按键修饰符
.xx | .enter | .tab | .delete | .esc | .space | .up | .down | .left | .right | .ctrl | .alt | .shift | .meta

表单域修饰符
.number  转换为数值
   - 注意点：	
      - 当开始输入非数字的字符串时，因为Vue无法将字符串转换成数值
      - 所以属性值将实时更新成相同的字符串。即使后面输入数字，也将被视作字符串。
.trim  自动过滤用户输入的首尾空白字符
     - 只能去掉首尾的 不能去除中间的空格

.lazy   将input事件切换成change事件

     - .lazy 修饰符延迟了同步更新属性值的时机。即将原本绑定在 input 事件的同步逻辑转变为绑定在 change 事件上
     - 在失去焦点 或者 按下回车键时才更新

eg:
<input type="text" v-model.number="num1">
```

##### 事件类型

```
点击事件
click

输入事件
input

失去焦点事件
blur

用于视图改变的时候去操作数据
change

按键事件
keydown
keyup
```

##### 事件函数中传参数

```js
v-on:click="handle1(123,456,$event)"

$event
vue中的事件对象，写在最后一位，固定写法
如果事件绑定函数调用，那么事件对象必须作为最后一个参数显示传递，并且事件对象的名称必须是$event

v-on:click="handle2"
默认携带了事件对象，第一个参数就是事件对象
如果事件直接绑定函数名称，那么默认会传递事件对象作为事件函数的第一个参数

eg:
methods: {
                handle1: function(p, p1, event) {
                	console.log(p, p1)
                	console.log(event.target.innerHTML)
                	this.num++;
                },
                handle2: function(event) {
                	console.log(event.target.innerHTML)
                }
            }

事件传入自定义参数以及事件对象
用户名: <input type="text" v-on:input="(e) => { handleInput('username', e)}">
密码: <input type="text" v-on:input="handleInput('pwd', $event)">
```

#### 属性

##### 属性绑定

```
v-bind或:

绑定
将某个属性的值,和data的某一项数据绑定在一起
单向数据绑定

eg:
<a v-bind:href='url'>跳转</a>
<a :href='url'>跳转</a>
```

##### 标签的属性

```
标签的属性
a标签的 href  target
img标签的 src alt title
input标签的type value
任何标签的 id class style
```

##### 样式绑定

```

style属性
普通的字符串
v-bind:style='mystyle'
	data:{
    mystyle:'width:100px;height:100px'
}

对象
v-bind:style='obj'
data:{
    obj:{
        width:'100px',
        height:'100px'
    }
}

数组
v-bind:style='arr'
data:{
    arr:[
       obj1:{
           width:'100px',
           height:'100px'
       },
       obj2:{
           color:'red'
       }
    ]
}

class属性
普通的字符串
v-bind:class='cls'
data:{
	cls: 'div1 bg'
}
对象
v-bind:class='obj'
data:{
    obj:{
       	div1:true, 
       	bg:true
   	 }
}
数组
v-bind:class='arr'
data:{
    arr:['div1', 'bg']
}

style属性
普通的字符串
v-bind:style='mystyle'
data:{
    mystyle:'width:100px;height:100px'
}
对象
v-bind:style='obj'
data:{
    obj:{
        width:'100px',
        height:'100px'
    }
}
数组
v-bind:style='arr'
data:{
    arr:[
       obj1:{
           width:'100px',
           height:'100px'
       },
       obj2:{
           color:'red'
       }
    ]
}
```

#### 分支循环结构

##### v-if

```
控制元素是否渲染到页面
根据表达式的值的 truthiness 来有条件地渲染元素。
在切换时元素及它的数据绑定 / 组件被销毁并重建。
如果元素是 <template>，将提出它的内容作为条件块。
将元素删除或者添加

配合的指令：v-else
          v-else-if
           
v-for比v-if优先级高,所以, 会先v-for之后, 再判断v-if

通过创建销毁元素的方式让元素可见或者不可见，v-if是动态的向DOM树内添加或者删除DOM元素,消耗的性能大，
真正的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建；
也是短路的：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。
浪费性能，
v-if切换有一个局部编译/卸载的过程，切换过程中合适地销毁和重建内部的事件监听和子组件
```

##### v-show

```
控制元素是否显示（已经渲染到了页面）
根据表达式的真假值，通过控制元素的display让元素可见或者不可
当条件变化时该指令触发过渡效果。

不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 的 “display” 属性进行切换
v-show只编译一次，后面其实就是控制css，而v-if不停的销毁和创建，故v-show性能更好一点。

v-show的使用场景建议
某个元素需要频繁切换显示状态,
因为频繁创建销毁DOM需要性能开销.
如果条件切换不是很频繁则使用v-if较好
```

##### v-for

```vue
循环遍历数组或者对象
将某一个标签及其内部完整的结构重复生成多个
每一份的数据是不同的
item进行区分

一般会配合key属性
使用key为了保持每一个item的状态
帮助Vue区分不同的元素，从而提高性能
eg:
<li v-for="item in list" v-bind:key="item.id">
    <input type="checkbox"> <span>{{item.title}}</span>
</li>

key的作用
key来给每个节点做一个唯一标识
key的作用主要是为了高效的更新虚拟DOM
提高页面的渲染性能, 标识界面元素的唯一性, 可以保持每一个item项的状态

注意项:
建议不要使用索引号当做key值进行使用

作用
为了高效的更新虚拟DOM，
其原理是vue在patch过程中通过key可以精准判断两个节点是否是同一个，从而避免频繁更新不同元素，使得整个patch过程更加高效，减少DOM操作量，提高性能。
若不设置key还可能在列表更新时引发一些隐蔽的bug
vue中在使用相同标签名元素的过渡切换时，也会使用key属性，其目的也是为了让vue可以区分它们，否则vue只会替换其内部属性而不会触发过渡效果

假设有ABCDE五个节点，
现在想在B和C中间添加一个F节点，
如果不加key的话，diff算法默认执行起来会把C更新成F，把D更新成C，E更新成D，最后再插入E；
如果加了key作为每个节点的唯一标识的话，diff算法就可以正确的识别此节点，会直接在B和C之间添加节点F，
所以key可以高效的更新虚拟dom
```

#### 表单相关操作

##### 获取单选框中的值

```html
- 两个单选框需要同时通过v-model 双向绑定 一个值 
- 每一个单选框必须要有value属性  且value 值不能一样 
- 当某一个单选框选中的时候 v-model  会将当前的 value值 改变 data 中的 数据

<input type="radio" id="male" value="1" v-model='gender'>
   <label for="male">男</label>

   <input type="radio" id="female" value="2" v-model='gender'>
   <label for="female">女</label>

<script>
    new Vue({
         data: {
             // 默认会让当前的 value 值为 2 的单选框选中
                gender: 2,  
            },
    })

</script>
```

##### 获取复选框中的值

```html
- 复选框需要同时通过v-model 双向绑定 一个值 
- 每一个复选框必须要有value属性  且value 值不能一样 
- 当某一个单选框选中的时候 v-model  会将当前的 value值 改变 data 中的 数据

<div>
   <span>爱好：</span>
   <input type="checkbox" id="ball" value="1" v-model='hobby'>
   <label for="ball">篮球</label>
   <input type="checkbox" id="sing" value="2" v-model='hobby'>
   <label for="sing">唱歌</label>
   <input type="checkbox" id="code" value="3" v-model='hobby'>
   <label for="code">写代码</label>
 </div>
<script>
    new Vue({
         data: {
                // 默认会让当前的 value 值为 2 和 3 的复选框选中
                hobby: ['2', '3'],
            },
    })
</script>
```

##### 获取下拉框和文本框中的值

```html
- 需要给select  通过v-model 双向绑定 一个值 
- 每一个option  必须要有value属性  且value 值不能一样 
- 当某一个option选中的时候 v-model  会将当前的 value值 改变 data 中的 数据

<div>
      <span>职业：</span>
      
      <select v-model='occupation' multiple>
          <option value="0">请选择职业...</option>
          <option value="1">教师</option>
          <option value="2">软件工程师</option>
          <option value="3">律师</option>
      </select>
         <!-- textarea 是 一个双标签   不需要绑定value 属性的  -->
        <textarea v-model='desc'></textarea>
  </div>
<script>
    new Vue({
         data: {
                // 默认会让当前的 value 值为 2 和 3 的下拉框选中
                 occupation: ['2', '3'],
             	 desc: 'nihao'
            },
    })
</script>
```

#### 计算属性computed

```html
通过计算才能得到的属性
可以根据data中的数据成员,动态计算出一个新的数据成员(这个数据成员在data中并不存在),计算属性的函数必须有返回值;
模板里面要多次使用相同的逻辑、复杂的逻辑

优点：
使得数据处理结构清晰；
依赖于数据，数据更新，处理结果自动更新；
计算属性内部this指向vm实例；
在template调用时，直接写计算属性名即可；
可以使用getter方法获取数据，set方法改变数据；

通过计算属性计算图书的总数
图书的总数就是计算数组的长度  
<div class="total">
        <span>图书总数：</span>
     	<!-- 3.2 在页面上 展示出来 -->
        <span>{{total}}</span>
</div>

  <script type="text/javascript">
    /*
      计算属性与方法的区别:计算属性是基于依赖进行缓存的，而方法不缓存
    */
    var vm = new Vue({
      data: {
        flag: false,
        submitFlag: false,
        id: '',
        name: '',
        books: []
      },
      computed: {
        total: function(){
          // 3.1  计算图书的总数
          return this.books.length;
        }
      },
    });
  </script>
```

##### computed和watch的区别

```
-计算属性得到一个 新 的值,只不过这个新的值依赖于data中的另外一项数据
-监听器只是为了得到一个时机,data中某个数据变化了的这个时机

相同：
两者都可以观察页面数据的变化

不同点
computed
（一个数据受多个数据影响）
在computed中定义的每一个计算属性，都会被缓存起来，只有当计算属性里面依赖的一个或多个属性变化了，才会重新计算当前计算属性的值。
1、支持数据的缓存。
2、函数内部的数据改变也会触发。
3、不支持异步，当computed内部有异步操作时computed无效
4、如果一个属性是由其他属性计算而来的，这个属性依赖其他属性，一般用computed
5、computed 属性值会默认走缓存，计算属性是基于它们的响应式依赖进行缓存的，也就是基于data中声明过或者父组件传递的props中的数据通过计算得到的值。（return里面不用声明定义变量就可以进行监听观察数据变化的。）

watch
watch是属性监听器，一般用来监听属性的变化（也可以用来监听计算属性函数），并做一些操作
1、不支持缓存
2、支持异步
3、只可以设置一个函数，可以带有两个参数
4、监听数据必须是data中声明过或者父组件传递过来的props中的数据，当数据变化时，触发其他操作。（return里面必须声明定义变量才能进行监听。）

举例说明：
1.在数据变化,会自动调用watch而不调用computed,只有在使用computed的值时才会调用conputed
2.多次使用computed时,如果computed所依赖的属性值没有变化,只有第一次使用会进行计算,之后的每次使用不会重新进行计算,而是会读取缓存
3.连续多次改变属性的值,watch只会执行最后一次
```

#####  computed和methods的区别

```js
methods方法不存在缓存
不管依赖的数据变不变，methods都会重新计算。
methods方法里面的函数，每调用一次，都会执行一下这个函数,这个方法只要加上了(),就会调用

计算属性的结果基于它们的依赖进行缓存的
依赖数据没有发生变化的时候，computed从缓存中获取，不会重新计算。那么多次访问，实际上用的都是第一次计算的结果
依赖的数据发生了变化，计算属性的方法才会得到执行

 <div id="app">
     <!--  当多次调用 reverseString  的时候,只要里面的 num 值不改变 他会把第一次计算的结果直接返回,直到data 中的num值改变 计算属性才会重新发生计算-->
    <div>{{reverseString}}</div>
    <div>{{reverseString}}</div>
     <!-- 调用methods中的方法的时候  他每次会重新调用 -->
    <div>{{reverseMessage()}}</div>
    <div>{{reverseMessage()}}</div>
  </div>
  <script type="text/javascript">
    /*
      计算属性与方法的区别:计算属性是基于依赖进行缓存的，而方法不缓存
    */
    var vm = new Vue({
      el: '#app',
      data: {
        msg: 'Nihao',
        num: 100
      },
      methods: {
        reverseMessage: function(){
          console.log('methods')
          return this.msg.split('').reverse().join('');
        }
      },
      //computed  属性 定义 和 data 已经 methods 平级 
      computed: {
        //  reverseString   这个是我们自己定义的名字 
        reverseString: function(){
          console.log('computed')
          var total = 0;
          //  当data 中的 num 的值改变的时候  reverseString  会自动发生计算  
          for(var i=0;i<=this.num;i++){
            total += i;
          }
          // 这里一定要有return 否则 调用 reverseString 的 时候无法拿到结果    
          return total;
        }
      }
    });
  </script>
```

#### 侦视器属性watch

```html
可以监视data中某一个数据成员的改变或路由中的某些属性的改变,可以根据这个改变,做一些其他操作(不仅仅局限于更新其他相关数据).
通过侦听自身的值变化去改变其他的响应式数据，计算属性是侦听其他的响应式数据来改变自身的状态

使用watch来响应数据的变化
一般用于异步或者开销较大的操作
watch 中的属性 一定是data中已经存在的数据 
当需要监听一个对象的改变时，普通的watch方法无法监听到对象内部属性的改变，只有data中的数据才能够监听到变化，此时就需要deep属性对对象进行深度监听


<body>
    <div id="app">
        <h1>简单计算器</h1>
        <input type="text" v-model.number='num1'> + <input type="text" v-model.number='num2'> = <span>{{result}}</span>
    </div>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript">
        /*要求: 实计算两数和, 注意是 实时哦! */
        var vm = new Vue({
            el: '#app',
            data: {
                num1: 0,
                num2: 0,
                result: 0,
            },
            methods: {},
            watch: {
                num1: function() {
                    this.result = this.num1 + this.num2;
                },
                num2: function() {
                    this.result = this.num1 + this.num2;
                }
            }
        });
    </script>
</body>
```

#### 过滤器属性filters

```html
Vue.js允许自定义过滤器，可被用于一些常见的文本格式化。
可以用在两个地方：双花括号插值{{}}和v-bind表达式。
被添加在JavaScript表达式的尾部，由“管道”符号指示
过滤器不改变真正的`data`，而只是改变渲染的结果，并返回过滤后的版本
全局注册时是filter，没有s的。而局部过滤器是filters，是有s的
支持级联操作

全局过滤器
upper 被定义为接收单个参数的过滤器函数，表达式msg 的值将作为参数传入到函数中。
然后继续调用同样被定义为接收单个参数的过滤器 lower ，将upper 的结果传递到lower中
  <div id="app">
    <input type="text" v-model='msg'>
    <div>{{msg | upper}}</div>
    <div>{{msg | upper | lower}}</div>
    <div :abc='msg | upper'>测试数据</div>
  </div>

<script type="text/javascript">
   Vue.filter('lower', function(val) {
      return val.charAt(0).toLowerCase() + val.slice(1);
    });
    var vm = new Vue({
      el: '#app',
      data: {
        msg: ''
      },
       //filters  属性 定义 和 data 已经 methods 平级 
       //  定义filters 中的过滤器为局部过滤器 
      filters: {
        //   upper  自定义的过滤器名字 
        //    upper 被定义为接收单个参数的过滤器函数，表达式  msg  的值将作为参数传入到函数中
        upper: function(val) {
         //  过滤器中一定要有返回值 这样外界使用过滤器的时候才能拿到结果
          return val.charAt(0).toUpperCase() + val.slice(1);
        }
      }
    });
  </script>
```

##### 过滤器中传参数

```html
filterA 被定义为接收三个参数的过滤器函数。
其中 message 的值作为第一个参数，
普通字符串 'arg1' 作为第二个参数，表达式 arg2 的值作为第三个参数。
<div id="box">
	{{ message | filterA('arg1', 'arg2') }}
</div>

<script>
	Vue.filter('filterA',function(n,a,b){
		if(n<10){
			return n+a;
		}else{
			return n+b;
		}
	});
	new Vue({
        el:"#box",
		data:{
			message: "哈哈哈"
		}
	})
</script>
```

#### 组件属性Component

```js
Vue.js最强大的功能之一
可以扩展 HTML 元素，封装可重用的代码

组件的状态
组件内的状态：data
组件外的状态：props
全局的状态：Vuex的state

封装组件
首先定义一个后缀名为.vue的文件.文件内部还是三部分组成,
template模板部分,script逻辑部分,style样式部分.

这三部分是
组件的核心部分,组件需要哪些结构,在模板部分书写,
需要什么样的外观样式,通过style部分书写,
有哪些行为在script部分书写.

一定要在script部分使用es6模块化的导出语法(exportdefault{}),进行导出.
然后在需要调用组件的地方使用es6模块化导入语法导入即可,组件需要哪些参数,直接在调用的部分进行传递即可.
主要逻辑还是在组件中完成.

组件化开发
为什么要组件化开发 
有时候页面代码量太大，逻辑太多或者同一个功能组件在许多页面均有使用，维护起来相当复杂，
这个时候，就需要组件化开发来进行功能拆分、组件封装，已达到组件通用性，增强代码可读性，维护成本也能大大降低。组件化很大程度上降低系统各个功能的耦合性，并且提高了功能内部的聚合性。这对前端工程化及降低代码的维护来说，是有很大的好处的，耦合性的降低，提高了系统的伸展性，降低了开发的复杂度，提升开发效率，降低开发成本。

组件缓存的使用
当从A页面跳转到B页面的时候, 此时展示在用户面前的是B页面, A页面会被销毁掉. 
如果按下返回按钮, 会创建一个新的A页面. 
而有时候我们不希望这种效果, 就可以对组件进行缓存

keep-alive需要加在 子组件的 标签的外边,  如果是路由组件, 则keep-alive需要加在router-view的外边, 此时我们往往需要配合include或者exclude属性进行使用.

如果组件缓存了, 那么组件创建一次之后, 就不会创建了, 所以, 被缓存的组件的created函数只会执行一次, 但是组件中的另外两个生命周期activated和deactivated会在组件显示和不显示之间进行调用
```

##### 前端组件化的原则

```
专一性
一个组件只专注做一件事，且把这件事做好。
可配置性一个组件，要明确它的输入和输出分别是什么，要做可配置性，最基本的方式是通过属性向组件传递配置的值，而在组件初始化的生命周期内，通过读取属性的值做出对应的显示修改。还有一些方法，通过调用组件暴露出来的函数，向函数传递有效的值；修改全局 CSS样式；向组件传递特定事件，并在组件内监听该事件来执行函数等。

标准性
任何一个组件都应该遵守一套标准，可以使得不同区域的开发人员据此标准开发出一套标准统一的组件。

复用性
任何一个组件应该都是一个可以独立的个体，可以使其应用在不同的场景中。
```

##### 组件化和模块化的区别

```
组件化一般是前端说，模块化一般是后端说，
这两者没有什么本质区别，都是为了复用，减少耦合，提高效率，不要重复造轮子。

区别
模块化的目的是为了重用，模块化后可以方便重复使用和插拨到不同的平台，不同的业务逻辑过程中。
组件化的目的是为了解耦，把系统拆分成多个组件，分离组件边界和责任，便于独立升级和维护。

组件化：
组件化就是基于可重用的目的，将一个大的软件系统按照分离关注点的形式，拆分成多个独立的组件，主要目的就是减少耦合。一个独立的组件可以是一个软件包、web服务、web资源或者是封装了一些函数的模块，独立出来的组件可以单独维护和升级而不会影响到其他的组件。

模块化：
模块化的目的在于将一个程序按照其功能做拆分，分成相互独立的模块，以便于每个模块只包含与其功能相关的内容，模块之间通过接口调用。
将一个大的系统模块化之后，每个模块都可以被高度复用。
```

##### 全局注册

```vue
全局组件注册后，任何vue实例都可以用
Vue.component('组件名称', { })
第1个参数是标签名称，第2个参数是一个选项对象

组件名称 是以HTML标签的形式使用
组件参数的data值必须是函数,同时这个函数要求返回一个对象 
因为data中返回的是一个对象所以每个组件中的数据是私有的
组件模板必须是单个根元素,组件模板的内容可以是模板字符串

组件可以重复使用多次 
即每个实例可以维护一份被返回对象的独立的拷贝

必须使用短横线的方式使用组件
如果使用驼峰式命名组件，那么在使用组件的时候，只能在字符串模板中用驼峰的方式使用组件，
但是在普通的标签模板中，必须使用短横线的方式使用组件

<div id="app">
    <button-counter></button-counter>
    <button-counter></button-counter>
    <button-counter></button-counter>
    <hello-world></hello-world>
  </div>

<script type="text/javascript">
     Vue.component('HelloWorld', {
      data: function(){
        return {
          msg: 'HelloWorld'
        }
      },
      template: '<div>{{msg}}</div>'
    });
    Vue.component('button-counter', {
      data: function(){
        return {
          count: 0
        }
      },
      template: `
        <div>
          <button @click="handle">点击了{{count}}次</button>
          <button>测试123</button>
			#  6 在字符串模板中可以使用驼峰的方式使用组件	
		   <HelloWorld></HelloWorld>
        </div>
      `,
      methods: {
        handle: function(){
          this.count += 2;
        }
      }
    })
    var vm = new Vue({
      el: '#app',
      data: {
      }
    });
  </script>
```

##### 局部注册

```html
只能在当前注册它的vue实例中使用  
将只在父模板可用，一定要在实例上注册了才能在html文件中使用
<div id="app">
	<my-component></my-component>
</div>

<script>
    // 定义组件的模板
    var Child = {
      template: '<div>A custom component!</div>'
    }
    new Vue({
      //局部注册组件
      components: {
          //驼峰命名法加不加双引号无所谓
        'my-component': Child
      }
    })
 </script>
```

#### 组件通信

##### 常用组件通信方法

```
一、$emit/props
父组件通过props方式向子组件传递
子组件通过$emit触发父组件中v-on绑定的自定义事件

二、$parent/$children和ref
ref：如果在普通的 DOM 元素上使用，引用指向的就是 DOM 元素；如果用在子组件上，引用就指向组件实例
$parent / $children：访问父 / 所有子实例

三、eventBus
新建一个Vue事件bus对象，然后通过 bus.$emit 触发事件， bus.$on 监听触发的事件
在需要用到的两个不同组件分别引入即可
需要注意的是接受数据的组件要清除事件总线eventBus

四、依赖注入-provide和inject
provide：Object | () =&gt; Object</li>
inject：Array&lt;string&gt; | { [key: string]: string | Symbol | Object }</li>
</ul>
</li>
<li>父组件中通过provider来提供变量，然后在子组件中通过inject来注入变量。</li>
<li>不论子组件有多深，只要调用了inject那么就可以注入provider中的数据。

五、attrs-和-listener
适用场景：多层、递归组件
$attrs 是包含了所以父组件在子组件上设置的属性（除了prop传递的属性、class 和 style ）</li>
<li>$listeners 是组件的内置属性，它的值是父组件(不含.native修饰器的) v-on事件监听器
<ul>
<li>如果子组件已经绑定$listener中同名的监听器，则两个监听器函数会以冒泡的方式先后执行<

六、v-model
父组件通过v-model传递值给子组件时，会自动传递一个value的prop属性，在子组件中通过this.$emit('input',val)自动修改v-model绑定的值</li>
<li>prop属性和触发事件可以通过model修改</li>

七、VueX

父子组件通信的其他方式
如何得到子组件的实例对象?
this.$refs.xxx的方式
这个也是一种父向子通信的方式
this.$parent: 在子组件中获取父组件的实例对象

单向数据流
所有的 prop 都使得其父子 prop 之间形成了一个单向下行绑定：父级 prop 的更新会向下流动到子组件中，但是反过来则不行。这样会防止从子组件意外改变父级组件的状态，从而导致你的应用的数据流向变的混乱。

每次父级组件发生更新时，子组件中所有的 prop 都将会刷新为最新的值。这意味着你不应该在一个子组件内部改变 prop。如果你这样做了，Vue 会在浏览器的控制台中发出警告。子组件想修改时，只能通过 $emit 派发一个自定义事件，父组件接收到后，由父组件修改。

传参的方式
路径参数
	/user/1
	这种需要修改路由规则, 并且在组件中通过this.$route.params.id获取数据
	 {
        path: '/user/:id',
        component: ArticleDetail
      }
查询参数
	/user?id=1
	这种不需要修改路由规则, 在组件中通过this.$route.query.id获取数据
```

##### 父组件向子组件传值

```html
父组件发送的形式是以属性的形式绑定值到子组件身上。
然后子组件用属性props接收
在props中使用驼峰形式，模板中需要使用短横线的形式字符串形式的模板中没有这个限制  
<div id="app">
    <div>{{pmsg}}</div>
     <!--1、menu-item  在 APP中嵌套着 故 menu-item   为  子组件      -->
     <!-- 给子组件传入一个静态的值 -->
    <menu-item title='来自父组件的值'></menu-item>
    <!-- 2、 需要动态的数据的时候 需要属性绑定的形式设置 此时 ptitle  来自父组件data 中的数据 . 
		  传的值可以是数字、对象、数组等等
	-->
    <menu-item :title='ptitle' content='hello'></menu-item>
  </div>

  <script type="text/javascript">
    Vue.component('menu-item', {
      // 3、 子组件用属性props接收父组件传递过来的数据  
      // props: {
      // 	title: Number,
      // 	content: Number
      // },
      props: ['title', 'content'],
      data: function() {
        return {
          msg: '子组件本身的数据'
        }
      },
      template: '<div>{{msg + "----" + title + "-----" + content}}</div>'
    });
    var vm = new Vue({
      el: '#app',
      data: {
        pmsg: '父组件中内容',
        ptitle: '动态绑定属性'
      }
    });
  </script>
```

##### 子组件向父组件传值

```
子组件用$emit()触发事件
$emit()第一个参数为自定义的事件名称，第二个参数为需要传递的数据
父组件用v-on 监听子组件的事件
<div id="app">
    <div :style='{fontSize: fontSize + "px"}'>{{pmsg}}</div>
     <!-- 2 父组件用v-on 监听子组件的事件
		这里 enlarge-text  是从 $emit 中的第一个参数对应   handle 为对应的事件处理函数	
	-->	
    <menu-item :parr='parr' @enlarge-text='handle($event)'></menu-item>
  </div>
  <script type="text/javascript" src="js/vue.js"></script>
  <script type="text/javascript">

    Vue.component('menu-item', {
      props: ['parr'],
      template: `
        <div>
          <ul>
            <li :key='index' v-for='(item,index) in parr'>{{item}}</li>
          </ul>
			###  1、子组件用$emit()触发事件
			### 第一个参数为 自定义的事件名称   第二个参数为需要传递的数据  
          <button @click='$emit("enlarge-text", 5)'>扩大父组件中字体大小</button>
          <button @click='$emit("enlarge-text", 10)'>扩大父组件中字体大小</button>
        </div>
      `
    });
    var vm = new Vue({
      el: '#app',
      data: {
        pmsg: '父组件中内容',
        parr: ['apple','orange','banana'],
        fontSize: 10
      },
      methods: {
        handle: function(val){
          // 扩大字体大小
          this.fontSize += val;
        }
      }
    });
  </script>
```

##### 兄弟之间的传递

```html
需要借助于事件中心，通过事件中心传递数据
提供事件中心，var hub = new Vue()
传递数据方，通过一个事件触发hub.$emit(方法名，传递的数据)
接收数据方，通过mounted(){} 钩子中  触发hub.$on()方法名
销毁事件，通过hub.$off()方法名销毁之后无法进行传递数据

<div id="app">
    <div>父组件</div>
    <div>
      <button @click='handle'>销毁事件</button>
    </div>
    <test-tom></test-tom>
    <test-jerry></test-jerry>
  </div>
  <script type="text/javascript" src="js/vue.js"></script>
  <script type="text/javascript">

    //1、 提供事件中心
    var hub = new Vue();

    Vue.component('test-tom', {
      data: function(){
        return {
          num: 0
        }
      },
      template: `
        <div>
          <div>TOM:{{num}}</div>
          <div>
            <button @click='handle'>点击</button>
          </div>
        </div>
      `,
      methods: {
        handle: function(){
          //2、传递数据方，通过一个事件触发hub.$emit(方法名，传递的数据)   触发兄弟组件的事件
          hub.$emit('jerry-event', 2);
        }
      },
      mounted: function() {
       // 3、接收数据方，通过mounted(){} 钩子中  触发hub.$on(方法名
        hub.$on('tom-event', (val) => {
          this.num += val;
        });
      }
    });
      
    Vue.component('test-jerry', {
      data: function(){
        return {
          num: 0
        }
      },
      template: `
        <div>
          <div>JERRY:{{num}}</div>
          <div>
            <button @click='handle'>点击</button>
          </div>
        </div>
      `,
      methods: {
        handle: function(){
          //2、传递数据方，通过一个事件触发hub.$emit(方法名，传递的数据)   触发兄弟组件的事件
          hub.$emit('tom-event', 1);
        }
      },
      mounted: function() {
        // 3、接收数据方，通过mounted(){} 钩子中  触发hub.$on()方法名
        hub.$on('jerry-event', (val) => {
          this.num += val;
        });
      }
    });

    var vm = new Vue({
      el: '#app',
      data: {
        
      },
      methods: {
        handle: function(){
          //4、销毁事件 通过hub.$off()方法名销毁之后无法进行传递数据  
          hub.$off('tom-event');
          hub.$off('jerry-event');
        }
      }
    });
  </script>
```

##### 总结

```
父向子
父组件通过自定义属性，向子组件传值，
子组件通过props接收后，便可以像使用data里面的数据一样使用了

子向父
子组件定义一个事件，触发事件的时候，通过$emit("参数1"，参数2)，向父组件传递数据
父组件内自定义事件，事件名为参数1，方法携带的参数($event) 就是 子组件向父组件传递的 参数2
子组件的事件是为了触发传值这个操作，父组件内自定义事件不需要触发条件，
子组件触发后，父组件会自动接收参数

兄弟之间
提供事件中心，var hub = new Vue()
传递方，定义一个事件，触发事件的时候，通过事件中心的$emit()方法传递两个参数，hub.$emit(参数1,参数2)，参数1是方法名，参数2是需要传的参数。
接收方，在mounted钩子函数中，通过事件中心的$on()方法，hub.$on('参数1',函数(形参))，接收传递方的参数1和一个函数，函数参数就是传递方的参数2。
销毁事件，在两个组件之外，定义一个事件，触发事件的时候，通过事件中心的$off()方法销毁，hub.$off("参数1")，销毁之后无法进行传递数据。
```

#### 组件插槽

```
组件插槽：
父组件向子组件传递内容

组件的最大特性就是复用性，而用好插槽能大大提高组件的可复用能力
通过插槽可以动态指定某一个组件模板部分的渲染,
我们在调用组件的时候,在组件的调用标签中间传递了什么样的标签结构,
那么该组件就会把我们传递的标签结构放在他的模板部分进行渲染.
```

##### 匿名插槽

```html
组件渲染的时候，
如果父组件没有为这个插槽提供了内容，会显示子组件内的默认的内容。
如果父组件为这个插槽提供了内容，子组件内的默认的内容会被替换掉。
插槽内可以包含任何模板代码，包括 HTML
    
<div id="app">
    <alert-box>有bug发生</alert-box>
    <alert-box>有一个警告</alert-box>
    <alert-box></alert-box>
  </div>

  <script type="text/javascript">
    Vue.component('alert-box', {
      template: `
        <div>
          <strong>ERROR:</strong>
          <slot>默认内容</slot>
        </div>
      `
    });
    var vm = new Vue({
      el: '#app',
      data: {
      }
    });
  </script>
```

##### 具名插槽

```HTML
具有名字的插槽 
使用<slot>中的"name"属性绑定元素，指定当前插槽的名字，这个slot的值必须和下面slot组件的name值对应上
如果没有匹配到，则放到匿名的插槽中
具名插槽的渲染顺序取决于模板，而不是取决于父组件中元素的顺序，
根据插槽模板字符串里面slot名字的顺序来决定，

template临时的包裹标签最终不会渲染到页面上
slot模板外面必须再包一层标签
    
<div id="app">
    <base-layout>
      <p slot='header'>标题信息</p>
      <p>主要内容1</p>
      <p>主要内容2</p>
      <p slot='footer'>底部信息信息</p>
    </base-layout>

    <base-layout>
        同时把多条文本填充到已经标注的插槽中
      <template slot='header'>
        <p>标题信息1</p>
        <p>标题信息2</p>
      </template>
      <p>主要内容1</p>
      <p>主要内容2</p>
      <template slot='footer'>
        <p>底部信息信息1</p>
        <p>底部信息信息2</p>
      </template>
    </base-layout>
  </div>
  <script type="text/javascript" src="js/vue.js"></script>
  <script type="text/javascript">
    Vue.component('base-layout', {
      template: `
        <div>
          <header>
            <slot name='header'></slot>
          </header>
          <main>
            <slot></slot>
          </main>
          <footer>
            <slot name='footer'></slot>
          </footer>
        </div>
      `
    });
    var vm = new Vue({
      el: '#app',
      data: { 
      }
    });
  </script>
```

#####  作用域插槽

```html
就是带数据的插槽，
为了让父组件能使用子组件中的数据，类似于“父组件向子组件传递数据”
既可以复用子组件的slot，又可以使slot内容不一致

子组件中通过slot标签自定义属性传递数据，
<slot :自定义事件名称='数据'>{{item.name}}</slot>
父组件通过添加template标签，template标签里面的slot-scope属性接收数据，
<template slot-scope='slotProps'></template>
然后使用这些数据，适用于至少包含三级以上的组件层级

eg：
1.当我们希望li的样式由外部使用组件的地方定义，因为可能有多种地方要使用该组件，
但样式希望不一样，这个时候我们需要使用作用域插槽
2.父组件中使用了<template>元素,而且包含scope="slotProps",slotProps在这里只是临时变量
3.子组件模板中,<slot>元素上有一个类似props传递数据给组件的写法msg="xxx",插槽可以提供一个默认内容，

  <div id="app">
    <fruit-list :list='list'>
      <template slot-scope='slotProps'>
        <strong v-if='slotProps.info.id==3' class="current">
            {{slotProps.info.name}}
         </strong>
        <span v-else>{{slotProps.info.name}}</span>
      </template>
    </fruit-list>
  </div>
  <script type="text/javascript" src="js/vue.js"></script>
  <script type="text/javascript">

    Vue.component('fruit-list', {
      props: ['list'],
      template: `
        <div>
          <li :key='item.id' v-for='item in list'>
            <slot :info='item'>{{item.name}}</slot>
          </li>
        </div>
      `
    });
    var vm = new Vue({
      el: '#app',
      data: {
        list: [{
          id: 1,
          name: 'apple'
        },{
          id: 2,
          name: 'orange'
        },{
          id: 3,
          name: 'banana'
        }]
      }
    });
  </script>

eg：
比如我有多个运营栏目，像淘宝首页有“有好货”，“爱逛街”这样两个栏目，每个栏目下都需要有一个商品卡片列表，
那么商品卡片列表CommodityList.vue就要抽成组件了。
而这个包含多个运营栏目的vue组件我假设它叫ColumnList.vue，在其中通过v-for调用了CommodityList组件。
我希望把点击商品卡片的业务放在ColumnList.vue中处理。
需要给Commodity组件传入数据，响应Commodity组件的clickCommodity事件
事件不必携带参数，完全符合父到子的数据流向，而不会发生子组件又给父组件反向发数据的情况
<commodity-list :commodities="column.commodityList">
	<template slot-scope="scope">
		<commodity :modityData="scope.row" @clickCommodity="onCommodityClick(scope.row)"></commodity>
	</template>
</commodity-list>
```

####  async和await

```js
async作为一个关键字放到函数前面
任何一个async函数都会隐式返回一个Promise
await关键字只能在使用async定义的函数中使用
await后面可以直接跟一个 Promise实例对象
await函数不能单独使用
让异步代码看起来、表现起来更像同步代码
```

##### async基础用法

```js
# 1.1 async作为一个关键字放到函数前面
	async function queryData() {
      # 1.2 await关键字只能在使用async定义的函数中使用      await后面可以直接跟一个 Promise实例对象
      var ret = await new Promise(function(resolve, reject){
        setTimeout(function(){
          resolve('nihao')
        },1000);
      })
      // console.log(ret.data)
      return ret;
    }
	# 1.3 任何一个async函数都会隐式返回一个promise   我们可以使用then 进行链式编程
    queryData().then(function(data){
      console.log(data)
    })
```

##### async处理多个异步函数

```js
    axios.defaults.baseURL = 'http://localhost:3000';
    async function queryData() {
      # 2.1  添加await之后 当前的await 返回结果之后才会执行后面的代码   
      var info = await axios.get('async1');
      #2.2  让异步代码看起来、表现起来更像同步代码
      var ret = await axios.get('async2?info=' + info.data);
      return ret.data;
    }
    queryData().then(function(data){
      console.log(data)
    })
```

#### 路由

##### 路由介绍

```
前端路由
锚点对应的是前端的某个组件
依靠hash值(锚链接)的变化进行实现
用来监听事件并分发执行事件处理函数
根据不同的事件来显示不同的页面内容，即事件与事件处理函数之间的对应关系(URL请求地址与服务器资源之间的对应关系 )
通过改变 URL，根据不同的用户URL地址请求，在不重新请求页面的情况下，返回不同的内容，更新页面视图。
原理
监听url中hash的变化, 然后切换组件
window.onhashchange=function(){}

后端路由
由服务器端进行实现，并完成资源的分发
后端路由性能相对前端路由来说较低，主要学习前端路由
url对应的是后端的某个资源
整个网页刷新,存在性能问题
支持浏览器前进后退

Ajax局部刷新
局部刷新,性能得以提升
但是不支持浏览器前进后退

SPA单页面应用
一个页面
局部刷新
支持浏览器前进后退
基于url的hash值
不是以页面为单位,是以组件为单位
它只有一个HTML
一个锚点对应一个组件,前端路由
```

##### 路由传参

```js
1.直接调用$router.push实现携带参数
this.$router.push({ name:'xxx',params:{id:123} })
2.声明式的导航
<router-link :to="{name:'xxx',params:{id:123}}">click<router-link>
```

##### $route和$router的差别

```
$route可以获取当前页面路由的信息,主要用来获取信息用的,里面主要包含路由的一些基本信息，
包括name、meta、path、hash、query、params、fullPath、matched、redirectedFrom

$router主要进行一些行为操作, 例如界面跳转this.$router.push('路径'),是VueRouter的实例，包含了一些路由的跳转方法，钩子函数等
```

##### 路由的模式

```
更新视图但不重新请求页面，是前端路由原理的核心之一
hash模式
也称作锚点，本身是用来做页面定位的，可以使对应 id 的元素显示在可视区域内。
基于location.hash来实现，location.hash 的值就是 URL 中 # 后面的内容，
地址栏中url尾巴后#号以及#后面的字符，称之为hash，使用 URL hash 值来作路由
hash虽然在URL中，但不被包括在HTTP请求中；用来指导浏览器动作，对服务端安全无用，hash不会重加载页面。
hash值变化不会导致浏览器想服务器发出请求，hash改变会触发hashchange事件，
浏览器的进退可以对其进行控制，可以用window.location.hash读取；
支持所有浏览器，包括不支持 HTML5 History Api 的浏览器；

hash路由模式的特性
--URL 中 hash 值只是客户端的一种状态，也就是说当向服务器端发出请求时，hash 部分不会被发送；
--hash 值的改变，都会在浏览器的访问历史中增加一个记录。因此我们能通过浏览器的回退、前进按钮控制hash 的切换；
--可以通过 a 标签，并设置 href 属性，当用户点击这个标签后，URL 的 hash 值会发生改变；或者使用  JavaScript 来对 loaction.hash 进行赋值，改变 URL 的 hash 值；
--我们可以使用 hashchange 事件来监听 hash 值的变化，从而对页面进行跳转（渲染）。

history模式
地址栏中的url没有 #号
依赖 HTML5 History API 和服务器配置，来实现 URL 的变化
主要采用了History interface 在HTML5中新增的 API (方法) history.pushState() 和 history.repalceState()。
这两个 API 可以在不进行刷新的情况下，操作浏览器的历史纪录。
这两个 API 不会触发 popstate 事件，需要手动触发页面跳转（渲染）。
唯一不同的是，前者是新增一个历史记录，后者是直接替换当前的历史记录
使用 popstate 事件来监听 url 的变化，从而对页面进行跳转（渲染）

history路由模式的特性
支持H5历史模式或者hash模式
支持嵌套路由
支持路由参数
支持编程式路由
支持命名路由
支持路由导航守卫
支持路由过渡动画特效
支持路由懒加载
支持路由滚动行为

abstract
在week环境中使用,支持所有 JavaScript 运行环境，如 Node.js 服务器端。
如果发现没有浏览器的 API，路由会自动强制进入这个模式

hash和history两个方法应用于浏览器的历史记录栈，
在当前已有的 back、forward、go 的基础之上，它们提供了对历史记录进行修改的功能。
只是当它们执行修改时，虽然改变了当前的 URL，但浏览器不会立即向后端发送请求，不会重载页面
```

##### 路由的导航钩子

```js
vue-router的导航钩子(钩子函数)
主要用来拦截导航，让它完成跳转或取消，前端权限控制的一种
全局守卫，路由独享守卫，局部守卫

全局守卫
所有路由配置的组件都会触发。 
beforeEach
参数
to：route即将进入的目标路由对象
from：route当前导航正要离开的路由
next：function一定要调用该方法resolve这个钩子。执行效果依赖next方法的调用参数。可以控制网页的跳转
在路由跳转前触发，进行判断拦截，以免跳转了再通知就为时已晚，这个钩子作用主要是用于登录验证
首页可以控制导航跳转，一般用于页面title的修改，一些需要登录才能调整页面的重定向功能
afterEach
和beforeEach相反，它是在路由跳转完成之后触发，参数包括to、from，没有了next，
它发生在beforeEach和beforeResolve之后，beforeRouteEnter(足迹按内守卫)之前。

路由独享守卫(单独路由独享组件)
在单个路由配置的时候也可以设置的钩子函数，且只能在这个路由下起作用。 
beforeEnter
和beforeEach完全相同，如果都设置则在beforeEach之后紧随执行，参数有to、from、next。

局部守卫(组件内的钩子)
在组件内执行的钩子函数，类似于数组内的生命周期函数，相当于为配置路由的组件添加的生命周期钩子函数。 
beforeRouterEnter(to,from,next)
在渲染该组件的对应路由被confirm前调用
beforeRouterUpdate(to,from,next)
在当前路由改变，但是依然渲染该组件时调用
beforeRouterLeave(to,from,next)
导航离开该组件的对应路由时被调用

挂载路由导航守卫
router.beforeEach((to, from, next) => {
	if (to.path === '/login') return next()
	const tokenStr = window.sessionStorage.getItem('token')
	if (!tokenStr) return next('/login')
	next()
})

路由跳转导航解析流程，当由A路由–>B路由的时候
1.在A组件里调用离开守卫。 A组件中的beforeRouterLeave
2.调用全局的beforeEach守卫。 router.beforeEach
3.再执行B路由配置里调用beforeEnter。
4.再执行B组件的进入守卫。 B组件中beforeRouterEnter
5. 调用全局的beforeResolve守卫(2.5+)。 router.beforeResolve
6. 导航被确认。
7. 调用全局的afterEach钩子。 router.afterEach
8. 触发DOM更新。
```



##### 路由学习目标

1.能够说出什么是路由 
2.能够说出前端路由的实现原理
3.能够使用Vue-Router实现前端路由
4.能够实现嵌套路由，动态路由  
5.能够实现命名路由以及编程式导航 
6.理解并实现后台管理案例

##### 路由的概念

广义的理解，路的指向

路由的本质就是一种对应关系，比如说我们在url地址中输入我们要访问的url地址之后，浏览器要去请求这个url地址对应的资源。
url地址和真实的资源之间的一种对应关系，就是路由。

路由分为前端路由和后端路由
1).后端路由是由服务器端进行实现，并完成资源的分发
2).前端路由是依靠hash值(锚链接)的变化进行实现 

后端路由性能相对前端路由来说较低，所以，我们接下来主要学习的是前端路由
前端路由的基本概念：根据不同的事件来显示不同的页面内容，即事件与事件处理函数之间的对应关系
前端路由主要做的事情就是监听事件并分发执行事件处理函数

##### 前端路由小案例

前端路由是基于hash值的变化进行实现的（比如点击页面中的菜单或者按钮改变URL的hash值，根据hash值的变化来控制组件的切换）
核心实现依靠一个事件，即监听hash值变化的事件

```js
window.onhashchange = function(){
    //location.hash可以获取到最新的hash值
    location.hash
}
```

前端路由实现tab栏切换：

```js
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Document</title>
        <!-- 导入 vue 文件 -->
        <script src="./lib/vue_2.5.22.js"></script>
    </head>
    <body>
        <!-- 被 vue 实例控制的 div 区域 -->
        <div id="app">
        <!-- 切换组件的超链接 -->
        <a href="#/zhuye">主页</a> 
        <a href="#/keji">科技</a> 
        <a href="#/caijing">财经</a>
        <a href="#/yule">娱乐</a>

        <!-- 根据 :is 属性指定的组件名称，把对应的组件渲染到 component 标签所在的位置 -->
        <!-- 可以把 component 标签当做是【组件的占位符】 -->
        <component :is="comName"></component>
        </div>

        <script>
        // #region 定义需要被切换的 4 个组件
        // 主页组件
        const zhuye = {
            template: '<h1>主页信息</h1>'
        }

        // 科技组件
        const keji = {
            template: '<h1>科技信息</h1>'
        }

        // 财经组件
        const caijing = {
            template: '<h1>财经信息</h1>'
        }

        // 娱乐组件
        const yule = {
            template: '<h1>娱乐信息</h1>'
        }
        // #endregion

        // #region vue 实例对象
        const vm = new Vue({
            el: '#app',
            data: {
            comName: 'zhuye'
            },
            // 注册私有组件
            components: {
            zhuye,
            keji,
            caijing,
            yule
            }
        })
        // #endregion

        // 监听 window 的 onhashchange 事件，根据获取到的最新的 hash 值，切换要显示的组件的名称
        window.onhashchange = function() {
            // 通过 location.hash 获取到最新的 hash 值
            console.log(location.hash);
            switch(location.hash.slice(1)){
            case '/zhuye':
                vm.comName = 'zhuye'
            break
            case '/keji':
                vm.comName = 'keji'
            break
            case '/caijing':
                vm.comName = 'caijing'
            break
            case '/yule':
                vm.comName = 'yule'
            break
            }
        }
        </script>
    </body>
    </html>
```

案例效果图：



![](C:\Tools\FED\总结\images\01前端路由.png)

点击每个超链接之后，会进行相应的内容切换，如下：

![](C:\Tools\FED\总结\images\01前端路由效果图.png)



核心思路：
在页面中有一个vue实例对象，vue实例对象中有四个组件，分别是tab栏切换需要显示的组件内容
在页面中有四个超链接，如下：

```html
<a href="#/zhuye">主页</a> 
<a href="#/keji">科技</a> 
<a href="#/caijing">财经</a>
<a href="#/yule">娱乐</a>
```

当我们点击这些超链接的时候，就会改变url地址中的hash值，当hash值被改变时，就会触发onhashchange事件
在触发onhashchange事件的时候，我们根据hash值来让不同的组件进行显示：

```js
window.onhashchange = function() {
    // 通过 location.hash 获取到最新的 hash 值
    console.log(location.hash);
    switch(location.hash.slice(1)){
        case '/zhuye':
        //通过更改数据comName来指定显示的组件
        //因为 <component :is="comName"></component> ，组件已经绑定了comName
        vm.comName = 'zhuye'
        break
        case '/keji':
        vm.comName = 'keji'
        break
        case '/caijing':
        vm.comName = 'caijing'
        break
        case '/yule':
        vm.comName = 'yule'
        break
    }
}
```

##### Vue Router简介

它是一个Vue.js官方提供的路由管理器。是一个功能更加强大的前端路由器，推荐使用。
Vue Router和Vue.js非常契合，可以一起方便的实现SPA(single page web application,单页应用程序)应用程序的开发。
Vue Router依赖于Vue，所以需要先引入Vue，再引入Vue Router

Vue Router的特性：
支持H5历史模式或者hash模式
支持嵌套路由
支持路由参数
支持编程式路由
支持命名路由
支持路由导航守卫
支持路由过渡动画特效
支持路由懒加载
支持路由滚动行为

##### Vue Router的使用步骤(★★★)

```
A.导入js文件
<script src="lib/vue_2.5.22.js"></script>
<script src="lib/vue-router_3.0.2.js"></script>

B.添加路由链接:<router-link>是路由中提供的标签，默认会被渲染为a标签，to属性默认被渲染为href属性，
to属性的值会被渲染为#开头的hash地址，router-link不是必须的
<router-link to="/user">User</router-link>
<router-link to="/login">Login</router-link>

C.添加路由填充位（路由占位符）
<router-view></router-view>

D.定义路由组件
var User = { template:"<div>This is User</div>" }
var Login = { template:"<div>This is Login</div>" }

E.配置路由规则并创建路由实例
var myRouter = new VueRouter({
    //routes是路由规则数组
    routes:[
        //每一个路由规则都是一个对象，对象中至少包含path和component两个属性
        //path表示  路由匹配的hash地址，component表示路由规则对应要展示的组件对象
        {path:"/user",component:User},
        {path:"/login",component:Login}
    ]
})

F.将路由挂载到Vue实例中
new Vue({
    el:"#app",
    //通过router属性挂载路由对象
    router:myRouter
})

小结：
Vue Router的使用步骤还是比较清晰的，按照步骤一步一步就能完成路由操作
A.导入js文件
B.添加路由链接
C.添加路由占位符(最后路由展示的组件就会在占位符的位置显示)
D.定义路由组件
E.配置路由规则并创建路由实例
F.将路由挂载到Vue实例中
```

##### 路由重定向

可以通过路由重定向为页面设置默认展示的组件
在路由规则中添加一条路由规则即可，如下：
var myRouter = new VueRouter({ 
    //routes是路由规则数组
    routes: [
        //path设置为/表示页面最初始的地址 / ,redirect表示要被重定向的新地址，设置为一个路由即可
        { path:"/",redirect:"/user"},
        { path: "/user", component: User },
        { path: "/login", component: Login }
    ]
})

##### 嵌套路由(★★★)

当我们进行路由的时候显示的组件中还有新的子级路由链接以及内容。

嵌套路由最关键的代码在于理解子级路由的概念：
比如我们有一个/login的路由
那么/login下面还可以添加子级路由，子路由设置在children里，如:
/login/account
/login/phone

参考代码如下：

```js
var User = { template: "<div>This is User</div>" }
//Login组件中的模板代码里面包含了子级路由链接以及子级路由的占位符
    var Login = { template: `<div>
        <h1>This is Login</h1>
        <hr>
        <router-link to="/login/account">账号密码登录</router-link>
        <router-link to="/login/phone">扫码登录</router-link>
        <!-- 子路由组件将会在router-view中显示 -->
        <router-view></router-view>
        </div>` }

    //定义两个子级路由组件
    var account = { template:"<div>账号：<input><br>密码：<input></div>"};
    var phone = { template:"<h1>扫我二维码</h1>"};
    var myRouter = new VueRouter({
        //routes是路由规则数组
        routes: [
            { path:"/",redirect:"/user"},
            { path: "/user", component: User },
            { 
                path: "/login", 
                component: Login,
                //通过children属性为/login添加子路由规则
                children:[
                    { path: "/login/account", component: account },
                    { path: "/login/phone", component: phone },
                ]
            }
        ]
    })

    var vm = new Vue({
        el: '#app',
        data: {},
        methods: {},
        router:myRouter
    });
```

页面效果大致如下：

![](C:\Tools\FED\总结\images\03嵌套路由.png)

##### 动态路由匹配(★★★)

var User = { template:"<div>用户：{{$route.params.id}}</div>"}

var myRouter = new VueRouter({
    //routes是路由规则数组
    routes: [
        //通过/:参数名  的形式传递参数 
        { path: "/user/:id", component: User },

​			]

})

补充：
如果使用$route.params.id来获取路径传参的数据不够灵活。 
1.我们可以通过props来接收参数
var User = { 
    props:["id"],
    template:"<div>用户：{{id}}</div>"
    }

var myRouter = new VueRouter({
    //routes是路由规则数组
    routes: [
        //通过/:参数名  的形式传递参数 
        //如果props设置为true，route.params将会被设置为组件属性
        { path: "/user/:id", component: User,props:true },

​			]

})

2.还有一种情况，我们可以将props设置为对象，那么就直接将对象的数据传递给
组件进行使用
var User = { 
    props:["username","pwd"],
    template:"<div>用户：{{username}}---{{pwd}}</div>"
    }

var myRouter = new VueRouter({
    //routes是路由规则数组
    routes: [
        //通过/:参数名  的形式传递参数 
        //如果props设置为对象，则传递的是对象中的数据给组件
        { path: "/user/:id", component: User,props:{username:"jack",pwd:123} },
        		]

})

3.如果想要 获取传递的参数值 还想要 获取传递的对象数据 ，那么props应该设置为
函数形式。
var User = { 
    props:["username","pwd","id"],
    template:"<div>用户：{{id}} -> {{username}}---{{pwd}}</div>"
    }

var myRouter = new VueRouter({
    //routes是路由规则数组
    routes: [
        //通过/:参数名  的形式传递参数 
        //如果props设置为函数，则通过函数的第一个参数获取路由对象
        //并可以通过路由对象的params属性获取传递的参数
        //
        { path: "/user/:id", component: User,props:(route)=>{
            return {username:"jack",pwd:123,id:route.params.id}
            } 
        },
        

    ]

})

##### 命名路由：给路由取别名

案例：

var myRouter = new VueRouter({
    //routes是路由规则数组
    routes: [
        //通过name属性为路由添加一个别名
        { path: "/user/:id", component: User, name:"user"},

​			]

})

//添加了别名之后，可以使用别名进行跳转
<router-link to="/user">User</router-link>
<router-link :to="{ name:'user' , params: {id:123} }">User</router-link>

//还可以编程式导航
myRouter.push( { name:'user' , params: {id:123} } )

##### 编程式导航(★★★)

页面导航的两种方式：
A.声明式导航：通过点击链接的方式实现的导航
B.编程式导航：调用js的api方法实现导航

Vue-Router中常见的导航方式(API)：
this.$router.push("hash地址");
this.$router.push("/login");
this.$router.push({ name:'user' , params: {id:123} });
this.$router.push({ path:"/login" });
this.$router.push({ path:"/login",query:{username:"jack"} });

this.$router.go( n );//n为数字，参考history.go
this.$router.go( -1 );

编程式导航参数规则
字符串
router.push('/home')
对象
router.push({path:'/home'})
命名的路由
router.push({name:'/user',params:{userId:123}})
带查询参数，变成/register?uname=lisi
router.push({path:'/register',query:{uname:'lisi'}})

##### 实现后台管理案例(★★★)

案例效果：

![](C:\Tools\FED\总结\images\02后台管理系统.png)

点击左侧的"用户管理","权限管理","商品管理","订单管理","系统设置"都会出现对应的组件并展示内容

其中"用户管理"组件展示的效果如上图所示，在用户管理区域中的详情链接也是可以点击的，点击之后将会显示用户详情信息。

案例思路：
1).先将素材文件夹中的11.基于vue-router的案例.html复制到我们自己的文件夹中。
看一下这个文件中的代码编写了一些什么内容，
这个页面已经把后台管理页面的基本布局实现了
2).在页面中引入vue，vue-router
3).创建Vue实例对象，准备开始编写代码实现功能
4).希望是通过组件的形式展示页面的主体内容，而不是写死页面结构，所以我们可以定义一个根组件：

```js
//只需要把原本页面中的html代码设置为组件中的模板内容即可
const app = {
    template:`<div>
        <!-- 头部区域 -->
        <header class="header">传智后台管理系统</header>
        <!-- 中间主体区域 -->
        <div class="main">
          <!-- 左侧菜单栏 -->
          <div class="content left">
            <ul>
              <li>用户管理</li>
              <li>权限管理</li>
              <li>商品管理</li>
              <li>订单管理</li>
              <li>系统设置</li>
            </ul>
          </div>
          <!-- 右侧内容区域 -->
          <div class="content right">
            <div class="main-content">添加用户表单</div>
          </div>
        </div>
        <!-- 尾部区域 -->
        <footer class="footer">版权信息</footer>
      </div>`
  }
```

5).当我们访问页面的时候，默认需要展示刚刚创建的app根组件，我们可以
创建一个路由对象来完成这个事情,然后将路由挂载到Vue实例对象中即可

```js
const myRouter = new VueRouter({
    routes:[
        {path:"/",component:app}
    ]
})

const vm = new Vue({
    el:"#app",
    data:{},
    methods:{},
    router:myRouter
})
```

补充：到此为止，基本的js代码都处理完毕了，我们还需要设置一个路由占位符

```js
<body>
  <div id="app">
    <router-view></router-view>
  </div>
</body>
```

6).此时我们打开页面应该就可以得到一个VueRouter路由出来的根组件了
我们需要在这个根组件中继续路由实现其他的功能子组件
先让我们更改根组件中的模板：更改左侧li为子级路由链接，并在右侧内容区域添加子级组件占位符

```js
const app = {
    template:`<div>
        ........
        <div class="main">
          <!-- 左侧菜单栏 -->
          <div class="content left">
            <ul>
              <!-- 注意：我们把所有li都修改为了路由链接 -->
              <li><router-link to="/users">用户管理</router-link></li>
              <li><router-link to="/accesses">权限管理</router-link></li>
              <li><router-link to="/goods">商品管理</router-link></li>
              <li><router-link to="/orders">订单管理</router-link></li>
              <li><router-link to="/systems">系统设置</router-link></li>
            </ul>
          </div>
          <!-- 右侧内容区域 -->
          <div class="content right">
            <div class="main-content">
                <!-- 在 -->
                <router-view></router-view> 
            </div>
          </div>
        </div>
        .......
      </div>`
  }
```

然后，我们要为子级路由创建并设置需要显示的子级组件

```js
//建议创建的组件首字母大写，和其他内容区分
const Users = {template:`<div>
    <h3>用户管理</h3>
</div>`}
const Access = {template:`<div>
    <h3>权限管理</h3>
</div>`}
const Goods = {template:`<div>
    <h3>商品管理</h3>
</div>`}
const Orders = {template:`<div>
    <h3>订单管理</h3>
</div>`}
const Systems = {template:`<div>
    <h3>系统管理</h3>
</div>`}

//添加子组件的路由规则
const myRouter = new VueRouter({
    routes:[
        {path:"/",component:app , children:[
            { path:"/users",component:Users },
            { path:"/accesses",component:Access },
            { path:"/goods",component:Goods },
            { path:"/orders",component:Orders },
            { path:"/systems",component:Systems },
        ]}
    ]
})

const vm = new Vue({
    el:"#app",
    data:{},
    methods:{},
    router:myRouter
})
```

7).展示用户信息列表：
    A.为Users组件添加私有数据,并在模板中循环展示私有数据

```js
const Users = {
    data(){
        return {
            userList:[
                {id:1,name:"zs",age:18},
                {id:2,name:"ls",age:19},
                {id:3,name:"wang",age:20},
                {id:4,name:"jack",age:21},
            ]
        }
    },
    template:`<div>
        <h3>用户管理</h3>
        <table>
            <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr :key="item.id" v-for="item in userList">
                    <td>{{item.id}}</td>
                    <td>{{item.name}}</td>
                    <td>{{item.age}}</td>
                    <td><a href="javascript:;">详情</a></td>
                </tr>
            </tbody>
        </table>
    </div>`}
```



8.当用户列表展示完毕之后，我们可以点击列表中的详情来显示用户详情信息，首先我们需要创建一个组件，用来展示详情信息

```js
const UserInfo = {
    props:["id"],
    template:`<div>
      <h5>用户详情</h5>
      <p>查看 {{id}} 号用户信息</p>
      <button @click="goBack">返回用户详情页</button>
    </div> `,
    methods:{
      goBack(){
        //当用户点击按钮，后退一页
        this.$router.go(-1);
      }
    }
  }
```

然后我们需要设置这个组件的路由规则

```js
const myRouter = new VueRouter({
    routes:[
        {path:"/",component:app , children:[
            { path:"/users",component:Users },
            //添加一个/userinfo的路由规则
            { path:"/userinfo/:id",component:UserInfo,props:true},
            { path:"/accesses",component:Access },
            { path:"/goods",component:Goods },
            { path:"/orders",component:Orders },
            { path:"/systems",component:Systems },
        ]}
    ]
})

const vm = new Vue({
    el:"#app",
    data:{},
    methods:{},
    router:myRouter
})
```

再接着给用户列表中的详情a连接添加事件

```js
const Users = {
    data(){
        return {
            userList:[
                {id:1,name:"zs",age:18},
                {id:2,name:"ls",age:19},
                {id:3,name:"wang",age:20},
                {id:4,name:"jack",age:21},
            ]
        }
    },
    template:`<div>
        <h3>用户管理</h3>
        <table>
            <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr :key="item.id" v-for="item in userList">
                    <td>{{item.id}}</td>
                    <td>{{item.name}}</td>
                    <td>{{item.age}}</td>
                    <td><a href="javascript:;" @click="goDetail(item.id)">详情</a></td>
                </tr>
            </tbody>
        </table>
    </div>`,
    methods:{
        goDetail(id){
            this.$router.push("/userinfo/"+id);
        }
    }
}
```

#### Vuex

##### Vuex学习目标

1.Vuex概述

2.Vuex基本使用

3.使用Vuex完成todo案例

##### Vuex介绍

```
统一管理状态\数据
vue生态系统中的状态管理
Vuex是实现组件全局状态管理的一种机制，可以方便的实现组件之间数据的共享
Vuex是专为 Vue.js 应用程序开发的状态管理模式。
每一个 Vuex 应用的核心就是 store（仓库）。
store 基本上就是一个容器，包含着应用中大部分的状态 ( state )。

Vuex的状态存储是响应式的
当 Vue 组件从 store 中读取状态的时候，若 store 中的状态发生变化，那么相应的组件也会相应地得到高效更新。 
改变 store 中的状态的唯一途径就是显式地提交 (commit) mutation。
可以方便地跟踪每一个状态的变化。

常用的场景
单页应用，组件之间的状态，音乐播放、登录状态、加入购物车等
一般情况下，只有组件之间共享的数据，才有必要存储到 vuex 中；
对于组件中的私有数据，依旧存储在组件自身的 data 中即可。

好处
能够在vuex中集中管理共享的数据，易于开发和后期维护
能够高效地实现组件之间的数据共享，提高开发效率
存储在 vuex 中的数据都是响应式的，能够实时保持数据与页面的同步
 
VUEX在实际开发中传值的具体步骤
1.安装，npm install vuex --save
2.导入vuex包，import Vuex from 'vuex'
3.用Vue.use(Vuex)注册Vuex
4.向外exports default一个VUEX.store实例对象，将这个对象挂载到VUE实例对象上，
5.在其他组件中就可以访问了
6.在main.js引入store，注入，新建一个目录store，...，export等

VUE中组件通信方法除了vuex还有很多
```

##### Vuex概述

Vuex是实现组件全局状态（数据）管理的一种机制，可以方便的实现组件之间的数据共享

使用Vuex管理数据的好处：
A.能够在vuex中集中管理共享的数据，便于开发和后期进行维护
B.能够高效的实现组件之间的数据共享，提高开发效率
C.存储在vuex中的数据是响应式的，当数据发生改变时，页面中的数据也会同步更新

##### Vuex的基本使用

创建带有vuex的vue项目，打开终端，输入命令：vue ui
当项目仪表盘打开之后，我们点击页面左上角的项目管理下拉列表，再点击Vue项目管理器
点击创建项目，如下图所示
第一步，设置项目名称和包管理器
![](C:\Tools\FED\总结\images\创建vuex项目01.png)
第二步，设置手动配置项目
![](C:\Tools\FED\总结\images\创建vuex项目02.png)
第三步，设置功能项
![](C:\Tools\FED\总结\images\创建vuex项目03.png)
![](C:\Tools\FED\总结\images\创建vuex项目04.png)
第四步，创建项目
![](C:\Tools\FED\总结\images\创建vuex项目05.png)

##### 使用Vuex完成计数器案例

打开刚刚创建的vuex项目，找到src目录中的App.vue组件，将代码重新编写如下：

```js
<template>
  <div>
    <my-addition></my-addition>
    <p>----------------------------------------</p>
    <my-subtraction></my-subtraction>
  </div>
</template>

<script>
import Addition from './components/Addition.vue'
import Subtraction from './components/Subtraction.vue'

export default {
  data() {
    return {}
  },
  components: {
    'my-subtraction': Subtraction,
    'my-addition': Addition
  }
}
</script>

<style>
</style>
```

在components文件夹中创建Addition.vue组件，代码如下：

```js
<template>
    <div>
        <h3>当前最新的count值为：</h3>
        <button>+1</button>
    </div>
</template>

<script>
export default {
  data() {
    return {}
  }
}
</script>

<style>
</style>
```

在components文件夹中创建Subtraction.vue组件，代码如下：

```js
<template>
    <div>
        <h3>当前最新的count值为：</h3>
        <button>-1</button>
    </div>
</template>

<script>
export default {
  data() {
    return {}
  }
}
</script>

<style>
</style>
```

最后在项目根目录(与src平级)中创建 .prettierrc 文件，编写代码如下：

```js
{
    "semi":false,
    "singleQuote":true
}
```

#### Vuex中的核心特性

#####  A.State


```js
定义了应用状态的数据结构，可以在这里设置默认的初始状态。
存储仓库中的公共共享数据
全局共享，并且具有响应式

State提供唯一的公共数据源，所有共享的数据都要统一放到Store中的State中存储
例如，打开项目中的store.js文件，在State对象中可以添加我们要共享的数据，如：count:0

在组件中访问State的方式：
1).this.$store.state.全局数据名称  如：this.$store.state.count
2).先按需导入mapState函数： import { mapState } from 'vuex'
然后数据映射为计算属性： computed:{ ...mapState(['全局数据名称']) }
```

##### B.Mutation

```js
<button @click="Add">+1</button>

methods:{
  Add(){
    //使用commit函数调用mutations中的对应函数，
    //第一个参数就是我们要调用的mutations中的函数名
    //第二个参数就是传递给add函数的参数
    this.$store.commit('add',10)
  }
}

Mutation用于修改变更$store中的数据(公共共享数据)
是唯一更改 store 中状态的方法，且必须是同步函数。
```

使用方式1：

```js
打开store.js文件，在mutations中添加代码如下
mutations: {
    add(state,step){
      //第一个形参永远都是state也就是$state对象
      //第二个形参是调用add时传递的参数
      state.count+=step;
    }
  }
然后在Addition.vue中给按钮添加事件代码如下：
<button @click="Add">+1</button>
methods:{
  Add(){
    //使用commit函数调用mutations中的对应函数，
    //第一个参数就是我们要调用的mutations中的函数名
    //第二个参数就是传递给add函数的参数
    this.$store.commit('add',10)
  }
}
```

使用方式2：


```js
import { mapMutations } from 'vuex'
methods:{
  ...mapMutations(['add'])
}

如下：
import { mapState,mapMutations } from 'vuex'

export default {
  data() {
    return {}
  },
  methods:{
      //获得mapMutations映射的sub函数
      ...mapMutations(['sub']),
      //当点击按钮时触发Sub函数
      Sub(){
          //调用sub函数完成对数据的操作
          this.sub(10);
      }
  },
  computed:{
      ...mapState(['count'])
  }
}
```

##### C.Action

```js
异步修改公共共享数据
用于提交 mutation，而不是直接变更状态，可以包含任意异步操作。
在mutations中不能编写异步的代码，会导致vue调试器的显示出错。
在vuex中我们可以使用Action来执行异步操作。
```

使用方式1：

```js
打开store.js文件，修改Action，如下：
发起异步任务，处理异步任务(setTimeout、网络请求都是异步任务)
actions: {
  addAsync(context,step){
    setTimeout(()=>{
      context.commit('add',step);
    },2000)
  }
}

然后在Addition.vue中给按钮添加事件代码如下：
<button @click="AddAsync">...+1</button>

methods:{
  AddAsync(){
    this.$store.dispatch('addAsync',5)
  }
}

在组件中通过import{mapActions} from VUEX 导入，
将它挂载到当前组件的计算属性上...mapActions(['函数名'])
```

使用方式2：

```js
import { mapActions } from 'vuex'
methods:{
  ...mapMutations(['subAsync'])
}

如下：
import { mapState,mapMutations,mapActions } from 'vuex'

export default {
  data() {
    return {}
  },
  methods:{
      //获得mapMutations映射的sub函数
      ...mapMutations(['sub']),
      //当点击按钮时触发Sub函数
      Sub(){
          //调用sub函数完成对数据的操作
          this.sub(10);
      },
      //获得mapActions映射的addAsync函数
      ...mapActions(['subAsync']),
      asyncSub(){
          this.subAsync(5);
      }
  },
  computed:{
      ...mapState(['count'])
      
  }
}
```

##### D.Getter

```js
允许组件从 Store 中获取数据
Getter用于对Store中的数据进行加工处理形成新的数据
它只会包装Store中保存的数据，并不会修改Store中保存的数据，
当Store中的数据发生变化时，Getter生成的内容也会随之变化

打开store.js文件，添加getters，如下：
export default new Vuex.Store({
  .......
  getters:{
    //添加了一个showNum的属性
    showNum : state =>{
      return '最新的count值为：'+state.count;
    }
  }
})

然后打开Addition.vue中，添加插值表达式使用getters
<h3>{{$store.getters.showNum}}</h3>

或者也可以在Addition.vue中，导入mapGetters，并将之映射为计算属性
import { mapGetters } from 'vuex'
computed:{
  ...mapGetters(['showNum'])
	//mapGetters辅助函数仅仅是将 -store 中的 getter 映射到局部计算属性
}
```

##### Module

```
允许将单一的 Store 拆分为多个 store 且同时保存在单一的状态树中。
获取state中的数据:
1 在其他组件中通过this.$store.state.'属性名'
2 在组件中通过import{mapState} from VUEX 导入，将它挂载到当前组件的计算属性上...mapState(['属性名'])
修改state中的数据:
1 通过this.$store.commit('函数名')
2 在组件中通过import{mapMutation} from VUEX 导入，将它挂载到当前组件的计算属性上...mapMutation(['函数名'])
```

#### vuex案例

##### Vuex案例总结

```
1.初始化案例
vue create test，cd test，npm run serve，vue ui
2.打开public文件夹，创建一个list.json文件，留言数据
3.打开main.js,添加store.js的引入
4.打开App.vue文件
将store中的数据获取并展示
给“添加事项”按钮、“删除”按钮、“复选”按钮、“清除已完成”按钮，绑定点击事件，编写处理函数
使用getters展示剩余项
给“全部”，“未完成”，“已完成”三个选项卡绑定点击事件，编写处理函数，将列表数据来源更改为一个getters
5.打开store.js
添加axios请求json文件获取数据的代码
编写addItem、removeItem、changeStatus、cleanDone
添加getters完成剩余项统计
添加getters完成剩余项统计
添加getters，mutations，state
```

##### A.初始化案例

首先使用vue ui初始化一个使用vuex的案例
然后打开public文件夹，创建一个list.json文件，文件代码如下：

```js
[
    {
        "id": 0,
        "info": "Racing car sprays burning fuel into crowd.",
        "done": false
    },
    {
        "id": 1,
        "info": "Japanese princess to wed commoner.",
        "done": false
    },
    {
        "id": 2,
        "info": "Australian walks 100km after outback crash.",
        "done": false
    },
    {
        "id": 3,
        "info": "Man charged over missing wedding girl.",
        "done": false
    },
    {
        "id": 4,
        "info": "Los Angeles battles huge wildfires.",
        "done": false
    }
]
```

再接着，打开main.js,添加store.js的引入，如下：

```js
import Vue from 'vue'
import App from './App.vue'
import store from './store.js'

// 1. 导入 ant-design-vue 组件库
import Antd from 'ant-design-vue'
// 2. 导入组件库的样式表
import 'ant-design-vue/dist/antd.css'

Vue.config.productionTip = false
// 3. 安装组件库
Vue.use(Antd)

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
```

再接着打开store.js，添加axios请求json文件获取数据的代码，如下：

```js
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //所有任务列表
    list: [],
    //文本输入框中的值
    inputValue: 'AAA'
  },
  mutations: {
    initList(state, list) {
      state.list = list
    },
    setInputValue(state,value){
      state.inputValue = value
    }
  },
  actions: {
    getList(context) {
      axios.get('/list.json').then(({ data }) => {
        console.log(data);
        context.commit('initList', data)
      })
    }
  }
})
```

最后，打开App.vue文件，将store中的数据获取并展示：

```js
<template>
  <div id="app">
    <a-input placeholder="请输入任务" class="my_ipt" :value="inputValue" @change="handleInputChange" />
    <a-button type="primary">添加事项</a-button>

    <a-list bordered :dataSource="list" class="dt_list">
      <a-list-item slot="renderItem" slot-scope="item">
        <!-- 复选框 -->
        <a-checkbox :checked="item.done">{{item.info}}</a-checkbox>
        <!-- 删除链接 -->
        <a slot="actions">删除</a>
      </a-list-item>

      <!-- footer区域 -->
      <div slot="footer" class="footer">
        <!-- 未完成的任务个数 -->
        <span>0条剩余</span>
        <!-- 操作按钮 -->
        <a-button-group>
          <a-button type="primary">全部</a-button>
          <a-button>未完成</a-button>
          <a-button>已完成</a-button>
        </a-button-group>
        <!-- 把已经完成的任务清空 -->
        <a>清除已完成</a>
      </div>
    </a-list>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'app',
  data() {
    return {
      // list:[]
    }
  },
  created(){
    // console.log(this.$store);
    this.$store.dispatch('getList')
  },
  methods:{
    handleInputChange(e){
      // console.log(e.target.value)
      this.$store.commit('setInputValue',e.target.value)
    }
  },
  computed:{
    ...mapState(['list','inputValue'])
  }
}
</script>

<style scoped>
#app {
  padding: 10px;
}

.my_ipt {
  width: 500px;
  margin-right: 10px;
}

.dt_list {
  width: 500px;
  margin-top: 10px;
}

.footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
```

##### B.完成添加事项

首先，打开App.vue文件，给“添加事项”按钮绑定点击事件，编写处理函数

```js
//绑定事件
<a-button type="primary" @click="addItemToList">添加事项</a-button>

//编写事件处理函数
methods:{
    ......
    addItemToList(){
      //向列表中新增事项
      if(this.inputValue.trim().length <= 0){
        return this.$message.warning('文本框内容不能为空')
      }

      this.$store.commit('addItem')
    }
  }
```

然后打开store.js编写addItem

```js
export default new Vuex.Store({
  state: {
    //所有任务列表
    list: [],
    //文本输入框中的值
    inputValue: 'AAA',
    //下一个id
    nextId:5
  },
  mutations: {
    ........
    //添加列表项
    addItem(state){
      const obj = {
        id :state.nextId,
        info: state.inputValue.trim(),
        done:false
      }
      //将创建好的事项添加到数组list中
      state.list.push(obj)
      //将nextId值自增
      state.nextId++
      state.inputValue = ''
    }
  }
  ......
})
```

##### C.完成删除事项

首先，打开App.vue文件，给“删除”按钮绑定点击事件，编写处理函数

```js
//绑定事件
<a slot="actions" @click="removeItemById(item.id)">删除</a>

//编写事件处理函数
methods:{
    ......
    removeItemById(id){
      //根据id删除事项
      this.$store.commit('removeItem',id)
    }
  }
```

然后打开store.js编写removeItemById

```js
export default new Vuex.Store({
  ......
  mutations: {
    ........
    removeItem(state,id){
      //根据id删除事项数据
      const index = state.list.findIndex( x => x.id === id )
      // console.log(index);
      if(index != -1) state.list.splice(index,1);
    }
  }
  ......
})
```

##### D.完成选中状态的改变

首先，打开App.vue文件，给“复选”按钮绑定点击事件，编写处理函数

```js
//绑定事件
<a-checkbox :checked="item.done" @change="cbStateChanged(item.id,$event)">{{item.info}}</a-checkbox>

//编写事件处理函数
methods:{
    ......
    cbStateChanged(id,e){
      //复选框状态改变时触发
      const param = {
        id:id,
        status:e.target.checked
      }

      //根据id更改事项状态
      this.$store.commit('changeStatus',param)
    }
  }
```

然后打开store.js编写changeStatus

```js
export default new Vuex.Store({
  ......
  mutations: {
    ........
    changeStatus(state,param){
      //根据id改变对应事项的状态
      const index = state.list.findIndex( x => x.id === param.id )
      if(index != -1) state.list[index].done = param.status
    }
  }
  ......
})
```

##### E.剩余项统计

打开store.js，添加getters完成剩余项统计

```js
getters:{
  unDoneLength(state){
    const temp = state.list.filter( x => x.done === false )
    console.log(temp)
    return temp.length
  }
}
```

打开App.vue，使用getters展示剩余项

```js
//使用映射好的计算属性展示剩余项
<!-- 未完成的任务个数 -->
<span>{{unDoneLength}}条剩余</span>

//导入getters
import { mapState,mapGetters } from 'vuex'
//映射
computed:{
  ...mapState(['list','inputValue']),
  ...mapGetters(['unDoneLength'])
}
```

##### F.清除完成事项

首先，打开App.vue文件，给“清除已完成”按钮绑定点击事件，编写处理函数

```js
<!-- 把已经完成的任务清空 -->
<a @click="clean">清除已完成</a>

//编写事件处理函数
methods:{
  ......
  clean(){
    //清除已经完成的事项
    this.$store.commit('cleanDone')
  }
}
```

然后打开store.js编写cleanDone

```js
export default new Vuex.Store({
  ......
  mutations: {
    ........
    cleanDone(state){
      state.list = state.list.filter( x => x.done === false )
    }
  }
  ......
})
```

##### G.点击选项卡切换事项

打开App.vue，给“全部”，“未完成”，“已完成”三个选项卡绑定点击事件，编写处理函数
并将列表数据来源更改为一个getters。

```js
<a-list bordered :dataSource="infoList" class="dt_list">
  ......
  <!-- 操作按钮 -->
  <a-button-group>
    <a-button :type="viewKey ==='all'?'primary':'default'" @click="changeList('all')">全部</a-button>
    <a-button :type="viewKey ==='undone'?'primary':'default'" @click="changeList('undone')">未完成</a-button>
    <a-button :type="viewKey ==='done'?'primary':'default'" @click="changeList('done')">已完成</a-button>
  </a-button-group>
  ......
</a-list>

//编写事件处理函数以及映射计算属性
methods:{
  ......
  changeList( key ){
    //点击“全部”，“已完成”，“未完成”时触发
    this.$store.commit('changeKey',key)
  }
},
computed:{
  ...mapState(['list','inputValue','viewKey']),
  ...mapGetters(['unDoneLength','infoList'])
}
```

打开store.js，添加getters，mutations，state

```js
export default new Vuex.Store({
  state: {
    ......
    //保存默认的选项卡值
    viewKey:'all'
  },
  mutations: {
    ......
    changeKey(state,key){
      //当用户点击“全部”，“已完成”，“未完成”选项卡时触发
      state.viewKey = key
    }
  },
  ......
  getters:{
    .......
    infoList(state){
      if(state.viewKey === 'all'){
        return state.list
      }
      if(state.viewKey === 'undone'){
        return state.list.filter( x => x.done === false )
      }
      if(state.viewKey === 'done'){
        return state.list.filter( x => x.done === true )
      }
    }
  }
})
```

#### vue脚手架

````js
node插件@vue/cli

安装方式(全局)
npm install -g @vue/cli
# OR
yarn global add @vue/cli

查看版本
vue --version

升级(全局)
npm update -g @vue/cli
# OR
yarn global upgrade --latest @vue/cli

升级(局部)
如需升级项目中的 Vue CLI 相关模块（以 @vue/cli-plugin- 或 vue-cli-plugin- 开头），
请在项目目录下运行 vue upgrade：
用法： upgrade [options] [plugin-name]

（试用）升级 Vue CLI 服务及插件

选项：
  -t, --to <version>    升级 <plugin-name> 到指定的版本
  -f, --from <version>  跳过本地版本检测，默认插件是从此处指定的版本升级上来
  -r, --registry <url>  使用指定的 registry 地址安装依赖
  --all                 升级所有的插件
  --next                检查插件新版本时，包括 alpha/beta/rc 版本在内
  -h, --help            输出帮助内容

vue脚手架创建项目
vue create 项目名

Manually select features
ESLint + Standard config
Lint on save
In dedicated config files

运行项目
npm run serve或yarn serve,然后点击链接

运行项目(可视化)
vue ui

终止服务
ctrl+c

src文件夹中有哪些文件
assets中是图片，字体等一些静态资源
components中是组件
filters中是过滤器
router中是路由文件
App.vue 根组件
mian.js 入口js文件

src中的资源会被webpack打包之后插入到public下面的index.html，mian.js是打包入口

命令行形式生成打包报告
vue-cli-service build --report

在vue控制台生成打包报告
点击“任务”=>“build”=>“运行”
运行完毕之后点击右侧“分析”，“控制台”面板查看报告
````

#### Proy与Object.defineProperty

```
Proxy的优势
可以直接监听对象而非属性；
可以直接监听数组的变化；
有多达13种拦截方法,不限于 apply、ownKeys、deleteProperty、has 等等，是 Object.defineProperty 不具备的；
返回的是一个新对象,我们可以只操作新的对象达到目的,而 Object.defineProperty 只能遍历对象属性直接修改；
Proxy的存在浏览器兼容性问题,而且无法用 polyfill 磨平，
因此Vue的作者才声明需要等到下个大版本( 3.0 )才能用 Proxy 重写。

Object.defineProperty的优势
兼容性好，支持IE9
```

#### mixins

```
代码的复用
注意, mixins并没有进行数据的共享

这个有可能会在问到: 如何做公共组件封装时会被问到

问题1: 组件的封装
问题2: 如果这些组件中, 有相同的一些代码, 该怎么处理

抽离Vue中的相同逻辑
Vue.mixin用法给组件每个生命周期，函数等都混入一些公共逻辑
```

#### $nextTick

````
为什么使用$nextTick？
数据的变化变化并不会立马造成界面的更新
当数据变化后，想得到最新数据形成的界面的dom元素，需要使用$nextTick

vue中的nextTick涉及到DOM的异步更新
nextTick是Vue提供的, 用于在修改完数据之后, 来操作页面元素的一个时机
数据变化-->更新虚拟树-->渲染界面
只有在渲染界面结束之后,才能操作新渲染出来界面的元素

应用过的场景
展示新闻列表的时候，点进去一个新闻，预览里面的图片，第一次可能页面还没有渲染处理，直接用的话可能会扑个空，也可以用settimeout
````

#### 状态保持

```
状态保持就是在不传送用户名和密码的情况下，服务器依然能知道这是哪个用户在发送请求。

状态保持的实现方案有3个
token  cookie  session，在前后端分离的开发模式中，一般会用token进行状态保持

keep-alive 
Vue 内置的一个组件，可以使被包含的组件保留状态，避免重新渲染 ，其有以下
特性
一般结合路由和动态组件一起使用，用于缓存组件；
提供 include 和 exclude 属性，两者都支持字符串或正则表达式， 
include 表示只有名称匹配的组件会被缓存，exclude 表示任何名称匹配的组件都不会被缓存，
exclude 的优先级比 include 高；
对应两个钩子函数 activated 和 deactivated ，
当组件被激活时，触发钩子函数 activated，当组件被移除时，触发钩子函数 deactivated。

防止组件被重新创建出来，从而缓存它的状态
```

#### Vue 3.0响应式原理

```
使用proxy

采用数据劫持结合发布订阅者模式，通过Object.defineProperty()方法劫持各个属性的getter和setter，属性发生变化时通知订阅者触发监听回调，更新视图。
由于JavaScript的限制，不能监听到数据和对象的变化

对象采用方法
1. Vue.set(this.obj, ‘c’, 3)
2. this.$set(this.obj, ‘c’, 4)
3. this.obj = Object.assign({}, this.obj, {c: 6})
4. this.obj = {…this.obj, c: 8}

数组采用方法
1. Vue.set(this.arr, 1, ‘x’)
2. this.$set(this.arr, 1, ‘x’)
3. this.arr.splice(2)
```

#### 网络层封装

```
方式1: Vue.protoType.$http = axios
		每一个组件中  this.$http.get('/login', {})
方式2:
	组件--> 各个模块的网络层(user.js) --> request.js(对axios进行封装)
	好处:职责分离
```

#### Vue项目的优化

```
vue单页面首屏加载优化
按需加载
基于DllPlugin 和 DllReferencePlugin 的 webpack 构建优化
异步组件
优化组件加载时机

优化页面的加载效率
使用路由懒加载;不要打包一些公共的依赖(vue,组件库),使用CDN加载这些依赖文件

什么是路由懒加载?
路由懒加载有什么好处?
如何实现路由懒加载?
路由懒加载是指通过异步的方式来加载对应的路由组件(默认情况是
将所有的组件全部加载并打包).
路由懒加载的好处:可以提高也的加载速度,尤其是首页的加载速度
(因为使用了懒加载后,加载首页的时候,就不需要加载其他页面对
应的组件,在需要的时候在加载)
具体实现:
importVuefrom'vue';
importRouterfrom'vue-router';
//异步导入组件
constList=resolve=>require(['@/components/list'],resolve);
constDetail=resolve=>require(['@/components/detail'],resolve);
constMessage=resolve=>require(['@/components/message'],resolve);
Vue.use(Router);
exportdefaultnewRouter({
//路由规则
routes:[
{path:'/list',component:List},
{path:'/detail',component:Detail},
{path:'/message',component:Message},
],
//路由模式:默认hash,可选值hash(如#/index)|history(/index)
mode:'history'
});

性能优化
尽量减少data中的数据，data中的数据都会增加getter和setter，会收集对应的watcher
v-if和v-for不能连用
如果需要使用v-for给每项元素绑定事件时使用事件代理
SPA 页面采用keep-alive缓存组件在更多的情况下，
使用v-if替代v-show
key保证唯一
使用路由懒加载
图片懒加载
使用cdn加载资源
```

#### 权限管理

    如果是比较全面的前端权限控制
    - 登录成功之后, 除了得到token之外, 还需要得到这个用户的权限数据
    - 根据这个用户的权限数据, 动态的添加路由规则(动态路由)
    - 对于一些按钮的显示, 可以根据用户的权限数据,结合自定义指令进行实现
    
    不同权限用户可视界面不同：
    这个项目大概的样子是，左边有个侧边栏，有页面一页面二等等，点击侧边栏右边的视图会发生改变
    
    要实现不同权限用户可视界面不同的话，
    首先用户登录之后得到token 用于状态保持，
    同时获得权限数据，就是这个用户所拥有的权限数据，是一个嵌套的树形结构的数据。
    
    然后把这个数据共享到VUEX中（用this.$store.commit(‘setRightList’,res.rights)），
    home页面就可以通过VUEX拿到这个权限列表数据(…mapState([‘rightList’]),在created里将rightList赋值给menuList)，然后再进行渲染
    
    同时还要在sessionStorage中存一份，并要和VUEX保持同步。
    具体操作就是在mutations里sessionStorange.setIten(‘rightList’,JSON.stringfy(data)),而初始化的时候state中的rightList也不要写成一个空数组，而是从sessionStorage当中取出来—在state里写，
    rightList:JSON.parse(sessionStorage.getItem(‘rightList’)||’[]’)
    
    要和后端商量好，从后端获取到的权限列表的数据那个属性名要正好和前端要渲染的数据的属性名要一样
    
    退出登录的时候sessionStorage.clear()清空，然后window.location.reload()刷新一下就行了，因为这时候session中已经拿不到数据了，所以就是一个空数组了
    
    那么右侧的组件的显示，也是根据登录后的数据决定的，要处理这个问题，用到的是动态添加路由规则。
    首先和后端开发商量一下，把路由规则命名与数据中的authName属性保持一致，
    在router.js中向外暴露一个函数，这个函数用于动态添加一个路由规则，然后再login.vue中进行导入router.js。然后在login.vue中就可以调用这个方法。（在生命周期created中调用一下就可以解决刷新后重新初
    始化问题）
    动态添加一个路由规则：给router.js中引入store,从VUEX中拿到数据(rightList),然后遍历这个数组，这个数组里面是一个个的对象，里面会存一个path属性，让这个属性的值和路由规则的引用保持一致，
    在router.js中再定义一个映射关系ruleMapping，把这个属性的值和路由规则的引用对应起来，接下来就可以通过ruleMapping[item.path]把拿到对应的路由规则，push到当前用户的路由规则。这样如果这个数
    组里没有这个路由，他就跳不过去，如果有，就能展示出来。    
    
    有一个超级管理员，他拥有一切权限，他可以看到一个分配权限的一个界面，他通过点击按钮可以给其他用户分配权限。在他点击按钮的同时，会向后端发出一个携带参数的请求，包含了具体给谁、分配什么权
    限这样信息。然后后端进行处理返回数据。下次这个用户在登录的时候，就拥有这些权限了。
    
    前端控制不了数据库，用户能不能操作数据库中的某些数据是由后端来控制的，前端能控制的只是一个视图层的展示
    
    后端的权限设计RBAC，是基于角色的权限控制。并不是直接把权限分配给用户，而是先分配给角色再分配个用户。后端去做的话，就是用户一张表、角色一张表、权限一张表、然后他们之间有多对多关系
    前端权限控制的意义： 提高用户体验，减少非法操作  排除不必要请求减轻服务器压力


​    不同权限用户可视界面不同：
​    这个项目大概的样子是，左边有个侧边栏，有页面一页面二等等，点击侧边栏右边的视图会发生改变
​    

    要实现不同权限用户可视界面不同的话，
    首先用户登录之后得到token 用于状态保持，
    同时获得rights数据，就是这个用户所拥有的权限数据，是一个嵌套的树形结构的数据。
    
    然后把这个数据共享到VUEX中（用this.$store.commit('setRightList',res.rights)），
    home页面就可以通过VUEX拿到这个权限列表数据(...mapState(['rightList']),在created里将rightList赋值给menuList)，然后再进行渲染
    
    同时还要在sessionStorage中存一份，并要和VUEX保持同步。
    具体操作就是在mutations里sessionStorange.setIten('rightList',JSON.stringfy(data)),而初始化的时候state中的rightList也不要写成一个空数组，而是从sessionStorage当中取出来---在state里写，
    rightList:JSON.parse(sessionStorage.getItem('rightList')||'[]')
    
    要和后端商量好，从后端获取到的权限列表的数据那个属性名要正好和前端要渲染的数据的属性名要一样
    
    退出登录的时候sessionStorage.clear()清空，然后window.location.reload()刷新一下就行了，因为这时候session中已经拿不到数据了，所以就是一个空数组了


​    那么右侧的组件的显示，也是根据登录后的数据决定的，要处理这个问题，用到的是动态添加路由规则。
​    首先和后端开发商量一下，把路由规则命名与数据中的authName属性保持一致，
​    在router.js中向外暴露一个函数，这个函数用于动态添加一个路由规则，然后再login.vue中进行导入router.js。然后在login.vue中就可以调用这个方法。（在生命周期created中调用一下就可以解决刷新后重新初
​    始化问题）
​    动态添加一个路由规则：给router.js中引入store,从VUEX中拿到数据(rightList),然后遍历这个数组，这个数组里面是一个个的对象，里面会存一个path属性，让这个属性的值和路由规则的引用保持一致，
​    在router.js中再定义一个映射关系ruleMapping，把这个属性的值和路由规则的引用对应起来，接下来就可以通过ruleMapping[item.path]把拿到对应的路由规则，push到当前用户的路由规则。这样如果这个数
​    组里没有这个路由，他就跳不过去，如果有，就能展示出来。
​    

    按钮的按权限显示
    用自定义指令实现
    给不希望显示的按钮绑定一个自定义指令
    首先在utils中新建一个permission.js文件，在里面通过Vue.directive来自定义一个指令。
    这个指令中定义一个inserted函数，它有两个参数，一个是当前使用指令的这个元素，另一个是binding，通过binding来得到指令使用时后面绑定的数据。这个时候我要判断，当前路由对应的组件中，用户是否具有
    操作这个按钮的权限，但问题是，我需要数据才能判断渲染谁不渲染谁。拿到这个数据是通过，给路由规则中，带一个meta，通过router.currentRoute.meta.indexOf(action)==-1来查找当前用户权限列表里有没
    有这一项，如果没有，就移除这个DOM,如果有，那就正常显示就行了
    Vue.directive('permission',{
    //在插入DOM节点时候进行调用
        inserted(使用指令的元素，binding){
        //可以通过binding来得到指令使用时后面跟的数据
    }
    	}
    )


​    
​    如果只是简单的权限控制, 那么通过路由的导航守卫就可以实现.
​    

    Vue的路由导航守卫, 可以在路由跳转的时候进行一些权限判断.
    router.beforeEach((to, from, next) => {
      // to 将要访问的路径
      // from 代表从哪个路径跳转而来
      // next 是一个函数 表示放行
      if (to.path === '/login') return next()
      // 获取token
      const tokenStr = window.sessionStorage.getItem('token')
      if (!tokenStr) return next('/login')
      next()
    })
    
    路由导航守卫更详细的信息如下: (了解)
    https://router.vuejs.org/zh/guide/advanced/navigation-guards.html
    
    如果是比较全面的前端权限控制
    登录成功之后, 除了得到token之外, 还需要得到这个用户的权限数据
    根据这个用户的权限数据, 动态的添加路由规则(动态路由)
    对于一些按钮的显示, 可以根据用户的权限数据,结合自定义指令进行实现


#### vue异步渲染

```
因为不采用异步更新，在每次更新数据都会对当前组件进行重新渲染。
所以为了性能考虑，vue 会在本轮数据更新后，再去异步更新视图。

vue是组件级更新，当前组件里的数据变了，它就会去更新这个组件。
当数据更改一次组件就要重新渲染一次，性能不高，为了防止数据一更新就更新组件，所以做了个异步更新渲染。（核心的方法就是nextTick）

原理：当数据变化后会调用notify方法，将watcher遍历，调用update方法通知watcher进行更新，这时候watcher并不会立即去执行，在update中会调用queueWatcher方法将watcher放到了一个队列里，在queueWatcher会根据watcher的进行去重，多个属性依赖一个watcher，如果队列中没有该watcher就会将该watcher添加到队列中，然后通过nextTick异步执行flushSchedulerQueue方法刷新watcher队列。flushSchedulerQueue中开始会触发一个before的方法，其实就是beforeUpdate，然后watcher.run() 才开始真正执行watcher，执行完页面就渲染完成啦，更新完成后会调用updated钩子。

dep.notify() 通知 watcher 进行更新操作
-->subs[i].update() 依次调用 watcher 的 update
-->queueWatcher 将 watcher 重新放到队列中
-->nextTick(flushSchedulerQueue) 异步清空 watcher 队列
```

#### vue优缺点

````
优点
当前端和数据做一些操作的时候，可以通过AJAX请求对后端做数据持久化，不需要刷新整个页面，
只需要改动DOM里需要改动的那部分数据。

缺点
特别是移动端应用场景，刷新页面太昂贵，会重新加载很多资源，
虽然有些会被缓存，但是页面的DOM,JS,CSS都会被页面重新解析一遍，
因此移动端页面通常会做出SPA单页应用。
````

#### vue react的区别

```
监听事件变化的实现原理不同

数据流不同，VUE可以实现双向绑定，但react不支持
组件通信方面也不太一样，react本身不支持自定义事件，VUE子向父传值是通过自定义事件来传递的
VUE推荐搭配axios使用，react一般用fetch

组件通信不同

模板渲染方式不同

渲染过程不同
```

#### react移动端兼容问题

```
- ES6的浏览器兼容问题：babel默认只会转换ES6的语法，而不会转换API，比如promise，Object.assign、array.from等新方法，我们可以引入另外的包来解决这个问题，比如babel-runtime、babel-polyfill来完成

- iOS下的软键盘问题： fixed失效是由于软键盘唤起后，页面的 fixed 元素将失效（ios认为用户更希望的是元素随着滚动而移动，也就是变成了 absolute 定位），既然变成了absolute，所以当页面超过一屏且滚动时，失效的 fixed 元素就会跟随滚动了。解决方案就是让整个页面处于一屏高度就能解决问题的根本

- meta标签对于移动端的一些特殊属性

  \- 主要I是强制让文档的宽度与设备宽度保持1:1，最大宽度1.0，禁止屏幕缩放：<meta content=“width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no” name=“viewport”>

  \- 这个也是iphone私有标签，允许全屏浏览<meta content="yes" name="apple-mobile-web-app-capable">

  \- iphone的私有标签，iphone顶端状态条的样式：<meta content="black" name="apple-mobile-web-app-status-bar-style">

  \- 禁止数字自动识别为电话号码，这个比较有用，因为一串数字在iphone上会显示成蓝色，样式加成别的颜色也是不生效的：<meta content=“telephone=no” name=“format-detection”>

  - 页面禁止复制、选中文本
    \- -webkit-user-select: none;
    \- -moz-user-select: none;
    \- -khtml-user-select: none;
    \- user-select: none;
  - input的placeholder出现文本位置偏上的问题：PC端设置line-height等于height能够对齐，但是移动端仍然偏上，可以设置为line-height：normal
  - 在iOS和Android中，audio和video元素无法自动播放的问题：代码设置为触屏即播
```

#### vue中踩的坑

```
给对象添加属性的时候，直接给data里面的对象添加属性然后复制，新添加的对象不是响应式。 

解决 通过vue.set（对象，属性，值）这种办法  添加的是就是响应式

在created操作dom 的时候，获取不到，报错，采用vue.nexttick回调函数获取
```

#### vuex中数据持久化

```js
什么是vuex 数据状态管理模式
Vuex 的状态存储是响应式的。
当 Vue 组件从 store 中读取状态的时候，若 store 中的状态发生变化，那么相应的组件也会相应地得到高效更新。

改变 store 中的状态的唯一途径就是显式地提交 (commit) mutation。
这样使得我们可以方便地跟踪每一个状态的变化。
 
	state：定义应用状态的数据结构，可以在这里设置默认的初始状态
	getter：允许组件从 store 中获取数据，mapGetters辅助函数仅仅是将store中的geeter映射到局部计算属性
	mutation：是唯一更改store中状态的方法。同步函数
	action：用于提交 mutation，而不是直接更改状态，可以包含异步操作
	module：允许将单一的store拆分为多个store且同事保存在单一的状态数中。

https://juejin.cn/post/6844903935656853517  关于vuex中的数据如何持久化及应用的场景
解决思路：localStorage或者sessionStorage 和vuex结合
```

#### vue项目template爆红

```
找到项目中的package.json文件
添加"requireConfigFile" : false在如下位置
    "parserOptions": {
      "parser": "@babel/eslint-parser",
      "requireConfigFile": false
    },x
```

#### 加载外部CDN

```js
为什么利用多个域名存储网站资源更有效?
确保用户在不同地区能用最快速度打开网站，其中某个域名崩溃用户也能通过其他域名访问网站

特点
主要用来使用用户就近获取资源
缓存更方便
突破浏览器并发限制
同一时间针对同一域名下的请求有一定数量限制，超过限制数目的请求会被阻塞。
大多数浏览器的并发数量控制在6以内，有些资源请求事件很长，因而会阻塞其他资源的请求。
因此，对于一些静态资源，如果放到不同的域名下面就能实现与其他资源的并发请求。
cookieless节省带宽，尤其是上行带宽一般比下行要慢 
对于UGC的内容和主站隔离，防止不必要的安全问题
数据做了划分，甚至切到了不同的物理集群，通过子域名来分流比较省事

github通过cdn托管jsdelivr(https://www.jsdelivr.com/)
1.首先得发布release
比如我的github一个仓库目录是
[big_event](https://github.com/bbbbzhang/big_event)/ 
[assets](https://github.com/bbbbzhang/big_event/tree/main/assets)/**images**/
2.然后链接是
https://cdn.jsdelivr.net/gh/github名/项目仓库@发布版本/想要使用的文件路径
（https://cdn.jsdelivr.net/gh/user/repo@version/file）
比如我的github一个仓库的其中一个目录是big_event/assets/images/
想要使用images下面的图片，
就这样写
https://cdn.jsdelivr.net/gh/bbbbzhang/big_event@1.0/assets/images/login_bg.jpg

默认情况下，依赖项的所有第三方包都会被打包到js/chunk-vendors.******.js文件中，导致该js文件过大
那么我们可以通过externals排除这些包，使它们不被打包到js/chunk-vendors.******.js文件中

module.exports = {
    chainWebpack:config=>{
        //发布模式
        config.when(process.env.NODE_ENV === 'production',config=>{
            //entry找到默认的打包入口，调用clear则是删除默认的打包入口
            //add添加新的打包入口
            config.entry('app').clear().add('./src/main-prod.js')

            //使用externals设置排除项
            config.set('externals',{
                vue:'Vue',
                'vue-router':'VueRouter',
                axios:'axios',
                lodash:'_',
                echarts:'echarts',
                nprogress:'NProgress',
                'vue-quill-editor':'VueQuillEditor'
            })
        })
        //开发模式
        config.when(process.env.NODE_ENV === 'development',config=>{
            config.entry('app').clear().add('./src/main-dev.js')
        })
    }
}
```

设置好排除之后，为了使我们可以使用vue，axios等内容，我们需要加载外部CDN的形式解决引入依赖项。
打开开发入口文件main-prod.js,删除掉默认的引入代码

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'
// import './plugins/element.js'
//导入字体图标
import './assets/fonts/iconfont.css'
//导入全局样式
import './assets/css/global.css'
//导入第三方组件vue-table-with-tree-grid
import TreeTable from 'vue-table-with-tree-grid'
//导入进度条插件
import NProgress from 'nprogress'
//导入进度条样式
// import 'nprogress/nprogress.css'
// //导入axios
import axios from 'axios'
// //导入vue-quill-editor（富文本编辑器）
import VueQuillEditor from 'vue-quill-editor'
// //导入vue-quill-editor的样式
// import 'quill/dist/quill.core.css'
// import 'quill/dist/quill.snow.css'
// import 'quill/dist/quill.bubble.css'

axios.defaults.baseURL = 'http://127.0.0.1:8888/api/private/v1/'
//请求在到达服务器之前，先会调用use中的这个回调函数来添加请求头信息
axios.interceptors.request.use(config => {
  //当进入request拦截器，表示发送了请求，我们就开启进度条
  NProgress.start()
  //为请求头对象，添加token验证的Authorization字段
  config.headers.Authorization = window.sessionStorage.getItem("token")
  //必须返回config
  return config
})
//在response拦截器中，隐藏进度条
axios.interceptors.response.use(config =>{
  //当进入response拦截器，表示请求已经结束，我们就结束进度条
  NProgress.done()
  return config
})
Vue.prototype.$http = axios

Vue.config.productionTip = false

//全局注册组件
Vue.component('tree-table', TreeTable)
//全局注册富文本组件
Vue.use(VueQuillEditor)

//创建过滤器将秒数过滤为年月日，时分秒
Vue.filter('dateFormat',function(originVal){
  const dt = new Date(originVal)
  const y = dt.getFullYear()
  const m = (dt.getMonth()+1+'').padStart(2,'0')
  const d = (dt.getDate()+'').padStart(2,'0')

  const hh = (dt.getHours()+'').padStart(2,'0')
  const mm = (dt.getMinutes()+'').padStart(2,'0')
  const ss = (dt.getSeconds()+'').padStart(2,'0')

  return `${y}-${m}-${d} ${hh}:${mm}:${ss}`
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
```

然后打开public/index.html添加外部cdn引入代码

```js
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="<%= BASE_URL %>favicon.ico">
    <title>电商后台管理系统</title>

    <!-- nprogress 的样式表文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/nprogress/0.2.0/nprogress.min.css" />
    <!-- 富文本编辑器 的样式表文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/quill/1.3.4/quill.core.min.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/quill/1.3.4/quill.snow.min.css" />
    <link rel="stylesheet" href="https://cdn.staticfile.org/quill/1.3.4/quill.bubble.min.css" />
    <!-- element-ui 的样式表文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/element-ui/2.8.2/theme-chalk/index.css" />

    <script src="https://cdn.staticfile.org/vue/2.5.22/vue.min.js"></script>
    <script src="https://cdn.staticfile.org/vue-router/3.0.1/vue-router.min.js"></script>
    <script src="https://cdn.staticfile.org/axios/0.18.0/axios.min.js"></script>
    <script src="https://cdn.staticfile.org/lodash.js/4.17.11/lodash.min.js"></script>
    <script src="https://cdn.staticfile.org/echarts/4.1.0/echarts.min.js"></script>
    <script src="https://cdn.staticfile.org/nprogress/0.2.0/nprogress.min.js"></script>
    <!-- 富文本编辑器的 js 文件 -->
    <script src="https://cdn.staticfile.org/quill/1.3.4/quill.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-quill-editor@3.0.4/dist/vue-quill-editor.js"></script>

    <!-- element-ui 的 js 文件 -->
    <script src="https://cdn.staticfile.org/element-ui/2.8.2/index.js"></script>

  </head>
  <body>
    <noscript>
      <strong>We're sorry but vue_shop doesn't work properly without JavaScript enabled. Please enable it to continue.</strong>
    </noscript>
    <div id="app"></div>
    <!-- built files will be auto injected -->
  </body>
</html>
```

定制首页内容

```js
开发环境的首页和发布环境的首页展示内容的形式有所不同
如开发环境中使用的是import加载第三方包，而发布环境则是使用CDN，那么首页也需根据环境不同来进行不同的实现
我们可以通过插件的方式来定制首页内容，打开vue.config.js，编写代码如下：

module.exports = {
    chainWebpack:config=>{
        config.when(process.env.NODE_ENV === 'production',config=>{
            ......
            
            //使用插件
            config.plugin('html').tap(args=>{
                //添加参数isProd
                args[0].isProd = true
                return args
            })
        })

        config.when(process.env.NODE_ENV === 'development',config=>{
            config.entry('app').clear().add('./src/main-dev.js')

            //使用插件
            config.plugin('html').tap(args=>{
                //添加参数isProd
                args[0].isProd = false
                return args
            })
        })
    }
}
```

然后在public/index.html中使用插件判断是否为发布环境并定制首页内容

```js
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="icon" href="<%= BASE_URL %>favicon.ico">
    <title><%= htmlWebpackPlugin.options.isProd ? '' : 'dev - ' %>电商后台管理系统</title>

    <% if(htmlWebpackPlugin.options.isProd){ %>
    <!-- nprogress 的样式表文件 -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/nprogress/0.2.0/nprogress.min.css" />
    ........
    <!-- element-ui 的 js 文件 -->
    <script src="https://cdn.staticfile.org/element-ui/2.8.2/index.js"></script>
    <% } %>
  </head>
```
