# React

```js
一个用于构建用户界面的javaScript库，起源于facebook的内部项目，13年开源

特点
声明式
基于组件
学习一次，随处使用

安装
yarn add react react-dom 
react包 核心，提供创建元素，组件等功能
react-dom包 提供DOM相关功能

React脚手架
初始化
npx create-react-app 项目名称
(npx是npm的高级版本，临时安装一个模块，使用过后删除这个模块)
启动
npm start

脚手架中使用React
导入react和react-dom两个包
import React from 'react'
import ReactDOM from 'react-dom'

创建元素
let h1 = React.createElement('h1',null,'我是标题')

渲染到页面
ReactDOM.render(h1,document.getElementById('root'))
```

## JSX

#### 介绍

````jsx
JavaScript XML，在JavaScript代码中写HTML格式的代码
声明式语法，与HTML结构相同

JSX不是标准的ECMAScript语法，
是ECMAScript的语法拓展，
是createElement()方法的语法糖(简化语法)，
被 @babel/preset-react 插件编译为createElement()方法

React元素：是一个对象，用来描述你希望在屏幕上看到的内容
const element = {
    <h1 className="greeting">
    	Hello JSX!
    </h1>
};

const element = 
React.createElement(
"h1",
{className: "greeting"},
"Hello JSX!"
);

const element = 
	type:"h1",
	props:{
        className: "greeting",
        children: "Hello JSX!"
    },
);

需要使用babel编译处理后，才能在浏览器环境中使用
create-react-app脚手架中已经默认有该配置，无需手动配置
编译JSX语法的包： @bable/preset-react

使用JSX语法创建react元素
let h1 = <h1>我是通过JSX创建的元素</h1>

使用ReactDOM来渲染元素
ReactDOM.render(h1,document.getElementById('root'))

注意
React元素的属性名使用驼峰命名法
特殊属性名：class -> className，for -> htmlFor，tabindex -> tabIndex
如果没有子节点的React元素可以用 `/>` 来结束
推荐：使用 小括号包裹JSX，从而避免JS中自动插入分号报错
````

#### 语法

```jsx
{JavaScritp表达式}
合法的js表达式都可以进行嵌入
JSX自身也是js表达式
js中的对象是一个例外，一般只会出现在style属性中
在{}中不能出现语句
eg:
let content = '插入的内容'
let h1 = <h1>我是通过JSX创建的元素+ {content}</h1>

条件渲染
eg:
let isLoading = true
let loading = ()=>{
    if(isLoading){
        return <div>Loading...</div>
    }
    return <div>加载完成</div>
}

列表渲染
尽量避免使用索引号作为key
let arr = [{
    id:1,
    name:'三国演义'
},{
    id:2,
    name:'水浒传'
},{
    id:3,
    name:'西游记'
},{
    id:4,
    name:'红楼梦'
}]
let ul = (<ul>
    {arr.map(item => <li key={item.id}>{item.name}</li>)}
</ul>)
ReactDOM.render(ul,document.getElementById('root'))

样式处理
行内样式
在style里面我们通过对象的方式传递数据
<li key={item.id} style={{'color': 'red',"backgroundColor": 'pink'}}>{item.name}</li>

类名
在js中进行引入，然后设置类名即可
import './css/index.css'
<li className='container'></li>
```

## 组件

#### 介绍

```react
表示页面中的部分功能

特点
可复用、独立、可组合

组件名称必须要大写字母开头

类组件
有状态组件
使用ES6语法的class创建的组件
应该继承React.Component父类，从而可以使用父类中提供的方法或者属性
必须提供 render 方法，render方法中必须要有return返回值
eg:
class Hello extends React.Component{
    render(){
        return (
            <div>这是第一个类组件</div>
        )
    }
}
ReactDOM.render(<Hello />,document.getElementById('root'))

函数组件
无状态组件
使用JS的函数创建组件
函数组件必须有返回值，表示该组件的结构(如果返回值为null，表示不渲染任何内容)
eg:
function Hello() {
    return (
        <div>这是第一个函数组件</div>
    )
}
ReactDOM.render(<Hello />,document.getElementById('root'))
```

#### 组件抽离

```react
组件作为一个独立的个体，一般都会放到一个单独的JS文件中

eg:
创建Hello.js
在Hello.js 中导入React，创建组件，在Hello.js中导出
import React from 'react'
export default class extends React.Component {
    render(){
        return (
            <div>单独抽离出来的 Hello</div>
        )
    }
}
在index.js中导入Hello组件，渲染到页面
import Hello from './js/Hello'
ReactDOM.render(<Hello />,document.getElementById('root'))
```

#### 受控组件(State)

```react
值受到react控制的表单元素

HTML中的表单元素是可输入的，也就是有自己的可变状态
React中可变状态通常保存在state中，并且只能通过setState()方法来修改
React讲state与表单元素值value绑定在一起，有state的值来控制表单元素的值

setState()
修改state，更新UI
数据驱动视图
不能直接修改state中的值
setState()更新数据是异步的
使用该语法，后面的setState不要依赖前面setState的值
多次调用setState，只会触发一次render
推荐使用:
this.setState((state,props) => {})
参数state： 表示最新的state
参数props： 表示最新的props，在状态更新(页面完成重新渲染)后立即执行某个操作

this.setState(
    (state, props) => {},
    () => {
        console.log("该回调函数会在状态更新后立即执行")
    }
)

eg：
export default class extends React.Component {
    // 第二种初始化方式
    state = {
        count:1
    }
    inputChange(e){
        let target = e.target;
        let value = target.type == 'checkbox' ? target.checked : target.value;
        this.setState({
            [e.target.name]: value
        })
    }

    render(){
        return (
            <div>
                <input type="text" value={this.state.txt} name="txt" onChange={this.inputChange}/>
                <input type="checkbox" value={this.state.isChecked} name="isChecked" onChange={this.inputChange}/>
            </div>
        )
    }
}
```

#### 非受控组件(Ref)

```react
借助于ref，使用元素DOM方式获取表单元素值
ref的作用：获取DOM或者组件

eg:
class App extends React.Component {
    constructor(){
        super()
        //创建 ref
        this.txtRef = React.createRef()
    }
    // 获取文本框的值
    getTxt =() => {
        console.log(this.txtRef.current.value)
    }
    render(){
        return (
          <div>
            <input type ="text" ref={this.txtRef} />
            <button onClick ={this.getTxt}>获取值</button>
          </div>
        )
    }
}
```

#### 组件通讯(Props)

````react
组件是独立且封闭的单元，默认情况下，只能使用组件自己的数据。
在组件化过程中，我们将一个完整的功能拆分成多个组件，以更好的完成整个应用的功能。
而在这个过程中，多个组件之间不可避免的要共享某些数据。
为了实现这些功能，就需要打破组件的独立封闭性，让其与外界沟通，这个过程就是组件通讯

props
接收传递给组件的数据
只读属性，不能对值进行修改
使用类组件时，如果写了构造函数，应该将props传递给super()
否则无法在构造函数中获取到props，其他的地方是可以拿到的
````

#### props.children

```react
children属性
表示组件标签的子节点，当组件标签有子节点时，props就会有该属性
与普通的props一样，值可以使任意值（文本、react元素、组件、甚至是函数）

eg:
子组件中
import React from 'react';
function App(props) {
    return (
        <div>{props.children}</div>
    );
}
export default App;
父组件中
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <App >哈哈哈哈</App>
);
```



#### 父子组件通讯

```
父组件传递数据给子组件
父组件提供要传递的state数据
给子组件标签添加属性，值为state中的数据
子组件通过props接收父组件中传递的数据

子组件传递数据给父组件
父组件提供回调函数，用来接收数据，
子组件调用，将要传递的数据作为回调函数的参数
将该函数作为属性的值，传递给子组件
子组件通过props调用回调函数
```

#### 兄弟组件通讯

```react
(子1->公共父，公共父->子2)
状态提升
将共享状态(数据)提升到最近的公共父组件中，由公共父组件管理这个状态
公共父组件职责：1. 提供共享状态 2.提供操作共享状态的方法
要通讯的子组件只需要通过props接收状态或操作状态的方法

eg：
子组件中
class Counter extends React.Component {
    render() {
        return (<div>
            <Child1 />
            <Child2 />
        </div>
        )
    }
}
class Child1 extends React.Component {
    render() {
        return (
            <h1>计数器：{this.props.count}</h1>
        )
    }
}
class Child2 extends React.Component {
    handleClick = () => {
        // 这里一旦调用，就会执行父组件里面 onIncrement函数
        this.props.onIncrement(2)
    }
    render() {
        return (
            <button onClick={this.handleClick}>+</button>
        )
    }
}

父组件中
class Counter extends React.Component {
    // 提供共享的状态
    state = {
        count: 0
    }
   // 提供共享方法
    onIncrement = (res) => {
   // 只要第二个子组件调用了这个函数，就会执行里面代码
        this.setState({
            count: this.state.count + res
        })
    }
    render() {
        return (<div>
            {/* 把状态提供给第一个子组件 */}
            <Child1 count={this.state.count}/>
            {/* 把共享方法提供给第二个子组件 */}
            <Child2 onIncrement={this.onIncrement} />
        </div>
        )
    }
}
```

####  跨组件通讯(Context)

```react
层级比较多的情况下使用
不必在每个级别手动传递props，简化组件之间的数据传递过程

cosnt Context = createContext(defaultValue)
<Context.Provider value>：通过value属性提供数据
<Context.Consumer>：通过render-props模式，在JSX中获取Context中提供的数据。

提供数据
cosnt {Provider, Consumer} = React.createContext()
<Provider value="pink">
	<div className="App">
		<Child/>
	</div>
</Provider>

消费数据
<Consumer>
	{ data => <span>{data}</span> }
</Consumer>

注意：
如果提供了Provider组件
Consumer获取到的是Provider中value属性的值
如果没有提供Provider组件
Consumer获取到的是createContext(defaultValue)的defaultValue值
```

#### propTypes

```react
在创建组件的时候，指定props的类型、格式等
捕获使用组件时因为props导致的错误，给出明确的错误提示，增加组件的健壮性

使用步骤
yarn add prop-types
import PropTypes from 'prop=types'
eg:
组件名.propTypes={
	colors: PropTypes.array
}

常见的约束规则
创建的类型：array、bool、func、number、object、string
React元素类型：element
必填项：isRequired
特定结构的对象：shape({})
```

#### deafaultProps

```react
默认值

eg:
App.defaultProps = {
	pageSize: 10
}
```

#### render-props模式

```react
实现状态逻辑复用

把prop是一个函数并且告诉组件要渲染什么内容的技术

并不是该模式叫render props就必须使用名为render的prop，实际上可以使用任意名称的prop
推荐：使用childre代替render属性

复用什么？
state
操作state的方法

复用方式
render props模式
高阶组件（HOC）

使用步骤
创建Mouse组件，在组件中提供复用的逻辑代码
将要复用的状态作为 props.render(state)方法的参数，暴露到组件外部
使用props.render() 的返回值作为要渲染的内容

eg:
class Mouse extends React.Component {
    // 鼠标位置状态
    state = {
        x: 0,
        y: 0
    }
Mouse.ropTypes= {
    children: PropTypes.func.isRequired
}
    // 监听鼠标移动事件
    componentDidMount(){
        window.addEventListener('mousemove',this.handleMouseMove)
    }
    componentWillUnmount(){
        window.removeEventListener('mousemove',this.handleMouseMove)
    }
    handleMouseMove = e => {
        this.setState({
            x: e.clientX,
            y: e.clientY
        })
    }
    render(){
        // 向外界提供当前子组件里面的数据
        return this.props.children(this.state)
    }
}
class App extends React.Component {
    render() {
        return (
            <div>
                App
                <Mouse render={mouse => {
                    return <p>X{mouse.x}Y{mouse.y}</p>
                }}/>
            </div>
        )
    }
}
ReactDOM.render(<App />,document.getElementById('root'))
```

#### 高阶组件

```react
实现状态逻辑复用
高阶组件是一个函数，接收要包装的组件，返回增强后的组件

步骤
创建一个函数，名称约定以with开头
指定函数参数，参数应该以大写字母开头
在函数内部创建一个类组件，提供复用的状态逻辑代码，并返回
在该组件中，渲染参数组件，同时将状态通过prop传递给参数组件
调用该高阶组件，传入要增强的组件，通过返回值拿到增强后的组件，并将其渲染到页面

包装函数
// 定义一个函数，在函数内部创建一个相应类组件
function withMouse(WrappedComponent) {
    // 该组件提供复用状态逻辑
    class Mouse extends React.Component {
        state = {
            x: 0,
            y: 0
        }
        // 事件的处理函数
        handleMouseMove = (e) => {
            this.setState({
                x: e.clientX,
                y: e.clientY
            })
        }
        // 当组件挂载的时候进行事件绑定
        componentDidMount() {
            window.addEventListener('mousemove', this.handleMouseMove)
        }
        // 当组件移除时候解绑事件
        componentWillUnmount() {
            window.removeEventListener('mousemove', this.handleMouseMove)
        }
        render() {
            // 在render函数里面返回传递过来的组件，把当前组件的状态设置进去
            return <WrappedComponent {...this.state} />
        }
    }
    return Mouse
}

哪个组件需要加强，通过调用withMouse这个函数，然后把返回的值设置到父组件中即可
function Position(props) {
    return (
        <p>
            X:{props.x}
            Y:{props.y}
        </p>
    )
}
// 把position 组件来进行包装
let MousePosition = withMouse(Position)

class App extends React.Component {
    constructor(props) {
        super(props)
    }
    render() {
        return (
            <div>
                // 高阶组件
                <MousePosition></MousePosition>
            </div>
        )
    }
}

使用高阶组件存在的问题：
得到两个组件的名称相同
原因：默认情况下，React使用组件名称作为displayName
解决方式：为高阶组件设置displayName，便于调试时区分不同的组件
displayName的作用：用于设置调试信息(React Developer Tools信息)
设置方式

传递props存在的问题：
如果没有传递props，会导致props丢失问题
解决方式： 渲染WrappedComponent时，将state和props一起传递给组件

小结
组件通讯是构建React应用必不可少的一环
props的灵活性让组件更加强大
状态提升是React组件的常用模式
组件生命周期有助于理解组件的运行过程
钩子函数让开发者可以在特定的时机执行某些功能
render props模式和高阶组件都可以实现组件状态逻辑的复用
组件极简模型：(state,props) => UI
```

#### 组件优化

```react
setState()的作用
修改state、更新组件

组件更新机制
父组件重新渲染时，也会重新渲染子组件，但只会渲染当前组件子树（当前组件以其所有子组件）

减轻state
只存储跟组件渲染相关的数据（比如：count/列表数据/loading等）
不用做渲染的数据不要放在state中
需要在多个方法中用到的数据，应该放到this中
eg:
class Hello extends Component {
	componentDidMount(){
    	this.timerId = setInterval(()={},2000)
	}
    componentWillUnmount(){
        clearInterval(this.timerId)
    }
    render() {...}
}

避免不必要的重新渲染
组件更新机制:
父组件更新会引起子组件也被更新
问题:
子组件没有任何变化时也会重新渲染
解决方式:
使用更新阶段的钩子函数，组件重新渲染前执行
shouldComponentUpdate(nextProps, nextState) => render
nextProps是最新的状态、nextState是最新的属性
shouldComponentUpdate函数返回布尔值，true代表需要重新渲染，false代表不需要
eg:
class Hello extends Component {
    shouldComponentUpdate(nextProps, nextState) {
		//根据条件，决定是否重新渲染组件
         // 判断一下当前生成的 值是否与页面的值相等
        if(nextState.number !== this.state.number){
             return true
         }
         // 判断一下当前生成的 值是否与页面的值相等
         if (nextProps.number !== this.props.number) {
            return true
        }
    	return false
    }
    render() {...}
}
    
纯组件PureComponent
与React.Component功能相似
与React.Component的区别：
PureComponent内部自动实现了shouldComponentUpdate钩子，不需要手动比较
原理：
纯组件内部通过分别比对前后两次props和state的值，来决定是否重新渲染组件
纯组件内部的对比是shallow compare（浅层对比）
对于值类型来说：比较两个变量的值是否相同
对于引用类型来说：只比较两个对象的引用地址是否相同
state或props中属性值为引用类型时，应该创建新数据，不要直接修改原数据

不要用push/unshift等修改当前数组的方法
应该用concat、slice等返回新数组的方法

eg：
class Hello extends React.PureComponent {
	render() {
        return(
        	<div>纯组件</div>
        )
    }
}
```

## 事件绑定

```react
事件名采用驼峰命名法
on+事件名称=事件处理函数

类组件中绑定事件函数的时候需要用到this，代表指向当前的类的引用
函数组件中不需要调用this
```

#### 事件对象

```react
React中的事件对象叫做：合成事件
可以通过事件处理函数的参数获取到事件对象
兼容所有浏览器，还拥有和浏览器原生事件相同的接口，
包括stopPropagation()和preventDefault()

原生事件对象
可以通过nativeEvent属性来进行获取

eg:
export default class extends React.Component {
    clickHandle(e){
        // 获取原生事件对象
        console.log(e.nativeEvent)
    }
    render(){
        return (
            <div><button onClick = {this.clickHandle}>点我点我点我</button></div>
        )
    }
}
```

#### 事件绑定中的this执行

```react
事件绑定this指向
在JSX中我们写的事件处理函数可以找到this，
原因在于在JSX中我们利用箭头函数，箭头函数是不会绑定this，
所以会向外一层去寻找，外层是render方法，
在render方法里面的this刚好指向的是当前实例对象

该语法是实验性语法，但是，由于babel的存在可以使用
使用class的实例方法，也是依赖箭头函数不绑定this的原因

eg：
// 事件处理程序
  onIncrement = () => {
    console.log('事件处理程序中的this：', this)
    this.setState({
      count: this.state.count + 1
    })
  }
  
利用bind方法
原型bind方法可以更改函数里面this的指向，
在构造中调用bind方法，然后把返回的值赋值给函数即可
eg：
class App extends React.Component {
  constructor() {
    super()
	...
    // 通过bind方法改变了当前函数中this的指向
    this.onIncrement = this.onIncrement.bind(this)
  }
  // 事件处理程序
  onIncrement() {
    ...
  }

  render() {
    ...
  }
}
```

## 生命周期

```
组件从被创建到挂载到页面中运行，再到组件不在时卸载的过程

钩子函数
生命周期的各个阶段伴随的一些方法调用
作用：为开发人员在不同阶段操作组件提供了时机

创建时（挂载阶段）
执行时机：组件创建时（页面加载时）
constructor()->render()->componentDidMount()

更新时
执行时机：setState()、 forceUpdate()、 组件接收到新的props
render()->componentDidUpdate()

卸载时
执行时机：组件从页面中消失，用来做清理操作
componentWillUnmount()

新增生命周期
getDerivedStateFromProps()
会在调用render方法之前调用，并且在初始挂载及后续更新时都会被调用。
返回一个对象来更新 state，如果返回 null 则不更新任何内容
会在每次渲染前触发此方法

shouldComponentUpdate()
根据shouldComponentUpdate()返回的布尔值，默认为true
判断 React 组件的输出是否受当前 state 或 props 更改的影响。
默认行为是 state 每次发生变化组件都会重新渲染
当 props 或 state 发生变化时，shouldComponentUpdate()会在渲染执行之前被调用。

getSnapshotBeforeUpdate()
获取更新前的一次快照
在最近一次渲染输出（提交到 DOM 节点）之前调用。
它使得组件能在发生更改之前从 DOM 中捕获一些信息（例如，滚动位置。
此生命周期的任何返回值将作为参数传递给componentDidUpdate()
此用法并不常见，但它可能出现在 UI 处理中，如需要以特殊方式处理滚动位置的聊天线程等
```

## 虚拟DOM和Diff算法

```react
React更新视图的思想
只要state变化就重新渲染视图
虚拟DOM配合Diff算法
只更新变化的地方

虚拟DOM
虚拟DOM -> state + JSX
本质上就是一个JS对象，用来描述你希望在屏幕上看到的内容
脱离了浏览器的束缚，只要是能支持js的地方都可以用到react，
所以react可以进行跨平台的开发

const element = 
	type:"h1",
	props:{
        className: "greeting",
        children: "Hello JSX!"
    },
);

<h1 class="greeting">
	Hello JSX!
</h1>

Diff算法
初次渲染时，React会根据初始化的state（model），创建一个虚拟DOM对象（树）
根据虚拟DOM生成真正的DOM，渲染到页面
当数据变化后(setState())，会重新根据新的数据，创建新的虚拟DOM对象（树）
与上一次得到的虚拟DOM对象，使用Diff算法比对（找不同），得到需要更新的内容
最终，React只将变化的内容更新（patch）到DOM中，重新渲染到页面

render()方法的调用并不意味着浏览器进行渲染，
render方法调用时意味着Diff算法开始比对了
```

## React-Router

#### 介绍

```react
前端路由是一套映射规则，在React中，是URL路径与组件的对应关系
简单来说，就是配置路径和组件

功能
让用户从一个视图（页面）导航到另一个视图（页面）

为什么需要前端路由？
现代的前端应用大多数是SPA（单页应用程序），也就是只有一个HTML页面的应用程序。
因为它的用户体验更好、对服务器压力更小，所以更受欢迎。
为了有效的使用单个页面来管理多页面的功能

使用步骤
安装
yarn add react-router-dom
导入路由的三个核心组件Router / Route / Link
import {BrowserRouter as Router, Route, Link} from 'react-router-dom'
使用Router 组件包裹整个应用
使用Link组件作为导航菜单（路由入口）
使用Route组件配置路由规则和要展示的组件（路由出口）
const First = () => <p>内容</p>
<Router>
	<div className="App">
	<Link to="/first">页面一</Link>
        <Route Path="first" component={First}></Route>
	</div>    
</Router>


react-router 提供了路由核心api。
如Router, Route, Switch等，但没有提供有关dom操作进行路由跳转的api

react-router-dom
在react-router的基础上扩展了可操作dom的api。
提供了 BrowserRouter、Route、Link 等 api，
可以通过 dom 操作触发事件控制路由。
依赖了 react-router，所以安装的时候只要安装 react-router-dom

Link组件，会渲染成一个 a 标签；
BrowserRouter组件，使用pushState和popState事件构建路由
hashRouter组件，使用 hash 和 hashchange 事件构建路由
```

#### 常用组件说明

````
Router组件
包裹整个应用，一个React应用只需要使用一次
两种常用的Router： HashRouter和BrowserRouter
HashRouter： 使用URL的哈希值实现 （localhost:3000/#/first）
BrowserRouter(推荐)：使用H5的history API实现（localhost3000/first）

Link组件
用于指定导航链接（a标签）
最终Link会编译成a标签，而to属性会被编译成 a标签的href属性

Route组件
指定路由展示组件相关信息
path属性：路由规则，这里需要跟Link组件里面to属性的值一致
component属性：展示的组件
Route写在哪，渲染出来的组件就在哪
````

#### 执行过程

```react
当我们点击Link组件的时候，修改了浏览器地址栏中的url
React路由监听地址栏url的变化
React路由内部遍历所有的Route组件，拿着Route里面path规则与pathname进行匹配

当路由规则（path）能够匹配地址栏中的pathname时，就展示该Route组件的内容

eg:
localhost:3000/first
first就是pathname
```

#### 编程式导航

```react
通过JS代码来实现页面跳转

点击登录按钮，登录成功后，通过代码跳转到后台首页，如何实现？
history是React路由提供的，用于获取浏览器历史记录的相关信息
push(path)：跳转到某个页面，参数path表示要跳转的路径
go(n)：前进或后退功能，参数n表示前进或后退页面数量

eg:
class Login extends Component [
	handleLogin = () => {
		// ...
		this.props.history.push("./home")
	}
	render() {...}
}
```

#### 默认路由

```react
进入页面时就会匹配的路由
只需要把path设置为 `'/'`

eg:
<Route path="/" component={Home}/>
```

#### 匹配模式

```react
模糊匹配模式
当Link组件的to属性值为 '/login' 时候，为什么默认路由也被匹配成功？
默认情况下，React路由是模糊匹配模式
模糊匹配规则：只要pathname以path开头就会匹配成功

/
能够匹配所有pathname
/first
能够匹配/first或者/first/a或/first/a/b

精准匹配
默认路由认可情况下都会展示，如果避免这种问题？
给Route组件添加exact属性，让其变为精准匹配模式
只有当path和pathname完全匹配时才会展示改路由
<Route exact path="/" component={Home}/>
```

#### 小结

```
React路由可以有效的管理多个视图实现 SPA
路由先需要通过安装
Router组件包裹整个应用，只需要使用一次
Link组件是入口，Route组件是出口
通过props.history实现编程式导航
默认是模糊匹配，添加exact编程精确匹配
React路由的一切都是组件，可以像思考组件一样思考路由
```

#### 6.x

```
Routes代替Switch
取消了精确匹配
```



## Redux

#### 介绍

```react
Redux是react中最流行的状态管理工具。
类似于vuex和vue的关系。

对于大型的复杂应用来说，如果只用react，不用redux，在处理数据和组件通讯的时候会比较吃力。

使用步骤
yarn global add create-react-app或npm i -g create-react-app
create-react-app react-demo
yarn add redux

store: 相当于公司的老板
action: 行为，相当于公司中要做的事情，比如 开发软件，测试软件，打扫卫生等等
reducer：相当于公司的员工，负责干活的。老板自己不干活

eg:
import { createStore } from 'redux';
/**
 * 这是一个 reducer，形式为 (state, action) => state 的纯函数。
 * 描述了 action 如何把 state 转变成下一个 state。
 *
 * state 的形式取决于你，可以是基本类型、数组、对象、
 * 甚至是 Immutable.js 生成的数据结构。惟一的要点是
 * 当 state 变化时需要返回全新的对象，而不是修改传入的参数。
 *
 * 下面例子使用 `switch` 语句和字符串来做判断，但你可以写帮助类(helper)
 * 根据不同的约定（如方法映射）来判断，只要适用你的项目即可。
 */
function counter(state = 0, action) {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1;
  case 'DECREMENT':
    return state - 1;
  default:
    return state;
  }
}

// 创建 Redux store 来存放应用的状态。
// API 是 { subscribe, dispatch, getState }。
let store = createStore(counter);

// 可以手动订阅更新，也可以事件绑定到视图层。
store.subscribe(() =>
  console.log(store.getState())
);

// 改变内部 state 惟一方法是 dispatch 一个 action。
// action 可以被序列化，用日记记录和储存下来，后期还可以以回放的方式执行
store.dispatch({ type: 'INCREMENT' });
// 1
store.dispatch({ type: 'INCREMENT' });
// 2
store.dispatch({ type: 'DECREMENT' });
// 1

```

![image-20210222180100543](C:\Tools\DEV\FED\React\redux\images\image-20210222180100543.png)

#### store

```react
保存数据的地方，你可以把它看成一个容器或者仓库。整个应用只能有一个Store。
管理者，管理 action 和 reducer

createStore函数用来生成 Store
import { createStore } from 'redux'
function reducer() {}
// 创建store必须提供参数 reducer
const store = createStore(reducer)

// store.getState()获取数据
console.log(store.getState())
```

#### action

```jsx
action是一个对象。
其中的type属性是必须的，表示 Action 的名称。其余的属性可以自由设置。
动作，描述的是需要做的事情和携带的数据
每一个动作都可以是一个action，比如登陆，退出，添加任务等等。
改变数据的唯一方式就是通过action。

const add = {
  // 数量+1
  type: 'INCREMENT'
}

const addUser = {
  // 添加用户
  type: 'ADD_USER',
  username: '张三'
}

const delUser = {
  // 删除用户
  type: 'DEL_USER',
  id: 1
}
```

#### action creator

```jsx
有多少种动作，就会对应多少个action，比如添加张三用户，添加李四用户，删除不同id的任务。
这样一个一个提供action会非常麻烦。

定义一个函数来生成 action，这个函数就叫 action creator。

作用
用于生成action

const actionCreator = function (username) {
  return {
  	type: 'ADD_USER',
  	username
  }
}

const action1 = actionCreator('张三')
const action2 = actionCreator('李四')
```

#### reducer

```jsx
reducer是一个函数，接收 action 和当前 State 作为参数，返回一个新的 State

store 收到 action 以后，不是自己处理，而是派发dispatch给reducer进行处理。
reducer处理完成之后会返回新的状态。

老板把当前的数据和动作交给了干活的人，干活的人完成之后，需要返回新的数据

const reducer = function (state, action) {
  // ...一系列处理
  return new_state;
};

整个应用的初始状态，可以作为state的初始值。
const count = 100
// 参数是一个函数,这个函数叫做reducer
function reducer(state = count, action) {
  return state
}
const store = createStore(reducer)
// 通过getState可以获取到数据
console.log(store.getState()) // 100
```

#### dispatch派发action

```jsx
通过store.dispatch(action)可以派发任务，把action交给reducer处理

// action creator
const add = (num) => {
  return {
    type: 'ADD',
    num
  }
}

// reducer处理动作
function reducer(state = defaultCount, action) {
  if (action.type === 'ADD') {
    return state + action.num
  }
  return state
}

// 派发动作
store.dispatch(add(5))
```

#### react-redux

```
Redux的官方React绑定库。
能够使React组件从Redux store中读取数据，
并且向store分发actions以更新数据

yarn add react-redux



```

![](https://cdn.jsdelivr.net/gh/bbbbzhang/Pictures@1.0.1/images/image-20210222184637401.png)

#### connect

```jsx
connect([mapStateToProps], [mapDispatchToProps])
返回一个与store连接的组件Provider提供store对象

import { createStore } from 'redux'
const store = createStore(reducer)

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)

mapStateToProps
如果定义该参数，组件将会监听 Redux store 的变化，
只要store数据变化，mapStateToProps就会执行。
这个函数必须返回一个对象，这个对象的数据会合并到组件的props中

mapDispatchToProps
参数是一个函数，接收dispatch作为参数
这个函数返回一个对象，这个对象会合并到组件中的props中

const mapStateToProps = state => {
  return {
    count: state.count
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    add: (num) => {
      dispatch(add(num))
    },
    sub: (num) => {
      dispatch(sub(num))
    }
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(Counter)
```

#### combineReducers

```jsx
如果一个项目只有一个reducer，对于一个大型项目来说必然非常的庞大，不好维护。
好比一个公司就一个干活的，那迟早得累死
我们可以定义多个reducer，最终通过combineReducers方法合成一个根reducer(总包工头)
使用combineReducers之后，最终store的状态是所有reducer返回的状态组合起来的。

import { combineReducers } from 'redux'

const defaultCount = 0
function countReducer(state, action) {
  if (state === undefined) {
    return defaultCount
  }
  if (action.type === 'ADD') {
    return state + action.num
  }
  if (action.type === 'SUB') {
    return state - action.num
  }
  return state
}

const defaultTodos = [
  {
    id: 1,
    name: '吃饭',
    done: false
  }
]
function todosReducer(state = defaultTodos, action) {
  return state
}

export default combineReducers({
  count: countReducer,
  todos: todosReducer
})

```

#### 异步删除功能

```react
redux-thunk	redux-saga
yarn add redux-thunk

使用中间件
import { createStore, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
const store = createStore(reducer, applyMiddleware(thunkMiddleware))

修改actions
export const delTodo = (id) => {
  return {
    type: 'DEL_TODO',
    id
  }
}
export const delTodoAsync = (id) => {
  return (dispatch) => {
    setTimeout(() => {
      dispatch(delTodo(id))
    }, 1000)
  }
}
```

#### 加减小案例

```react
//用redux的组件
import React, {Component} from 'react';
import { connect } from "react-redux"
import {addNUM, subNUM} from "../action"

class TestComcom extends Component {
    render() {
        const {count,addNUM,subNUM} = this.props
        return (
            <div>
                <p>{count}</p>
                <button onClick={addNUM}>+10</button>
                <button onClick={subNUM}>-5</button>
            </div>
        );
    }
}
const mapStateToProps = (state)=>{
    return{
        count:state
    }
}
const mapDispatchToProps = (dispatch)=>{
    return {
        addNUM(){
            dispatch(addNUM(10))
        },
        subNUM(){
            dispatch(subNUM(5))
        }
    }
}
export default connect(mapStateToProps,mapDispatchToProps)(TestComcom);


//store
import {createStore} from "redux";
import reducer from "./reducer"
const store = createStore(reducer)
export default store

//action
export const addNUM = (num)=>{
    return {
        type:"ADD_NUM",
        num
    }
}
export const subNUM= (num)=>{
    return {
        type:"SUB_NUM",
        num
    }
}

//reducer
export default function reducer(state = 0,action){
    if(action.type==="ADD_NUM"){
        return state+action.num
    }
    if(action.type==="SUB_NUM"){
        return state-action.num
    }
    return state
}

//根组件
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import store from "./store"
import { Provider } from "react-redux";

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <Provider store={store}>
        <App></App>
    </Provider>
);
```

## React Hooks

#### 介绍

```
Hooks是React v16.8 中的新增功能
一个Hook就是一个特殊的函数
只能在函数组件中使用
为函数组件提供状态、生命周期等原本class组件中提供的React功能
根据功能而不是基于生命周期方法强制进行代码分割
具有更好的TS类型推导
tree-shaking友好，打包时去掉未引用的代码
更好的压缩

为什么要有Hooks?
Hooks 出现之前（React v16.8 以前）React 存在如下问题。
1. 组件的状态逻辑复用：
在Hooks之前，组件的状态逻辑复用经历了:mixins（混入）、HOCs（高阶组件）、render-props等模式。

（早已废弃）mixins 的问题：
1 数据来源不清晰 2 命名冲突。

HOCs、render-props 的问题：
重构组件结构，导致组件形成 JSX 嵌套地狱问题。

2. class组件自身的问题：
选择：函数组件和class组件之间的区别以及使用哪种组件更合适。
需要理解class中的this是如何工作的。
相互关联且需要对照修改的代码被拆分到不同生命周期函数中。
相比于函数组件来说，不利于代码压缩和优化，也不利于 TS 的类型推导
```

#### useState

````react
为函数组件提供状态（state）
import { useState } from "react"
const [count，setCount] = useState(0)

参数：
状态初始值。比如，传入0表示该状态的初始值为0。
状态可以是任意值（比如，数值、字符串等），而class组件中的状态必须是对象。

返回值：
数组，包含两个值：
当前状态count，相当于class中的state、
修改该状态的函数setCount，相当于class中的setState()
使用了数组解构语法，相当于创建了两个变量（可以是任意的变量名称）分别获取到对应索引的数组元素。

约定：
修改状态的函数名称以set开头，后面跟上状态的名称（比如，此处的set+Count）。

读取状态：
<h1>{count}</h1>
该方式提供的状态，就像函数的局部变量，因此，直接可以在函数内的任意位置使用

修改状态：
<button onClick={()=>setCount(count+1)}>+1</button>
setCount是一个函数，参数表示：新的状态值。
调用该函数后，将使用新的状态值替换旧值。
修改状态后，因为状态发生了改变，所以，该组件就会重新渲染

函数组件使用useState Hook后的执行过程，以及状态值的变化：
组件第一次渲染：
1. 从头开始执行该组件中的代码逻辑。
2. 调用 useState(0) 将传入的参数作为状态初始值，即：0。
3. 渲染组件，此时，获取到的状态 count 值为： 0。
组件第二次渲染：
1. 点击按钮，调用 setCount(count + 1) 修改状态，因为状态发生改变，所以，该组件会重新渲染。
2. 组件重新渲染时，会再次执行该组件中的代码逻辑。
3. 再次调用 useState(0)，此时 React 内部会拿到最新的状态值而非初始值，比如，该案例中最新的状态值为 1。
4. 再次渲染组件，此时，获取到的状态 count 值为：1。
注意：
useState 的初始值（参数）只会在组件第一次渲染时生效。
也就是说，以后的每次渲染，useState 获取到都是最新的状态值。
React 组件会记住每次最新的状态值

如果一个函数组件需要多个状态，该如何处理？
调用 useState Hook 多次即可，每调用一次 useState Hook 可以提供一个状态。
注意：
useState Hook 多次调用返回的 [state, setState] 相互之间，互不影响
````

#### useState 补充说明

```react
useState Hook返回的更新状态的函数为回调函数的情况：
setCount(prev => newState)：
参数：回调函数，其中prev表示上一次的状态值
返回值：newState，表示要更新的值

const [count,setCount] = useState(0)
setCount(prev => prev + 1)

使用场景：
在定时器代码中修改状态时，为了避免重复创建定时器，推荐使用第二种方式。
因为回调函数的方式对外层数据没有依赖，而有没有依赖会影响 useEffect 等 Hook 的执行过程
```

#### useEffect

```react
处理函数组件中的副作用（side effect）

副作用（side effect）：
是相对于主作用来说的，一个功能（比如，函数）除了主作用，其他的作用就是副作用
对于 React 组件来说，
主作用：
根据数据（state/props）渲染 UI
副作用：
手动修改 DOM、数据（Ajax）请求、console.log、修改全局变量、修改函数引用类型的参数（比如，参数是对象）等

import { useEffect } from "react"
useEffect(()=>{
	document.title = `当前点击次数${count}`
})

第一个参数：
回调函数（称为 effect），就是在该函数中写副作用代码。
执行时机：该 effect，会在每次组件更新（DOM更新）后执行

第二个参数不传：
问题：
如果组件中有除count外的另外一个状态，
另一个状态更新时，刚刚的 effect 回调，也会执行。

第二个参数传一个数组：
数组中的元素可以成为依赖项（deps）
该示例中，表示只有当 count 改变时，才会重新执行该effect
useEffect(()=>{
	document.title = `当前点击次数${count}`
}, [count])

第二个参数传一个空数组([])：
effect只会在组件第一次渲染后执行，
可以执行像事件绑定等只需要执行一次的操作
相当于 class 组件的 componentDidMount 钩子函数的作用
使用场景：事件绑定、发送请求获取数据 
useEffect(()=>{
	const onMouseMove = () =>consloe.log("鼠标移动了")
    window.addEventListener("mousemove", onMoseMove)
}, [])

effect 的返回值
可选，可以返回一个清理函数，用来执行事件解绑等清理操作

清理函数的执行时机：
第二个参数为空数组(没有依赖)：在组件卸载时执行
第二个参数为非空数组(有依赖项)：在effect重新执行前执行
相当于 class 组件的 componentWillUnmount 钩子函数的作用
useEffect(()=>{
	const handleResize = () =>consloe.log("浏览器窗口大小变了")
    window.addEventListener("resize", handleResize)
    return () => window.removeEventListener("resize", handleResize)
}, [])

推荐：
一个 useEffect 只处理一个功能，有多个功能时，使用多次 useEffect。

优势：
根据业务逻辑来拆分，相同功能的业务逻辑放在一起，
而不是根据生命周期方法名称来拆分代码。
编写代码时，关注点集中；而不是上下翻滚来查看代码。

useEffect Hook 发送请求获取数据（side effect）：
useEffect(()=>{
	const loadData = async () => {
        await axios(...)
    }
}, [])

注意：
effect 只能是一个同步函数，不能使用 async。
因为 effect 的返回值应该是一个清理函数，
React 会在组件卸载或者 effect 的依赖项变化时重新执行。
但如果 effect 是 async 的，此时返回值是 Promise 对象。
这样的话，就无法保证清理函数被立即调用。
如果延迟调用清理函数，也就没有机会忽略过时的请求结果或取消请求。
为了使用 async/await 语法，可以在 effect 内部创建 async 函数，并调用
```

#### useRef

```react
在 React 中进行 DOM 操作时，用来获取 DOM
返回一个带有 current 属性的可变对象，通过该对象可以进行 DOM 操作

import { useRef } from "react"
const inputRef = useRef<HTMLInputElement>(null)

参数：
在获取 DOM 时，一般都设置为 null。

泛型函数的类型变量 HTMLInputElement：
指定要获取的 DOM 元素的类型。这样，在进行 DOM 操作时，才有类型提示。

返回值：
包含 current 属性的对象，可以理解为：{ current: HTMLInputElement | null }

<input ref={inputRef} />
只要在 React 中进行 DOM 操作，都可以通过 useRef Hook 来获取 DOM
比如，获取 DOM 的宽高等
对于获取文本框的值来说，推荐使用受控组件方式来获取
更符合 React 库的定位，避免直接操作 DOM

```

####  useRef 高级用法

```react
useRef Hook 的用法：手动获取 DOM。比如，获取文本框，

const inputRef = useRef<HTMLInputElement>(null)

作用：
创建一个带有current属性的可变对象
此处可以理解为：{ current: HTMLInputElement | null }。

特点：
useRef 创建的对象将在组件更新期间保持（引用）不变。
可变对象：对象中 current 属性的值可以改变，可以存储任意数据。
保持不变：组件更新期间，获取到的是同一个对象（引用相等）。

useRef 的高级用法：
利用了保持不变这个特点。

场景一：
可以配合 React.memo 使用，保证对象引用相等

const useRef = useRef({ age: 18 })

<Child user={userRef.current} />

特点：
useRef 创建的对象将在组件组件更新期间保持引用不变。
所以，通过 current 属性，获取到的值（此处，为带有 age 属性的对象）也保持引用不变。

注意：
这种用法只适用于不包含 state/props 的对象。
因为其引用不变的特性，会导致无法获取到最新值。
所以，对于包含 state/props 的对象（比如，{ age: count }，count 为组件 state），
还应该使用 useMemo Hook。
    
场景二：
打破函数组件获取数据时的限制，拿到数据的最新值

const countRef = useRef(count)
useEffect(() => {
    countRef.current = count
}, [count])

setTimeout(() =>{
    console.log("count:", countRef.current)
},3000)

函数组件的特性：
每次特定渲染，都只能在代码中获取到那一次特定渲染时的数据（闭包的原因）。

不管是在 useEffect 还是在定时器的回调函数中，拿到的 countRef 都是同一个对象。
因此，useEffect 修改了 current 的值，
在定时器中就可以获取到这个修改后的值，也就是最新的 count 值。

注意：
修改 current 属性的值，不会让组件重新渲染。
只要想在组件更新期间获取到同一个数据，就可以使用 useRef 来实现。
```

#### 非空断言（!） 

```react
断言其操作内容是非 null 且非 undefined，文档链接（TS 提供的语法）。 

使用场景：
某个值的类型包含 null 或 undefined。
但是，在使用时我们确定该值一定存在。 
此时，就可以使用非空断言（!），告诉 TS 我很确定此处的值不可能为 null 或 undefined。 
这样，TS 就可以去掉类型中的 null 或 undefined 类型，从而在访问对象属性时不会报错。 

注意：
非空断言（!）仅仅是从 TS 类型中去掉 null 或 undefined 类型，从而在访问对象属性时不会报错。 
但是，该操作不保证代码运行的正确性，
如果值为 null 或 undefined，在代码运行时还是会报错
```

#### useContext

```react
获取 Context 中的值。要配合 Context 一起使用

<Context.Consumer>
在 JSX 中获取 Context 共享的数据

useContext
在 JS 代码中获取 Context 的数据

const ThemeContext = createContext("green")
const value = useContent(ThemeContext)

参数：
Context 对象，即：通过 createContext 函数创建的对象。

返回值：
Context 中提供的 value 数据
```

#### useReducer

```react
作用：
类似于 useState Hook，用来为函数组件提供状态
使用场景：
当组件的状态逻辑复杂或下一个（新）状态取决于上一个（旧）状态时
优势：
将组件内部的逻辑处理抽离到组件外部（reducer 函数），减轻组件自身的负担

此处的 reducer、dispatch、action 与 Redux 中的概念相同

const [state, dispatch] = useReducer(reducer, initialState)

第一个参数：
reducer 函数，处理状态逻辑。
签名为 (state, action) => newState，根据当前状态计算出新的状态并返回。

第二个参数：
initialState 状态初始值。

返回值：
状态（state）、修改状态的函数（dispatch）

dispatch({ type: "increment", payload:1 })

参数：
action（动作，描述要做什么），
即：带有 type 属性的对象，type 表示当前 action 的类型。
对象中的其他属性（比如，payload）表示传递给要做的事情的数据
```

#### 自定义 Hooks

```react
const useTodos = (initialValue:TodoItem[]) =>{
	const [todo, setTodos] = useState(initialValue)
	...onAdd等事件处理程序的逻辑代码
	return {todos,onAdd,onToggle,onDelete}
}

const {todos,onAdd,onToggle,onDelete} = useTodos(initialValue)

<TodoContext.Provider
	value={{ todos, onToggleTodo:onToggle,onDeleteTodo:onDelete}}
></TodoContext.Provider>
```

#### 函数组件的特性

```react
React 中的函数组件是通过函数来实现的，
函数组件的公式：f(state) => UI，
即：数据到视图的映射

特性：
对于函数组件来说，每次状态更新后，组件都会重新渲染。
并且，每次组件更新都像是在给组件拍照。每张照片就代表组件在某个特定时刻的状态。
或者说：组件的每次特定渲染，都有自己的 props/state/事件处理程序 等。
这些照片记录的状态，从代码层面来说，是通过 JS 中函数的闭包机制来实现的。

导致的问题：
1. 组件每次重新渲染时，组件内部的事件处理程序等函数都会重新创建，
导致子组件每次都会接收到不同的 props，从而重复进行不必要的渲染（性能问题）。

2. 组件内的事件处理程序等函数中，只能获取到那一次特定渲染时的数据，这是合理的（闭包的原因）。

说明：
函数组件配合 Hooks 使用时，会不会因为闭包以及每次都创建新的函数等，让组件变慢？
答案：
不会！

注意：
在没有发现性能问题前，避免过早的性能优化。
如果要优化，一定要考虑优化成本是否大于优化后的价值。

对于第一个问题，我们使用 React.memo 配合 useCallback/useMemo 这两个 Hooks 来解决。
对于第二个问题，我们使用 useRef Hook 来解决

```

#### React 组件更新机制

```
只要父组件状态更新，子组件就会无条件的一起更新。

子组件 props 变化时更新过程：
组件代码执行 -> JSX Diff（配合虚拟 DOM）-> 渲染（变化后的内容）【 DOM 操作】。

子组件 props 无变化更新过程：
组件代码执行 -> JSX Diff（配合虚拟 DOM）【无 DOM 操作】

注意：
此处更新指的是组件代码执行、JSX 进行 Diff 操作
（纯 JS 的操作，速度非常快，不会对性能产生太多影响）
如果组件 props 改变了，那么，该组件就必须要更新，才能接收到最新的 props。
但是，如果组件 props 没有改变时，组件也要进行一次更新。
实际上，这一次更新是没有必要的
```

#### React.memo 高阶组件

```react
记忆组件上一次的渲染结果，在 props 没有变化时复用该结果，避免函数组件不必要的更新

const MemoChild = React.memo(Child)

解释：
React.memo 是一个高阶组件，用来记忆（memorize）组件。

参数（Child）：
需要被记忆的组件，或者说是需要避免不必要更新的组件。

返回值（MemoChild）：
React 记住的 Child 组件。

原理：
通过对比检查更新前后 props 是否相同，来决定是否复用上一次的渲染结果，
如果相同，复用上一次的渲染结果；
如果不同，重新渲染组件

默认情况下，
React.memo只会对更新前后的props进行浅对比(shallow compare与PureComponent相同)
也就是说，对于对象类型的props来说，只会比较引用

如果更新前后的引用相同，复用上一次的渲染结果（不会重新渲染该组件）。
如果更新前后的引用不同，重新渲染该组件

如果你要手动控制比较过程，可以使用 React.memo 的第二个参数
React.memo(Child,function areRqual(prevProps. nextProps){
    return prevProps === nextProps
})
第二个参数：
用来比较更新前后 props 的函数。

返回值：
如果返回 true，表示记住（不重新渲染）该组件；如果返回 false，表示重新渲染该组件
```

#### useCallback

```react
在使用 React.memo 时，对于对象类型的 props，只会比较引用（浅对比）。
但是，因为组件每次更新都会创建新的 props 值，比如，新的对象、事件处理程序等（函数组件的特性）。
这就导致：React.memo 在处理对象类型的 props 时，会失效（每次的 props 都是新对象）。
但是，我们还是想让 React.memo 在处理对象类型的 props 时，也有效。
为了让 React.memo 处理对象类型的 props 有效，只要在组件更新期间保持对象类型引用相等，就可以了。
这时候，就要用到以下两个 Hooks：
l useCallback Hook：记住函数的引用，在组件每次更新时返回相同引用的函数。
l useMemo Hook：记住任意数据（数值、对象、函数等），在组件每次更新时返回相同引用的数据【功能之一】

使用场景：
在使用 React.memo 时，为了组件每次更新时都能获取到相同引用的函数，就要用到 useCallback Hook。

注意：
需要配合 React.memo 高阶函数一起使用。

作用：
记忆传入的回调函数，这个被记住的回调函数会一直生效，直到依赖项发生改变。

const memorizedCallback = useCallback(() => {
    doSomething(a,b)
}, [a,b])

第一个参数：
必选，需要被记忆的回调函数。

第二个参数：
必选，依赖项数组，用于指定回调函数中依赖（用到）的数据（类似于 useEffect 的第二个参数）。

即使没有依赖，也得传入空数组（[]），此时，useCallback 记住的回调函数就会一直生效。
返回值
useCallback记住的回调函数。

useCallback记住的回调函数会一直生效（或者说会一直返回同一个回调函数），直到依赖项发生改变
```

#### useMemo

```react
使用场景：
类似于 useCallback，可以在组件更新期间保持任意数据引用相等，一般用来处理对象类型的数据。

对比：
useCallback 只能记忆函数，而 useMemo 可以记忆任意数据。

作用：
记忆任意数据，这个被记住的数据会一直生效，直到依赖项发生改变

const memorizedValue = useMemo(() => 需要记住的数据, deps)

第一个参数：
必选，回调函数。注意：该回调函数会被调用，并通过返回值指定需要被记住的数据。

第二个参数：
必选，依赖项数组，用于指定回调函数中依赖（用到）的数据。同样，没有依赖项时，传入空数组（[]）。

返回值：
useMemo 记住的数据。

useMemo 记住的数据会一直生效（或者说会一直返回同一个数据），直到依赖项发生改变。

如何选择使用哪一个？
如果处理的是函数，推荐使用 useCallback Hook。
如果处理的是其他数据（比如，对象），推荐使用 useMemo Hook。

useMemo Hook 可以记忆任意数据。
因此，可以通过 useMemo 记忆函数，来模拟 useCallback Hook 的功能：

const handleClick =useMemo(() => {
    return () => {
        setCount(count + 10)
    }
}, [count])

const handleClick =useCallback(() => {
        setCount(count + 10)
}, [count])

useCallback 的第一个参数，就是要记忆的函数。
useMemo 的第一个参数的返回值，才是要记忆的数据（比如，此处的 onClickCallback）。

注意：
对于useCallback来说，第一个参数就是要记忆的函数（红线标记），该函数不会立即执行，只有调用时才会执行。
对于useMemo来说，第一个参数的返回值才是要记忆的函数，所以为了拿到返回值，第一个参数（绿线）会立即执行。

useMemo Hook 可以记忆任意数据。
因此，可以通过 useMemo Hook 来记忆 React 组件，模拟 React.memo 高阶组件的功能：

const child = useMemo(() => <Child user={{ age: count }} />, [count])
<div>{child}</div>

使用 useMemo Hook 记忆 Child 组件。
该组件只会在依赖项 count 改变时，重新渲染；否则，会直接复用上一次 useMemo 记住的结果。
此时，返回值 child 就表示 Child 组件。因此，直接在 JSX 中渲染 child 即可。
说明：
因为 JSX（此处，<Child />）最终会转化为 JS 对象，所以，可以将 React 组件存储到变量中通过 {} 来使用。

useMemo 除了可以记忆任意数据，在组件更新期间保持数据（一般是对象类型）引用相等外，还有其他使用场景。

更重要的使用场景：
如果数据是通过昂贵的计算得到的，可以通过 useMemo 记忆计算结果，直到依赖项发生改变。
从而，避免重复计算，提升性能。

不使用 useMemo Hook：
组件每次更新时都会重新执行该函数中的代码，造成重复计算。

使用了 useMemo Hook：
记忆计算结果，并只在依赖项 count 改变时，重新执行该函数中的代码，避免重复计算。

注意：
useMemo 可以单独使用，也就是不用总是配合 React.memo 使用。此时，也不需要父子组件嵌套。
```

#### Hooks 实现原理

```react
模拟实现 useState Hook 和 useEffect Hook，来理解 Hooks 的实现原理。

先实现 useState Hook，
目标：
1. 支持组件内只使用一次 useState，即：提供一个状态。
2. 支持组件内多次使用 useState，即：提供多个状态。
目标一的分析：
1. 基于计数器案例，来实现 useState Hook 的功能（此时，状态为数值类型）。
2. 根据 useState Hook 的使用方式，来为其提供参数和返回值。
3. 因为调用 setCount 修改状态的函数时，要重新渲染组件。所以，封装 render 函数，来达到更新组件的目的。
4. 组件每次更新时都会再次调用 useState()，我们要保证能够获取到最新值。

模拟实现 useState Hook
1. 【已完成】支持组件内只使用一次 useState，即：提供一个状态。
2. 支持组件内多次使用 useState，即：提供多个状态。

问题：
现在基于目标一实现的 useState ，在组件内多次使用 时，多个状态之间会相互影响。

原因：
多次使用 useState，用的是同一个 state 变量存储状态数据，所以，会相互影响。

解决思路：
使用数组存储这些状态数据；按照使用 useState 时的顺序作为索引，来保存或读取这些数据。

const [count, setCount] = useState(100)
const [age, setAge] = useState(16)
state[0] = 100
state[1] = 16

对比模拟实现的 useState 与 React 中的 useState：
模拟实现 useState：通过数组+索引变量来存储状态数据
React 的 useState：通过链表（数据结构）来实现

关键点：
保证组件每次渲染时，都以相同的顺序调用 Hooks（适用于 Hooks）。

type Hook = {
    memoizedState: any,
    baseState: any,
    next: Hook | null,
}

let hook: Hook
hook
hook.next
hook.next.next

Hooks 的使用规则：
1. 只能在函数组件或自定义 Hooks 中使用
2. 只能在最顶级使用，不能在 if/for/嵌套函数中使用（如果这样做，无法始终保持一致的调用顺序）

注意：
如果没有遵循以上规则，会有错误提示（对应的 ESLint 规则：eslintreact-hooks/rules-of-hooks）
```

