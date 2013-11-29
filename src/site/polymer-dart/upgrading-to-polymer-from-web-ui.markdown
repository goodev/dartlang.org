---
layout: default
title: "从 Web UI 升级到 Polymer.dart "
description: "学习一些升级 Web UI 到 Polymer.dart 的一些提示"
has-permalinks: true
---

# {{ page.title }}

这里是一些从 Web UI 升级到  [polymer.dart](/polymer-dart/) 的一些开发者建议，并不完善。

如果你有任何升级建议，请给我们发送一个
该页面的
[pull request](https://github.com/dart-lang/dartlang.org)
，或者发送你的建议到
[web-ui@dartlang.org](https://groups.google.com/a/dartlang.org/forum/#!forum/web-ui)。
先谢谢您的支持！

### 开始

* 我们建议为你的 "application" HTML 页面创建一个组件。
  Polymer 认为任何东西都是一个组件。
  - 这样可以使用 Polymer风格 的事件绑定，该功能只能在 
    polymer元素 模板中使用。
  - 这样也设置了元素的数据绑定，并且启用了
    [Polymer 表达式](http://pub.dartlang.org/packages/polymer_expressions)
    功能。

* 你可以把 `<template>` 元素放到 main HTML 页面中，当他们并 *不会*
  绑定到 main 库作用域中。Polymer.dart 不支持绑定到库作用域，
  但是通过在 Dart 对象上设置
  [model](http://api.dartlang.org/docs/releases/latest/dart_html/Element.html#model)
  你可以初始化一个模板。
  
  polymer 元素的模板 *将会* 自动初始化为模型，
  和 Web UI 一样提供了访问其内容的便利方法。

* 要使应用编译为 JavaScript ，你需要先 build 应用。
  参考 [deploy_to_javascript](https://github.com/sethladd/dart-polymer-dart-examples/tree/master/web/deploy_to_javascript)
  和它的 `build.dart` 文件。注意 `--deploy` 参数。

### 自定义元素

* 用 `<polymer-element>` 替代 `<element>`。

* polymer-element 元素的 `extends` 属性是可选的。如果
  你使用了该元素，则应该使用 `<div is="my-element">` 这种格式；如果你没有用
  `extends` 属性，则可以直接使用 `<my-element>`。

  如果你继承了 DOM 元素，则实现自定义元素的 Dart 类也需要继承对应的
  元素类型。

*  polymer-element 的 `constructor` 属性已经失效。

* 如果你的自定义元素没有对应的 Dart 类，
  在 `<polymer-element>` 元素中添加一个 `noscript` 属性。

* 自定义元素的 Dart 类必需 _注册过_。
  用 `@CustomTag('element-name')` 注解可以很方便的注册 Dart 类。
  你也可以手工的调用函数 `registerPolymerElement` 来注册。

* 在 `created()` 命名构造函数中 **必需** 调用 `super.created()` 。
 如果你在继承其他自定义元素， 
  在 `enteredView` 和 `leftView` 也推荐调用 super 函数。

* 用 `shadowRoot` 来查找你自定义元素内的节点。
  如果节点具有 ID 属性，则可以用 `$['the-id']` 这种"自动节点查找"方式来查找。

* `<polymer-element>`的 `apply-author-styles` 属性
  现在有个 getter 可以获取 CSS 样式内容了：
  e.g.:

    class MyElement extends PolymerElement {
       bool get applyAuthorStyles => true;
       // ...
    }

* 声明式事件处理方式只能在自定义元素内使用。
  另外 也可以用  {% raw %}'on-click="{{doFoo}}"'.{% endraw %} 来替代 `on-click="doFoo()"`。

* 不再支持带有连字号的自定义属性。 你现在可以用
  ： `<foo-bar myPropertyName="{{expr}}">`。

### 数据绑定

* 对象要检测改变事件 **必需** 实现 Observable。
  查看 [observe](http://api.dartlang.org/docs/releases/latest/observe.html)
  库了解详情。

* 现在用 
  [Polymer 表达式](http://pub.dartlang.org/packages/polymer_expressions)
  替代绑定数据中的 Dart 表达式。 Polymer 表达式 是更强大的数据绑定语言，
  其提供了便利的过滤操作和 null 值的安全使用。

* Getters 不再是 observable 了的。需要在  `created` 回调函数中用
  [onPropertyChange](http://api.dartlang.org/docs/releases/latest/observe.html#onPropertyChange) 和
  [notifyProperty](http://api.dartlang.org/docs/releases/latest/observe.html#notifyProperty)
  来让系统知道该值已经改变了。你可以使用 observe 库中的其他辅助功能，
  例如，
  [PathObserver](http://api.dartlang.org/docs/releases/latest/observe/PathObserver.html)
  和 [ListPathObserver](http://api.dartlang.org/docs/releases/latest/observe/ListPathObserver.html).

* 修改的
  [field](http://api.dartlang.org/docs/releases/latest/observe/PropertyChangeRecord.html#field)
  的名字现在为 Symbol ，而不是 String 了。

* 在 `template if` 表达式中 Null 为 false。
  Non-null 和 non-false 值为 true。
  关于该问题有还有 Bug，请查看
  [issue 13044](https://code.google.com/p/dart/issues/detail?id=13044)。

* 使用 `repeat` 属性替代模板中的 `iterate` 属性。

* Polymer.dart 不支持模板标签的 `instantiate` 属性。
  要初始化一个模板，只要绑定其模型即可，需要确保模板有个 `bind` 属性。

  用 `if` 替代条件中的 `instantiate` 。

* Polymer.dart 中的所有数据绑定表达式都需要 `{{ }}`，
  模板中的`if` 和 `repeat` 也需要。
  - 旧的 Web UI: `template instantiate="some boolean"`.
  - 新的 Polymer.dart: `template if="{{some boolean}}"`.

* 当绑定到 input 元素的时候，不需要使用 `bind-`了，使用如下方式：
  `<input type="text" value="{{foo}}">`.

### 来做社区的建议

Matthew Butler 分享了一些从 Web UI 升级到 Polymer 的建议。

* [Upgrading from Web UI to Polymer, part 1](http://blog.butlermatt.me/?p=13)
* [Upgrading from Web UI to Polymer, part 2](http://blog.butlermatt.me/?p=35)