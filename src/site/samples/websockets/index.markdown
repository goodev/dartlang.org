---
layout: default
title: WebSockets 101
live_example_url: example/index.html

header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

如何使用 WebSockets 通信的示例。

阅读
[介绍 WebSockets: 在 Web 中使用 Sockets](http://www.html5rocks.com/en/tutorials/file/filesystem/)
文章可以了解 WebSockets 的相关内容。

WebSocket 是一个通过单个 TCP 连接实现双向
通道的协议。

该示例打开一个连接到反馈服务器
(`ws://echo/websocket.org`) 的 WebSocket 连接。
发送数据并在页面中显示反馈内容。

在 Dart 编辑器中打开该项目，选中 `index.html` 来运行.

[查看源代码](https://github.com/dart-lang/dart-samples/tree/master/web/html5/websockets/basics).

<iframe class="running-app-frame"
        style="height:500px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
