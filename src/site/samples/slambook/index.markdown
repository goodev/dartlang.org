---
layout: default
title: 从表单收集数据
live_example_url: /docs/tutorials/forms/examples/slambook/out/web/slambook.html
header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}


由于没有运行服务器，所以在
下面的示例中输入内容并点击 *Submit*  按钮，
则会显示结果 “No server”。

该示例演示如何用表单收集数据。

一个表单通常包含多个输入元素
来收集各种类型的数据，例如
名字和地址、生日、Emai 地址等等。
HTML 支持几种输入元素，有 text fields、 text areas、 radio buttons、 和 checkboxes。
HTML5 添加了一些具体的输入元素，例如 email 和 password fields、
color pickers、 date and time widgets、以及 range elements。

一个表单通常有一个 _action_ 和 一个 _method_ 属性分别
指定了发送数据的 URL 和 发送数据的方式。
action 和 method 可以在 HTML 代码中指定，也可以
在 Dart 代码设置或者用 Dart 库
来动态的执行 action。

查看[这个教程](/docs/tutorials/forms) 来了解更多信息，
或者
[查看源代码](https://github.com/dart-lang/dart-tutorials-samples/tree/master/web/slambook).

<iframe class="running-app-frame"
        style="height:550px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
