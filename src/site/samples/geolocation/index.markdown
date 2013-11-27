---
layout: default
title: 简单的  Geolocation 示例
live_example_url: example/index.html
header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

Geolocation API 可以跟踪用户位置信息。该 API 是
设备不可知的，底层机制可能使用 GPS 、WIFI 或者只是让
用户输入一个位置。由于查询
位置可能需要一些时间，所以该 API 是异步的，当请求
位置的时候 你需要提供一个回调函数。

Trip Meter 示例显示了用户的初始位置，当该页面
打开的时候会跟踪用户的位置。

在 Dart 编辑器中打开该应用，并通过 `index.html`来运行。

<iframe class="running-app-frame"
        style="height:300px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看
[源代码](https://github.com/dart-lang/dart-samples/tree/master/web/html5/geolocation/trip_meter)。

查看所有 [示例](/samples/)。
