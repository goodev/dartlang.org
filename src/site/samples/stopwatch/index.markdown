---
layout: default
title: 定义自定义元素
live_example_url: /docs/tutorials/polymer-intro/examples/stopwatch/out/web/index.html
header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

启动和停止计时器。用 Reset 按钮重置
计时器为 00:00.

该示例介绍如何实现 Polymer 的自定义元素。

计时文本、三个按钮和其功能、以及定义该这些控件的样式
都包含在自定义元素中。
自定义元素的定义封装并隐藏了
其实现细节，
这样当你使用该元素的时候，无需关注其他内容。使用的时候只需要引用自定义元素名字即可：

`<tute-stopwatch></tute-stopwatch>`

计时器文本通过 Polymer 的数据绑定和 Dart 
变量绑定在一起。

声明式事件绑定可以让你在 HTML 端设置
事件的处理函数。

详细信息参考该[教程](/docs/tutorials/polymer-intro)，
或者
[查看源代码](https://github.com/dart-lang/dart-tutorials-samples/tree/master/web/stopwatch).


<iframe class="running-app-frame"
        style="height:250px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
