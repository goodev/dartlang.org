---
layout: default
title: "试试 Dart"
description: "尝试些点 Dart 代码，学习一些基础内容。"
snippet_img: images/piratemap.jpg
has-permalinks: true
tutorial:
  id: trydart
js:
- url: /js/os-switcher.js
  defer: true
- url: /js/editor-downloads-analytics.js
  defer: true
- url: /js/editor-version.js
  defer: true
header:
  css: ["/codelabs/darrrt/darrrt.css"]
---

# {{ page.title }}

## 有点空闲时间？来编写个 Dart 应用吧

在该代码实验室中,
你将从一个框架应用中创建一个海盗徽章生成器。
该示例应用简单的介绍了一些 Dart 语言和库的特性。
该代码实验室假设你具有其他编程语言的背景。

<strong>建构该应用！</strong>

<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/6-piratebadge_json/piratebadge.html">
</iframe>

<hr>

<div class="piratemap" markdown="1" style="min-height:325px">

## 步骤

* [Step 0: 设置环境](#set-up)
* [Step 1: 运行框架应用](#step-one)
* [Step 2: 添加一个输入框](#step-two)
* [Step 3: 添加一个按钮](#step-three)
* [Step 4: 创建一个类](#step-four)
* [Step 5: 保存到本地存储中](#step-five)
* [Step 6: 使用 HttpRequest 从 JSON 文件中读取姓名](#step-six)
* [Step 7: 继续前行，了解 Dart 语言的更多特性](#step-seven)

</div>


<hr>

## Step 0: 设置环境 {#set-up}

在该步骤中，你需要下载 Dart 并获取一些实例代码。


### <i class="icon-anchor"> </i> 下载 Dart。

<div class="trydart-step-details" markdown="1">
如果你尚未下载 Dart，
点击下面按钮下载。
解压下载的文件得到一个名称为 `dart` 的目录。

{% include downloads/_dart-editor.html buttonclass="btn btn-primary btn-lg" %}

<p class="os-choices" markdown="1">
  Dart 工具
  可以在最新的这些系统中使用
  {% include os-choices.html %}
</p>
</div>

### <i class="icon-anchor"> </i> 启动编辑器。

<div class="trydart-step-details" markdown="1">
打开 `dart` 目录，双击  **DartEditor**。

**有问题？遇到麻烦了？** 请访问
[Dart 编辑器问题指南](/tools/editor/troubleshoot.html) 页面。

</div>

### <i class="icon-anchor"> </i> 下载示例代码。

<div class="trydart-step-details" markdown="1">
<a href="https://github.com/dart-lang/one-hour-codelab/archive/master.zip">下载</a>
示例代码。
解压文件后
得到一个名称为 `one-hour-codelab-master` 的目录。
</div>

### <i class="icon-anchor"> </i> 打开 the one-hour-codelab-master 示例应用

<div class="trydart-step-details" markdown="1">
在 Dart 编辑器中，
使用菜单 **File > Open Existing Folder...**
打开 `one-hour-codelab-master` 目录。
</div>

<div class="row"> <div class="col-md-7" markdown="1">

![The files and directories in the piratebadge directory.](images/filesanddirs.png)

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* `packages` 目录、 `pubspec.yaml` 和 `pubspec.lock` 文件是
和项目依赖相关的文件。
该项目已经设置了所有的依赖项了。
Dart 编辑器自动安装需要的包。

* 几个带编号的目录包含了每个步骤中的完整代码。
`1-blankbadge` 包含了框架应用代码，你将从这里开始。
`6-piratebadge_json` 包含了最终版本的代码。

* `piratebadge.css` 文件提供
了所有步骤中需要用到的 CSS 样式文件。
在该示例中你无须修改该文件。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<hr>

##Step 1: 运行框架应用 {#step-one}

在该步骤中，你打开源代码文件，
熟悉下 Dart 和 HTML 代码，
然后运行应用。

### <i class="icon-anchor"> </i> 展开 1-blankbadge 目录。

<div class="trydart-step-details" markdown="1">
在 Dart 编辑器中，通过点击目录前面的小箭头
![wee arrow](images/wee-arrow.png) 图标来
展开 `1-blankbadge` 目录
这个目录包含两个文件 ：`piratebadge.html` 和 `piratebadge.dart`。
</div>

### <i class="icon-anchor"> </i> 打开文件。

<div class="trydart-step-details" markdown="1">
通过在 Dart 编辑器中双击 `piratebadge.html` 和 `piratebadge.dart`来
打开这两个文件。
</div>

### <i class="icon-anchor"> </i> 浏览代码。

<div class="trydart-step-details" markdown="1">
熟悉下框架应用的 Dart 和 HTML 代码。
</div>

<div class="trydart-step-details" markdown="1">
#### piratebadge.html
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details" markdown="1">
{% prettify html%}
<html>
  <head>
    <meta charset="utf-8">
    <title>Pirate badge</title>
    <link rel="stylesheet" href="../piratebadge.css">
  </head>
  <body>
    <h1>Pirate badge</h1>
    
    [[highlight]]<div class="widgets">[[/highlight]]
      [[highlight]]TO DO: Put the UI widgets here.[[/highlight]]
    [[highlight]]</div>[[/highlight]]
    <div class="badge">
      <div class="greeting">
        Arrr! Me name is
      </div>
      <div class="name">
        [[highlight]]<span id="badgeName"> </span>[[/highlight]]
      </div>
    </div>

    [[highlight]]<script type="application/dart" src="piratebadge.dart"></script>[[/highlight]]
    [[highlight]]<script src="packages/browser/dart.js"></script>[[/highlight]]
  </body>
</html>
{% endprettify %}

</div>
<div class="trydart-filename">piratebadge.html</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* 在该示例中，所有`piratebadge.html` 文件代码的改动
都在带有 `widgets` class 标示的
&lt;div&gt; 元素内完成。

* 在后面的步骤中，
带有 `badgeName` 的 &lt;span&gt; 元素将有
Dart 代码根基用户输入内容
来动态更新。

* `piratebadge.dart` 脚本是该应用的主要代码文件。

* `packages/browser/dart.js` 脚本是一个启动脚本，
负责启动 Dart VM 和兼容
不支持 Dart 的浏览器。

</div> </div>

<div class="trydart-step-details" markdown="1">
#### piratebadge.dart
</div>

<div class="row"> <div class="col-md-7" markdown="1">

<div class="trydart-step-details" markdown="1">
{% prettify dart %}
[[highlight]]void main() {
  // Your app starts here.
}
[[/highlight]]
{% endprettify %}
</div>
<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 该文件是该应用的主要代码文件。
通过  `piratebadge.html` 文件中的 &lt;script&gt; 标签引用代码文件。

* `main()` 函数是代码入口。
当应用启动的时候 Dart调用该函数。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}
</div> </div>

### <i class="icon-anchor"> </i> 运行应用。

<div class="trydart-step-details" markdown="1">
要在 Dart 编辑器中运行该应用，只需要选择 `piratebadge.html`
文件并点击 Run 按钮即可。
<img src="images/run.png" width="16" height="16"
     alt="Run button">.

![Click the run button](images/clickrun.png)

Dart 编辑器将启动 _Dartium_来加载该应用，Dartium 是一个包含
Dart 虚拟机的浏览器。

在左边会看到一个 TO DO 注释，
在右边有个红底白字的徽章。
</div>

<div class="trydart-step-details" markdown="1">
<iframe class="running-app-frame"
        style="height:220px;width:550px;"
        src="examples/1-blankbadge/piratebadge.html">
</iframe>
</div>

<hr>

##Step 2: 添加一个输入框 {#step-two}

<div class="trydart-note" markdown="1">
<strong>提示：</strong> 在该代码实验室中，
你可以继续编辑在`1-blankbadge`中的文件。
你可以和其他目录的文件比较来确认你的修改，
如果遇到问题也可以恢复这些文件。
</div>

在该步骤中，将在应用中添加一个输入框。
当用户在输入框中输入的时候，
Dart 代码使用输入的值来更新徽章的内容。

### <i class="icon-anchor"> </i> 编辑 piratebadge.html.

<div class="row"> <div class="col-md-7" markdown="1">

<div class="trydart-step-details" markdown="1">

Add the &lt;input&gt; tag to the HTML code
within the `widgets` &lt;div&gt;.

{% prettify html %}
...
<div class="widgets">
[[highlight]]  <div>
    <input type="text" id="inputName" maxlength="15">
  </div>[[/highlight]]
</div>
...
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.html</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* 该输入框的 ID 为 `inputName`。
Dart 使用 CSS 选择器（例如 这个 ID）
来从 DOM 中查询元素。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

### <i class="icon-anchor"> </i> 编辑 piratebadge.dart.

<div class="trydart-step-details" markdown="1">

在代码文件顶部
导入 `dart:html`
(在版权信息下方)。

</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details" markdown="1">

{% prettify dart %}
[[highlight]]import 'dart:html';[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 该导入语句将导入 dart:html 包中的所有类和资源，
提供了 HTML 元素和访问 DOM 的能力。

* Dart 编辑器非常乐意的提醒你 导入的内容没有使用。
先不要关心它。在下一步将修复该问题。

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

在输入框中添加一个监听器来处理输入事件。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details" markdown="1">

{% prettify dart %}
void main() {
  [[highlight]]querySelector('#inputName').onInput.listen(updateBadge);[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 在 dart:html 中定义的 `querySelector()` 函数从 DOM 中获取
一个元素。
这里的代码使用 ID `#inputName` 
来查询输入框。

* `onInput` 注册监听输入事件的监听器。

* 当用户点击键盘的时候触发输入事件。

* 你可以使用单引号或者双引号来创建字符串。

* Dart 编辑器提示你该函数不存在。
现在就创建该函数。

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

把事件监听函数实现为顶部（top-level）函数。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details" markdown="1">

{% prettify dart %}
...

[[highlight]]void updateBadge(Event e) { 
  querySelector('#badgeName').text = (e.target as InputElement).value;
}[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 该函数从输入框中的值设置 `badgeName` 元素的值。

* 可以发现 `updateBadge()` 是一个事件处理函数，
其参数为一个 `Event` 对象。

* 产生输入事件的元素为 `e.target` 对象。

* `as` 关键字把 `e.target` 转换为一个
`InputElement` ，这样 Dart 编辑器就不会报提醒了。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

### <i class="icon-anchor"> </i> 运行应用。

<div class="trydart-step-details" markdown="1">

通过菜单 **File > Save All** 保存修改的内容。

使用 Dart 编辑器的 Run 按钮
<img src="images/run.png" width="16" height="16"
     alt="Run button">
运行应用。

比较你的应用和如下是否一样。

在输入框中输入内容。

<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/2-inputnamebadge/piratebadge.html">
</iframe>

#### 问题？

如果遇到问题，把你修改的代码和 `2-inputbadge` 中的代码比较一下。

* [piratebadge.html](https://github.com/dart-lang/one-hour-codelab/blob/master/web/2-inputnamebadge/piratebadge.html)

* [piratebadge.dart](https://github.com/dart-lang/one-hour-codelab/blob/master/web/2-inputnamebadge/piratebadge.dart)
</div>


<hr> 

##Step 3: 添加一个按钮 {#step-three}

在该步骤中，将在应用中添加一个按钮。
当输入框中没有内容的时候按钮启用。
当用户点击按钮的时候，
应用把 `Anne Bonney` 这个名字输入到徽章中。

### <i class="icon-anchor"> </i> 编辑 piratebadge.html.

<div class="trydart-step-details" markdown="1">
在输入框下方添加 &lt;button&gt; 标签。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify html %}
...
<div class="widgets">
  <div>
    <input type="text" id="inputName" maxlength="15">
  </div>
[[highlight]]  <div>
    <button id="generateButton">Aye! Gimme a name!</button>
  </div>[[/highlight]]
</div>
...
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.html</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* 该按钮有个 ID `generateButton` ，这样
Dart 代码就可以通过 ID 获取按钮。

</div> </div>

### <i class="icon-anchor"> </i> 编辑 piragebadge.dart.

<div class="trydart-step-details" markdown="1">
在 import 语句下方，定义一个顶级 `ButtonElement` 变量。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
import 'dart:html';

[[highlight]]ButtonElement genButton;[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 顶级（Top-level）变量是库级别的名称。

* ButtonElement 是 dart:html 库中
众多 DOM 元素中的一个。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

使用一个事件处理函数把按钮联系起来。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void main() {
  querySelector('#inputName').onInput.listen(updateBadge);
  [[highlight]]genButton = querySelector('#generateButton');
  genButton.onClick.listen(generateBadge);[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* `onClick` 注册一个鼠标点击事件。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

添加一个顶级函数来修改徽章的名字。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
...

[[highlight]]void setBadgeName(String newName) {
  querySelector('#badgeName').text = newName;
} [[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 该函数使用新的名字修改徽章内容。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

实现按钮的点击处理函数。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
...

[[highlight]]void generateBadge(Event e) {
  setBadgeName('Anne Bonney');
}[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 该函数设置徽章的名字为 `Anne Bonney`。

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>
修改 `updateBadge()` 函数来调用 `setBadgeName()`函数。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void updateBadge(Event e) {
[[highlight]]  String inputName = [[/highlight]](e.target as InputElement).value;
[[highlight]]  setBadgeName(inputName);[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 设置输入框的值为本地字符串。

</div></div>


<div class="trydart-step-details" markdown="1">

<hr>

在 `updateBadge()` 中添加一个 if-else 骨架代码。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void updateBadge(Event e) {
  String inputName = (e.target as InputElement).value;
  setBadgeName(inputName);
[[highlight]]  if (inputName.trim().isEmpty) {
    // To do: add some code here.
  } else {
    // To do: add some code here.
  }[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* `String` 类有一些用来处理字符串数据的
函数和属性，
例如 `trim()` 和 `isEmpty`。

* String 类在 `dart:core` 库中定义，
每个 Dart 程序中都会自动导入该库。

* Dart 具有通用的编程语言概念，例如  `if`-`else`。

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

现在修改 if-else 语句来根据条件改变按钮的状态。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void updateBadge(Event e) {
  String inputName = (e.target as InputElement).value;
  setBadgeName(inputName);
  if (inputName.trim().isEmpty) {
    [[highlight]]genButton..disabled = false
             ..text = 'Aye! Gimme a name!';[[/highlight]]
  } else {
    [[highlight]]genButton..disabled = true
             ..text = 'Arrr! Write yer name!';[[/highlight]]
  }
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 级联操作符 (`..`) 可以让你在同一个对象上
操作多个函数和属性。

* `updateBadge()` 代码用级联操作符来设置
按钮的两个属性。
和下面的代码具
有同样的效果。

<pre>
genButton.disabled = false;
genButton.text = 'Aye! Gimme a name!';
</pre>

</div></div>


### <i class="icon-anchor"> </i> 运行应用。

<div class="trydart-step-details" markdown="1">

使用菜单 **File > Save All** 保存文件。

使用 Dart 编辑器中的 Run 按钮
<img src="images/run.png" width="16" height="16"
     alt="Run button">
运行应用。

比较你的应用和如下是否一样。

在输入框中输入文字。
从输入框中删除文字。
点击按钮。

<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/3-buttonbadge/piratebadge.html">
</iframe>


#### 问题？

如果遇到问题，把你的代码和 `3-buttonbadge`中的代码比较一下。

* [piratebadge.html](https://github.com/dart-lang/one-hour-codelab/blob/master/web/3-buttonbadge/piratebadge.html)

* [piratebadge.dart](https://github.com/dart-lang/one-hour-codelab/blob/master/web/3-buttonbadge/piratebadge.dart)

</div>


<hr>

##Step 4: 创建 PirateName 类 {#step-four}

在该步骤中，你只需要修改 Dart 代码。
创建一个代表海盗名称的类。
完成后，该类随即的
从一个列表中选择名字和称呼。
或者你也可以在构造函数
中提供名字和称呼。

### <i class="icon-anchor"> </i> 编辑 piratebadge.dart.

<div class="trydart-step-details" markdown="1">
在文件顶部添加一个 import 语句。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
import 'dart:html';

[[highlight]]import 'dart:math' show Random;[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* 使用 `show` 关键字来
导入你仅仅需要的类、函数、和属性。

* `Random` 提供了一个随机数生成器。

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

在文件底部定义一个类。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
...

[[highlight]]class PirateName {
}[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* 这里定义了类的名字。

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

创建一个类级别（静态）的 Random 对象。
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  [[highlight]]static final Random indexGen = new Random();[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* `static` 定义一个类变量。这样，
随机数生成器将在所有该类的实例
中共享。

* Dart 编辑器用斜体字显示静态变量。

* 使用 `new` 来调用构造函数。

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

Add two instance variables to class,
one for the first name and one for the appellation.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  static final Random indexGen = new Random();
[[highlight]]  String _firstName;
  String _appellation;[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Private variables start with underscore (`_`).

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

Create two static lists within the class
that provide a small collection of names and appellations to choose from.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
[[highlight]]  static final List names = [
    'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
    'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];
  static final List appellations = [
    'Black','Damned', 'Jackal', 'Red', 'Stalwart', 'Axe',
    'Young', 'Old', 'Angry', 'Brave', 'Crazy', 'Noble'];[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* `final` variables cannot change.

* Lists are built into the language.
These lists are created using list literals.

* The `List` class provides the API for lists.

</div></div>


<div class="trydart-step-details" markdown="1">

<hr>

Provide a constructor for the class.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
[[highlight]]  PirateName({String firstName, String appellation}) {
    if (firstName == null) {
      _firstName = names[indexGen.nextInt(names.length)];
    } else {
      _firstName = firstName;
    }
    if (appellation == null) {
      _appellation = appellations[indexGen.nextInt(appellations.length)];
    } else {
      _appellation = appellation;
    }
  }[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Constructors have the same name as the class.

* The parameters enclosed in curly brackets (`{` and `}`)
are optional, named parameters.

* The `nextInt()` function gets a new random integer
from the random number generator.

* Use square brackets (`[` and `]`) to index into a list.

* The `length` property returns the number of items in a list.

* The code uses a random number as an index into the list.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Provide a getter for the pirate name.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
[[highlight]]  String get pirateName =>
    _firstName.isEmpty ? '' : '$_firstName the $_appellation';[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div><div class="col-md-5" markdown="1">

* Getters are special methods that provide read access to an object’s properties.

* The ternary operator `?:` is short-hand for an if-then-else statement.

* String interpolation
(`'$_firstName the $_appellation'`)
lets you easily build strings from other objects.

* The fat arrow (` => expr; `) syntax is a shorthand for `{ return expr; }`.

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

Modify the function `setBadgeName()` to use a PirateName instead of a String:
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void setBadgeName([[highlight]]PirateName[[/highlight]] newName) {
  querySelector('#badgeName').text = newName[[highlight]].pirateName[[/highlight]];
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div><div class="col-md-5" markdown="1">

* This code calls the getter to get the PirateName as a string.

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

Change `updateBadge()` to generate a PirateName based on the input field value.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void updateBadge(Event e) {
  String inputName = (e.target as InputElement).value;
  
  [[highlight]]setBadgeName(new PirateName(firstName: inputName));[[/highlight]]
  ...
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div><div class="col-md-5" markdown="1">

* The call to the constructor provides a value for one optional named parameter.

</div></div>

<div class="trydart-step-details" markdown="1">

<hr>

Change `generateBadge()` to generate a PirateName instead of using `Anne Bonney`.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void generateBadge(Event e) {
  setBadgeName([[highlight]]new PirateName()[[/highlight]]);
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div><div class="col-md-5" markdown="1">

* In this case, the call to the constructor passes no parameters.

</div></div>

### <i class="icon-anchor"> </i> Run the app.

<div class="trydart-step-details" markdown="1">
  
使用菜单 **File > Save All** 保存文件。

Use the Run button
<img src="images/run.png" width="16" height="16"
     alt="Run button">
in Dart Editor to run the app.

比较你的应用和如下是否一样。

Type in the input field.
Remove the text from the input field.
Click the button.

<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/4-classbadge/piratebadge.html">
</iframe>


#### 问题？

Check your code against the files in `4-classbadge`.

* [piratebadge.html](https://github.com/dart-lang/one-hour-codelab/blob/master/web/4-classbadge/piratebadge.html)

* [piratebadge.dart](https://github.com/dart-lang/one-hour-codelab/blob/master/web/4-classbadge/piratebadge.dart)

</div>


<hr>


##Step 5: 保存到本地存储中 {#step-five}

In this step, you give the app some persistence
by saving the badge name to local storage each time it changes.
When you restart the app,
it initializes the badge from the saved name.

### <i class="icon-anchor"> </i> Edit piratebadge.dart.

<div class="trydart-step-details" markdown="1">
Import the JSON converter from the `dart:convert` library.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
import 'dart:html';
import 'dart:math' show Random;
[[highlight]]
import 'dart:convert' show JSON;[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* `JSON` provides convenient access to the most common JSON use cases.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Add a named constructor to the PirateName class.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
[[highlight]]  PirateName.fromJSON(String jsonString) {
    Map storedName = JSON.decode(jsonString);
    _firstName = storedName['f'];
    _appellation = storedName['a'];
  }[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* The constructor creates a new PirateName instance from a JSON-encoded string.

* `PirateName.fromJson` is a named constructor.

* `JSON.decode()` parses a JSON string and creates Dart objects from it.

* The pirate name is decoded into a `Map` object.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Add a getter to the PirateName class
that encodes a pirate name in a JSON string.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
  [[highlight]]String get jsonString => '{ "f": "$_firstName", "a": "$_appellation" } ';[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* The getter formats the JSON string using the map format.

</div> </div>


<div class="trydart-step-details" markdown="1">

<hr>

Declare a top-level string.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
[[highlight]]final String TREASURE_KEY = 'pirateName';[[/highlight]]

void main() {
  ...
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* You store key-value pairs in local storage. This string is the key.
The value is the pirate name.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Save the pirate name when the badge name changes.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void setBadgeName(PirateName newName) {
  [[highlight]]if (newName == null) {
    return;
  }[[/highlight]]
  querySelector('#badgeName').text = newName.pirateName;
  [[highlight]]window.localStorage[TREASURE_KEY] = newName.jsonString;[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Local storage is provided by the browser's `Window`.

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Add a top-level function called `getBadgeNameFromStorage()`.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void setBadgeName(PirateName newName) {
  ...
}

[[highlight]]PirateName getBadgeNameFromStorage() {
  String storedName = window.localStorage[TREASURE_KEY];
  if (storedName != null) {
    return new PirateName.fromJSON(storedName);
  } else {
    return null;
  }
}[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* The function retrieves the pirate name from local storage
and creates a PirateName object from it.

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

<div class="trydart-step-details" markdown="1">
<hr>
Call the function from the `main()` function.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void main() {
  ...
  [[highlight]]setBadgeName(getBadgeNameFromStorage());[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Initialize the badge name from local storage.

&nbsp; {% comment %} non-breaking space required for bootstrap/markdown bogosity {% endcomment %}

</div> </div>

### <i class="icon-anchor"> </i> Run the app.

<div class="trydart-step-details" markdown="1">
  
使用菜单 **File > Save All** 保存文件。

Use the Run button
<img src="images/run.png" width="16" height="16"
     alt="Run button">
in Dart Editor to run the app.

比较你的应用和如下是否一样。

Click the button to put a name on the badge.
Start the app again by duplicating this window.

<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/5-localbadge/piratebadge.html">
</iframe>


#### 问题？

Check your code against the files in `5-localbadge`.

* [piratebadge.html](https://github.com/dart-lang/one-hour-codelab/blob/master/web/5-localbadge/piratebadge.html)

* [piratebadge.dart](https://github.com/dart-lang/one-hour-codelab/blob/master/web/5-localbadge/piratebadge.dart)

</div>


<hr>


##Step 6: Read names from JSON-encoded file {#step-six}

In this step, you change the PirateName class to get
the list of names and appellations from a JSON file.
This gives you a chance to add more names and
appellations to the program.

### <i class="icon-anchor"> </i> Create piratenames.json.

<div class="trydart-step-details" markdown="1">
Use **File > New File...** to create a JSON-encoded file
named `piratenames.json` with the following content.

Put the file in `1-blankbadge` alongside the Dart and HTML files you've been editing.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
{ "names": [ "Anne", "Bette", "Cate", "Dawn",
            "Elise", "Faye", "Ginger", "Harriot",
            "Izzy", "Jane", "Kaye", "Liz",
            "Maria", "Nell", "Olive", "Pat",
            "Queenie", "Rae", "Sal", "Tam",
            "Uma", "Violet", "Wilma", "Xana",
            "Yvonne", "Zelda",
            "Abe", "Billy", "Caleb", "Davie",
            "Eb", "Frank", "Gabe", "House",
            "Icarus", "Jack", "Kurt", "Larry",
            "Mike", "Nolan", "Oliver", "Pat",
            "Quib", "Roy", "Sal", "Tom",
            "Ube", "Val", "Walt", "Xavier",
            "Yvan", "Zeb"],
  "appellations": [ "Awesome", "Black", "Captain", "Damned",
            "Even", "Fighter", "Great", "Hearty",
            "Irate", "Jackal", "King", "Lord",
            "Mighty", "Noble", "Old", "Powerful",
            "Quick", "Red", "Stalwart", "Tank",
            "Ultimate", "Vicious", "Wily", "aXe",
            "Young", "Zealot",
            "Angry", "Brave", "Crazy", "Damned",
            "Eager", "Fool", "Greedy", "Hated",
            "Idiot", "Jinxed", "Kind", "Lame",
            "Maimed", "Naked", "Old", "Pale",
            "Queasy", "Rat", "Sandy", "Tired",
            "Ugly", "Vile", "Weak", "Xeric",
            "Yellow", "Zesty"]}
{% endprettify %}
</div>

<div class="trydart-filename">piratenames.json</div>

</div> <div class="col-md-5" markdown="1">

<i class="icon-key"> </i> <strong> 关键信息 </strong>

* The file contains a JSON-encoded map,
which contains two lists of strings.

</div> </div>

### <i class="icon-anchor"> </i> Edit piratebadge.html.

<div class="trydart-step-details" markdown="1">
Disable the input field and the button.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify html %}
...
  <div>
    <input type="text" id="inputName" maxlength="15" [[highlight]]disabled[[/highlight]]>
  </div>
  <div>
    <button id="generateButton" [[highlight]]disabled[[/highlight]]>Aye! Gimme a name!</button>
  </div>
...
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.html</div>

</div> <div class="col-md-5" markdown="1">


* The Dart code enables the text field and
the button after the pirate names are successfully read from
the JSON file.

</div> </div>

### <i class="icon-anchor"> </i> Edit piratebadge.dart.

<div class="trydart-step-details" markdown="1">

Add an import to the top of the file.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
import 'dart:html';
import 'dart:math' show Random;
import 'dart:convert' show JSON;

[[highlight]]import 'dart:async' show Future;[[/highlight]]
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* The `dart:async` library provides for asynchronous programming.

* A `Future` provides a way to get a value in the future.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>
Replace the `names` and `appellations` lists with these static, empty lists:
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...
  [[highlight]]static List<String> names = [];
  static List<String> appellations = [];[[/highlight]]
  ...
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* **Be sure to remove `final` from these declarations.**

* `[]` is equivalent to `new List()`.

* A List is a _generic_ type&mdash;a List can contain any kind of object.
If you intend for a list to contain only strings,
you can declare it as `List<String>`.

</div> </div>

<div class="trydart-step-details" markdown="1">

<hr>

Add two static functions to the PirateName class:
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
class PirateName {
  ...

  [[highlight]]static Future readyThePirates() {
    var path = 'piratenames.json';
    return HttpRequest.getString(path)
        .then(_parsePirateNamesFromJSON);
  }
  
  static _parsePirateNamesFromJSON(String jsonString) {
    Map pirateNames = JSON.decode(jsonString);
    names = pirateNames['names'];
    appellations = pirateNames['appellations'];
  }[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* `HttpRequest` is a utility for retrieving data from a URL.

* `getString()` is a convenience method for doing a simple
GET request that returns a string.

* The code uses a `Future` to perform the GET asynchronously.

* The callback function for `.then()` is called when
the Future completes successfully.

* When the Future completes successfully,
the pirate names are read from the JSON file.

* `readyThePirates` returns the Future so the main program has the
opportunity to do something after the file is read.

</div> </div>

<div class="trydart-step-details" markdown="1">
<hr>
Add a top-level variable.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
[[highlight]]SpanElement badgeNameElement;[[/highlight]]

void main() {
  ...
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Stash the span element for repeated use instead of querying the DOM for it.

</div> </div>

<div class="trydart-step-details" markdown="1">
<hr>
Make these changes to the `main()` function.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void main() {
  [[highlight]]InputElement inputField = querySelector('#inputName');
  inputField.onInput.listen(updateBadge);[[/highlight]]
  genButton = querySelector('#generateButton');
  genButton.onClick.listen(generateBadge);
  
  [[highlight]]badgeNameElement = querySelector('#badgeName');[[/highlight]]
  ...
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Stash the span element in the global variable.
Also, stash the input element in a local variable.


</div> </div>

<div class="trydart-step-details" markdown="1">
<hr>
Then, add the code to get the names from the JSON file,
handling both success and failure.
</div>

<div class="row"> <div class="col-md-7">

<div class="trydart-step-details">
{% prettify dart %}
void main() {
  ...
  
[[highlight]]  PirateName.readyThePirates()
    .then((_) {
      //on success
      inputField.disabled = false; //enable
      genButton.disabled = false;  //enable[[/highlight]]
      setBadgeName(getBadgeNameFromStorage());
    [[highlight]]})
    .catchError((arrr) {
      print('Error initializing pirate names: $arrr');
      badgeNameElement.text = 'Arrr! No names.';
    });[[/highlight]]
}
{% endprettify %}
</div>

<div class="trydart-filename">piratebadge.dart</div>

</div> <div class="col-md-5" markdown="1">

* Call the `readyThePirates()` function,
which returns a Future.

* When the Future successfully completes,
the `then()` callback function is called.

* Using underscore (`_`) as a parameter name
indicates that the parameter is ignored.

* The callback function enables the UI
and gets the stored name.

* If the Future encounters an error
the `catchError` callback function is called
and the program displays an error message,
leaving the UI disabled.

* The callback functions for `then()` and `catchError` are defined inline.

</div> </div>

### <i class="icon-anchor"> </i> Run the app.

<div class="trydart-step-details" markdown="1">
  
使用菜单 **File > Save All** 保存文件。

Use the Run button
<img src="images/run.png" width="16" height="16"
     alt="Run button">
in Dart Editor to run the app.

If you want to see what happens when the app can't find the `.json` file,
change the file name in the code and run the program again.

Compare your app to the final version running below.


<iframe class="running-app-frame"
        style="height:220px;width:530px;"
        src="examples/6-piratebadge_json/piratebadge.html">
</iframe>


#### 问题？

Check your code against the files in `6-piratebadge_json`.

* [piratebadge.html](https://github.com/dart-lang/one-hour-codelab/blob/master/web/6-piratebadge_json/piratebadge.html)

* [piratebadge.dart](https://github.com/dart-lang/one-hour-codelab/blob/master/web/6-piratebadge_json/piratebadge.dart)

</div>

### <i class="icon-anchor"> </i> Share your pirate name.

<div class="trydart-step-details" markdown="1">

Congratulations! You finished the pirate badge code lab.


Share your pirate name with the world.

<p class="share-button twitter">
<a href="https://twitter.com/share"
   class="twitter-share-button external-link"
   data-count="none"
   data-text="Arrr! I've generated me pirate name and learnt Dart, to boot. http://dartlang.org/darrrt"
   data-hashtags="dartlang">Tweet</a>
 </p>

<script src="https://apis.google.com/js/plusone.js"></script>
<g:plus action="share"></g:plus>

</div>


<hr>

##Step 7: 继续前行，了解 Dart 语言的更多特性 {#step-seven}

### <i class="icon-anchor"> </i> Think about what you've done!

<div class="trydart-step-details" markdown="1">

This code lab provided a tour of most Dart language features
and many library features.
Here's where to go to learn more.

#### The Dart language

<a href="https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html">
A Tour of the Dart Language</a>
shows you how to use each major Dart feature,
from variables and operators to classes and libraries.
This code lab introduced the following Dart language features,
all of which are covered in more detail in the language tour.

* string interpolation (`'$_firstName the $_appellation'`)
* the cascade operator (`..`)
* the fat arrow (`=>`) function syntax
* the ternary operator (`?:`)
* named constructors (`PirateName.fromJSON(...)`)
* optional parameters
* a class
* getters
* instance methods and fields
* class level methods and fields
* top-level variables and functions
* typecasting with `as` (`(e.target as InputElement)`)
* import, and import with `show` (`import 'dart:math' show Random;`)
* generics

#### The Dart libraries

<a href="https://www.dartlang.org/docs/dart-up-and-running/contents/ch03.html">
A Tour of the Dart Libraries</a>
shows you how to use the major features in Dart’s libraries.

#### API documentation for classes

<a href="https://api.dartlang.org/dart_core/String.html" target="_blank">String</a>,
<a href="https://api.dartlang.org/dart_core/List.html" target="_blank">List</a>,
<a href="https://api.dartlang.org/dart_core/Map.html" target="_blank">Map</a>,
<a href="https://api.dartlang.org/dart_math/Random.html" target="_blank">Random</a>,
<a href="https://api.dartlang.org/dart_html/InputElement.html" target="_blank">InputElement</a>,
<a href="https://api.dartlang.org/dart_html/ButtonElement.html" target="_blank">ButtonElement</a>,
<a href="https://api.dartlang.org/dart_html/Event.html" target="_blank">Event</a>,
<a href="https://api.dartlang.org/dart_html/HttpRequest.html" target="_blank">HttpRequest</a>, and
<a href="https://api.dartlang.org/dart_async/Future.html" target="_blank">Future</a>

#### API documentation for libraries

<a href="https://api.dartlang.org/dart_core.html" target="_blank">dart:core</a>,
<a href="https://api.dartlang.org/dart_math.html" target="_blank">dart:math</a>,
<a href="https://api.dartlang.org/dart_html.html" target="_blank">dart:html</a>,
<a href="https://api.dartlang.org/dart_async.html" target="_blank">dart:async</a>, and
<a href="https://api.dartlang.org/dart_convert.html" target="_blank">dart:convert</a>

#### API documentation for JSON and local storage

<a href="https://api.dartlang.org/dart_html/Window.html#localStorage" target="_blank">LocalStorage</a>, and
<a href="https://api.dartlang.org/dart_convert.html#JSON" target="_blank">JSON</a>


</div>

### <i class="icon-anchor"> </i> Check out the samples.

<div class="trydart-step-details" markdown="1">

Run some Dart programs online and check out the source code
on our [Samples page](/samples/).
</div>

### <i class="icon-anchor"> </i> Read the tutorials.

<div class="trydart-step-details" markdown="1">
Learn more about Dart from
the [Dart tutorials](/docs/tutorials/).
</div>

