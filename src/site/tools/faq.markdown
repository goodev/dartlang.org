---
layout: default
title: "工具 FAQ"
description: "FAQ 和使用 Dart 工具的一些提示。"
has-permalinks: false
---

# {{ page.title }}

我在 Linux 上运行 Linux 版本的 Dart 出现问题。
: 有些版本的 Linux 需要手工编译 Dart SDK。
  有些需要升级你的 GCC 库到最新版本。
  下面的资源可能
  对你有所帮助：

  * [在 CentOS、 Red Hat、 Fedora 和 Amazon Linux AMI 上编译 Dart](https://code.google.com/p/dart/wiki/BuildingOnCentOS)
  * [在 Ubuntu 10.04 Server 上编译 Dart SDK](https://code.google.com/p/dart/wiki/BuildDartSDKOnUbuntu10_04)
  <br /><br />

是否可以把所有的 Dart 文件都放到代码库中？
: Dart 工具生成的代码不应该提交到代码库中。
  在 [哪些文件不要提交到代码库](/tools/private-files.html) 页面
  有些建议。
  <br /><br />

如果调试一个编译为 JavaScript 的应用？
: 使用 Dart 编辑器和 Dartium 调试 Dart web
  应用非常容易。
  在 [调试 dart2js 生成的代码](/docs/dart-up-and-running/contents/ch04-tools-dart2js.html#tools-dart2js-debugging)
  页面介绍了如何调试 生成的 JavaScript 代码。
  <br />

**我还应该了解那些内容？**

  * [HOP](http://pub.dartlang.cc/packages/hop) - task framework
  <br /><br />

