---
layout: default
title: "下载 Dart"
description: "Dart 语言相关的下载介绍。"
has-permalinks: false
js:
- url: /js/os-switcher.js
  defer: true
- url: /js/downloads-analytics.js
  defer: true
- url: /js/editor-version.js
  defer: true
---

# 下载和安装 Dart 非常简单！

<p class="os-choices">
选择您的系统平台：
 {% include os-choices.html %}
</p>

有两种方式下载 Dart。

## 方式一： 捆绑式下载所有 Dart 工具 {#whole_enchilada}

下载的 Dart 编辑器捆绑包中包含了
所有 Dart 语言相关的工具，可以创建、编辑、测试和编译
基于 web 的和基于 服务器端的应用。

Dart 编辑器捆绑包中包含如下内容：

* Dart Editor - 一个功能丰富的用来编辑 、调试和运行 Dart 程序
  的 IDE。
* Dartium - Chromium 的定制版本，里面包含了一个 Dart VM。
  可以用 Dartium 来测试和调试 您的 Dart Web 应用。
* SDK - 软件开发包，里面包含 Dart 虚拟机、
  Dart 库、和其他一些
    命令行工具：

  * [dart](/docs/dart-up-and-running/contents/ch04-tools-dart-vm.html) - 独立的 VM
  * [dart2js](/docs/dart-up-and-running/contents/ch04-tools-dart2js.html) - Dart-to-JavaScript 编译器
  * [dartanalyzer](/docs/dart-up-and-running/contents/ch04-tools-dart_analyzer.html) - 静态分析工具
  * [pub](http://pub.dartlang.cc/) - Dart 包管理器
  * [dartdoc](dartdoc/) - API 文档生成工具

{% include downloads/_dart-editor.html buttonclass="btn btn-primary btn-lg" %}

Dart Editor 可以自己在线更新，同时也可以更新 SDK 和
Dartium，当一个新的集成版本发布的时候，你可以选择更新。
也可以到 **Preferences**菜单中选择， **Update**，然后选择
**Download updates automatically** 来自动更新。

<aside class="alert alert-info" markdown="1">
**早期尝鲜者？**  

<span class="windows downloads">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
 <a data-tool="editor" class="download-link" data-bits="64" data-os="windows" data-build="continuous" href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/editor/darteditor-windows-x64.zip">Dart Editor for
Windows 64-bit</a> 或者
 <a data-tool="editor" class="download-link" data-bits="32" data-os="windows" data-build="continuous" href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/editor/darteditor-windows-ia32.zip">Dart Editor for
Windows 32-bit</a>。
</span>

<span class="linux downloads">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
 <a data-tool="editor" class="download-link" data-bits="64" data-os="linux" data-build="continuous" href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/editor/darteditor-linux-x64.zip">Dart Editor for
Linux 64-bit</a> 或者
 <a data-tool="editor" class="download-link" data-bits="32" data-os="linux" data-build="continuous" href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/editor/darteditor-linux-ia32.zip">Dart Editor for
Linux 32-bit</a>。
</span>

<span class="macos downloads">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
 <a data-tool="editor" class="download-link" data-bits="64" data-os="macos" data-build="continuous" href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/editor/darteditor-macos-x64.zip">Dart Editor for
Mac OS X</a>。
</span>
</aside>

下载完后，解压下载的文件。 Dart 就安装好了！

现在你可以看看 [海盗徽章](/codelabs/darrrt/) 新手代码教程了。

------

## 方式二： 只下载你需要的软件 {#a_la_carte}
也许你喜欢使用自己管用的 IDE 或者编辑器，并不需要
Dart 编辑器。

没问题！

你只需要下载 Dart SDK 就可以开始使用 Dart 了。
Dart SDK 中包含如下
内容：

  * [dart](/docs/dart-up-and-running/contents/ch04-tools-dart-vm.html) - 独立的 VM
  * [dart2js](/docs/dart-up-and-running/contents/ch04-tools-dart2js.html) - Dart-to-JavaScript 编译器
  * [dartanalyzer](/docs/dart-up-and-running/contents/ch04-tools-dart_analyzer.html) - 静态分析工具
  * [pub](http://pub.dartlang.cc/) - Dart 包管理器
  * [dartdoc](dartdoc/) - API 文档生成工具


<p class="os-choices">
{% include downloads/_sdk.html buttonclass="btn btn-primary btn-lg" %}
</p>

如果你在编写一个 Web 应用，则你还应该下载 Dartium。
Chromium 的定制版本，里面包含了一个 Dart VM。
  可以用 Dartium 来测试和调试 您的 Dart Web 应用。

{% include downloads/_dartium.html buttonclass="btn btn-primary btn-lg" %}

Dartium 可执行文件在 12 周后过期。
当过期后，你需要重新
下载一个 Dartium 来使用。

<aside class="alert alert-info" markdown="1">
**早期尝鲜者？**  

<span class="windows">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/sdk/dartsdk-windows-x64-release.zip">SDK for Windows 64-bit</a>
或者 
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/sdk/dartsdk-windows-ia32-release.zip">SDK for Windows 32-bit</a>.
</span>

<span class="macos">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/sdk/dartsdk-macos-x64-release.zip">SDK for Mac OS X</a>.
</span>

<span class="linux">
如果您想提前几周探索稳定版中的新的功能，
你可以下载<strong>Dev Channel(开发者通道)</strong> 中的版本：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/sdk/dartsdk-linux-x64-release.zip">SDK for Linux 64-bit</a>
或者
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/sdk/dartsdk-linux-ia32-release.zip">SDK for Linux 32-bit</a>.
</span>

<span class="windows">
你还可以下载<strong>Dev Channel(开发者通道)</strong> 中的：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/dartium/dartium-windows-ia32-release.zip">Dartium for Windows</a>.
</span>

<span class="macos">
你还可以下载<strong>Dev Channel(开发者通道)</strong> 中的：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/dartium/dartium-macos-ia32-release.zip">Dartium for Mac OS X</a>.
</span>

<span class="linux">
你还可以下载<strong>Dev Channel(开发者通道)</strong> 中的：
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/dartium/dartium-linux-x64-release.zip">Dartium for Linux 64-bit</a>
dartium-linux-x64-release.zip
或者
<a href="http://storage.googleapis.com/dart-archive/channels/dev/release/latest/dartium/dartium-linux-ia32-release.zip">Dartium for Linux 32-bit</a>.
</span>
</aside>

注意，如果你按照这种方式来下载 Dart， 下载的文件比较小，但是当
有新版本发布的时候，
你需要手动更新一下。

现在你可以
[下载一个插件](more_downloads.html) 来定制你的 IDE 或者编辑器 使其支持 Dart 语言。

------

### Linux 用户提示
如果你使用旧版的 Ubuntu 编译 SDK， 你可能需要
把  GCC 升级到 4.6+ 版本。
参考 <a href="faq.html">工具 FAQ</a> 了解详情。

------

## 反馈
我们期待您的反馈！使用 Dart 编辑器右上角
的 SEND FEEDBACK 可以给我们发送反馈，
或者 在 [dartbug.com](http://dartbug.com) 上提交一个 bug。
