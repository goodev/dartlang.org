---
layout: article
title: "Dart 代码风格指南"
rel:
  author: bob-nystrom
description: "遵守这些风格指南来编写一致的易读的 Dart 代码。"
has-permalinks: true
article:
  written_on: 2011-10-01
  updated_on: 2013-10-04
  collection: everyday-dart
---

{% include toc.html %}

# {{ page.title }}

<em>作者： Bob Nystrom<br />
译者： 云在千峰<br />
<time pubdate date="2011-10-27">2011 十月</time>
(2013 十月 更新)
</em>

当建造一个 Dart 代码生态的时候，如果都使用一致的代码风格则比较容易使用。
Dart 需要一个专业的风格指南来帮助我们设计语言独特的特性，并且大家协作
起来
更加方便。

在该指南中很有可能有些内容你并不同意。作为作者，其中
的有些内容我自己都不同意。我希望你能明白，代码的一致性比我们
自己的偏好更加重要。

在心中记住一点，和 Dart 中的很多内容一样，该风格指南并不是一成不变的。
随着语言的演进和逐步的使用 Dart，我们的风格指南也会进化。
这就意味着，不可避免的会有些代码不符合最新的风格指南，
或者有些地方风格指南是含糊不清的或者尚未定论的。
请耐心的等待我们一会，随着 Dart 语言和库逐步的文档，
这些内容会逐渐完善的。

## 如何阅读该指南

该指南从宏观到微观大概的分为几个部分。
每个部分都包含一些风格指南。
每个都依如下四个词语开始：

* **确保** 指南说明应该总是遵守该风格。
从来没有适当的理由不遵守这些风格。

* **不要** 指南恰恰相反：这样做从来不是一种好注意。
你会发现有一些这种建议。其他语言的这种指南
都是经过长时间的积累来发现的一些陷阱。
Dart 是新的语言，所以我们直接修复这些陷阱并
避免使用它们。

* **推荐** 指南是一些你 *应该* 遵守的实践。然而，
有些情况下按照其他的方式做可能也有道理。当你不
遵守这些指南的时候，确保你自己知道你在做什么。

* **避免** 指南是推荐的反义词：你不应该这么做，
但是很少情况下或许有这么做的理由。

听上去这些就像如果你不系好你的鞋带，警察
就会找上门来一样。然而事实上并没有这么糟糕。
大部分的风格指南都是常见的情况，并且我们也是讲道理的凡人。我们的目标总是一样的：
编写出优雅的、可读的和可维护的代码。

## 类型

#### 避免 创建只包含静态成员的类

在 Java 和 C# 中，所有的成员必需位于类中。在这些语言中，
你有时只是用这些类作为命名空间：只是用来保存一些静态成员。
Dart - 有点类似 Python 和 JavaScript -  并没有这些限制。
你可以随意的在顶级代码中定义变量和函数。

通过导入包并使用前缀可以避免命名冲突的问题。
这个优点是，当命名冲突*没有*发生的时候（只有
*使用*该库的人知道，库的创建者并不知情），用户不需要
在任何调用的地方都完全引用全称。

这并不意味着你不应该有*任何*的静态成员，
但是创建一个*只有*静态成员的类是非常少见的。
相反，这些应该是库。大部分的类应该代表你要构造的东西。

<div class="good">
{% prettify dart %}
library utils;

num distance(num x1, num y1, num x2, num y2) {
  /* ... */
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
library utils;

class GeometryUtils {
  static num distance(num x1, num y1, num x2, num y2) {
    /* ... */
  }
}
{% endprettify %}
</div>

#### 避免 定义只有一个成员的抽象类，如果一个简单的函数可以实现该功能。

和 Java 不一样，Dart 支持 first-class（类等）函数、闭包、和使用它们的优雅轻量的语法。
如果你只需要一个回调函数，只需要用一个函数即可。
如果你定义一个只包含一个成员的抽象类，并且该类的成员名字为
没有业务意义的 `call` 或者 `invoke`，这通常意味着
你只要使用一个函数即可。

<div class="good">
{% prettify dart %}
typedef bool Predicate(item);
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
abstract class Predicate {
  bool test(item);
}
{% endprettify %}
</div>

## 成员

#### 确保 使用构造函数而不是静态函数来创建实例


使用 `new` 或者 `const` 来调用构造函数，在调用的时候就清楚的知道
一个对象会被创建。Dart 中的命名构造函数和工厂构造函数
为你提供了其他语言静态函数提供的功能，对于调用者而言
和调用常规的构造函数类似。

<div class="good">
{% prettify dart %}
class Point {
  num x, y;
  Point(this.x, this.y);
  Point.zero()
      : x = 0,
        y = 0;
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
class Point {
  num x, y;
  Point(this.x, this.y);
  static Point zero() => new Point(0, 0);
}
{% endprettify %}
</div>

#### 确保 使用 `;` 来替代 `{}` 作为空构造函数的函数体


在 Dart 中，一个空内容的构造函数可以只用一个分号结尾。
const(常量) 构造函数*需要*这样。
为了一致性和简洁性，其他空构造函数也应该这样。

<div class="good">
{% prettify dart %}
class Point {
  int x, y;
  Point(this.x, this.y);
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
class Point {
  int x, y;
  Point(this.x, this.y) {}
}
{% endprettify %}
</div>

#### 确保 把 `super()`放到构造函数初始化列表后面调用


域（Field）初始化是按照他们出现在构造函数初始化列表的顺序计算值的。
如果你在初始化列表中间调用了 `super()`，则
父类的初始化会在子类的初始化还没执行完的时候
立即执行。

这并*不意味着*父类的*构造函数体*也会执行。
构造函数体只会在所有的初始化代码执行完后执行，而不论你把 `super()` 放到哪里调用。
通常不会出现初始化循序的问题，所以把 `super()` 放到
初始化列表中也不会出现啥大的问题。

习惯上把它放到最后可以提高代码一致性和视觉上强调
父类构造函数体执行的顺序，也可能有利于
提高性能。

<div class="good">
{% prettify dart %}
View(Style style, List children)
    : _children = children,
      super(style) {
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
View(Style style, List children)
    : super(style),
      _children = children {
{% endprettify %}
</div>

#### 确保 使用 getter 来执行概念上像访问一个属性的操作


如果函数的名字以 `get` 开头，或者一个形容词，例如 `visible` 或者
`empty` ，这通常是使用 getter 的标志。更具体的，
当如下情况时，应该使用 getter 来替代函数：

  * **没有任何参数。**
  * **返回一个值。**
  * **没有副作用。** 调用 getter 不应该改变任何外部可见的
  状态（内部缓存和延时初始化是可以的）。
  重复的调用 getter 应该返回同样的值，除非该对象在调用之间明显的被修改过了。
  * **非常快。** 用户期待像 `foo.bar` 这种操作应该执行很快。

<div class="good">
{% prettify dart %}
num width = rect.width;
bool allGone = collection.isEmpty;
bool canSee = button.visible;
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
num amount = accounts.sum;           // may be slow to calculate
DateTime timeStamp = DateTime.now;   // returns different value each call
window.refresh;                      // doesn't return a value
{% endprettify %}
</div>

#### 确保 用一个 setter 来执行概念上像设置一个属性的操作


如果函数的名字以 `set` 开头，通常意味着该函数是一个 setter。
更具体的，当如下情况发生应该用 setter 替代 函数：

  * **需要一个参数。**
  * **改变对象的一些状态。**
  * **有一个对应的 getter。** 对于用户来说，只能修改而不可见的状态是非常奇怪的。
   (反正则不一样，只有 getter 没有 setter 是
   可以理解的。)
  * **是幂等（idempotent）的。** 用同样的值调用同一个 setter 两次，第二次
  调用应该没有任何效果。
  * **非常快。** 对于像 `foo.bar = value` 这种操作，用户认为应该非常快。

<div class="good">
{% prettify dart %}
rect.width = 3;
button.visible = false;
{% endprettify %}
</div>

#### 避免 只是为了"安全"而为一个变量提供 getter 和 setter 函数


在 Java 和 C#中，把所有的成员变量用 getter 和 setter 函数隐藏起来是很常见的。
大部分情况下 getter 和 setter 的实现只是赋值和返回该值。
因为 Java 中的成员变量和 getter 函数是不一样的，
所以
如果你只是用来访问该成员变量，你无法直接调用成员变量。

Dart 没有这个限制。Dart 中的成员变量和 getter/setter 是完全难以区分的。
你可以先暴露一个成员变量让其他人访问，而后你发现需要做些操作的时候，
你可以添加一个该变量的 getter 和 setter，但是调用方式依然不变。

<div class="good">
{% prettify dart %}
class Box {
  var contents;
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
class Box {
  var _contents;
  get contents => _contents;
  set contents(value) {
    _contents = value;
  }
}
{% endprettify %}
</div>

#### 推荐 使用一个 public final 成员变量来替代一个带有 getter的 私有变量


如果你有一个成员变量，外部的代码可以看到该变量但是无法修改其值
（你也无须在构造函数以外设置该变量的值），
大多数情况下都适用的一种方式就是把该变量设置为 `final` 的。

<div class="good">
{% prettify dart %}
class Box {
  final contents = [];
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
class Box {
  var _contents;
  get contents => _contents;
}
{% endprettify %}
</div>

#### 推荐 使用 `=>` 来定义函数体只是返回单个表达式的函数


在函数表达式中使用 `=>` ，你还可以定义局部变量。
这种语法特别适合只有一个简单的变量并返回其
计算结果。

<div class="good">
{% prettify dart %}
get width => right - left;
bool ready(num time) => minTime == null || minTime <= time;
containsValue(String value) => getValues().contains(value);
{% endprettify %}
</div>

并非只有一行代码的函数体才能用 `=>`， 但是如果
你发现一个表达式需要用多行显示的时候，为了代码清晰的考虑，
最好还是用花括号和 `return` 语句来实现函数体。

#### 避免 使用没有实际意义的布尔参数


和其他类型不同，布尔值通常用于字面格式（literal form）。
数字等通常用命名常量引用，而布尔值通常都是直接用
`true` 和 `false` 。如果该布尔值在函数调用的地方不能
清晰的表达其代表的意义，则可能导致代码可读性降低：

<div class="bad">
{% prettify dart %}
new Task(true);
new Task(false);
new ListBox(false, true, true);
{% endprettify %}
</div>

作为替代方案，可以考虑使用命名参数、命名构造函数或者命名常量来
明确表达代码的意义。

<div class="good">
{% prettify dart %}
new Task.oneShot();
new Task.repeating();
new ListBox(scroll: true, showScrollbars: true);
{% endprettify %}
</div>

## 类型注解

#### 推荐 在公开的 API 上提供类型


类型是一个库如何使用的重要文档。
给参数和返回值提供类型可以帮助
用户理解该 API 的参数和提供的功能。

如果，一个公共 API 可以接受任何类型、或者一些 Dart 类型系统无法表达的值，则
可以保持该 API 参数为
无类型的。

对于内部代码或者内部库，如果你感觉类型对理解代码
有帮助，则你可以提供类型，但是请记住，类型并*不是*必须的。

<div class="bad">
{% prettify dart %}
install(id, destPath) {
  /* ... */
}
{% endprettify %}
</div>

这里， `id` 是何类型并不明确。一个 string？ 而 `destPath` 又是啥？一个 string 
或者一个 `File` 对象？ 该函数是同步的还是异步的？

<div class="good">
{% prettify dart %}
Future<bool> install(PackageId id, String destPath) {
  /* ... */
}
{% endprettify %}
</div>

通过类型，这些疑问就消失了。

#### 推荐 用 `var` 修饰局部变量


现在流行的编码中，函数体都是非常短小的，而局部变量的类型通常
通过表达式就可以推断出来而无需明确注明。
所有明确的类型注解通常看起来比较碍眼。
聪明的编辑器可以从表达式中判断局部变量的类型并且
提供代码自动完成和你期望的代码建议。

<div class="good">
{% prettify dart %}
Map<int, List<Person>> groupByZip(Iterable<Person> people) {
  var peopleByZip = new Map<int, List<Person>>();
  for (var person in people) {
    peopleByZip.putIfAbsent(person.zip, () => <Person>[]);
    peopleByZip[person.zip].add(person);
  }
  return peopleByZip;
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
Map<int, List<Person>> groupByZip(Iterable<Person> people) {
  Map<int, List<Person>> peopleByZip = new Map<int, List<Person>>();
  for (Person person in people) {
    peopleByZip.putIfAbsent(person.zip, () => <Person>[]);
    peopleByZip[person.zip].add(person);
  }
  return peopleByZip;
}
{% endprettify %}
</div>

#### 推荐 在性能敏感的地方使用  `double` 或者 `int` 来替代 `num` 作为参数类型

单一调用入口（参数具有明确的类型）
比多态调用入口（参数具有多种类型）
要更容易优化。

如果可以，就为你的参数类型提供具体的数字类型。
明确的指明 `double` 或者 `int` 帮助你的用户用一致的
参数来调用你的函数或者方法。

当用 `num` 作为类型的时候，意味着 "要么是 int 要么就是 double"。
Dart 运行环境无法优化这个不确定的参数。

#### 不要 为初始化构造函数提供类型


如果构造函数的参数用 `this.` 来初始化成员变量，
则参数类型是和成员变量的类型一样。

<div class="good">
{% prettify dart %}
class Point {
  int x, y;
  Point(this.x, this.y);
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
class Point {
  int x, y;
  Point(int this.x, int this.y);
}
{% endprettify %}
</div>

#### 避免 在方法表达式提供类型


方法表达式的值是非常简洁的。如果方法复杂到需要类型才能理解，
则通常应该用方法声明或者函数来实现。
相反，如果方法简洁到可以用一个表达式表示，
则通常意味着不需要类型。

<div class="good">
{% prettify dart %}
var names = people.map((person) => person.name);
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
var names = people.map((Person person) {
  return person.name;
});
{% endprettify %}
</div>

#### 避免 在不需要的地方用 `dynamic`


Dart 的大部分地方都可以忽略类型，这样该类型就是 `dynamic` 的。
所有，省略类型就语义上等同于 `dynamic` 并且
看起来更简洁。

<div class="good">
{% prettify dart %}
lookUpOrDefault(String name, Map map, defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
dynamic lookUpOrDefault(String name, Map map, dynamic defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
{% endprettify %}
</div>

#### 确保 在可以使用任何对象的地方用 `Object` 来替代 `dynamic` 


有些操作可以在任何对象上执行。例如，一个日志函数
可以调用任何对象的 `toString()`。Dart 中有两种类型都运行所有对象：
  `Object` 和 `dynamic`。然而，他们表达了不同的意思。

`Object` 类型说明： "我可以接受任意对象，并且我只
期望该对象具有 `Object` 中定义的函数。"

而 `dynamic` 类型则意味着，没有恰当的类型可以代买
你需要的参数类型。 (或者有一种类型可以，但是你懒得写出来。)

<div class="good">
{% prettify dart %}
// Accepts any object.
void log(Object object) {
  print(object.toString());
}

// Only accepts bool or String, which can't be expressed in a type annotation.
bool convertToBool(arg) {
  if (arg is bool) return arg;
  if (arg is String) return arg == 'true';
  throw new ArgumentError('Cannot convert $arg to a bool.');
}
{% endprettify %}
</div>

## 命名

#### 确保 用 `UpperCamelCase` 风格来命名


类和 typedef 定义的名字的首字母应该大写，并且
没有分隔符。

<div class="good" markdown="1">
{% prettify dart %}
class SliderMenu {
  // ...
}

class HttpRequest {
  // ...
}

typedef num Adder(num x, num y);
{% endprettify %}
</div>

#### 确保 常量使用大写字母和下划线 （`ALL_CAPS_WITH_UNDERSCORES`）风格命名


常量&mdash;用 `const` 修饰的变量&mdash; 在 Dart 中是特殊的，
和 `final` 不一样，他们可以用于常量表达式中。
为了明确该行为，他们用自己特有的命名风格。

<div class="good">
{% prettify dart %}
const PI = 3.14;
const DEFAULT_TIMEOUT = 1000;
final urlScheme = new RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = new Random();
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
const pi = 3.14;
const kDefaultTimeout = 1000;
final URL_SCHEME = new RegExp('^([a-z]+):');

class Dice {
  static final NUMBER_GENERATOR = new Random();
}
{% endprettify %}
</div>

#### 确保 其他的标示符都用 `lowerCamelCase` 格式命名


类成员变量、顶级定义、变量、参数和命名参数都应该以该格式命名，并
不用
分隔符。

<div class="good">
{% prettify dart %}
var item;

HttpRequest httpRequest;

align(clearItems) {
  // ...
}
{% endprettify %}
</div>

#### 确保 用 `lowercase_with_underscores` 格式命名文件名和库名


一些文件系统对大小写不敏感，所有大部分的项目都要求文件名字为小写字母。
使用分隔符可以让文件名更具可读性。
使用下划线作为分隔符说明该名字为合法的 Dart 标示符，在需要
支持文件导入的时候会用到。

<div class="good" markdown="1">
好的命名示例：

* `slider_menu.dart`
* `file_system.dart`
* `library peg_parser;`
</div>

<div class="bad" markdown="1">
坏的命名示例：

* `SliderMenu.dart`
* `filesystem.dart`
* `library peg-parser;`
</div>

#### 确保 首字母单词缩写和大于两个字符的缩写词按照单词来对待


大写的字母缩略词比较难读，并且当有多个相邻的缩略词的时候比较
难以区分。类似于 `HTTPSFTPConnection` 的名字无法知道
到底是一个 HTTPS FTP connection 还是一个 HTTP SFTP connection。

为了避免这种情况，缩略词按照一个单词对待，但是两个字母的缩略词除外。
two-letter ones.

<div class="good">
{% prettify dart %}
HttpConnection
uiHandler
IOStream
HttpRequest
ID
id
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
HTTPConnection
UiHandler
IoStream
HTTPRequest
Id
{% endprettify %}
</div>

## 注释

#### 确保 用 doc-style 注释来为成员变量和类型提供注释


Dart 支持两种类型文档注释。单行注释
用 `///` 开始：

<div class="good">
{% prettify dart %}
/// Parses a set of option strings. For each option:
///
/// * If it is `null`, then it is ignored.
/// * If it is a string, then [validate] is called on it.
/// * If it is any other type, it is *not* validated.
void parse(List options) {
  // ...
}
{% endprettify %}
</div>

块注释用 `/**` 开始，用 `*/` 结尾可以跨行：

<div class="good">
{% prettify dart %}
/**
 * Parses a set of option strings.
 */
void parse(List options) {
  // ...
}
{% endprettify %}
</div>

在文档注释中，你可以用 [markdown][] 语法来格式。

[markdown]: http://daringfireball.net/projects/markdown/

#### 确保 其他非文档注释用单行注释


<div class="good">
{% prettify dart %}
greet(name) {
  // Assume we have a valid name.
  print('Hi, $name!');
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
greet(name) {
  /* Assume we have a valid name. */
  print('Hi, $name!');
}
{% endprettify %}
</div>

#### 确保 按照普通的语句来些注释，大写字母开头并且添加标点符号。


这并不意味着，注释必须为一个完整的语句。
"Returns the number of items." 是一个可以接受的注释。

<div class="good">
{% prettify dart %}
// Remove the last item from the collection.
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
// remove the last item from the collection
{% endprettify %}
</div>

#### 确保 在文档注释中用方括号包围当前作用域的标示符


如果用方括号包围变量、函数名字和类型，
文档生成器会生成一个连接来查看
该名字的定义。

<div class="good">
{% prettify dart %}
import 'dart:math';

/// Rolls both [Dice] and returns the highest rolled value.
num greatestRoll(Dice a, Dice b) => max(a.roll(), b.roll());
{% endprettify %}
</div>

#### 确保 用散文的方式来提供函数描述文档注释


其他语言用冗长的标签和分块来描述什么是
参数和该函数返回啥。

<div class="bad">
{% prettify dart %}
/**
 * Defines a flag with the given name and abbreviation.
 *
 * @param name The name of the flag.
 * @param abbr The abbreviation for the flag.
 * @returns The new flag.
 * @throws IllegalArgumentException If there is already an option with
 *     the given name or abbreviation.
 */
Flag addFlag(String name, String abbr) {
  // ...
}
{% endprettify %}
</div>

在 Dart 的习惯用法是 在描述中集成参数和返回值的类型并用方括号
来高亮这些参数。

<div class="good">
{% prettify dart %}
/**
 * Defines a flag. Throws an [IllegalArgumentException] if there is
 * already an option named [name] or there is already an option using
 * abbreviation [abbr]. Returns the new flag.
 */
Flag addFlag(String name, String abbr) {
  // ...
}
{% endprettify %}
</div>

## 空白

和其他很多语言一样， Dart 忽略空白。但是，*人类*却不忽略空白。
用一个一直的空白风格可以帮助人类和编译器一样
理解代码。

#### 不要 用 tab


用空格来格式化代码，这样在每个人的编辑器中看起来都一样。
这样当在博客中或者其他网站发表代码的时候也能保持格式一样。例如 例如 [Google Code][] 或者 [GitHub][]。

[google code]: http://code.google.com/projecthosting/
[github]: http://github.com

流行的编辑器会用空格来替代 tab，让你编辑 tab 比较方便并
保持留白的一致性。

#### 避免 大于 80 个字符的代码行


阅读研究发现，人类在阅读比较长的文本的时候，无法快速的跳转到下一行。
这就是为啥 报纸 和杂志 都使用多列的
文本布局。

如果你真的需要用大于 80 个字符的行，
我们的经验告诉你，你的代码应该是太冗长了，应该可以更加简练些。
你真的愿意
使用 `AbstractWidgetFactoryManagerBuilder` 这个类吗？

#### 确保 在多行表达式的地方把操作符放到前面一行的末尾


放到前面一行还是后面一行都是合法的，但是为了一致性考虑
我们的代码都是把操作符放到前面一行。

<div class="good">
{% prettify dart %}
if (isDeepFried ||
    (hasPieCrust && !vegan) ||
    containsBacon) {
  print('Bob likes it.');
}
{% endprettify %}
</div>

注意： `=>` 也复合该约定：

<div class="good">
{% prettify dart %}
bobLikes() =>
    isDeepFried || (hasPieCrust && !vegan) || containsBacon;
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
bobLikes()
    => isDeepFried || (hasPieCrust && !vegan) || containsBacon;
{% endprettify %}
</div>

#### 确保 把 `.` 放到多行表达式的下一行的开头


该约定紧接前面一条规则。和其他操作符不一样，如果你用一个
 `.` 来分隔表达式，则把 `.` 放到下一行的开头。

<div class="good">
{% prettify dart %}
someVeryLongVariable.withAVeryLongProperty
    .aMethodOnThatObject();
{% endprettify %}
</div>

#### 确保用两个空格来缩进代码块


<div class="good">
{% prettify dart %}
if (condition) {
  print('hi');
}
{% endprettify %}
</div>

#### 确保 最少用四个空格来缩进跨行的代码


<div class="good">
{% prettify dart %}
someLongObject.aReallyLongMethodName(longArg, anotherLongArg,
    wrappedToNextLine);
{% endprettify %}
</div>

如果你喜欢下面的风格，则可以用更多的空格来缩进：

<div class="good">
{% prettify dart %}
someLongObject.aReallyLongMethodName(longArg, anotherLongArg,
                                     wrappedToNextLine);
{% endprettify %}
</div>

#### 不要 缩进一个方法表达式的延续


上面一条规则的一个例外情况就是当在一个大的表达式中使用方法表达式的时候，
和提供函数参数一样，他们使用下面的方式来格式化：

<div class="good">
{% prettify dart %}
new Future.delayed(const Duration(seconds: 1), () {
  print('I am a callback');
});
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
new Future.delayed(const Duration(seconds: 1), () {
      print('I am a callback');
    });
{% endprettify %}
</div>

#### 确保 把开始的花括号 (`{`) 放到它所属的同一行结尾


<div class="good">
{% prettify dart %}
class Foo {
  method() {
    if (true) {
      // ...
    } else {
      // ...
    }
  }
}
{% endprettify %}
</div>

#### 确保 在所有的控制流语句中用花括号


这样可以避免 [dangling else][]（悬空 else） 问题。

[dangling else]: http://en.wikipedia.org/wiki/Dangling_else

<div class="good">
{% prettify dart %}
if (true) {
  print('sanity');
} else {
  print('opposite day!');
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
if (true) print('sanity');
else
  print('opposite day!');
{% endprettify %}
</div>

当然，也有一个特例，就是当 `if` 非常短并且没有 `else` 语句，还
可以在一行显示的时候。

<div class="good">
{% prettify dart %}
if (arg == null) return defaultValue;
{% endprettify %}
</div>

#### 确保 用两个空格缩进 switch cases 并用四个空格缩进 case 块


<div class="good">
{% prettify dart %}
switch (fruit) {
  case 'apple':
    print('delish');
    break;

  case 'durian':
    print('stinky');
    break;
}
{% endprettify %}
</div>

#### 确保 在二元和三元操作符之间和冒号后面用空格，不要在一元操作符后面用空格



注意： `<` 和 `>` 在表达式中被认为是二元操作符，但是对于泛型类型除外。
 `is` 和 `is!` 被认为是一个二元操作符。
 用户访问成员的 `.` 不应该用空格分隔。

<div class="good">
{% prettify dart %}
a = 1 + 2 / (3 * -b);
c = !condition == a > b;
d = condition ? b : object.method(a, b, c);
if (obj is! SomeType) print('not SomeType');
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
a=1+2/(3* - b);
c= ! condition==a>b;
d= condition?b:object.method(a,b,c);
if (obj is !SomeType) print('not SomeType');
{% endprettify %}
</div>

#### 确保 在每个 `in` 之间和循环中的 `;` 后面使用空格


<div class="good">
{% prettify dart %}
for (var i = 0; i < 100; i++) {
  // ...
}

for (final item in collection) {
  // ...
}
{% endprettify %}
</div>

#### 确保 在控制流关键字后面用一个空格


和函数和方法调用不一样。
调用函数和方法则不需要使用空格分隔。

<div class="good">
{% prettify dart %}
while (foo) {
  // ...
}

try {
  // ...
} catch (e) {
  // ...
}
{% endprettify %}
</div>

#### 不要 在 `(`、 `[`、  `{` 之后和 `)`、 `]`、 `}` 之前用空格


同样，当 `<` 和 `>` 用作泛型的时候 ，也不加空格。

<div class="good">
{% prettify dart %}
var numbers = <int>[1, 2, (3 + 4)];
{% endprettify %}
</div>

#### 确保 在函数和方法体的 `{` 之前加一个空格


This is an exception to the above rule. When a `{` is used after a parameter
list in a function or method, there should be a space between it and the `)`
ending the parameters.

<div class="good">
{% prettify dart %}
getEmptyFn(a) {
  return () {};
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
getEmptyFn(a){
  return (){};
}
{% endprettify %}
</div>

#### 确保 每行只放一个构造函数初始化列表语句


<div class="good">
{% prettify dart %}
MyClass()
    : firstField = "some value",
      secondField = "another",
      thirdField = "last" {
  // ...
}
{% endprettify %}
</div>

注意 `:` 应该放到下一行代码前面并用四个空格缩进。
每个成员变量应该对齐（除了第一个变量以外，其他的变量都用六个空格
缩进）。

#### 确保 在命名参数的`:` 后面使用一个空格


<div class="good">
{% prettify dart %}
class ListBox {
  bool showScrollbars;

  ListBox({this.showScrollbars: false});
}

main() {
  new ListBox(showScrollbars: true);
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
new ListBox(showScrollbars:true);
new ListBox(showScrollbars : true);
{% endprettify %}
</div>

#### 确保 在可选参数 `=` 赋值前后用一个空格


<div class="good">
{% prettify dart %}
class HttpServer {
  static Future<HttpServer> listen([int port = 80]) {
    // ...
  }
}
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
import 'dart:async';

class HttpServer {
  static Future<HttpServer> listen([int port=80]) {
    // ...
  }
}
{% endprettify %}
</div>

#### 确保 在函数级联调用的时候 使用空格缩进


<div class="good">
{% prettify dart %}
var list = new List()
    ..addAll([1,2,3])
    ..addAll([4,5,6]);
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
var list = new List()
  ..addAll([1,2,3])
  ..addAll([4,5,6]);
{% endprettify %}
</div>
