---
layout: default
title: 可搜索 List
live_example_url: example/index.html

header:
  css: ["/samples/samples.css"]
---

## {{ page.title }}

该示例介绍如何用自定义元素创建可搜索的列表。
该示例演示了 Polymer 的如下特性：

* 定义自定义元素
* `<template>` 标签
* HTML 导入指令 
* 数据绑定


`<searchable-list>` 元素使用数据绑定实现搜索操作。
查看 `searchable_list.html` 和 `searchable_list.dart` 中
的代码。

`SearchableList` 类用三个变量实现搜索：

* `data` 保存列表中的所有数据
* `searchParam` 保存搜索参数
* `results`保存 `data` 中符合搜索条件的数据

当用户在输入框中输入内容，触发  `search()` 函数，然后更新
 `results` 的值。 由于  `results` 是一个 observable 变量，
该变量的 UI 也自动更新。

下面是实现搜索的最少代码
(`searchable_list.dart`):

    search() {
      results.clear();
      String lower = searchParam.toLowerCase();
      results.addAll(data.where((d) => d.toLowerCase().contains(lower)));
    }

任何 `searchParam` 的改变都会触发  `search()`。
下面是触发改变的代码
(  `searchable_list.dart` 中的 `enteredView()` 函数):

    onPropertyChange(this, #searchParam, search);

[查看源代码](https://code.google.com/p/dart/source/browse/#svn%2Fbranches%2Fbleeding_edge%2Fdart%2Fsamples%2Fsearchable_list).

<iframe class="running-app-frame"
        style="height:500px;width:100%;"
        src="{{page.live_example_url}}">
</iframe>

查看所有 [示例](/samples/)。
