---
layout: default
title: 用 IndexedDB 保存和查询数据
live_example_url: /docs/tutorials/indexeddb/examples/count_down/out/web/count_down.html
header:
  css: ["/samples/samples.css"]
---

<h1>{{ page.title }}</h1>

输入名称和时间并点击傍边的加号按钮。

该示例演示如何在客户端用 IndexedDB 来保存数据并从 IndexedDB 读取数据。

IndexedDB 是现在很多浏览器都支持的客户端存储方式，但是并不是所有的浏览器都支持。
IndexedDB 是一个索引数据库，每个
记录通过唯一的 ID 标识。

简单来说，要保存数据到 IndexedDB 需要以下操作：

- 检查浏览器是否支持
- 创建或打开一个数据库
- 从数据库中打开 对象存储，如果没有这创建一个
- 在对象存储上创建一个事务
- 在数据库中添加一条数据记录
- 处理事务完成或者错误事件


详细信息请参考这个 [教程](/docs/tutorials/indexeddb)
或者查看
[源代码](https://github.com/dart-lang/dart-tutorials-samples/tree/master/web/stopwatch)。

<iframe class="running-app-frame"
        style="height:400px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
