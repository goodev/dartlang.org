---
layout: default
title: 使用 Application Cache
live_example_url: example/index.html

header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

如何使用 Application Cache 接口的示例。

关于该主题的详细信息，请参考
[Application
Cache 上手指南](http://www.html5rocks.com/en/tutorials/appcache/beginner/)，
这是由 Eric Bidelman 发表在  HTML5Rocks 的文章。

Application Cache 可以告诉浏览器那些文件需要缓存
以便离线使用。这样，
即便用户在离线情况下点击刷新按钮
你的应用依然能够正常使用。

你可以在 Dart 编辑器打开该示例，选中  `index.html` 来运行。

要查看该示例的效果，则修改 `index.html` 文件并重新打开该
应用。由于浏览器用了缓存版本的 `index.html` 所以
你的修改内容并没有显示出来。然后在
appcache.mf 中修改版本和日期并再次运行该应用。
现在就会加载新版本的网页了。

查看
[源代码](https://github.com/dart-lang/dart-samples/tree/master/web/html5/appcache/beginner)。

<iframe class="running-app-frame"
        style="height:500px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
