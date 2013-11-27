---
layout: default
title: 在 DOM 树中移动元素
live_example_url: /docs/tutorials/add-elements/examples/anagram/anagram.html">
header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

点击字母的单元格。

该应用演示了如何在 DOM 中移动元素。

要在页面中移动元素，修改其父元素属性即可。一个元素只能有
一个父元素，所以当修改元素的父元素就可以实现在 DOM 树中移动元素的效果了。
在该示例中，如果点击字母，则点击事件负责改变字母的
父元素。

阅读 [这个教程](/docs/tutorials/add-elements/#moving-elements)
来了解更多信息，或者查看
[示例源代码](https://github.com/dart-lang/dart-tutorials-samples/tree/master/web/anagram)。

<iframe class="running-app-frame"
        style="height:400px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
