---
layout: article
title: "在 Dart 中模拟方法"
description: 如何定义行为和方法一样的 Dart 类
rel:
  author: gilad-bracha
has-permalinks: true
article:
  written_on: 2012-01-01
  updated_on: 2013-11-01
  collection: language-details
---

{% include toc.html %}

# {{ page.title }}

<em>作者： Gilad Bracha <br>
2012 1月
(2013 11月更新)</em>

该文章介绍 如何定义行为和方法一样的 Dart 类。

## call() 函数

下面的示例中，是一个普通的定义
了一个 `call()` 函数的 `WannabeFunction` 类。

{% prettify dart %}
class WannabeFunction {
  call(int a, int b) => a + b;
}
{% endprettify %}

call() 很特殊，任何定义 call() 函数的对象都假定在
动态的模拟一个方法调用。
这样，我们可以和使用方法一样来使用 WannabeFunction 实例：

{% prettify dart %}
var wf = new WannabeFunction();
wf(3, 4); // 7
{% endprettify %}

上面的代码和直接使用方法相比有点繁琐。
但是，有些地方该功能还是相当有用的。
同时这也是 Dart 语言的核心设计哲学：

* 对于一个对象来说，最重要的是其行为。如果一个对象 _a_ 和一个对象 _b_ 的接口兼容，则 _a_ 差不多可以替代 _b_。
* 任何对象的接口都可以被另外一个对象模拟

### 这是如何实现的呢？

当计算 x(a<sub>1</sub>, .., a<sub>n</sub>) 的时候，如果是一个普通的方法，
则用普通的方式来调用；如果不是，我们就在上面调用 call() 函数。
如果 x 支持 call() 函数并且能够兼容调用的参数，则就调用 call() 函数。

否则，就调用 `noSuchMethod()`。`noSuchMethod()` 的默认实现是：
先检测是否由于调用 call() 引起的，如果是的话，则抛出一个帮助性错误信息建议你或许应该使用闭包。


## apply() 函数

Function 类用如下签名定义了一个
静态的 `apply()` 函数：

{% prettify dart %}
static apply(Function function,
                      List positionalArguments,
                      [Map<Symbol, dynamic> namedArguments]);
{% endprettify %}

apply() 函数用泛型方式来调用函数。
最后一个参数是可选的，只有当调用的函数支持命名参数的时候才需要该参数。
最后一个参数是用 map 提供的，key 为参数的名字；value 为参数的值。
这里值得注意的是，名字是通过
[Symbol](http://api.dartlang.org/docs/releases/latest/dart_core/Symbol.html)
类的实例定义的。


## 符号

你可以从字符串创建符号：

{% prettify dart %}
new Symbol('myFavoriteMethodName');
{% endprettify %}

如果可能，使用常量符号对象：

{% prettify dart %}
const Symbol('myFavoriteMethodName');
{% endprettify %}

用常量符号可以帮助 dart2js 来压缩你的代码。


## 方法类型

另外一个问题是，用户自定义的方法类是如何和系统关联起来的。
为了恰当的模拟方法，我们需要他们是一些方法类型的成员（也就是说，用 is 关键字来检查是否属于一个类型，返回值为 true，如下所示）：

{% prettify dart %}
typedef BinaryFunction(a,b);
...
new WannabeFunction() is BinaryFunction; // true
{% endprettify %}

因此，如果一个对象具有一个 call() 函数，并且该函数也是一个方法类型的成员则我们判定
该对象就是这个方法类型的成员。
{Therefore, we decree that an object is a member of a function type if the
object’s class has a call() method and that method is a member of the function
type.}

## Interactions with mirrors and noSuchMethod()

在 Dart 中，通过重写 noSuchMethod() 函数，你可以定义当调用该对象不存在的函数时的行为。
下面是演示如何在 noSuchMethod() 中用方法模拟的示例：

{% prettify dart %}
noSuchMethod(Invocation msg) =>
    msg.memberName == #foo ? Function.apply(baz,
                                msg.positionalArguments,
                                msg.namedArguments)
                          : super.noSuchMethod(msg);
{% endprettify %}

第一个分支处理了你想把参数转移到另外一个函数的情况。
如果你知道 `baz` 函数不支持任意的命名参数，则可以用 `Function.apply(baz, msg.positionalArguments)` 。
第二个分支只是简单的调用标准的 noSuchMethod() 实现，这是一个常见的情况。

noSuchMethod() 只有一个 
[Invocation](http://api.dartlang.org/dart_core/Invocation.html) 对象参数。
Invocation 的布尔属性确定函数的调用语法，如下表所示：

<!-- TODO: move this to stylesheet -->
<style type="text/css">
  .property-table { margin-bottom: 20px;}
  .property-table td {border: 1px solid #bbb; text-align: center;}
  .property-table td.true {background: #d9f2db;}
  .property-table td.false {background: #ffbfbf;}
</style>

<table class="property-table">
<tr>
  <th>&nbsp;</th>
  <th colspan="3">Form of method invocation</th>
</tr>
<tr>
  <th>&nbsp;</th><th>x.y</th><th>x.y = e</th><th>x.y(...)</th>
</tr>
</tr>
  <th align="left">isMethod</th>
  <td class="false"> false </td> <!-- x.y -->
  <td class="false"> false </td> <!-- x.y = e -->
  <td class="true"> true </td>   <!-- x.y(...) -->
</tr>
<tr>
  <th align="left">isGetter</th>
  <td class="true"> true </td>   <!-- x.y -->
  <td class="false"> false </td> <!-- x.y = e -->
  <td class="false"> false </td> <!-- x.y(...) -->
</tr>
<tr>
  <th align="left">isSetter</th>
  <td class="false"> false </td> <!-- x.y -->
  <td class="true"> true </td>   <!-- x.y = e -->
  <td class="false"> false </td> <!-- x.y(...) -->
</tr>
<tr>
  <th align="left">isAccessor</th>
  <td class="true"> true </td>   <!-- x.y -->
  <td class="true"> true </td>   <!-- x.y = e -->
  <td class="false"> false </td> <!-- x.y(...) -->
</tr>
</table>

It is important not to assume that `isMethod` means that a non-accessor was
being looked up, since in fact, Dart semantics mean that we would have called
noSuchMethod() only if neither a normal method nor a getter were found.
Likewise, `isGetter` does not imply a getter was being looked up; if a method
was present, it would be closurized and returned.

## 总结

下面是如何实现自定义方法类型的必备知识：

1.  定义一个带有名字为 **call** 函数的类。
1.  实现 call()  函数来定义当用你的类来当做函数调用（使用 **()** 语法）的时候的行为。
1.  作为一个好的风格，让你的类实现 **Function** 接口。
 
