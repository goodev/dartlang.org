---
layout: default
title: "dartdoc: API 文档生成器"
description: "从源代码和文档注释中生成 API 文档"
has-permalinks: false
---

# {{ page.title }}

可以用 dartdoc 工具 (`bin/dartdoc`) 来生成 Dart 代码的 文档。
 默认情况下，dartdoc 生成你指定的 `.dart` 代码和这些代码所导
 入的库的文档。

按照[Dart 文档注释风格指南](/articles/doc-comment-guidelines/) 
推荐的方式写注释，可以 改进生成的 文档。

Dart 提供了其他开发工具，请访问 
 [Dart 工具](/tools/)。

## 基本用法

下面是从 Dart 代码中生成文档的方法：

{% prettify sh %}
dartdoc --out=/docs/mylib mylib.dart
{% endprettify %}

默认情况下，生成的文档位于 `docs/` 目录中。

## 支持的参数

dartdoc 常用参数如下：

`--out=<absolute_path>`
: 设置生成的文档目录，如果目录不存在，则会创建该目录。

`--no-code`
: 在生成的文档中不要包含代码。

`--exclude-lib=<identifier>`
: 设置不生成文档的库。
  示例: `--exclude-lib=metadata`

`--omit-generation-time`
: 在每个文档页面底部不要包含生成的日期。

`--mode=static`
: 使用静态 HTML 导航，生成的文档文件会占用更多的存储空间，但是 本地浏览会比较方便。

`--package-root=<path>`
: 设置查找导入库的目录。则需要设置该选项。例如: --package-root=foo/packages/
   如果你的文件目录和  
 [pub 包目录布局约定 ](http://pub.dartlang.org/doc/package-layout.html)  
   中介绍的不一样，
   则需要设置该选项。
   例如: `--package-root=foo/packages/`

`--help`
: 打印所有参数信息。

