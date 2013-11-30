---
layout: article
title: "Dart 习惯用法"
rel:
  author: bob-nystrom
description: '学习如何编写看起来像 Dart 的代码。'
has-permalinks: true
article:
  written_on: 2011-10-01
  updated_on: 2013-03-12
  collection: everyday-dart
---

{% include toc.html %}

# {{ page.title }}

_作者： Bob Nystrom<br>
译者：云在千峰<br>
2011 10月
(2013 3月更新)_

Dart 设计的时候就借鉴了其他语言，如果你用过其他语言 -- 特别是 Java 和 JavaScript -- 
就可以发现 Dart 看起来比较熟悉。
如果你努力尝试的话，你可以完全按照这些语言来用 Dart；
如果你_再努力尝试下_的话，你也可以按照 Fortran 的方式来用 Dart，
但是如果这样的话，就丧失了 Dart 的独特性和趣味性了。

这篇文章介绍如何编写独特适合 Dart 的代码。
由于该应用仍然还在进化，很多习惯语法也在发生变化。
仍然有一些地方我们目前还不确定如何做是最好的。（也许
你可以帮助我们。）
但是，这里的一些观点也许会让你从 Java 或者 JavaScript 中摆脱出来并为之眼前一亮，
从而进入到 Dart 世界。

<aside class="alert alert-info" markdown="1">
  **注意**：
 该文章并不是要告诉你 Dart 编程的基本内容。
 如果你还没接触过 Dart ，我们推荐你先
 看看
  [Dart 语言概览](/docs/dart-up-and-running/)。
</aside>

## 构造函数

先从构造函数开始。每个对象都是在某个地方创建的，
定义构造函数是一个对象的重要组成部分。
关于构造函数，Dart 有一些很有趣
的观点。

### 自动的成员初始化

首先就是去除一些繁琐的初始化过程。
很多构造函数都是简单的把参数赋值给成员变量，例如：

{% prettify dart %}
class Point {
  num x, y;
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
}
{% endprettify %}

这里为了给一个变量赋值，我们不得不写_四_次 `x`。真无聊啊！在 Dart 中，
我们做的更好：

{% prettify dart %}
class Point {
  num x, y;
  Point(this.x, this.y);
}
{% endprettify %}

如果构造函数的参数名字之前带有 `this.`，则对应的成员变量会用该参数的值
自动初始化。
该示例还演示了其他一个小特性：
如果构造函数体是空的，你可以用一个分号 (`;`) 来替代 `{}`。

### 命名构造函数

和其他很多动态类型语言一样， Dart 不支持重载（overloading）。
针对函数来说，不支持重载不是问题，你可以选择另外一个名字。但是 构造函数就没这么幸运了。
为了弥补该不足之处， Dart 让你可以定义_命名构造函数_：

{% prettify dart %}
import 'dart:math';

class Point {
  num x, y;
  Point(this.x, this.y);
  Point.zero() : x = 0, y = 0;
  Point.polar(num theta, num radius) {
    x = cos(theta) * radius;
    y = sin(theta) * radius;
  }
}
{% endprettify %}

上面的 Point 类有三个构造函数，一个普通的和两个命名构造函数。
你可以这样使用他们：

{% prettify dart %}
import 'dart:math';

main() {
  var a = new Point(1, 2);
  var b = new Point.zero();
  var c = new Point.polar(PI, 4.0);
}
{% endprettify %}

注意，当调用命名构造函数的时候，我们依然用 `new` 关键字。
他们不只是一个静态函数。

### 工厂构造函数

有很多关于_工厂_的设计模式。
当你需要一个类的实例而又不想绑定到具体的实现中去（想要
一些灵活性），则可以用到这些模式。
例如 已经缓存了一个实例了，则就使用缓存的示例；
或者你想用一个不同类型的实现。

当用 Dart 创建对象的时候，
Dart 无需改变调用代码就支持工厂模式。
例如，你可以定义一个_工厂构造函数_。当_调用_该函数的时候，
用起来就和一般的构造函数一样。但是，该构造函数的实现可以做任意事情。例如：

{% prettify dart %}
class Symbol {
  final String name;
  static Map<String, Symbol> _cache;

  factory Symbol(String name) {
    if (_cache == null) {
      _cache = {};
    }

    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final symbol = new Symbol._internal(name);
      _cache[name] = symbol;
      return symbol;
    }
  }

  Symbol._internal(this.name);
}
{% endprettify %}

上面是一个定义符号的类。一个符号就像一个字符串，但是我们确保
对于同样的名字只有一个符号对象存在。
这样你可以只用比较两个符号是否是同一个对象就可以知道他们
是否相同。

这个默认的构造函数用 `factory` 来修饰。
这样 Dart 就知道该函数为一个 工厂构造函数。 当调用该函数的时候，它_不会_创建
一个新的对象（在工厂构造函数内没有 `this` 变量）。相反，
你需要自己创建一个对象并返回。这里查找之前缓存的对象，
如果发现已经存在了就返回查找到的实例。

比较酷的是，_调用者_不知道这一切。他们只是这样调用：

{% prettify dart %}
var a = new Symbol('something');
var b = new Symbol('something');

assert(identical(a, b)); // true!
{% endprettify %}

第二个 `new` 只会返回前面缓存的对象。
该特性比较好的是，如果一开始我们不知道需要一个工厂构造函数，
而后面我们发现我们需要这样做的时候，我们只需要把
该构造函数设置为工厂构造函数即可，而不需要修改调用者的代码。

## 方法(Functions)

和许多新型的语言一样， Dart 的类等方法（first-class function）完全支持
闭包并使用轻量级的语法。方法和其他东西一样都是对象，
你应该毫不犹豫的使用他们。

Dart 有三种创建方法的方式：

* 命名方法
* 具有方法体的匿名方法
* 表达式方法，通常称之为 _arrow functions（箭头方法）_

命名方法看起来如下：

{% prettify dart %}
bool isShouting(String message) {
  return (message.toUpperCase() == message);
}
{% endprettify %}

上面的代码看起来和 Java C 语言中的函数没啥区别。
你可以用常用的方式来调用方法：

{% prettify dart %}
print(isShouting("I'M JUST VERY EXCITED")); // true
{% endprettify %}

在 Dart 中，方法是对象，所以你可以把他们当做参数来传递：

{% prettify dart %}
var messages = ['hello', 'DART IS FUN'];
var shouts = messages.where(isShouting).toList();

print(shouts); // ['DART IS FUN']
{% endprettify %}

如果你无须给方法命名，则可以用匿名方法。
看起来和命名方法类似，但是没有名字和返回值类型。
下面是一个示例：

{% prettify dart %}
var shouts2 = messages.where((m) {
  return (m.toUpperCase() == m);
}).toList();
{% endprettify %}

最后，如果你只需要执行一个表达式并返回一个值，则可以使用轻量
级语法 `=>`：

{% prettify dart %}
var shouts3 = messages.where((m) => m.toUpperCase() == m).toList();
{% endprettify %}

一个圆括号包围的参数列表，后面跟着一个  `=>` 和一个表达式。
这样就创建了一个使用这些参数的方法，并
返回该表达式的值。

在实际工作中，由于箭头方法很简洁并且 `=>` 很容易识别， 我们发现我们非常喜欢箭头
方法。
我们经常把匿名方法用作 事件处理函数和回调函数。

更多信息，参考
[Dart 中的方法](/docs/dart-up-and-running/contents/ch02.html#functions)。

### 一行代码的函数

Dart 还有一个我非常喜欢的特性：
可以用 `=>` 来定义函数。
当然你_可以_这样做：

{% prettify dart %}
class Rectangle {
  num width, height;

  bool contains(num x, num y) {
    return (x < width) && (y < height);
  }

  num area() {
    return width * height;
  }
}
{% endprettify %}

但是当你可以这样干的时候，为啥还那样呢？

{% prettify dart %}
class Rectangle {
  num width, height;
  bool contains(num x, num y) => (x < width) && (y < height);
  num area() => width * height;
}
{% endprettify %}

我们发现箭头函数非常适合 getter 和其他只有一行
代码的函数。

### 方法类型和别名

不要忘记了， Dart 可以把方法当做参数。
下面是一个示例：

{% prettify dart %}
List<num> filterNumbers(List<num> numbers, bool filter(num x)) {
  return numbers.where(filter).toList();
}
{% endprettify %}

上面的代码是正确的，如果可以把 `filter` 的类型提取出来则看起来会比较简洁。
当些代码的时候，你不知道过滤方法的参数类型。所有，你
没法说 `if (filter is bool filter(num x))`。
另外，用 `filterNumbers` 则显得有点复杂。

为了提供简洁的方法签名，并提供更多的类型信息，你可以用_typedef_。
一个 _typedef_ 本质上为
一个方法签名提供了一个别名。

{% prettify dart %}
typedef bool Filter(num x);

List<num> filterNumbers(List<num> numbers, Filter filter) {
  return numbers.where(filter).toList();
}
{% endprettify %}

现在，你可以用 `if (filter is Filter)`了。

无论何时创建一个能接受方法的变量时，都可以用 
typedef 来定义方法的签名。
下面的示例来自于 Dart Web UI 库：

{% prettify dart %}
/** Function to set up the contents of a conditional template. */
typedef void ConditionalBodySetup(ConditionalTemplate template);

/**
 * A template conditional like `<template instantiate="if test">` or
 * `<td template instantiate="if test">`.
 */
class ConditionalTemplate extends PlaceholderTemplate {
  bool isVisible = false;
  final ConditionalBodySetup bodySetup;

  ConditionalTemplate(Node reference, exp, this.bodySetup)
      : super(reference, exp);

  ...
{% endprettify %}

## 类型定义

如果你可以这样写代码：

{% prettify dart %}
// Dart

String MakeGreeting(String name) {
  String greeting = 'hello $name';
  return greeting;
}
{% endprettify %}

为什么还要这样写呢？

{% prettify javascript %}
// JavaScript w/ Closure compiler

/**
 * @param {String} name
 * @return {String}
 */
makeGreeting = function(name) {
  /** @type {String} */
  var greeting = 'hello ' + name;
  return greeting;
}
{% endprettify %}

Dart 是可选类型语言，这意味着用户不用总是
需要处处检测类型就可以运行代码了。使用类型当做
"内置的文档"可以帮助你的同事或者工具理解你的
代码。

一般来说， **在你代码的"暴露不用" 使用类型**。
如果其他的开发者需要用到你的接口，则用类型注解。
这样他们会感激你的。

在函数内部，该规则是比较灵活的。如果你想用类型就用吧，
如果团队代码风格允许的话，你也可以只用 `var`。
即使你用 `var` ，智能的编辑器和静态分析工具也能
为你提供一些代码建议。

如果，你想表达一些系统类型无法表达的东西时， 你可以完全忽略类型。
例如，如果你的函数既可以接收 整数 也可以接收一个 Duration，则
你可以把参数类型设置为 `var`。

{% prettify dart %}
/// This method used to only take an [int] but now it takes a [Duration] or
/// [int]. Use of [int] is deprecated, please use [Duration].
calculateTimePeriod(var duration) {
  if (duration is int) {
    // ...
  } else if (duration is Duration) {
    // ...
  } else {
    throw new ArgumentError('duration must be an int or Duration');
  }
}
{% endprettify %}

在 API 进化中这是常见的场景。当 API 确定后，你
可以确定其类型了。

更多信息参考 [Dart 可选静态类型](/articles/optional-types/)。

## 成员变量、 getters、和 setters

Dart 用标准的 `object.someProperty` 语法来访问
成员变量。在大部分语言中，当  `someProperty`是该对象的真实成员变量的时候才有效，
但是 Dart 也允许你定义看起来和访问成员变量一样的函数。
在其他语言中，这些函数被称之为 _getters_ 和 _setters_。
下面是一个示例：

{% prettify dart %}
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right             => left + width;
      set right(num value)  => left = value - width;
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;
}
{% endprettify %}

这里定义了一个 Rectangle 类，该类有四个成员变量 - `left`、 `top`、 `width`、
和 `height`。该类还使用 getters 和 setters 定义了另外两个虚拟成员变量：
`right` 和 `bottom`。在使用这个类的时候，
你不知道"真实"成员变量和 getters 、 setters 有啥区别：

{% prettify dart %}
var rect = new Rectangle(3, 4, 20, 15);
print(rect.left);
print(rect.bottom);
rect.top = 6;
rect.right = 12;
{% endprettify %}

这种模糊了成员变量和 getters/setters 之间界限的机制是该语言的基础。
理解该机制比较清楚的观点是：成员变量_只是_ getters/setters 的默认实现。
这样，你可以实现一些有趣的功能，例如 用一个变量来重写一个继承的 getter。
如果一个接口定义了一个 getter 函数，则你可以用一个同样名字和类型 成员变量 来重写该函数。
如果变量是可变的（没有 `final`），则还可以实现一个 setter 函数。

在实际应用中，你无须只是为了隐藏成员变量而为他们提供一个无聊的 getters 和 setters 函数，
例如 Java 和 C# 就是
这样的。
如果你有一些需要暴露的成员变量，可以直接设置为 public 的。如果
你不想让其他人修改，则设置为 `final` 的。 

以后，如果你想做一些验证或者其他功能，你可以把该成员变量替换为 getter 和 setter。
例如，如果我们希望 Rectangle 类没有负的尺寸， 则我们可以这样修改代码：

{% prettify dart %}
class Rectangle {
  num left, top;
  num _width, _height;

  Rectangle(this.left, this.top, this._width, this._height);

  num get width => _width;
  set width(num value) {
    if (value < 0) throw 'Width cannot be negative.';
    _width = value;
  }

  num get height => _height;
  set height(num value) {
    if (value < 0) throw 'Height cannot be negative.';
    _height = value;
  }

  num get right             => left + width;
      set right(num value)  => left = value - width;
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;

}
{% endprettify %}

这样我们修改了该类来实现一些验证功能，而无需修改任何使用该类的
代码。

## 顶级（Top-level）定义

Dart 是一个 "纯" 面向对象语言，可以放到变量的任意值都是对象（"primitives" 除外），
并且任意对象都是某个类的实例。Dart 不是一个_dogmatic（教条式）_的面向对象语言。
不需要把任何东西都定义到一个类中。你可以随意的定义
顶级方法、函数、变量、甚至 getter 和 setter。

{% prettify dart %}
import 'dart:math';

num abs(num value) => value < 0 ? -value : value;

final TWO_PI = PI * 2.0;

int get today {
  final date = new DateTime.now();
  return date.day;
}

main() {
  print(today);
}
{% endprettify %}

在一些你不需要把任意定义都放到类中的语言中，例如 JavaScript，通常也需要
定义一个命名空间：防止具有相同名字的顶级定义会冲突。
为了解决该问题， Dart 实现了一个可以带有前缀名称导入的库系统。
这样你就_无需_防御性的把你的函数定义到一个类中了。

最常见的顶级函数就是 `main()`。如果你使用 DOM，
像 `document` 和 `window` 这些"变量"都是定义在 Dart 的顶级 getter。
以前 Dart 有一个 Math 类，后来我们把该类的所有函数都放到 dart:math 库的
顶级函数中了。

## 依赖注入

你可以组合 typedef、方法和构造函数来定义一个简单的
_依赖注入_系统。如下示例：

{% prettify dart %}
typedef Connection ConnectionFactory();

Connection _newDBConnection() => new DatabaseConnection();

class Person {
  String id;
  String name;
  ConnectionFactory connectionFactory;

  Person({this.connectionFactory: _newDBConnection});

  Future save() {
    var conn = connectionFactory();
    return conn.query('UPDATE PERSONS SET name = ? WHERE id = ?', [name, id]);
  }
}
{% endprettify %}

上面的简单示例演示了很多 Dart 中的酷特性：

Typedefs
: 用来创建一个返回数据库连接的方法别名。

可选命名参数
: 用来设置默认的数据库连接工厂，或者用一个用户设置的工厂方法。

顶级方法
: 用来定义默认的数据库连接工厂方法

## 字符串和插值

Dart 有一些字符串字面量。你可以用单引号或者双引号来定义字符串，
也可以用三个单引号来定义跨行的字符串：

{% prettify dart %}
var s1 = 'I am a "string"'
"I'm one too";

var s2 = '''I'm
on multiple lines
''';

var s3 = """
As
am
I
""";
{% endprettify %}

尽管在 String 上还有一个加号(+)操作符，但是用_字符串插值_是更简洁高效的方式：

{% prettify dart %}
var name = 'Fred';
var salutation = 'Hi';
var greeting = '$salutation, $name';
{% endprettify %}

在字符串字面量中的美元符号 (`$`)后跟一个变量名字代表一个变量的值。
 (如果变量不是 string 对象，则调用 `toString()`函数。)
 你也可以把表达式放到花括号中来插值表达式的值：

{% prettify dart %}
import 'dart:math';
main() {
  var r = 2;
  print('The area of a circle with radius $r is ${PI * r * r}');
}
{% endprettify %}

## 操作符

Dart 的操作符和优先级和你熟悉的语言一样，例如 Java 、 C 等。
这样，他们符合你期望的行为。但是在表面之下，他们还有一些特殊用法。
在 Dart 中，类似 `1 + 2` 这种使用操作符的表达式只是调用函数的语法糖。
这个例子类似于语言中的 `1.+(2)`。

这就意味着，大部分情况下你都可以重写自定义类型的操作符。
例如，下面是一个自定义的 `Vector` 类：

{% prettify dart %}
class Vector {
  num x, y;
  Vector(this.x, this.y);
  operator +(Vector other) => new Vector(x + other.x, y + other.y);
}
{% endprettify %}

这样，我们可以用熟悉的语法来把两个 Vector 相加：

{% prettify dart %}
var position = new Vector(3, 4);
var velocity = new Vector(1, 2);
var newPosition = position + velocity;
{% endprettify %}

话虽如此，但不要太疯狂了。我们给你车的钥匙并且
相信你不会瞎搞乱撞。

在实际中，如果你定义的类型在"真实世界"（在黑板上？）中经常使用操作符，则很可能该
类型很适合重写操作符：例如 复数、向量、矩阵 等等。
否则，可能不适合重写操作符。使用自定义操作符的类型通常也应该是不可变的。

注意，操作符调用只是普通的函数调用，所以他们本质上具有不对称性。
总是在左边的参数上查找函数。所以当你用  `a + b`，
则由类型 `a`来确定实现何种功能。

## 相等判断

Dart 有两种相等判断操作符：
`==` 和 `!=`。
和 JavaScript 的相等操作符有点差别。
和 JavaScript 不同， Dart 没有 `===` 操作符，而是提供了
一个顶级方法 `identical()`。

用 `==` 和 `!=` 来测试相等。在 99% 的情况下他们都能满足你的需求。
和 JavaScript 不同，他们不会做任何潜在的转化，所以他们和你期望的行为一致。
所以 大胆的用吧。
和 _Java_ 也不同，他们可以在任意定义了相等关系的类型使用。
告别 `someString.equals("something")` 吧。

如果有意义，你可以在自定义类型中实现 `==`。
但是你无须实现 `!=`：Dart 会从 `==` 的实现中自动推断  `!=`。
如果你自己实现了 `==`，不要忘了同时实现
[hashCode](http://api.dartlang.org/dart_core/Object.html#hashCode)。

`identical() 函数用来测试两个对象是否_是内存中的同一个对象_。
实际上，你很少使用这种测试。 Object 类定义 `==` 返回 `identical(this, other)`，
所以，只有当你重写 `==` 或者 避免重写 `==` 的时候才需要调用 `identical()`。

## 数字

Dart 有个 `num` 类和两个子类：`int` 、 `double`。
整数在 VM 中可以是任意大小，double 为 IEEE 754 标准定义的 64-bit double。

在常规的 Dart 代码中，我们发现需要两种类型的数字：

1. 没有小数点的整数。例如：用于列表索引的整数。
1. 任何数字，包含带小数点的。

第一种情况使用 `int` ，第二种情况用  `num`。
只有极少数情况我们才需要一个数字_必须_带小数点儿
_不能_为整数，这种情况才需要用 double。

Dart 中的数字通常都是 `int` 或者 `num`，
极少情况下才会是 `double`。

## Futures

Future 代表未来某个时候会返回一个值。

用 Future 的函数应该总是返回 Future。这样可以帮助调用者来
处理错误的情况。也可以让调用者知道
何时该操作完成。

{% prettify dart %}
Future doLengthyComputation() {
  return lengthyComp().then((value) => print(value))
                      .catchError((e) => print(e));
}
{% endprettify %}

总是把 `catchError()` 级联在
`then()` 之后调用，否则你会丢失在 `then()` 中抛出的异常。

下面是一个 **不要这么干** 的反面示例：

{% prettify dart %}
// WARNING: This code contains an anti-pattern.
Future doLengthyComputation() {
  Future future = lengthyComp();
  future.then((value) => print(value));

  // BAD! You'll only get errors from future, not from then().
  // BAD! Your caller never sees any errors that occur.
  future.catchError((e) => print(e));
  return future;
}
{% endprettify %}

如果你想在"未来"运行一个函数， `Timer.run` 将会诱惑你使用它。
除非你知道你在干啥，否则**不要用**。
非常不幸的是，在 run 回调函数中的异常通常或多或少的不好捕获。

非常幸运的是， Future 有个构造函数可以帮助我们。
`Future.delayed` 函数可以在未来运行一个函数而无需丢失
可能抛出的异常。

{% prettify dart %}
Future doLengthyComputation() {
  return new Future.delayed(const Duration(seconds: 0),
      () => doTheThingThatMightFail());
}
{% endprettify %}

## 注释

Dart 支持可被工具解析的结构化注释。
然而，为了用更流畅和更自然的注释， Dart 避免正式的 API 文档。

对比 Java 和 Dart 的注释风格：

<div class="row">
  <div class="col-md-6">
{% prettify java %}
/**
 * Returns an Llama object that can then be petted. 
 * The age argument must specify an non-zero integer. The amount
 * argument is the amount of {@link Money} paid for the llama.
 * <p>
 * This method throws {@link NoMoreLlamasException} is thrown
 * if there are no more llamas to purchase.
 * {@link IllegalArgumentException} is
 * thrown if age is less than zero.
 *
 * @param  age  a non-zero age
 * @param  amount the amount of money paid for the llama
 * @throws NoMoreLlamasException if there are no more llamas available
 * @throws IllegalArgumentException if age is less than zero
 * @return      the llama
 * @see         Farmer
 */
 public Llama buyLlama(Age age, Money amount) {
   // ...
 }
{% endprettify %}
  </div>
  <div class="col-md-6">
{% prettify dart %}
/**
 * Returns a Llama that can be petted.
 * An [ArgumentError] is thrown if age is less than zero, and
 * [NoMoreLlamasError] is thrown if they are all out of llamas.
 */
Llama buyLlama(int age, Money amount) {
  // ...
}
{% endprettify %}
  </div>
</div>

Dart 文档注释使用了 少即是多 的原则。无需一遍又一遍的重复你的描述，
只需要在注释中说明你需要啥即可。
同时，也无需在文档注释中用 HTML 标签； Dart 的 dartdoc 工具可以理解
一些 Markdown 语法。

{% prettify dart %}
/**
 * ## Examples
 *
 * Getting the _value_:
 *
 *     Future<int> future = getFutureFromSomewhere();
 *     future.then((value) {
 *       print("I received the number $value");
 *     });
 * ...
 */ 
{% endprettify %}

了解更多 [Dart 注释风格](/articles/doc-comment-guidelines/)。