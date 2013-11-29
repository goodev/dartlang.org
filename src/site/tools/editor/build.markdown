---
layout: default
title: "Build.dart 和 Dart 编辑器 Build 系统"
description: "使用 build.dart 来改变 Dart 编辑器 build 过程。"
has-permalinks: false
---

# {{page.title}} 

Build.dart 是一个简单的 build 脚本，可以在 Dart 编辑器
build 系统中添加自定义行为。
如果 Dart 编辑器项目根目录中有名字为 `build.dart` 的脚本文件，
则在 build 的时候会调用该文件。
你可以使用 build.dart 来处理修改过的文件，
生成其他文件，
或者 修改 build 系统的其他行为。

{% include toc.html %}


## Flags

Dart 编辑器 可以使用如下标记来
调用 build.dart ：

`--changed=<filename>`
：指定一个文件修改过了，需要重新 build。
    对于每个修改过的文件，都会指定 `--changed` 标记。

`--removed=<filename>`
：指定该文件被删除了，可能影响 build 过程。
   对于每个删除的文件 都会指定 `--removed` 标记。

`--clean`
： 请求 build.dart 脚本删除所有生成的文件，
  并重置所有保存的设置。
  除了`--machine` 不用
  设置其他标记。

`--full`
： 请求重新 build，
  所有的增量 build 都失效。

`--machine`
： 请求  build.dart 在 标准输出(stdout) 打印
  JSON 格式的错误信息，
  这样在 Dart 编辑器中可以显示这些信息。

`--deploy`
：创建一个目录，里面包含把该应用部署到服务器的
   文件。
  只用于 <a href="/polymer-dart">Polymer.dart</a>
  linter 和 build 工具。
  在 polymer library 的
  [builder.dart](https://code.google.com/p/dart/source/browse/trunk/dart/pkg/polymer/lib/builder.dart)
  中可以查看更多信息。

当前，编辑器总是
指定 `--machine` 标记。
其他标记，例如 一个`--full`、 一个 `--clean`、一个或者多个 `--changed` 和 `--removed` 标记
都可以指定。

如果 build 脚本返回非零的退出代码，
则脚本生成的所有 stdout 和 stderr 都
会显示在控制台视图中。
零退出代码 _不会_ 显示任何输出信息，
build.dart 通常会调用多少，
如果不停的在控制台视图显示
滚动信息则会干扰用户。

build.dart 在名字为 `out` 目录中所做的改动
使用 `--changed` 标记_不会_ 反馈到 build.dart 中。
其他的文件改动或创建文件 _都会_ 反馈。


## 一个示例

下面是一个把所有 .foo 文件处理为 .foobar 文件
的 build.dart 脚本。
{% comment %}
NOTE: This sample is based on
https://code.google.com/p/dart/source/browse/trunk/dart/samples/build_dart_simple/build.dart
{% endcomment %}

{% prettify dart %}
{% insert code/build.dart %}
{% endprettify %}


## machine 接口

有时 build.dart 脚本需要反馈信息
给编辑器。script needs to
编辑器通常通过扫描 build.dart 输出
到 stdout 的特定
内容来实现该功能。
当 Dart 编辑器 启动 build.dart 的时候，
会指定一个 `--machine` 标记说明
编辑器需要特定格式的信息。

特定格式的信息遵守如下规则：

* 每个信息都独立位于一行。
* 每个信息都格式化为 JSON RPC 命令/函数 。
* 每个消息都在方括号中。

下面显示两种类型信息：

* Errors、 warnings、和其他信息
* File 映射

### Errors、 warnings、和其他信息

当 build.dart 处理输入文件的时候，
使用 **error** 或者 **warning** 消息来显示
一些错误格式的文件。
也可以生成一般 (**info**) 信息，
例如，扫描用户代码中的 TODO 信息。
编辑器用这些信息来标记
文件和代码行，
并且在 问题视图 中显示这些信息。

下面是 stdout 中包含
 error 和  warning 信息的示例：

{% prettify json %}
[{"method":"error","params":{"file":"foo.html","line":23,"message":"no ID found"}}]

[{"method":"warning","params":{"file":"foo.html","line":23,"message":"no ID found"}}]

[{"method":"error","params":{"file":"foo.html","line":23,"message":"no ID found","charStart"=123,"charEnd"=130}}]
{% endprettify %}

JSON RPC 函数名字可以为
 **error**、 **warning**、或者 **info**。
参数为：

file
： 相对的或者绝对的脚本文件名

line
：错误或者警告的行数，从 1 开始。

message
： 显示给用户的信息。

charStart
： 文件出错的字符开始位置，从 0 开始。

charEnd
： 文件出错的字符结束位置，从 0 开始。

charStart 和 charEnd 参数是可选的，但是建议提供。
包含这两个信息，编辑器可以提供友好的
 tooltip 信息来显示 错误和警告。


### File 映射

当 build.dart 脚本从输入文件生成输出文件的时候，
脚本可以告诉编辑器这些文件之间的映射关系。

<aside class="alert alert-info" markdown="1">
**注意：**
并不是所有的映射关系都需要告诉编辑器，
只有一些对用户非常重要的映射才需要。
</aside>

当指定文件映射的时候，
Dart 编辑器 重定向 HTTP 请求并
使用映射的文件。
例如，
如果你把 `index.html` 映射到 `out/index.html`，
Dart 编辑器把请求 `index.html` 文件的请求重定向为  `out/index.html`，
并启动 `out/index.html` 文件来替代 `index.html`。

下面是一个示例把 foo.html 映射到  out/foo.html：

{% prettify json %}
[{"method":"mapping","params":{"from":"foo.html","to":"out/foo.html"}}]
{% endprettify %}

文件映射的 JSON RPC 函数名字为 **mapping**。
参数为：

from
：相对于脚本或者绝对的 文件路径。

to
：相对于脚本或者绝对的 文件路径。


## 更多示例

如下代码对于理解 build.dart 文件可能会有帮助：

* [dart/samples/build_dart/build.dart](https://code.google.com/p/dart/source/browse/trunk/dart/samples/build_dart/build.dart)
* Web UI: 
   * [build.dart](https://github.com/dart-lang/web-ui/blob/master/build.dart)
   * [component_build.dart](https://github.com/dart-lang/web-ui/blob/master/lib/component_build.dart)
