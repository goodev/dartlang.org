---
layout: article
title: "Dart 的可选类型"
description: "可选类型是 Dart 语言的一种革命性创新。
这篇文章介绍可选类型是如何实现的。"
rel:
  author: gilad-bracha
article:
  written_on: 2011-10-01
  updated_on: 2012-09-01
  collection: language-details
---

{% include toc.html %}

# {{ page.title }}

<em>作者： Gilad Bracha<br />
2011 10月 (2012 9月更新)</em>


可选类型是 Dart 语言的一种革命性创新。
这篇文章介绍可选类型是如何实现的。

## 概览


Dart 是动态类型语言。你可以和使用 JavaScript 一样不用类型声明就
可以编写、运行 Dart 程序。

你也可以选择在代码中添加类型声明：


* 添加类型声明并 *不会* 妨碍你的程序编译和运行 -- 即使你的类型声明不完整或者声明错了。prevent your program from
* 无论添加了什么类型声明，你的程序语义都是一样的。


虽然如此，使用类型也可以获取很多收益。
类型提供了如下优点：


* 方便人类理解。
    如果使用类型声明，则他人能比较容易的阅读你的代码。
* 方便电脑理解。
    工具可以有多种方式使用类型。
    特别是一些 IDE 中的 代码提示和改进的代码导航等非常棒的特性。
* 早期错误检测。
    Dart 有一个静态分析器来告诉你代码中的潜在问题。
    另外在 开发模式下，
    Dart 自动把类型声明转化为运行时断言来辅助调试代码。
* 有时，类型可以帮助提高编译为 JavaScript 后的性能。
    后面我们将介绍该问题的更多信息。

## 静态检查


静态检查和 C 中的 lint 类似。
在编译的时候提示你一些潜在的问题。
很多提示都和类型相关。
静态检查并*不会*提示错误情况 &mdash; 
无论静态检查的结果如何，你都可以编译和运行你的代码。


静态检查并没有报告所有的类型问题。
静态检查不是一个 类型检查器，Dart 和 普通的静态类型系统使用类型的方式有所区别。
静态检查的警告非常有可能真的就是一个问题，而不是报告
一些通过强制类型转换就可以满足类型系统的一些无聊的信息。


例如：


{% prettify dart %}
class Point {
  final num x, y;
  Point(this.x, this.y);
  Point operator +(Point other) {
    return new Point(x+other.x, y+other.y);
  }
  String toString() {
    return "x: $x, y: $y";
  }
}

main() {
  var p1 = new Point(0, 0);
  var p2 = new Point(10, 10);

  int n = p1 + p2;

  print(n);
}
{% endprettify %}


很明显上面的代码有问题。
这种情况下 静态检查 会发出一个警告信息。



<img src="imgs/static-warning.png" width="665" height="363"
     alt="Static warning in Dart Editor"
     style="border: 1px solid gray; box-shadow: 5px 5px 5px rgba(50, 50, 50, 0.25);">


注意，上面的代码依然可以运行，
设置  <code>n</code> 为 Point 的一个
实例并打印结果  <code>x: 10, y: 10</code>。



然而和强制类型系统不同，这样的代码


{% prettify dart %}
Object lookup(String key) { /* ... */ } // a lookup method in a heterogenous table
String s = lookup('Frankenstein');
{% endprettify %}


在 静态检查 看了完全没问题。
原因就是，除了类型信息外，上面的代码很有可能是完全正确的。
你-写代码的人-通常具有语义分析知识，而类型检测器没有。
尽管该函数声明的返回值为 <code>Object</code>，但是
你知道保存在 'Frankenstein' 表中的值为一个 字符串。


## 动态（dynamic）类型


当没有提供类型的时候 Dart 是如何避免出错的呢？
关键点就在于 <code>dynamic</code> 类型，
当没有设置类型的时候， Dart 就认为其为 <code>dynamic</code> 类型。
使用 <code>dynamic</code> 来满足类型检查的要求。


有些情况下你可能需要直接使用 <code>dynamic</code>。


{% prettify dart %}
Map<String, dynamic> m = {
    'one': new Partridge(),
    'two': new TurtleDove(),
    /* ..., */
    'twelve': new Drummer()};
{% endprettify %}


上面的示例中，我们可以把  <code>m</code> 类型声明为
<code>Map&lt;String, Object></code> ，
但是这样的话，当从 map 获取内容的时候，返回值将有一个静态类型 <code>Object</code>。
既然 map 的值除了 <code>Object</code> 以外没有一个更加通用的接口，
我们推荐用  <code>dynamic</code>。
如果我们尝试用如下代码来使用 map 的值，


{% prettify dart %}
pearTree = m['one'].container();
{% endprettify %}


如果值的类型为 <code>Object</code>， 我们就会收到一个警告说，
<code>Object</code> 不支持 container 操作。
如果我们用 <code>dynamic</code> 类型，则不会出现该警告。


## 泛型


Dart 支持具体的泛型。
泛型类型的对象在运行时还带有类型参数。
把类型参数传递给构造函数来创建一个泛型类型是一个运行时操作。
这是如何符合可选类型需求的呢？


然而，如果你从来不想用类型声明，则
泛型并不强迫你使用。
你可以不提供类型参数来创建一个泛型类型的类。
例如：


{% prettify dart %}
new List();
{% endprettify %}


这样是可以的，当然你也可以这样用：


{% prettify dart %}
new List<String>();
{% endprettify %}

。 


{% prettify dart %}
new List();
{% endprettify %}


是 


{% prettify dart %}
new List<dynamic>();
{% endprettify %}

的简写形式。

在构造函数中，类型参数是一个运行时规则。
他们是在运行的时候起作用的，
所以可以用来当做动态类型判断：


{% prettify dart %}
new List<String>() is List<Object>  // true: every string is an object 
new List<Object>() is List<String>  // false: not all objects are strings
{% endprettify %}


Dart 中的泛型符合程序员的直觉。
下面是一些有趣的情况：


{% prettify dart %}
new List<String>() is List<int>     // false
new List<String>() is List          // true
new List<String>() is List<dynamic> // same as line above
new List() is List<dynamic>         // true, these are exactly the same
{% endprettify %}

相比而言，类型声明
(例如，变量的类型定义、方法/函数的返回值类型)
在运行时不起作用，所有不影响程序语义。
最后一个示例值得研究下：


{% prettify dart %}
new List() is List<String>          // true as well!
{% endprettify %}


你可以不用类型来些代码，
但是你会经常把数据传递给带有类型的库。
为了避免类型干扰你，
没有类型的泛型类型被当做其他任意类型的泛型看待。


## Checked mode（检查模式）


在开发阶段，Dart 代码可以运行在检查模式。
如果运行在检查模式，
系统会自动运行一些参数的类型检查、返回值类型检查和赋值类型检查。
如果类型检查失败，
则报出错误信息停止执行。


{% prettify dart %}
String s = new Object();
{% endprettify %}

由于 <code>Object</code>  不是 <code>String</code> 的子类型，
所以该代码将不会执行。
然而


{% prettify dart %}
Object foo() {
  return "x";
}
String s = foo();
{% endprettify %}


可以执行。
尽管 foo 声明的返回类型为 <code>Object</code>，但是
函数 foo 在运行时返回的对象为 <code>String</code>，所以通过检查。
当一个对象赋值到一个变量的时候，
Dart 检查该对象的运行时类型是否是声明类型的子类型。



本质上，检查模式就相当于在调试器中运行代码并在每个赋值、返回值等地方设置一些类型检查。
更多示例：

{% prettify dart %}
<int>[0,1, 1][2] = new Object(); // fails in checked mode

bar(int n) {
  return n *2;
}
...
bar(3.2); // returns 6.4 in production, but fails in checked mode
{% endprettify %}


在检查模式下，每次用参数调用函数的时候，该参数的运行时类型被用来检查是否符合函数声明的类型。
修复上面的问题非常简单：


{% prettify dart %}
bar(num n) {
  return n *2;
}

...

bar(3.2); // works fine

int i_bar(num n) {
  return n *2;
}

...

i_bar(3.2); // fails in checked mode
            // because returned value is not an int
{% endprettify %}


注意最后一行代码。
尽管返回值并没有赋值给任何对象，但是在返回的时候还是
检查了该值的类型。



下面再回来看看 Frankenstein。


{% prettify dart %}
Object lookup(String key) { /* ... */ } // a lookup method in a heterogenous table
String s = lookup('Frankenstein');
{% endprettify %}


如果我们认为在运行的时候该函数返回的是一个字符串，则在检查模式下执行没问题。
如果不是，则会发出错误信息提示我们认为的条件是错误的。
在生产环境下，上面的代码将能够正常执行。
假设上面的代码返回值不是一个字符串，例如是  <code>Frankenstein</code> 实例。
变量 <code>s</code> 将引用该实例。
Dart 不会强制把该实例转化为字符串。
如果这样做了，则说明类型声明修改了我们代码的行为，这说明类型不是可选的了。



当如，如果你根本不使用类型，则
检查模式对你没有任何作用。


{% prettify dart %}
my_add(s1, s2) {
  return s1 + s2;
}

my_add(3, 4); // 7
my_add(new Point(3, 3), new Point(4, 4)); // Point(7, 7)
{% endprettify %}

这些检查将引起一些性能问题，所有不会在生产环境下运行这些类型检查。
这些检查的优点主要是用来查找代码中的动态类型陷阱并帮助你
可以比较容易的调试问题。
当如，大部分的问题都是在测试的时候发现的，但是检查模式可以帮助你定位这些问题。


## 使用类型


如何使用类型取决于你。
如果你不喜欢类型，则你可以完全不用。
你可以和使用其他动态语言一样来使用 Dart 并且不会有任何类型的警告信息。
由于 Dart 库都带有类型信息，他们告诉你接受什么类型的参数和返回什么类型的值，
所以你依然可以从类型中受益。
如果在检查模式下运行，如果你使用了错误的类型参数调用库，则
会发出错误信息帮助你修复代码。


如果你喜欢类型，则你可以在任意地方使用类型。
你可以按照普通的静态类型语言来使用类型，但是你不会限制在同样的静态类型检查问题中。
Dart 的规则并不是十分严格。
我们期望通过提供额外的工具来帮助
处理类型问题。



我们并不推荐上面这两种极端情况。
如果有意义就使用类型，否则就不用。
在库的公共变量中添加类型是比较有价值的。
然后就是私有变量类型声明。
即使没有其他人维护代码，当你几个月后再来看
自己的代码，就会发现类型是非常有帮助的。

在方法代码中，并不是总需要类型，有时候代码足够简单，
使用类型会让代码看起来比较凌乱。


通常，你应该避免类型影响你的代码设计。
有些情况下，也有不同的设计，有些设计使用类型比没类型更加好用。
例如，相对于使用函数名字字符串通过反射来调用函数来说，如果可以
把函数当做参数来使用，则代码会更加高效、类型检查也更容易。
Dart 并不鼓励无理由的使用反射。然而，如果反射真的有意义，则你应该毫不犹豫的使用。
