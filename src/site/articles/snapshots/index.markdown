---
layout: article
title: "Dart 快照"
rel:
  author: siva-annamalai
description: "学习如何用快照提高你的应用启动速度"
has-permalinks: true
article:
  written_on: 2013-02-13
  collection: language-details
---

{% include toc.html %}

# {{ page.title }}

<em>作者： Siva Annamalai <br />
<time pubdate date="2013-02-13">2013 2月</time>
</em>

这篇文章介绍了什么是 Dart 快照，已经快照如何
让 Dart 应用启动更块。
如果你在编写命令行应用，
通过生成自己的快照可以大幅的提高应用的启动时间。
这篇文章将告诉你如何生成自己的应用。

如果你在编写 web 应用，你无须做任何操作：
带有 Dart VM 的虚拟机将自动为你的应用生成快照。
当你的应用下次运行的时候，
浏览器从缓存中获取快照并使用该快照来启动你的应用。

## 什么是快照？

快照是一个或多个 Dart 对象
序列化后的
字节流。
快照和 Dart 对象在
孤立（isolate）内存堆
中的数据很相近。

Dart VM 主要在两方面用快照：

* **加速应用的初次启动时间**。
  一个核心库和应用脚本的快照通常包含
  了库和应用程序的解析过的数据。
  这样，当应用启动的时候就无需
  再次解析和语法分析了。

* 从一个 isolate **传递对象**
    到另外一个 isolate。

Dart VM 使用如下类型的快照： 

* 一个代表 isolate 堆
    初始化后
    的 **完整快照**。
    Dart VM 使用这种类型快照来
    加速启动和初始化整个 Dart 核心库和
    其他库，例如：dart:uri、 dart:io、 dart:utf、 dart:json、 dart:isolate 等。

* 一个代表 isolate 堆中应用脚本载入完成并未
    开始执行时候数据的 **脚本快照**。
    该类型快照用来快速启动和初始化
    一个应用。
    例如：用来启动 dart2js 的脚本用了一个
    预先创建的 dart2js 应用的脚本快照。

* 一个**对象快照**。
    从一个 isolate 到另外一个 isolate 的消息传递。
    在 Dart VM 中会创建一个需要传递对象的对象快照。


## 浏览器如何使用快照

包含 Dart VM 的浏览器使用用来加速应用启动和初始化
的完整快照。
该快照包含整个 Dart 核心库和其他常用的库，
例如：
 dart:uri、 dart:utf、 dart:json、 dart:isolate、 和 dart:html。

另外，浏览器还可以缓存一个应用的脚本快照，当下次打开
应用的时候载入该缓存的快照来加速应用的启动。


## 如何生成和使用脚本快照

用 Dart VM 可以生成和使用脚本快照。

<aside class="alert alert-info" markdown="1">
**注意：**
对于只运行几次的程序，
你无需给他们创建快照。
脚本快照只对部署的应用有用，
可以加速该应用的启动时间。
</aside>

用 dart 的 `--snapshot` 选项来生成
脚本快照。
还可以用 `--package_root` 选项来指定
通过 import 使用的包的位置(`import 'package:...'`)。

<pre>
dart <em>[</em>--package_root=<em>path]</em> --snapshot=<em>out-file</em> <em>dart-script-file</em>
</pre>

`--snapshot` 选项把一个 _dart-script-file_ 
的脚本快照写入到  _out-file_ 中。
例如，下面的命令创建了 `dart2js.dart` 脚本的快照，
并把创建的快照保存到 `dart2js.snapshot` 文件中。

{% prettify sh %}
dart --snapshot=dart2js.snapshot \ 
    dart-sdk/lib/dart2js/lib/_internal/compiler/implementation/dart2js.dart
{% endprettify %}

要从快照中执行脚本，
在命令行上指定脚本的文件即可：

<pre>
dart <em>snapshot-file</em> <em>args</em>
</pre>

指定的任意 _args_ 都会传递给脚本。
例如，你可以用 `myscript.dart -oout.js` 作为命令行参数
来执行 dart2js：

{% prettify sh %}
dart dart2js.snapshot myscript.dart -oout.js
{% endprettify %}

## 如何生成完整快照

如果你在实现一个嵌入到 Dart VM 中的项目（例如 Dartium）
，则请阅读这部分内容。 gen_snapshot 工具
将生成一个完整快照
（包含 核心库、dart:uri、 dart:io、 dart:utf、 dart:json、 dart:isolate 等 ）
到 _out-file_ 中：

<pre>
gen_snapshot <em>[options]</em> --snapshot=<em>out-file</em>
</pre>

支持如下 _options_:

<table class="table">
  <tr style="text-align:left">
    <th>Option</th> <th>Description</th>
  </tr>
  <tr>
    <td class="nowrap">
      --package_root=<em>path</em>
    </td>
    <td>
      指定 import 导入的库的根目录
      (<code>import 'package:...'</code>).</td>
  </tr>
  <tr>
    <td class="nowrap">
      --url_mapping=<em>mapping</em>
    </td>
    <td>
      在导入库的时候提供一个用于解析 URI 的 URL 映射。
    </td>
  </tr>
</table>


## 总结

通过
[dart/runtime/vm directory](http://code.google.com/p/dart/source/browse/#svn%2Fbranches%2Fbleeding_edge%2Fdart%2Fruntime%2Fvm)
可以发现更多关于快照的信息和快照如何实现的。
在
[snapshot.h](http://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/runtime/vm/snapshot.h)
中查找 "Snapshot" 。
注意：当实现变化的时候，代码可能会移到别的目录。
