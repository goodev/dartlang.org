---
layout: article
title: "Dart Doc 注释指南"
rel:
  author: kathy-walrath
description: "如何为 Dart API 编写文档注释。"
has-permalinks: true
article:
  written_on: 2012-11-01
  collection: everyday-dart
---

{% include toc.html %}

# {{ page.title }}

<em>作者： Kathy Walrath<br />
<time pubdate date="2012-11-21">2012 11月</time>
</em>

该文档介绍了 Dart 团队一致同意使用的
文档注释约定。
如果你有任何改进该约定的建议，请
[告诉我们](http://groups.google.com/a/dartlang.org)。

## 示例

下面是一个函数或者方法的典型注释：

<!-- BEGIN(min) -->{% prettify dart %}
/**
 * Returns the lesser of two numbers.
 *
 * Returns NaN if either argument is NaN.
 * The lesser of -0.0 and 0.0 is -0.0.
 * If the arguments are otherwise equal (including int and doubles with the
 * same mathematical value) then it is unspecified which of the two arguments
 * is returned.
 *
 *     return min(100, value);
 */
num min(num a, num b) {/*...*/}
{% endprettify %}<!-- END(min) -->

变量和属性的注释示例：

<!-- BEGIN(PI) -->{% prettify dart %}
/// The PI constant.
const double PI = 3.1415926535897932;
{% endprettify %}<!-- END(PI) -->

类描述的示例注释请参考
完整的
([生成文档](http://api.dartlang.org/dart_async/Completer.html)和
[源代码](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/sdk/lib/async/future.dart))。
中的注释。


## 内容

文档注释的第一段内容非常特别。
然后，后面的内容有你决定，
我们强烈建议包含示例代码。


### 第一段：一句描述

和该页第一个示例一样，第一段文档注释是
简要的、面向用户的依句号结尾的描述。
并不一定是一个完整的
句子。

该描述应该可以帮助使用者来判断
该
API 是否对他们有用。
从来不要只是重复 API 的名字；
尝试用更多信息来重新描述一下。
如果可以请避免链接跳转。


#### 方法和函数
{:.no_toc}

方法/函数 描述以 **第三人称动词**开头。

例如：

* `Returns true if every element of this collection satisfies the predicate [f]. `
* `Starts the stopwatch.`


#### 变量、 getters 和 setters
{:.no_toc}

静态/示例 变量和 getter/setter 描述应该用**名词短语**描述。

如果既有 setter 又有 getter，只在 getter 上提供注释即可。
这样，会按照变量对待。
由于在函数/变量声明的时候已经包含了类型信息，所以没必要再次包含类型信息了。

示例：

* `The number of days in the current month.`


#### 类
{:.no_toc}

用**名词短语**来描述类。

示例：

* [List](http://api.dartlang.org/dart_core/List.html) 的描述: <br>`An indexable collection with a length, also known as an array.`

* [String](http://api.dartlang.org/dart_core/String.html) 的描述: <br>`A basic string, implemented as an immutable sequence of UTF-16 code units.`  


#### 库
{:.no_toc}

用**名词短语**来描述库。

示例：

* [dart:core](http://api.dartlang.org/dart_core.html) 的描述: <br>`Core functionality that's automatically imported into every Dart program.`

* [dart:collection](http://api.dartlang.org/dart_collection.html) 的描述: <br>`Data structures for managing collections of objects.`
        
        

### 剩下的文档注释

第一段以后的内容用来描述返回值、
需要什么参数、副作用、
可能抛出的异常 和 相关的 API 等等。

对于常用的情况请提供**示例代码**和
连接到更详细信息的**链接**。


## Markup（标记）

在 [Dart 语言规范](/docs/spec/)的
15.1.2 节中定义了如何使用
标记来格式化注释。
目前，dartdoc 支持一些 markdown 语法（如下所述），
但是以后可能会有所改变。

**当不确定的时候，少用格式标记。**你很少有机会搞坏 文档注释，并且其他人也可以添加格式化标记。


### 链接

可以链接到 Dart 的 标示符 和任意 URI ，
标示符中 构造函数 比较特殊。

#### 标示符
{:.no_toc}

`[id]` _或者_ `[id](uri)`

如果 _id_ 是类的名字，不管是否具有同名的构造函数，生成的链接都
指向该类。
如果指定 _uri_ ，则必须为 Dart 的库 _L_，并且
_id_ 必须是声明在 _L_ 里面的名字。

#### 构造函数
{:.no_toc}

`[new c]` _或者_ `[new c](uri)`


#### 超链接
{:.no_toc}

`[text](uri)` _或者_ `<uri>`

注意： _uri_ 是要链接的 URI 地址；
_text_ 是替代 URI 来显示的文本。


### 块风格

#### 段落
{:.no_toc}

用 _一个空白行_ 来表示一个段落的结束。

#### 代码块
{:.no_toc}

在 _注释字符后面_ 用四个空白字符表示，
也就是在 * 或 / 后面有**五个空格**
（由于 * 或 / 后面总是跟随一个空格）。
示例：

{% prettify dart %}
/**
 * ...
 * For example:
 *
 *     Future&lt;int> future = getFutureFromSomewhere();
 *     future.then((value) {
 *       print("I received the number $value");
 *     });
 * ...
 */
{% endprettify %}

#### 标题

<pre>## header text until newline</pre>

当前支持次级标题(例如 `###`)
但是并没加入规范中。


#### 未排序（子弹头）列表
{:.no_toc}

<pre>* item continues until next list item or blank line</pre>

在第一个列表条目前面必须为一个空行。


#### 排序（带数字）的列表
{:.no_toc}
<pre>1. item continues until next list item or blank line
2. next item</pre>

规范中没有规定自动添加号码。用
`2.` 代表 #2、`3.` 代表 #3，以此类推。


### 行内格式

#### 代码字体
{:.no_toc}

<code>`code`</code> _(注意反引号)
或者_
<code>[:code:]</code>

如非如下两种情况，尽量避免使用代码字体：
(1) 一大段代码
(2) 可以有效的避免混淆（混乱）

#### 斜体
{:.no_toc}

`_single underscore_`
_或者_
`*single asterisk*`

如果规范中有澄清的话，单个星号
可能会用作粗体。

#### 粗体
{:.no_toc}

`**double asterisk**`
_或者_
`__double underscore__`

规范中还没有保护双星号和双下划线，
所以很有可能用单星号代表粗体。

下面是一个警告注释示例：

{% prettify dart %}
/**
 * ...
 * **Warning:** This feature is not yet supported in all modern browsers.
 * See <http://caniuse.com/flexbox> for current status.
 * ...
 */
{% endprettify %}


## 选词造句和标点符号等

* 保持短小精悍、直接明白。文档是为用户而不是为实现者看的。
* 避免使用缩写，例如 “i.e.” 和 “e.g.” (很多人不知道缩写代表啥意思。) 如果有必要，直接用 “that is” 和 “for example” 。
* 如果没有恰当的理由，请在示例代码中用 单引号 (') 来替代
      双引号 (")，
  (只是为了一致性考虑。)
* 当指代一个从当前类创建的对象时候，用 "this" 而不是 "the"。
  例如：
  Adds an item to this list.


## 资源

* Dart 风格指南中的 [注释](/articles/style-guide/#comments)
   部分。
* dart:math API doc 
  ([generated doc](http://api.dartlang.org/dart_math.html),
  [source code](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/sdk/lib/math/math.dart))
* [dart-doc-testing](https://github.com/kwalrath/dart-doc-testing) 项目
  ([generated doc](http://kwalrath.github.com/dart-doc-testing/comment_test/CommentTester.html),
  [source code](https://github.com/kwalrath/dart-doc-testing/blob/master/CommentTest.dart))
