--- 
layout: default
title: "Polymer.dart"
description: "基于标准的 web 组件：
用于 Dart web 应用的
自定义元素、模板、
和数据绑定。
Dart 版本的 Polymer。"
has-permalinks: true
---

<style>

.features h2 {
  color: gray;
}

.features i {
  font-size: 5em;
}

ol {
  margin-left: 11px;
}

.sidenav.affix {
  top: 55px;
}

hr {
  margin: 44px 0;
}

@media (min-width: 768px) and (max-width: 979px) {
  .sidenav.affix {
    top: 0;
  }
}

@media (max-width: 767px) {
  .sidenav.affix {
    position: static;
    width: auto;
    top: 0;
  }
}

.jumbotron h1 {
  margin-bottom: 22px;
}

</style>

<div class="jumbotron">
      <h1> {{page.title}} </h1>
      <p>
      用 Dart 和 web 组件创建结构化的、可封装的、客户
      端 web 应用。
        <br>
        <em>一个 Dart 版本的
        <a href="http://www.polymer-project.org">Polymer</a>。</em>
      </p>
</div>

<div class="row" markdown="1">

<div class="col-md-3" markdown="1">

<div class="sidenav" data-spy="affix" data-offset-top="250" markdown="1">

1. ToC
{:toc .toc .nav .nav-list}

</div>

</div>

<div class="col-md-8" markdown="1">

## 特性

Polymer.dart 移植了 _Polymer Foundation_
和 _Polymer Core_。

<div class="row features">

<div class="col-md-4 text-center">

<i class="fa fa-code"> </i>

<h2 class="no-permalink">自定义标签</h2>

设计你自己的 HTML 标签来封装 样式、结
构和行为。

</div>

<div class="col-md-4 text-center">

<i class="fa fa-exchange"> </i>

<h2 class="no-permalink">数据绑定</h2>

创建 Dart 对象和 DOM 节点之间的实时双向数据绑定。

</div>

<div class="col-md-4 text-center">

<i class="fa fa-check"> </i>

<h2 class="no-permalink">标准</h2>

今天就使用新兴的 web 标准。

</div>

</div>

<hr>

## 示例

在查看下面代码的同时，记得看看 Dart 教程
[定义一个自定义元素](/docs/tutorials/polymer-intro/)。
该教程告诉你如何定义、实现和初始化
一个自定义元素。

### 自定义元素

使用自定义元素扩展 HTML 标签。

该示例显示了一个简单的自定义元素。高级的自定义元素
可以包含样式、自定义行为、属性、数据绑定以及更多
功能。

下面的 HTML 代码定义了一个自定义元素：

{% prettify html %}{% raw %}
<!-- hello_world.html -->
<polymer-element name="[[highlight]]hello-world[[/highlight]]" noscript>
  <template>
    <p>Hello from inside a custom element!<p>
  </template>
</polymer-element>
{% endraw %}{% endprettify %}

下面的 HTML 代码_使用_ 了自定义元素：

{% prettify html %}
<head>
  <link rel="import" href="[[highlight]]hello_world.html[[/highlight]]">
  <script type="application/dart">export 'package:polymer/init.dart';</script>
  <script src="packages/browser/dart.js"></script>
</head>

<body>   
  [[highlight]]<hello-world></hello-world>[[/highlight]]
</body>
{% endprettify %}


### 数据绑定

使用实时的双向数据绑定来同步 DOM 节点和对象模型的数据。

该示例中，`ClickCounterElement` 的 `count` 变量绑定
到自定义元素 `<template>` 的 `{% raw %}{{count}}{% endraw %}` 中。
当 `count` 的值改变的时候， 元素的文本也跟着
改变。

{% prettify html %}{% raw %}
<polymer-element name="click-counter">
  <template>
    <button on-click="{{increment}}">Click Me</button>
    <p>You clicked the button [[highlight]]{{count}}[[/highlight]] times.</p>
  </template>
  <script type="application/dart" src="click_counter.dart"></script>
</polymer-element>
{% endraw %}{% endprettify %}

{% prettify dart %}
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('click-counter')
class ClickCounterElement extends PolymerElement {
  [[highlight]]@observable int count[[/highlight]] = 0;
  
  ClickCounterElement.created() : super.created();

  void increment(Event e, var detail, Node target) {
    count += 1;
  }
}
{% endprettify %}


### 自定义属性（attributes）

用属性来配置自定义元素。

该示例中，`VolumeNobElement` 的 `volume` 变量绑定
到自定义元素 `<template>` 的 `{% raw %}{{volume}}{% endraw %}` 中。
当 `volume` 的值改变的时候， 元素的文本也跟着
改变。

{% prettify html %}{% raw %}
<polymer-element name="volume-nob">
  <template>
    <p>You turned the volume to {{volume}}.</p>
  </template>
  <script type="application/dart" src="volume_nob.dart"></script>
</polymer-element>
{% endraw %}{% endprettify %}

{% prettify dart %}
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('volume-nob')
class VolumeNobElement extends PolymerElement {
  // @published means 'this is an attribute', and it is observable.
  [[highlight]]@published int volume[[/highlight]] = 0;

  VolumeNobElement.created() : super.created();
}
{% endprettify %}

可以通过如下自定义属性来初始化  volume 的值：

{% prettify html %}
<volume-nob volume="11"></volume-nob>
{% endprettify %}


### 条件模板

通过在模板中声明式条件来控制 UI。

条件模板是数据绑定的一部分。
如果 `count` 值变了，模板自动重新计算。

{% prettify html %}{% raw %}
<polymer-element name="click-counter">
  <template>
    <button on-click="{{increment}}">Click Me</button>
    <template [[highlight]]if="{{count <= 0}}"[[/highlight]]>
      <p>Click the button. It's fun!</p>
    </template>
    <template [[highlight]]if="{{count > 0}}"[[/highlight]]>
      <p>You clicked the button {{count}} times.</p>
    </template>
  </template>
  <script type="application/dart" src="click_counter.dart"></script>
</polymer-element>
{% endraw %}{% endprettify %}

{% prettify dart %}
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('click-counter')
class ClickCounterElement extends PolymerElement {
  @observable int count = 0;
  
  ClickCounterElement.created() : super.created();

  void increment(Event e, var detail, Node target) {
    count += 1;
  }
}
{% endprettify %}


### 模板循环

遍历一个集合，为每个集合的元素应用
一个模板。

模板循环是数据绑定的一部分。
如果从 `fruits` 中删除或者添加元素，
`<ul>` 的内容会自动更新。

{% prettify html %}{% raw %}
<polymer-element name="fav-fruits">
  <template>
    <ul>
      <template [[highlight]]repeat="{{fruit in fruits}}"[[/highlight]]>
        <li>
          I like {{ fruit }}.
        </li>
      </template>
    </ul>
  </template>
  <script type="application/dart" src="fav_fruits.dart"></script>
</polymer-element>
{% endraw %}{% endprettify %}

{% prettify dart %}
import 'package:polymer/polymer.dart';

@CustomTag('fav-fruits')
class FavFruitsElement extends PolymerElement {
  final List [[highlight]]fruits = toObservable[[/highlight]](['apples', 'pears', 'bananas']);

  FavFruitsElement.created() : super.created();
}
{% endprettify %}

### 扩展 DOM 元素

继承真正的 DOM 元素。

{% prettify html %}{% raw %}
<polymer-element name="fancy-button" [[highlight]]extends="button"[[/highlight]]>
  <template>
    <style>
    .fancy {
      color: pink;
    }
    </style>
    <span class="fancy"><content></content></span>
  </template>
  <script type="application/dart" src="fancy_button.dart"></script>
</polymer-element>
{% endraw %}{% endprettify %}

{% prettify dart %}{% raw %}
import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('fancy-button')
class FancyButton [[highlight]]extends ButtonElement with Polymer, Observable[[/highlight]] {
  FancyButton.created() : super.created() {
    polymerCreated();
  }
}
{% endraw %}{% endprettify %}

{% prettify html %}{% raw %}
<button [[highlight]]is="fancy-button"[[/highlight]]></button>
{% endraw %}{% endprettify %}

### Packaging 包

通过
[pub](https://www.dartlang.org/docs/dart-up-and-running/contents/ch04-tools-pub.html)
来分享和重用自定义元素，
pub 为 Dart package manager(包管理器)。

{% prettify bash %}{% raw %}
> pub install fancy_button
{% endraw %}{% endprettify %}

{% prettify html %}{% raw %}
<head>
  <link [[highlight]]rel="import"[[/highlight]]
    href="packages/fancy_button/fancy_button.html">
</head>
<body>
  <button [[highlight]]is="fancy-button"[[/highlight]]>Click me!</button>
</body>
{% endraw %}{% endprettify %}


### 更多示例代码

在
[polymer.dart 示例代码中](https://github.com/sethladd/dart-polymer-dart-examples)
可以看到很多很多示例代码。
学习如何
[绑定到 checkbox](https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web/bind_to_checkbox)、
[嵌套模板](https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web/nested_templates)、
[在自定义元素调用函数](https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web/call_method_on_custom_element)、
以及更多内容。 如果你需要一个新的示例，请 [告诉我们](https://github.com/sethladd/dart-polymer-dart-examples/issues?state=open) 。

<hr>

## 安装

用 [pub](http://pub.dartlang.org) 来
安装 polymer.dart。
在 `pubspec.yaml` 中添加如下代码即可：

    dependencies:
      polymer: any

然后，运行 `pub install` 来下载该库并在代码中使用。

查看 [polymer.dart pub 页面](http://pub.dartlang.org/packages/polymer)
了解更多内容。

<hr>

## 工具

Polymer.dart 提供一个工具 linter 来报告语法和用法警告。
linter 可以和 Dart 编辑器关联起来并直接
的 代码中显示警告。

在项目根目录中创建一个 `build.dart` 文件：

{% prettify dart %}
import 'package:polymer/builder.dart';

void main(List<String> args) {
  lint(entryPoints: ['web/index.html'], options: parseOptions(args));
}
{% endprettify %}

当保存文件的时候，Dart 编辑器运行  `build.dart` 并显示来自于
linter 的警告信息。

<img src="polymer-warning-in-editor.png">

### Building

用 `pub build` 把 polymer.dart 编译为 JavaScript，这样你的应用
就可以在大多数的浏览器中运行了。Build 的时候也会把脚本代码连接到同一个文件中
来加速网页加载速度。

首先，把 polymer.dart 的 _transformer_ 添加到你的 `pubspec.yaml` 文件中，
`transformers` 部分应该位于该文件的末尾处，在 依赖项后面。

{% prettify yaml %}
transformers:
- polymer:
    entry_points: web/index.html
{% endprettify %}

然后，在项目根目录运行 `pub build` 会生成一个 `build` 目录。

{% prettify bash %}
> pub build
{% endprettify %}

在 `build` 目录中包含 HTML、 JavaScript、和其他资源。
然后你可以在你喜欢的服务器中部署 `build` 目录中的文件。

关于 build 的详细信息，请参考： [pub build](http://pub.dartlang.org/doc/pub-build.html).

<hr>

## 从 Web UI 升级

Polymer.dart 是 Web UI 的下一次革命。

[从  Web UI 升级到 polymer.dart ](upgrading-to-polymer-from-web-ui.html)
提供了一些提示来帮助你升级。

<hr>

## 兼容性

Polymer.dart 在 IE9、 IE10、 Safari 6、最新的 Chrome、
最新的 Firefox、 和最新的 Android 版 Chrome 上测试通过。

Dart 团队和 Polymer 团队相互协作一起保证 polymer.dart
元素和 polyfills
(目前还没包含在浏览器中的特性)
能够完全兼容 Polymer。

<hr>

## 支持

我们非常期待你的建议和反馈。

* 在 StackOverflow 上询问 [如何办之类的问题][so] 。
* 加入我们的 [关于 polymer.dart 的日常讨论][web-ui-list] 
  邮件列表。
* 给 polymer-dev 邮件列表来 [反馈 web 组件的相关问题][polymer-dev-list]
  (该邮件列表和 Dart 无关)。
* 给 polymer.dart 提 [Bug 和功能请求][dartbug] 。

<hr>

## 源代码

Polymer.dart 是开源的。你可以在
[dart.googlecode.com/](https://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/pkg/) 中
查看 polymer.dart 代码和很多组件代码。
[下载代码](https://code.google.com/p/dart/wiki/GettingTheSource)
来深入研究并贡献补丁。

<hr>

## 状态

Polymer.dart 和 Polymer 一样还在开发中。

### Web UI parity

Web UI 是 polymer.dart 的先驱。
我们认为 Polymer.dart 和 Web UI 在功能上是同等的。

### Polymer parity

我们的目标是让所有的 Polymer 功能都可以在 Dart 中使用。

| Feature | Parity with Polymer
|--
| Custom Elements | Tracking
| Shadow DOM | Tracking
| Observers | Tracking
| Node.bind() | Tracking
| Template Binding | Tracking
| HTML imports | Tracking
| Polymer Expressions | Tracking
| [Polymer Core](https://github.com/Polymer/polymer) | Tracking
| Pointer events | Not started
| Web animations | Not started
| [Polymer base elements](https://github.com/Polymer/polymer-elements) | [Community effort](https://github.com/ErikGrimes/polymer_elements)
| [Polymer UI elements](https://github.com/Polymer/polymer-ui-elements) | [Community effort](https://github.com/ErikGrimes/polymer_ui_elements)
{: .table}

<hr>

## 教程

来自 [Dart 教程](/docs/tutorials/) 的 
[定义一个自定义元素](/docs/tutorials/polymer-intro/)，
介绍了如何使用  Polymer.dart 开发自定义
元素的介绍。
你也可以查看教程中的其他
 Polymer 
[示例](/docs/tutorials/polymer-intro/#what-next)
。
<hr>

## 附加读物

下面是 polymer.dart 库的一些延伸性资料。阅读这些资料有利于你掌握 polymer.dart。

### Polymer

* Read Polymer's [guiding principles](http://www.polymer-project.org/#guiding-principles)
* Watch the [Hello, Polymer!](http://www.youtube.com/watch?v=irGDN5Ysi_A)
  video featuring some of the lead members of Polymer.

### 文章

* [HTML5Rocks - Shadow DOM 101](http://www.html5rocks.com/en/tutorials/webcomponents/shadowdom/)
* [HTML5Rocks - Shadow DOM 201: CSS and Styling](http://www.html5rocks.com/tutorials/webcomponents/shadowdom-201/)
* [HTML5Rocks - Shadow DOM 301: Advanced Concepts & DOM APIs](http://www.html5rocks.com/tutorials/webcomponents/shadowdom-301/)
* [Custom elements - defining new elements in HTML](http://www.html5rocks.com/en/tutorials/webcomponents/customelements/)

### 规范

Much of polymer.dart is built upon new and emerging web specifications.
Polymer.dart offers polyfills for the following features.

Heads up: These are specs written for implementors. Lots of details ahead.

[Custom elements][custom-elements-spec]
: A method for enabling the author to define and use new types of DOM elements.

[Shadow DOM][shadow-dom-spec]
: An encapsulation primitive for DOM subtrees. It provides a method of
establishing and maintaining functional boundaries between DOM trees and how
these trees interact with each other within a document, thus enabling better
functional encapsulation within the DOM.

[Template element][template-spec]
: A method for declaring inert DOM subtrees in HTML and manipulating them
to instantiate document fragments with identical contents.

[HTML Imports][html-imports-spec]
: A way to include and reuse HTML documents in other HTML documents.


</div>

</div>

[polymer]: http://www.polymer-project.org
[so]: http://stackoverflow.com/tags/dart
[web-ui-list]: https://groups.google.com/a/dartlang.org/forum/#!forum/web-ui
[polymer-dev-list]: https://groups.google.com/forum/?fromgroups=#!forum/polymer-dev
[dartbug]: http://dartbug.com/new
[custom-elements-spec]: https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/custom/index.html
[shadow-dom-spec]: https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/shadow/index.html
[html-imports-spec]: https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html
[template-spec]: https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/templates/index.html
