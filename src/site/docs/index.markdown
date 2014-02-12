---
layout: default
title: "开发者指南"
description: "Dart 语言的文档、参考、库以及工具。"
has-permalinks: true
---

{% include docs_toc.html %}

# {{ page.title }}

Dart 开发概览告诉你一些能够
帮助你创建、测试和部署 Dart 代码的
文档、文章和其他开发资源。

## 开始

阅读下面内容，
或者开始[下载 Dart](/#get-started)
并玩玩 Dart 编辑器。

[海盗们 停下来：编写个 Web 应用吧](/codelabs/darrrt/)
：一步一步创建一个 web 应用 。
这个一小时代码实验室假设你具有其他编程语言背景，
但是并不要求对 Dart 或者 HTML 有所了解。

[语言概览 (_Dart: Up and Running_, Chapter 2)](/docs/dart-up-and-running/contents/ch02.html)
： 介绍 Dart 语言中的每个主要功能特性，
从变量到操作符、从类到库。

[Dart 教程](/docs/tutorials/)
：使用 Dart 创建 web 应用的手把手教程。

## 概念

目前你不需要查看下面的所有内容，
但是要记得这些内容以方便你以后参考。


### 库

下载的 Dart SDK 中包含了一些库。
你也可以定义自己的库或者
使用[pub 包管理器](http://pub.dartlang.org)
来获取其他的库。

[库和可见性 ( _Dart: Up and Running_  Chapter 2 的一部分)](/docs/dart-up-and-running/contents/ch02.html#libraries)
： 学习如何使用和创建库。 

[库概览 (_Dart: Up and Running_, Chapter 3)](/docs/dart-up-and-running/contents/ch03.html)
：学习如何使用 每个 Dart 库中的主要特性。

[文章](/articles/)
：从"库和 APIs"部分学习如何
使用独立的库、包和 API，例如
[polymer.dart](/polymer-dart/)、
[单元测试](/articles/dart-unit-tests/)、
和 [Futures](/articles/using-future-based-apis/)。

[API 文档](http://api.dartlang.org)
：查看 Dart 库的所有 API 文档。


### 核心基础类

很多 Dart 函数返回 Iterable、Future或者 Stream 对象。


#### Iterable

一个 Iterable 对象是一个 对象的集合，例如
list 或者 set。
Dart 语言中的 Iterable 类提供了
用于 for-in 循环的接口。
深入了解：

* [Collections ( _Dart: Up and Running_ Chapter 3 的一部分)](/docs/dart-up-and-running/contents/ch03.html#ch03-collections)
* [Iteration ( _Dart: Up and Running_, Chapter 3 的一部分)](/docs/dart-up-and-running/contents/ch03.html#ch03-iteration)
* [Iterable API 文档](http://api.dartlang.org/dart_core/Iterable.html)


#### Future

Future 对象代表一个未来时刻获取到的值。
例如， dart:io 中的 File 类的 readAsString() 函数
返回一个 Future&lt;String>，
你可以使用她获取整个文件的内容为一个字符串。
深入了解：

* [使用 Future APIs](/articles/using-future-based-apis/)
* [Futures 和 错误处理](/articles/futures-and-error-handling/)
* [Future API 文档](http://api.dartlang.org/dart_async/Future.html)


#### Stream

Stream 对象代表一个未来时刻获取到的
一系列数据。
Stream 的一个示例是
 dart:html 中的按钮的 onClick 事件流。
 另外一个示例就是 dart:io 的 File 类的 openRead()函数的返回值，
 用来读取文件数据流。
深入了解：


* [用 Streams 数据](/docs/tutorials/streams/)
* [在 Dart 中创建 Streams](/articles/creating-streams/)
* [Stream API 文档](http://api.dartlang.org/dart_async/Stream.html)

## 创建命令行程序

可以用 Dart 干任何事情，从脚本到 web 服务器。
感谢 Heroku 支持第三方运行环境，
你可以在 Heroku 云服务器中运行 Dart 应用的服务器端代码。

* [dart: The Standalone VM](/docs/dart-up-and-running/contents/ch04-tools-dart-vm.html)
* [Heroku cloud application platform](http://www.heroku.com) 

## 创建 Web 应用

如果你对 web 应用还不了解，
请先看看 <a href="/docs/tutorials/">Dart 教程</a>&mdash;
假设你没有 Dart 和 web 应用的开发经验，
通过一些列教程告诉你如何用 Dart 编写 web 应用，

当你开发 web 应用的时候，
可以在 Dartium 中运行。
开发完成后，可以把你的 Dart 代码编译
为 JavaScript 并在其他浏览器中运行。

当创建 web 应用的时候，你可以用
dart:html 和 polymer.dart 包
或者 AngularDart。
虽然你可能不需要用 polymer.dart 或者 AngularDart，
但是这些工具简化了你的代码。


### dart:html

浏览器中的 Dart 基础接口。

* [连接 Dart 和 HTML](/docs/tutorials/connect-dart-html/)
  (Dart 教程中的一部分)
* [改进 DOM](/articles/improving-the-dom/)
* [dart:html API 文档](http://api.dartlang.org/dart_html.html)

### Polymer.dart

一个可以让你今天就使用未来 web api的包。

* [Polymer.dart 主页](/polymer-dart/)
* [pub.dartlang.org/packages/polymer](http://pub.dartlang.org/packages/polymer)
* [polymer.dart 示例](/samples/#polymer_dart)

### AngularDart

Angular 框架的 Dart 实现。

* [AngularDart 教程](https://github.com/angular/angular.dart.tutorial/wiki)
* [pub.dartlang.org/packages/angular](http://pub.dartlang.org/packages/angular)
* [AngularDart 示例](/samples/#angular_dart)

### Dart 和 JavaScript

你没有被束缚到 Dart 库中。
通过 dart:js 库，
你可以在 Dart 中使用其他 JavaScript 库。

* [dart:js API 文档](http://api.dartlang.org/dart_js.html)
* [使用 JavaScript 的示例](/samples/#using_javascript_from_dart)

## 工具

Dart 工具非常友好，你
可以选择不同的编辑器、IDE以及其他工具。


当 [下载 Dart](/#get-started)后，
只包含[Dart 编辑器](/tools/editor/) IDE、
[Dartium](/tools/dartium/) (带有 Dart 虚拟机的浏览器)
和 [Dart SDK](/tools/sdk/)。
SDK 包含一些命令行工具，分别为：
 Dart VM (dart)、一个 Dart-to-JavaScript 编译器 (dart2js)、
 和一个包管理器 (pub)。

[Dart 编辑器](/tools/editor/)
：开始学习 Dart 的最简单方式。

[Dart 工具](/tools/)
：关于其他工具的一些信息和
下载地址。


## 测试

一个静态的分析器和单元测试库
提供了测试 web 和命令行应用的功能。
如果你的代码是开源的，
尝试使用 drone.io 这个持续集成测试功能。

* [dartanalyzer: 静态分析器](/docs/dart-up-and-running/contents/ch04-tools-dart_analyzer.html)
* [为 Pub 包编写单元测试](/articles/writing-unit-tests-for-pub-packages/)
* [Dart 中的单元测试](/articles/dart-unit-tests/)
* [drone.io](http://drone.io)

## 其他资源

当你遇到麻烦或者有任何疑问，
试试这些资源。


### 编程问题

在这里询问关于 Dart 编程的问题：

* [Stack Overflow](http://stackoverflow.com/questions/tagged/dart)
* [Dart 中文论坛](http://bbs.dartlang.cc)


### 代码风格

如果可能，请遵守如下文档中
推荐的代码格式。

* [Dart 的习惯用法](/articles/idiomatic-dart/)
* [Dart 风格指南](/articles/style-guide/)
* [Dart Doc 注释指南](/articles/doc-comment-guidelines/)

### 问题和特性反馈

如果你发现一个Bug，
搜索下 Dart 问题列表看看该 Bug 是否
已经被发现了，是否有
解决方法。

要请求一个新特性，你可以创建一个问题，或者
在适当的[邮件列表](/support/)中发起一个
讨论。

* [Dart 问题列表](http://code.google.com/p/dart/issues/list)

