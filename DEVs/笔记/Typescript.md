# TypeScript

## 介绍

```
JavaScript的超集
TypeScript = Type + JavaScript（在 JS 基础之上，为 JS 添加了类型支持）
微软开发的开源编程语言，可以在任何运行 JavaScript 的地方运行

为什么要为 JS 添加类型支持？
背景：
JS 的类型系统存在“先天缺陷”，JS 代码中绝大部分错误都是类型错误（Uncaught TypeError）。
问题：
增加了找 Bug、改 Bug 的时间，严重影响开发效率。

从编程语言的动静来区分：
TypeScript 属于静态类型的编程语言，编译期做类型检查； 
JS 属于动态类型的编程语言，执行期做类型检查。

代码编译和代码执行的顺序：
编译、执行。
对于 JS 来说：
需要等到代码真正去执行的时候才能发现错误（晚）。
对于 TS 来说：
在代码编译的时候（代码执行前）就可以发现错误（早）。
配合开发工具，TS 可以提前找到在编写代码的同时就发现代码中的错误，减少找Bug、改Bug时间

优势
1. 更早（写代码的同时）发现错误，减少找 Bug、改 Bug 时间，提升开发效率。
2. 程序中任何位置的代码都有代码提示，随时随地的安全感，增强了开发体验。
3. 强大的类型系统提升了代码的可维护性，使得重构代码更加容易。
4. 支持最新的 ECMAScript 语法，优先体验最新的语法，让你走在前端技术的最前沿。
5. TS 类型推断机制，不需要在代码中的每个地方都显示标注类型，在享受优势的同时，降低了成本。

Vue 3 源码使用 TS 重写、
Angular 默认支持 TS、
React 与 TS 完美配合，
TypeScript 已成为大中型前端项目的首先编程语言

TS代码转化为JS代码的工具包
npm i -g typescript\yarn global add typescript
tsc -v

简化运行TS步骤的工具包
npm i -g ts-node\yarn global add ts-node
ts-node -v
```

## 常用类型

#### 介绍

```typescript
类型注解
let age: number = 18
代码中的 :number 就是类型注解

为变量添加类型约束。
约定了什么类型，就只能给变量赋值该类型的值，否则，就会报错。
```

#### JS已有类型

```typescript
原始类型：
number/string/boolean/null/undefined/symbol。
特点：
简单。这些类型，完全按照 JS 中类型的名称来书写。

对象类型：
object（包括，数组、对象、函数等对象）。
特点：
对象类型，在 TS 中更加细化，每个具体的对象都有自己的类型语法
```

##### 数组类型

```typescript
let number: number[] = [1, 3, 5]
let string: Array<string> = ['a', 'b', 'c']
```

##### 函数类型

```typescript
函数参数和返回值的类型
为函数指定类型的两种方式：
1、单独指定参数、返回值的类型
function add(num1: number, num2: number): number {
    return num1 + num2
}
const add = (num1: number, num2: number):number => {
    return num1 + num2
}
2、同时指定参数、返回值的类型
当函数作为表达式时，可以通过类似箭头函数形式的语法来为函数添加类型。
const add:(num1: number, num2: number) => number = (num1 + num2) => {
    return num1 + num2
}

void
如果函数没有返回值，那么，函数返回值类型为：void
function greet(name: string): void {
    console.log("Hello", name)
}

可选参数
在可传可不传的参数名称后面添加 ?（问号）。
可选参数只能出现在参数列表的最后，也就是说可选参数后面不能再出现必选参数。
function mySlice(start?: number, end?: number): void {
    console.log("起始索引：", start, "结束索引：", end)
}
```

##### 对象类型

```typescript
JS中的对象是由属性和方法构成的
TS中对象的类型在描述对象的结构（有什么类型的属性和方法）
let person: { name: string; age: number; sayHi(): void } = {
    name: "jack",
    age: 19,
    sayHi() {}
}

1. 直接使用 {} 来描述对象结构。属性采用属性名: 类型的形式；方法采用方法名(): 返回值类型的形式。
2. 如果方法有参数，就在方法名后面的小括号中指定参数类型（比如：greet(name: string): void）。
3. 在一行代码中指定对象的多个属性类型时，使用 ;（分号）来分隔。
如果一行代码只指定一个属性类型（通过换行来分隔多个属性类型），可以去掉 ;（分号）。
方法的类型也可以使用箭头函数形式（比如：{ sayHi: () => void }）


```



#### TS新增类型

```typescript
联合类型、自定义类型（类型别名）、接口、元组、字面量类型、枚举、void、any 等。

联合类型:
| (竖线)
由两个或多个其他类型组成的类型，表示可以是这些类型中的任意一种
eg:
let arr: (number | string)[] = [1, 'a',3, 'b']

类型别名（自定义类型）:
为任意类型起别名。
当同一类型（复杂）被多次使用时，可以通过类型别名，简化该类型的使用
使用 type 关键字来创建类型别名。
类型别名（比如，此处的 CustomArray），可以是任意合法的变量名称。
创建类型别名后，直接使用该类型别名作为变量的类型注解即可。
eg:
type CustomArray = (number | string)[]
let arr: CustomArray = [1, 'a',3, 'b']






```

```typescript
```

```typescript

```

```typescript
```

```typescript
```

```typescript
```

## 高级类型

```typescript
```



## 高级类型

```typescript
```



## 在 React 中使用 TypeScript

```typescript
```



