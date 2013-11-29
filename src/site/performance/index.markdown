---
title: Dart 性能
layout: default
description: 跟踪 Dart VM 和 dart2js 的性能。
js:
- url: /js/performance-charts.js
  defer: true
---

# {{ page.title }}

跟踪 [Dart VM](/docs/dart-up-and-running/contents/ch04-tools-dart-vm.html) 和
[dart2js](/docs/dart-up-and-running/contents/ch04-tools-dart2js.html) 的性能。更多信息访问
[Dart 基准测试](/articles/benchmarking/)。

<ul class="nav nav-tabs" id="performance-charts-nav">
</ul>

<div class="tab-content" id="performance-charts">
</div>

按住鼠标拖动来左右移动，按住 shift 并拖动来实现缩放。

<section id="performance-faq" markdown="1">

## FAQ

<div markdown="1">
测试的分数说明了啥？
: 分数为每秒运行的次数：在一秒内可以运行
  基准测试的次数。所有的分数都是
  越大性能越好。
</div>

<div markdown="1">
在做何种基准测试？
: 当前用
  [Octane](https://developers.google.com/octane/)基准测试来显示图标，包含
  DeltaBlue、 Richards、和 Tracer。

  * [DeltaBlue](https://github.com/dart-lang/benchmark_harness/blob/master/example/DeltaBlue.dart)
  是一个单向约束求解器（one-way constraint solver），
  由 John Maloney 和 Mario Wolczko 用 Smalltalk 编写。
  DeltaBlue 主要关注多态和面向对象编程。

  * [Richards](https://github.com/dart-lang/benchmark_harness/blob/master/example/Richards.dart)
  是 OS 内核模拟测试，由 Martin Richards 为 BCPL 编写。
  Richards 主要关注属性访问和 调用函数和方法。

  * [Tracer](https://github.com/dart-lang/benchmark_harness/tree/master/example/Tracer/dart)
  是射线追踪测试，由 Adam Burmister 
  用 JavaScript 编写。
 Adam 和 Octane 版本的 JavaScript 测试都使用了 prototype.js 库
 中的类封装模式。
 由于 Dart 原生支持类系统，
	所以和 Octane 版本来比较性能会不准确。
 所以我们用改进的 JavaScript 版本 Tracer 来和
  Dart 对比测试性能。
	改进的版本只支持构造函数和原型，并没有任何抽象层；
	改进后的代码比 Octane 中的 Raytrace JavaScript 测试快
	50%。
</div>

<div markdown="1">
如何在 Dart VM、 dart2js 和 V8 中生成数字？
: Dart VM 使用 Dart VM 中的 
  [benchmark harness](https://github.com/dart-lang/benchmark_harness) 
  来生成数字。
  dart2js 中的数字通过把 benchmark 和 harness 转换为 JavaScript 并在
  V8 中运行生成的代码。
  最后， V8 数字使用 JavaScript 中同样的 benchmark 和同样的  harness
  来生成。
</div>

<div markdown="1">
使用何种系统配置来运行的测试？
: 我们使用了 Intel(R) Core(TM) i5-2400 CPU @ 3.10GHz
 处理器并运行 Ubuntu 12.04 LTS x64 系统。
</div>

<div markdown="1">
是用 32-bit 还是 64-bit ？
: 用的是 32-bit。代码也可以在  64-bit 系统运行，但是我们运行的是
   32-bit 版本的 V8 和 Dart VM。
</div>

<div markdown="1">
在 Dart 中使用显式类型是否公平？是否需要把 Dart 变量都声明为没有类型的才比较公平？
: 这是公平的。在 VM 产品模式下运行，Dart 的类型注解在设计上就不影响
  运行性能。更多信息，参考
  [ Dart 可选静态类型](/articles/optional-types/) 和
  [为什么类型是可选的](/articles/why-dart-types/) 文章。
  _Credit to [olliej on HN](http://news.ycombinator.com/item?id=4903435)._
</div>

<div markdown="1">
还有其他基准测试吗？
: 正确的移植基准测试需要时间。当更多的基准测试准备好后，
 我们会发布新的测试图标。
</div>

</section>
