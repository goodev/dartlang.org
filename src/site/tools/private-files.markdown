---
layout: default
title: "哪些文件不要提交到代码库中"
description: "开发工具会生成一些文件，并不是所有的文件都需要提交到代码库中。"
has-permalinks: true
---

# {{ page.title }}

当在代码版本工具中保存 Dart 代码的时候，
或者用 [pub](http://pub.dartlang.org) 、 [github](http://github.com)
或者其他工具，
你不应该提交 Dart 编辑器、pub和其他工具
生成的那些文件。

<aside class="alert alert-info" markdown="1">
**注意：**
除非明显注明，否则该页面只讨论源代码资源库，
_不_ 包含部署 Dart 应用。
一些无需提交到代码库中的文件，在部署应用的
时候是非常重要的或者是不可或缺的。
</aside>

1. [规则](#the-rules)
1. [详情](#details)
   1. [packages/](#packages)
   1. [pubspec.lock](#pubspeclock)
   1. [*.dart.js and *.js.map](#dartjs)
{:.toc}

## 规则

**不要提交** pub、Dart 编辑器和 dart2js 创建的
如下文件和目录：

    packages/
    pubspec.lock  // 应用包除外
    .project
    .buildlog
    *.js_
    *.js.deps
    *.js.map

**不要提交** 其他 IDE 生成的
文件和目录。
例如：

    .project      // Eclipse
    *.iml         // IntelliJ
    *.ipr         // IntelliJ
    *.iws         // IntelliJ
    .idea/        // IntelliJ
    .DS_Store     // Mac

**避免提交** 生成的 JavaScript 文件：

    *.dart.js

详细信息，参考下面的详情。

## 详情

基本规则，你只需要提交其他人需要使用你的包或者代码库
的必要文件。
提交其他没必要的文件，
可能会影响其他人的工作效率，
另外一些文件可能会暴露你个人电脑的设置从而
引起安全问题。
在常规的代码库中，通用的规则
就是避免提交工具自动生成的文件。

参考 Github 帮助文档中的 [忽略文件列表](https://help.github.com/articles/ignoring-files)
了解详情。

### packages/

 `packages/` 目录包含
 你电脑相关的一些连接。
使用你代码的用户，会在自己电脑上
通过 [pub install](http://pub.dartlang.org/doc/#installing-dependencies)
来生成这些目录。


### pubspec.lock

`pubspec.lock` 是个特例，
和 Ruby 的 `Gemfile.lock` 类似。

**对于库 包（ library package）**，**不要** 提交 `pubspec.lock` 文件。

**对于应用包（ application package）**， **需要** 提交 `pubspec.lock` 文件。
该文件是用来管理非共享资源的推荐方式，
例如在应用中管理他们的依赖项。


### *.dart.js 和 *.js.map {#dartjs}

因为 .dart.js 和 .js.map 文件是工具生成的，
所以一般不需要提交到代码库中。

然而，当 _部署_ 一个 web 应用的时候，
你需要部署 .dart.js 文件，这些文件在不支持
 Dart VM 的浏览器中使用。
当  _测试_ 一个 web 应用的时候，
也许还需要部署 .js.map 文件，
该文件提供了 JavaScript 到 Dart 代码的映射关系，
这样调试代码会比较轻松。
关于把  Dart 代码转换为 JavaScript 以及调试 JavaScript的
更多信息请参考：
[dart2js 文档](/docs/dart-up-and-running/contents/ch04-tools-dart2js.html)。
