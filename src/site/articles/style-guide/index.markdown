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

#### AVOID wrapping fields in getters and setters just to be "safe".


In Java and C#, it's common to hide all fields behind getters and setters (or
properties in C#), even if the implementation just forwards to the field. That
way, if you ever need to do more work in those members, you can without needing
to touch the callsites. This is because calling a getter method is different
than accessing a field in Java, and accessing a property isn't binary-compatible
with accessing a raw field in C#.

Dart doesn't have this limitation. Fields and getters/setters are completely
indistinguishable. You can expose a field in a class and later wrap it in a
getter and setter without having to touch any code that uses that field.

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

#### PREFER using a public final field instead of a private field with a public getter.


If you have a field that outside code should be able to see but not assign to
(and you don't need to set it outside of the constructor), a simple solution
that works in many cases is to just mark it `final`.

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

#### CONSIDER using `=>` to define members whose body returns the result of a single expression.


In addition to using `=>` for function expressions, Dart also lets you define
members with them. They are a good fit for simple members that just calculate
and return a value.

<div class="good">
{% prettify dart %}
get width => right - left;
bool ready(num time) => minTime == null || minTime <= time;
containsValue(String value) => getValues().contains(value);
{% endprettify %}
</div>

Members that don't fit on one line can still use `=>`, but if you find yourself
cramming a single expression into several continued lines, it is probably
cleaner to just use a curly body with an explicit `return`.

#### AVOID boolean arguments unless their meaning is completely obvious.


Unlike other types, booleans are usually used in literal form. Things like
numbers are usually wrapped in named constants, but we usually just pass around
`true` and `false` directly. That can make callsites unreadable if it isn't
clear what the boolean represents:

<div class="bad">
{% prettify dart %}
new Task(true);
new Task(false);
new ListBox(false, true, true);
{% endprettify %}
</div>

Instead, consider using named arguments, named constructors, or named constants
to clarify what the call is doing.

<div class="good">
{% prettify dart %}
new Task.oneShot();
new Task.repeating();
new ListBox(scroll: true, showScrollbars: true);
{% endprettify %}
</div>

## Type annotations

#### PREFER providing type annotations on public APIs.


Type annotations are important documentation for how a library should be used.
Annotating the parameter and return types of public methods and functions helps
users understand what the API expects and what it provides.

If, however, a public API does accept any type, or accepts a range of values
that Dart's type system cannot express, then it is acceptable to leave that
untyped.

For code internal to a library (either private, or things like nested functions)
annotate where you feel it helps, but don't feel that you *must* provide them.

<div class="bad">
{% prettify dart %}
install(id, destPath) {
  /* ... */
}
{% endprettify %}
</div>

Here, it's unclear what `id` is. A string? And what is `destPath`? A string or a
`File` object? Is this method synchronous or asynchronous?

<div class="good">
{% prettify dart %}
Future<bool> install(PackageId id, String destPath) {
  /* ... */
}
{% endprettify %}
</div>

With types, all of this is clarified.

#### PREFER using `var` without a type annotation for local variables.


Method bodies in modern code tend to be short, and the types of local variables
are almost always trivially inferrable from the initializing expression, so
explicit type annotations are usually just visual noise. Decent editors can
infer the type of local variables and still provide the auto-complete and
tooling support you expect.

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

#### PREFER using `double` or `int` instead of `num` for parameter type annotations in performance sensitive code.

Monomorphic call sites (sites that have stable input types)
can be optimized much easier than polymorphic call sites (sites that have
varying input types).

Whenever you can, pick a specific number type for your type annotation.
Explicitly say `double` or `int` to help your users pass in a consistent type
to your function or method.

When you use `num` as a type annotation, you are saying "either an int or
a double can go here." This ambiguity it harder for Dart runtimes to optimize.

#### DON'T type annotate initializing formals.


If a constructor parameter is using `this.` to initialize a field, then the type
of the parameter is understood to be the same type as the field.

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

#### AVOID annotating types on function expressions.


The value of function expressions is their brevity. If a function is complex
enough that types are needed to understand it, it should probably be a function
statement or a method. Conversely, if it is short enough to be an expression, it
likely doesn't need types.

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

#### AVOID annotating with `dynamic` when not required.


In most places in Dart, a type annotation can be omitted, in which case the type
will automatically be `dynamic`. Thus, omitting the type annotation entirely is
semantically equivalent but more terse.

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

#### DO annotate with `Object` instead of `dynamic` to indicate any object is accepted.


Some operations will work with any possible object. For example, a log method
could take any object and call `toString()` on it. Two types in Dart permit all
objects: `Object` and `dynamic`. However, they convey two different things.

The `Object` annotation says "I accept any object, and I only require it to have
the methods that `Object` itself defines."

A `dynamic` type annotation means that no type annotation can express what
objects you actually allow. (Or maybe one could, but you don't care to write
it.)

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

## Names

#### DO name types using `UpperCamelCase`.


Classes and typedefs should capitalize the first letter of each word (including
the first word), and use no separators.

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

#### DO name constants using `ALL_CAPS_WITH_UNDERSCORES`.


Constants&mdash;variables declared using `const`&mdash;are special in Dart
because they can be used in constant expressions, unlike `final` variables. To
clarify this, they are given their own naming style.

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

#### DO name other identifiers using `lowerCamelCase`.


Class members, top-level definitions, variables, parameters, and named
parameters should capitalize the first letter of each word *except* the first
word, and use no separators.

<div class="good">
{% prettify dart %}
var item;

HttpRequest httpRequest;

align(clearItems) {
  // ...
}
{% endprettify %}
</div>

#### DO name libraries and source files using `lowercase_with_underscores`.


Some file systems are not case-sensitive, so many projects require filenames to
be all lowercase. Using a separate character allows names to still be readable
in that form. Using underscores as the separator ensures that the name is still
a valid Dart identifier, which may be helpful if the language later supports
symbolic imports.

<div class="good" markdown="1">
Good:

* `slider_menu.dart`
* `file_system.dart`
* `library peg_parser;`
</div>

<div class="bad" markdown="1">
Bad:

* `SliderMenu.dart`
* `filesystem.dart`
* `library peg-parser;`
</div>

#### DO capitalize acronyms and abbreviations longer than two letters like words.


Capitalized acronyms can be harder to read, and are ambiguous when you have
multiple adjacent acronyms. Given the name `HTTPSFTPConnection`, there's no way
to tell if that's an HTTPS FTP connection or an HTTP SFTP one.

To avoid this, acronyms are capitalized like regular words, except for
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

## Comments

#### DO comment members and types using doc-style comments.


Dart supports two syntaxes of doc comments. Line doc comments start each line
with `///`:

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

Block doc comments start with `/**`, end with `*/` and can span multiple lines:

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

Within a doc comment, you can use [markdown][] for formatting.

[markdown]: http://daringfireball.net/projects/markdown/

#### DO use line comments for everything else.


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

#### DO capitalize and punctuate comments like sentences.


This doesn't mean that the comment must always be a complete sentence, though it
usually should. "Returns the number of items." is an acceptable comment.

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

#### DO use square brackets in doc comments for identifiers that are in scope.


If you surround things like variable, method or type names in square brackets,
then documentation generators can look up the name and cross-link the two
together.

<div class="good">
{% prettify dart %}
import 'dart:math';

/// Rolls both [Dice] and returns the highest rolled value.
num greatestRoll(Dice a, Dice b) => max(a.roll(), b.roll());
{% endprettify %}
</div>

#### DO describe method signatures in the prose of the documentation comment.



Other languages use verbose tags and sections to describe what the parameters
and returns of a method are.

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

The convention in Dart is to just integrate that into the description of the
method and highlight parameters using square brackets.

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

## Whitespace

Like many languages, Dart ignores whitespace. However, *humans* don't. Having a
consistent whitespace style helps ensure that human readers see code the same
way the compiler does.

#### DON'T use tabs.


Using spaces for formatting ensures the code looks the same in everyone's
editor. It also makes sure it looks the same when posted to blogs, or on code
sites like [Google Code][] or [GitHub][].

[google code]: http://code.google.com/projecthosting/
[github]: http://github.com

Modern editors emulate the behavior of tabs while inserting spaces, giving you
the easy editing of tabs and the consistency of spaces.

#### AVOID lines longer than 80 characters.


Readability studies show that long lines of text are harder to read because your
eye has to travel farther when moving to the beginning of the next line. This is
why newspapers and magazines use multiple columns of text.

If you really find yourself wanting lines longer than 80 characters, our
experience is that your code is likely too verbose and could be a little more
compact. Do you really need to call that class
`AbstractWidgetFactoryManagerBuilder`?

#### DO place the operator on the preceding line in a multi-line expression.


There are valid arguments for both styles but most of our code seems to go this
way, and consistency matters most.

<div class="good">
{% prettify dart %}
if (isDeepFried ||
    (hasPieCrust && !vegan) ||
    containsBacon) {
  print('Bob likes it.');
}
{% endprettify %}
</div>

Note that this includes `=>` as well:

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

#### DO place the `.` on the next line in a multi-line expression.


This supercedes the previous rule. Unlike other operators, if you split an
expression on a `.`, then put that at the beginning of the second line.

<div class="good">
{% prettify dart %}
someVeryLongVariable.withAVeryLongProperty
    .aMethodOnThatObject();
{% endprettify %}
</div>

#### DO indent block bodies two spaces.


<div class="good">
{% prettify dart %}
if (condition) {
  print('hi');
}
{% endprettify %}
</div>

#### DO indent continued lines with at least four spaces.


<div class="good">
{% prettify dart %}
someLongObject.aReallyLongMethodName(longArg, anotherLongArg,
    wrappedToNextLine);
{% endprettify %}
</div>

You may indent more than four spaces to line things up if you like:

<div class="good">
{% prettify dart %}
someLongObject.aReallyLongMethodName(longArg, anotherLongArg,
                                     wrappedToNextLine);
{% endprettify %}
</div>

#### DON'T indent lines that are continued with a function expression.


The one exception to the above rule is function expressions used within larger
expressions, like being passed to methods. These are formatted like so:

<div class="good">
{% prettify dart %}
new Future.delayed(const Duration(seconds:1), () {
  print('I am a callback');
});
{% endprettify %}
</div>

<div class="bad">
{% prettify dart %}
new Future.delayed(const Duration(seconds:1), () {
      print('I am a callback');
    });
{% endprettify %}
</div>

#### DO place the opening curly brace (`{`) on the same line as what it follows.


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

#### DO use curly braces for all flow control structures.


Doing so avoids the [dangling else][] problem.

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

There is one exception to this: short `if` statements with no `else` clause that
fit on one line may omit the braces.

<div class="good">
{% prettify dart %}
if (arg == null) return defaultValue;
{% endprettify %}
</div>

#### DO indent switch cases two spaces and case bodies four spaces.


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

#### DO use spaces around binary and ternary operators, after commas, and not around unary operators.



Note that `<` and `>` are considered binary operators when used as expressions,
but not for specifying generic types. Both `is` and `is!` are considered single
binary operators. However, the `.` used to access members is not and should
*not* have spaces around it.

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

#### DO place spaces around `in`, and after each `;` in a loop.


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

#### DO use a space after flow-control keywords.


This is unlike function and method calls, which do *not* have a space between
the name and the opening parenthesis.

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

#### DON'T use a space after `(`, `[`, and `{`, or before `)`, `]`, and `}`.


Also, do not use a space when using `<` and `>` for generic types.

<div class="good">
{% prettify dart %}
var numbers = <int>[1, 2, (3 + 4)];
{% endprettify %}
</div>

#### DO use a space before `{` in function and method bodies.


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

#### DO format constructor initialization lists with each field on its own line.


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

Note that the `:` should be wrapped to the next line and indented four spaces.
Fields should all line up (so all but the first field end up indented six
spaces).

#### DO use a space around `:` in named parameters and after `:`  for a named argument.


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

#### DO use a spaces around `=` in optional positional parameters.


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

#### DO use four spaces for method cascades


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
