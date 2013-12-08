---
layout: default
title: "Dart Cookbook"
description: "使用 Dart 的妙方。"
has-permalinks: true
---

# Dart Cookbook

{::options parse_block_html="true" /}
<div class="row">
<div class="col-md-4">
<div class="bs-sidebar hidden-print affix-top" role="complementary">
{::options parse_block_html="false" /}  

## 目录

1. [Strings](#strings)
    1. [连接字符串](#concatenating-strings)
    1. [字符串插值](#interpolating-expressions-inside-strings)
    1. [处理字符串中的特殊字符](#handling-special-characters-within-strings)
    1. [用 StringBuffer 来创建字符串](#incrementally-building-a-string-using-a-stringbuffer)
    1. [判断字符串是否为空](#determining-whether-a-string-is-empty)
    1. [删除开头和结尾的空格字符](#removing-leading-and-trailing-whitespace)
    1. [改变字符大小写](#changing-string-case)
    1. [处理由多个字符单元组成的扩展字符](#handling-extended-characters-that-are-composed-of-multiple-code-units)
    1. [在字符和字符编码之间转换](#converting-between-characters-and-numerical-codes)
    1. [计算字符串的长度](#calculating-the-length-of-a-string)
    1. [一次一个字符地处理字符串](#processing-a-string-one-character-at-a-time)
    1. [把字符串分割为子字符串](#splitting-a-string-into-substrings)
    1. [检测一个字符串是否包含另外一个字符串](#determining-whether-a-string-contains-another-string)
    1. [查找匹配正则表达式的字符串](#finding-matches-of-a-regular-expression)
    1. [用正则表达式替换字符串](#substituting-strings-using-regular-expressions)
1. [Lists](#lists)
    1. [创建固定长度的 List](#creating-a-fixed-length-list)
    1. [创建不可变的 List](#creating-an-immutable-list)
    1. [创建一个用默认值初始化的 List](#creating-a-list-and-initializing-it-with-default-values)
    1. [复制一个 List](#copying-a-list)
    1. [在 List 中添加内容](#appending-items-to-a-list)
1. [Numbers](#numbers)
    1. [把字符串转换为数字](#converting-a-string-to-a-number)
    1. [把数字转换为字符串](#converting-a-number-to-a-string)
1. [JSON](#json)
    1. [编码为 JSON 格式](#encoding-json)
    1. [解析 JSON 格式](#decoding-json)
1. [URIs](#uris)
    1. [编码和解码完整的 URI](#encoding-and-decoding-fully-qualified-uris)
    1. [解析 URI](#parsing-uris)
    1. [创建 URI](#building-uris)
1. [测试](#测试)
    1. [只运行一个测试](#running-only-a-single-test)
    1. [过滤要运行的测试](#filtering-which-tests-are-run)
    1. [在测试前后运行代码](#running-code-before-and-after-each-test)
    1. [测试同步异常](#测试-synchronous-exceptions)
    1. [测试双精度数字相等](#测试-for-double-equality)
1. [HTML DOM](#html-dom)
    1. [用 CSS 选择器查找 DOM 元素](#using-css-selectors-to-find-dom-elements)
    1. [在一个限定的范围内使用 CSS 选择器](#using-css-selectors-within-a-limited-scope)
    1. [从一个特定的元素来遍历 DOM](#traversing-the-dom-starting-from-a-particular-element)
    1. [创建 DOM 元素](#creating-dom-elements)
    1. [在 DOM 元素中添加一个子元素](#inserting-child-elements-inside-an-existing-dom-element)
    1. [在 DOM 元素前后插入子元素](#inserting-elements-before-or-after-an-existing-dom-element)
    1. [复制 DOM 元素](#cloning-dom-elements)
    1. [替换 DOM 元素](#replacing-dom-elements)
    1. [从 DOM 中删除元素](#removing-an-element-from-the-dom)
    1. [获取和设置 DOM 元素的属性](#getting-and-setting-dom-element-attributes)
    1. [获取和设置元素样式属性](#getting-and-setting-element-style-properties)
1. [Web UI](#web-ui)
    1. [Using a Dart expression inside HTML](#using-a-dart-expression-inside-html)
    1. [Observing a Dart variable for changes](#observing-a-dart-variable-for-changes)
    1. [Creating a bidirectional binding using text elements](#creating-a-bidirectional-binding-using-text-elements)
    1. [Creating a binding using radio buttons](#creating-a-binding-using-radio-buttons)
    1. [Creating bindings for booleans using checkboxes](#creating-bindings-for-booleans-using-checkboxes)
    1. [Selecting multiple items from a list of checkboxes using data binding](#selecting-multiple-items-from-a-list-of-checkboxes-using-data-binding)
{:.toc .nav .bs-sidenav}

{::options parse_block_html="true" /}
</div>
</div>
<div class="col-md-8"> <!-- Start of content -->
{::options parse_block_html="false" /}  

## Strings

### 连接字符串

#### 面对的问题

你想在 Dart 中连接字符串。

#### 解决的方式

用 `+` 操作符：

{% prettify dart %}
var fact = 'Dart ' + 'is ' + 'fun!'; // 'Dart is fun!'
{% endprettify %}

你可以用 `+` 操作符来连接单行和多行字符串：

{% prettify dart %}
var funnyGuys = 'Dewey ' + 'Cheatem' + 
''' and
Howe'''; // 'Dewey Cheatem and\n Howe'
{% endprettify %}

#### 延伸讨论

你还可以把字符串字面量放到一起：

{% prettify dart %}
var fact = 'Dart '  'is '  'fun!'; // 'Dart is fun!'
{% endprettify %}

字符串字面量放到一起的用法也支持多行字符串：

{% prettify dart %}
var fact = 'Dart '
'is '
'fun!'; // 'Dart is fun!'
{% endprettify %}


如果你要连接的字符串片段已经在一个 List 中了，则可以用 List 的
`join()` 函数：

{% prettify dart %}
var film = ['The', 'Big', 'Lebowski'].join(' '); // 'The Big Lebowski'
{% endprettify %}

如果你需要从多个片段创建一个很长很长的字符串，则用
StringBuffer 会更加高效（查看下面的 _用 StringBuffer 来创建字符串_）。

还可以用字符串插值功能。


### 字符串插值

#### 面对的问题

你想在字符串中嵌入 Dart 表达式的值。

#### 解决的方式

通过使用 $\{表达式} 语法你可以把表达式的值放到一个字符串中。

{% prettify dart %}
var favFood = 'sushi';
var whatDoILove = 'I love ${favFood.toUpperCase()}'; // 'I love SUSHI'
{% endprettify %}

如果表达式只是一个标识符，则可以省略 \{}：

{% prettify dart %}
var whatDoILove = 'I love $favFood'; // 'I love sushi'
{% endprettify %}

#### 延伸讨论

`'string ${expression}`  和 `string` + `expression.toString()`
具有同样的效果。
例如：

{% prettify dart %}
var four = 4;
var seasons = 'The $four seasons'; // 'The 4 seasons'
{% endprettify %}

在功能上和如下代码一样：

{% prettify dart %}
var seasons = 'The ' + 4.toString() + ' seasons';
// 'The 4 seasons'
{% endprettify %}

你应该考虑给你的类实现一个 `toString()` 函数。
如果没有，则会发生如下情况：

{% prettify dart %}
class Point {
  num x, y;
  Point(this.x, this.y);
}

var point = new Point(3, 4);
print('Point: $point'); // "Point: Instance of 'Point'"
{% endprettify %}

这个结果或许不是你所期望的。下面是定义了 `toString()` 后的
示例：

{% prettify dart %}
class Point {
  ...
    
  String toString() => 'x: $x, y: $y';
}

print('Point: $point'); // 'Point: x: 3, y: 4'
{% endprettify %}

### 处理字符串中的特殊字符

#### 面对的问题

你想在字符串中加入 换行符、美元符号和其他特殊的字符。

#### 解决的方式

在特殊字符前面加一个 `\`。

{% prettify dart %}
  print('Wile\nCoyote'); 
  // Wile
  // Coyote
{% endprettify %}

#### 延伸讨论

Dart 有一些特殊用途的字符，这些字符可以通过转义方式使用：

* \n 换行符，和 \x0A 一样。
* \r 回车，和  \x0D 一样。
* \f 换页符，和 \x0C 一样。
* \b 退格， 和 \x08 一样。
* \t 制表符， 和 \x09 一样。
* \v 垂直制表符， 和 \x0B 一样。

如果你喜欢的话，可以用 `\x` 或者 `\u` 的方式来
使用特殊字符：

{% prettify dart %}
print('Wile\x0ACoyote');   // Same as print('Wile\nCoyote')
print('Wile\u000ACoyote'); // Same as print('Wile\nCoyote') 
{% endprettify %}

还可以用 `\u{}` 方式：

{% prettify dart %}
print('Wile\u{000A}Coyote'); // same as print('Wile\nCoyote')
{% endprettify %}

也可以转义字符串插值表达式中的 `$`：

{% prettify dart %}
var superGenius = 'Wile Coyote';
print('$superGenius and Road Runner');  // 'Wile Coyote and Road Runner'
print('\$superGenius and Road Runner'); // '$superGenius and Road Runner'
{% endprettify %}

如果你把 `\` 用着一个不是特殊字符前面，则不起作用：

{% prettify dart %}
print('Wile \E Coyote'); // 'Wile E Coyote'
{% endprettify %}

##### 原始字符串

你可以用原始字符串来关闭字符串插值的功能。
在字符串引号前面添加一个 `r` 来创建一个原始字符串：

{% prettify dart %}
print(r'Wile \E Coyote');               // 'Wile \E Coyote'
print(r'$superGenius and Road Runner'); // '$superGenius and Road Runner'
{% endprettify %}

特殊字符和 `$` 符号在原始字符串中只代表普通的字符。


### 用 StringBuffer 创建增量字符串

#### 面对的问题

你想用更高效的方式来组合字符片段。

#### 解决的方式

用 StringBuffer 来生成字符串。如下是一个从 url 片段
中组合成一个 url 字符串的例子：

{% prettify dart %}
var data = [{'scheme': 'https', 'domain': 'news.ycombinator.com'}, 
            {'domain': 'www.google.com'}, 
            {'domain': 'reddit.com', 'path': 'search', 'params': 'q=dart'}
           ];

String assembleUrlsUsingStringBuffer(entries) {
  StringBuffer sb = new StringBuffer();
  for (final item in entries) {
    sb.write(item['scheme'] != null ? item['scheme']  : 'http');
    sb.write("://");
    sb.write(item['domain']);
    sb.write('/');
    sb.write(item['path'] != null ? item['path']  : '');
    if (item['params'] != null) {
      sb.write('?');
      sb.write(item['params']);
    }
    sb.write('\n');
  }
  return sb.toString();
}

// https://news.ycombinator.com/
// http://www.google.com/
// http://reddit.com/search?q=dart
{% endprettify %}

一个 StringBuffer 收集字符串片段，只有当 `toString()` 函数
调用的时候才生成一个新的字符串。

#### 延伸讨论

使用 StringBuffer 和 直接连接字符串 相比，效率要高很多。
例如 下面的代码：

{% prettify dart %}
String assembleUrlsUsingConcatenation(data) {
  var urls = '';
  for (final item in data) {
    urls += item['scheme'] != null ? item['scheme']  : 'http';
    urls += "://";
    urls += item['domain'];
    urls += '/';
    urls += item['path'] != null ? item['path']  : '';
    if (item['params'] != null) {
      urls += '?';
      urls += item['params'];
    }
    urls += '\n';
  }
  return urls;
}
{% endprettify %}

虽然产生的结果一样，但是上面的代码会导致
多次连接字符串，从而引起性能问题。


##### StringBuffer 的其他函数

除了 `write()` 函数之外， StringBuffer 类还提供了其他函数：
`writeAll()` 一次写入一个字符串 list 的所有内容、
`writeCharCode()` 一次写入一个字符代码、
`writeln()` 写入一个新的换行符 、 等等。
下面的示例演示如何使用这些函数：

{% prettify dart %}
var sb = new StringBuffer();
sb.writeln('The Beatles:');
sb.writeAll(['John, ', 'Paul, ', 'George, and Ringo']);
sb.writeCharCode(33); // charCode for '!'.
var beatles = sb.toString(); // 'The Beatles:\nJohn, Paul, George, and Ringo!' 
{% endprettify %}


### 判断字符串是否为空

#### 面对的问题

你想知道字符串是否为空的。如果你尝试使用 `if (string) {...}`，你会
发现这样并不满足你的要求。

#### 解决的方式

用 `string.isEmpty`：

{% prettify dart %}
var emptyString = '';
print(emptyString.isEmpty); // true
{% endprettify %}

你也可以直接用  `==`：

{% prettify dart %}
if (string == '') {...} // True if string is empty.
{% endprettify %}

一个包含空白字符的字符串不是空的：

{% prettify dart %}
var space = ' ';
print(space.isEmpty); // false
{% endprettify %}

#### 延伸讨论

不要用 `if (string)` 来测试字符串是否为空。 在 Dart 中，除了 boolean 值
true 外所有的对象都是 fasle， 所有 `if (string)` 总是为空。
在检测模式下 如果你在 'if' 中用了非 boolean 值的表达式，则编辑器会发出一个警告信息。


### 删除字符串首尾空白字符

#### 面对的问题

你想要删除字符串开头和结尾的 空格、制表符以及其他空白字符。

#### 解决的方式

用 `string.trim()`：

{% prettify dart %}
var space = '\n\r\f\t\v';       // A variety of space characters.
var string = '$space X $space';
var newString = string.trim();  // 'X'
{% endprettify %}

String 类并没包含一个只删除开头或者结尾空白字符的函数。
如果你有该需求，则可以用正则表达式。

只删除开头的空白字符：

{% prettify dart %}
var newString = string.replaceFirst(new RegExp(r'^\s+'), ''); // 'X \n\r\f\t\v'
{% endprettify %}

只删除末尾的空白字符：

{% prettify dart %}
var newString = string.replaceFirst(new RegExp(r'\s+$'), ''); // '\n\r\f\t\v X'
{% endprettify %}


### 改变字符大小写

#### 面对的问题

你想改变字符串的大小写

#### 解决的方式

用 String 的 `toUpperCase()` 和 `toLowerCase()` 函数：

{% prettify dart %}
var theOneILove = 'I love Lucy';
theOneILove.toUpperCase();                           // 'I LOVE LUCY!'
theOneILove.toLowerCase();                           // 'i love lucy!'

// Zeus in modern Greek.
var zeus = '\u0394\u03af\u03b1\u03c2';               // 'Δίας'
zeus.toUpperCase();                                  // 'ΔΊΑΣ'

var resume = '\u0052\u00e9\u0073\u0075\u006d\u00e9'; // 'Résumé'
resume.toLowerCase();                                // 'résumé'
{% endprettify %}

对于没有大小写之分的语言（比如 中文、印度文等）， `toUpperCase()` 和 `toLowerCase()` 
函数不会改变字符串内容。

{% prettify dart %}
var chickenKebab = '\u091a\u093f\u0915\u0928 \u0915\u092c\u093e\u092c'; 
// 'चिकन कबाब'  (in Devanagari)
chickenKebab.toLowerCase();  // 'चिकन कबाब'
chickenKebab.toUpperCase();  // 'चिकन कबाब'
{% endprettify %}

如果字符串用 `toUpperCase()` 和
`toLowerCase()` 不会改变大小写，则通常说明该字符串只有
一种形态。


### 处理由多个字符单元组成的扩展字符

#### 面对的问题

你想使用表情和其他特殊字符，这些字符用 16 bit 无法表达。
你如何在代码中直接使用这些字符呢？

#### 解决的方式

你可以用 `'\u{}'` 语法创建扩展字符：

{% prettify dart %}
var clef = '\u{1D11E}'; // 𝄞
{% endprettify %}

#### 延伸讨论

大多数的 UTF-16 字符用 two-byte (16 bit) 代码序列保存。
由于 两个 byte 只能包含 65,536 个字符。所以就用两个 16 bit 来表示位于
0x10000 和 0x10FFFF 中的增补字符集。这里的字符只有成对使用（用两个 16 bit）时，才有意义。
如果单个用，则是不合法的 UTF-16 字符。 通常用术语 'surrogate pair(代理对)' 来表示这种字符。

`'\u{1D11E}'` 字符由 `'\uD834'` 和
`'\uDD1E'` 代理对组成。

通过 `codeUnits` 属性可以获取扩展字符的
代理对：

{% prettify dart %}
clef.codeUnits.map((codeUnit) => codeUnit.toRadixString(16)); 
// ['D834', 'DD1E']
{% endprettify %}

单独使用一个代理对成员会出错，
你应该避免提供访问这些代理对的变量和函数：

{% prettify dart %}
print('\uD834');          // Error: '\uD834' is not a valid string.
print('\uDD1E');          // Error: '\uDD1E' is not a valid string either.
print(clef.split('')[1]); // Invalid string. Dart Editor prints '?'
print(clef[0]);           // Invalid string. Dart Editor prints '?'
{% endprettify %}

当处理扩展字符串的时候，你应该用
`runes` getter 函数。

例如，查询字符串的长度，应该用 `string.runes.length`，而不要用
`string.length`：

{% prettify dart %}
print(clef.runes.length);     // 1
print(clef.length);           // 2
print(clef.codeUnits.length); // 2
{% endprettify %}

要获取单个字符或者第几个字符，也要用 `runes` ：

{% prettify dart %}
print(clef.runes.toList()[0]); // 119070 ('\u{1D11E}')
{% endprettify %}

要把扩展字符串的字符放到一个 list 中，也需要用 `runes` 来映射字符：

{% prettify dart %}
var clef = '\u{1D11E}'; // 𝄞
var title = '$clef list:'
print(subject.runes.map((rune) => new String.fromCharCode(rune)).toList());
// ['𝄞', ' ', 'l', 'i', 's', 't', ':']
{% endprettify %}


### 在字符和字符编码之间转换

#### 面对的问题

你需要把字符串转换为字符代码或者 把字符代码转换为字符串。

#### 解决的方式

用 `runes` getter  来获取字符串的代码数字：

{% prettify dart %}
'Dart'.runes.toList();            // [68, 97, 114, 116]

var smileyFace = '\u263A';        // ☺
print(smileyFace.runes.toList()); // [9786], (equivalent to ['\u263A']).

var clef = '\u{1D11E}';           // 𝄞
print(clef.runes.toList());       // [119070], (equivalent to ['\u{1D11E}']).
{% endprettify %}

用 `string.codeUnits` 来获取一个字符串的 UTF-16 代码单元( code unit )：

{% prettify dart %}
'Dart'.codeUnits.toList();     // [68, 97, 114, 116]
smileyFace.codeUnits.toList(); // [9786]
clef.codeUnits.toList();       // [55348, 56606]
{% endprettify %}

##### 用 codeUnitAt() 获取单个代码单元：

要获取特定位置的字符代码单元，用  `codeUnitAt()`：

{% prettify dart %}
'Dart'.codeUnitAt(0);     // 68
smileyFace.codeUnitAt(0); // 9786 (the decimal value of '\u263A')
clef.codeUnitAt(0);       // 55348 (does not represent a legal string) 
{% endprettify %}

#### 把数字代码转换为字符串

使用工厂构造函数 `String.fromCharCodes(charCodes)` 可以从
数字代码中生成一个新的字符串，参数可以为 runes 和 code units。
`String.fromCharCodes(charCodes)` 会自动分辨他们的区别，并返回
正确的字符串：

{% prettify dart %}
print(new String.fromCharCodes([68, 97, 114, 116]));                  // 'Dart'

print(new String.fromCharCodes([73, 32, 9825, 32, 76, 117, 99, 121]));
// 'I ♡ Lucy'

// Passing code units representing the surrogate pair.
print(new String.fromCharCodes([55348, 56606]));                      // 𝄞

// Passing runes.
print(new String.fromCharCodes([119070]));                            // 𝄞
{% endprettify %}

还可以用 `String.fromCharCode()` 转换一个 rune
或者 code unit 为字符串：

{% prettify dart %}
new String.fromCharCode(68);     // 'D'
new String.fromCharCode(9786);   // ☺
new String.fromCharCode(119070); // 𝄞
{% endprettify %}

创建一个只包含一半代理对的字符串是允许的，但是不推荐这
样做。


### 计算字符串的长度

#### 面对的问题

你想知道字符串的长度，但是在处理各种长度 Unicode 字符的时候你不知道
如何正确的计算字符长度。

#### 解决的方式

用 `string.runes.length` 计算字符串的长度：

{% prettify dart %}
print('I love music'.runes.length); // 12
{% endprettify %}

包含扩展字符的字符串也可以用  `string.runes.length`  
来查询字符串长度：

{% prettify dart %}
var clef = '\u{1D11E}';        // 𝄞
var subject = '$clef list:';   // 
var music = 'I $hearts $clef'; // 'I ♡ 𝄞'

clef.runes.length;             // 1
music.runes.length             // 5
{% endprettify %}

#### 延伸讨论

你可以省略 `runes` 直接用 String 的 `length` 变量。 这样会返回
字符串的代码单元长度。 对于大部分的 unicode 字符，用 `string.length`和
`string.runes.length` 的结果一样。

对于 扩展字符， `string.length` 的值要比 `string.runes.length` 
大：

{% prettify dart %}
clef.length;                   // 2

var music = 'I $hearts $clef'; // 'I ♡ 𝄞'
music.length;                  // 6
{% endprettify %}

如果你不是想要代码单元的长度，则最好使用
`string.runes.length`。

##### 使用组合字符

如上所示，把扩展字符和普通字符一起使用而无需处理 runes 和 代码单元的复杂性，让 Dart 来处理字符
和计算字符串的长度看起来是非常诱人的。
人们都知道 'Dart' 是四个字符而 'Amelié' 是六个字符。 在 Dart 中，'Dart' 的长度确实是四，但是
'Amelié' 的长度就不一定了：

{% prettify dart %}
var name = 'Ameli\u00E9';               // 'Amelié'
var anotherName = 'Ameli\u0065\u0301';  // 'Amelié'
print(name.length);                     // 6
print(anotherName.length);              // 7
{% endprettify %}

虽然 `name` 和 `anotherName` 代表的字符串看起来是一样的，
但是 'é' 通过不同的 runes 创建的。
这样通过输出的字符串就没法确定该字符串的长度了。


### 一次一个字符地处理字符串

#### 面对的问题

你想处理字符串中的每个字符。

#### 解决的方式

通过函数 `string.split('')` 来映射结果字符：

{% prettify dart %}
var lang= 'Dart';

// ['*D*', '*a*', '*r*', '*t*']
print(lang.split('').map((char) => '*${char}*').toList());

var smileyFace = '\u263A';
var happy = 'I am $smileyFace';
print(happy.split('')); // ['I', ' ', 'a', 'm', ' ', '☺']
{% endprettify %}

或者遍历字符串：

{% prettify dart %}
var list = [];
for(var i = 0; i < lang.length; i++) {
  list.add('*${lang[i]}*'); 
}

print(list); // ['*D*', '*a*', '*r*', '*t*']
{% endprettify %}

或者映射 runes：

{% prettify dart %}
// ['*D*', '*a*', '*r*', '*t*']
var charList = "Dart".runes.map((rune) {
  return '*${new String.fromCharCode(rune)}*').toList();
});

// [[73, 'I'], [32, ' '], [97, 'a'], [109, 'm'], [32, ' '], [9786, '☺']]
var runeList = happy.runes.map((rune) {
  return [rune, new String.fromCharCode(rune)]).toList();
});
{% endprettify %}

当使用扩展字符的时候，你应该总是用 runes 来操作字符。
不要用 `split('')` 可以避免索引扩展字符。
查看 _处理由多个字符单元组成的扩展字符_ 来了解如何
处理扩展字符。


### 把字符串分割为子字符串

#### 面对的问题

你想用分隔符或者正则表达式把字符串分割为子字符串。

#### 解决的方式

用  `split()` 函数，参数为 字符串或者 RegExp 对象。

{% prettify dart %}
var smileyFace = '\u263A';
var happy = 'I am $smileyFace';
happy.split(' '); // ['I', 'am', '☺']
{% endprettify %}

下面是用 RegExp 调用 `split()` 的示例：

{% prettify dart %}
var nums = '2/7 3 4/5 3~/5';
var numsRegExp = new RegExp(r'(\s|/|~/)');
nums.split(numsRegExp); // ['2', '7', '3', '4', '5', '3', '5']
{% endprettify %}

上面的代码中， `nums` 包含了一些数学表达式。
用 RegExp 把里面的数字给分割出来。

当用 RegExp 来调用 `split()` 函数时，你可以分别处理每个匹配或者不匹配的
子字符串：

{% prettify dart %}
var phrase = 'Eats SHOOTS leaves';

var newPhrase = phrase.splitMapJoin((new RegExp(r'SHOOTS')),
  onMatch:    (m) => '*${m.group(0).toLowerCase()}*',
  onNonMatch: (n) => n.toUpperCase());

print(newPhrase); // 'EATS *shoots* LEAVES'
  
{% endprettify %}

RegExp 匹配中间的字符 ('SHOOTS')。
一对回调函数用来处理匹配和不匹配的子字符串，该操作发生在字符串 Join 操作之前。


### 检测一个字符串是否包含另外一个字符串

#### 面对的问题

你想知道一个字符串是否是另外一个字符串的子集。

#### 解决的方式

用 `string.contains()`：

{% prettify dart %}
var fact = 'Dart strings are immutable';
print(fact.contains('immutable')); // True.
{% endprettify %}

第二个参数可以用来设置开始查找字符串的起点位置：

{% prettify dart %}
print(fact.contains('Dart', 2)); // False
{% endprettify %}

#### 延伸讨论

String 类提供了一些函数用来测试一个字符串是否
是另外一个字符串的子集：

{% prettify dart %}
print(string.startsWith('Dart')); // True.
print(string.endsWith('e'));      // True.
{% endprettify %}

你还可以用 `string.indexOf()` 函数来判断，如果在字符串中没有发现子字符串则
返回值为 -1 ， 如果发现的话，就返回子字符串的位置：

{% prettify dart %}
var found = string.indexOf('art') != -1; // True, `art` is found in `Dart`.
{% endprettify %}

还可以用 RegExp 和 `hasMatch()`：

{% prettify dart %}
var found = new RegExp(r'ar[et]').hasMatch(string);
//  True, 'art' and 'are' match.
{% endprettify %}

### 查找匹配正则表达式的字符串

#### 面对的问题

你想用正则表达式来匹配字符串，并且想访问匹配的子字符串。

#### 解决的方式

用 RegExp 类来创建一个正则表达式对象，然后用 `allMatches()` 函数
来查找匹配的项：

{% prettify dart %}
var neverEatingThat = 'Not with a fox, not in a box';
var regExp = new RegExp(r'[fb]ox');
List matches = regExp.allMatches(neverEatingThat);
print(matches.map((match) => match.group(0)).toList()); // ['fox', 'box']
{% endprettify %}

#### 延伸讨论

你可以通过查询 `allMatches()` 返回值来获取匹配项的
个数：

{% prettify dart %}
var howManyMatches = matches.length; // 2
{% endprettify %}

要查找第一个匹配的项，用  `firstMatch()` 函数：

{% prettify dart %}
var firstMatch = RegExp.firstMatch(neverEatingThat).group(0); // 'fox'
{% endprettify %}

要直接访问匹配的字符串，用  `stringMatch()` 函数：

{% prettify dart %}
print(regExp.stringMatch(neverEatingThat));         // 'fox'
print(regExp.stringMatch('I like bagels and lox')); // null
{% endprettify %}

### 用正则表达式替换字符串

#### 面对的问题

你想用正则表达式来查找字符串，并替换找到的字符串。

#### 解决的方式

用 RegExp 类来创建一个正则表达式对象，然后通过字符串的
 `replaceAll()` 函数来替换：

{% prettify dart %}
var resume = 'resume'.replaceAll(new RegExp(r'e'), '\u00E9'); // 'résumé'
{% endprettify %}

如果你只想替换第一个匹配的项，则用函数 `replaceFirst()`：

{% prettify dart %}
// Replace the first match of one or more zeros with an empty string.
var smallNum = '0.0001'.replaceFirst(new RegExp(r'0+'), ''); // '.0001'
{% endprettify %}

可以用 `replaceAllMapped()` 函数来注册一个修改所有匹配项的方法：

{% prettify dart %}
var heart = '\u2661'; // '♡'
var string = 'I like Ike but I $heart Lucy';
var regExp = new RegExp(r'[A-Z]\w+');
var newString = string.replaceAllMapped(regExp, (match) {
  return match.group(0).toUpperCase()
}); 
print(newString); // 'I like IKE but I ♡ LUCY'
{% endprettify %}




## Lists

### 创建固定长度的 List

#### 面对的问题

你想创建一个大小不变的 List。

#### 解决的方式

给 List 构造函数提供一个长度的参数即可创建一个
长度固定的 List：

{% prettify dart %}
var fixedList = new List(3); // fixedList can have exactly 3 items.
{% endprettify %}

你不能修改固定 list 的长度：

{% prettify dart %}
fixedList.add(2);       // UnsupportedError
fixedList.removeLast(); // UnsupportedError
fixedList.length = 10;  // UnsupportedError
{% endprettify %}

但是你 _可以_ 改变每个 list 元素的值：

{% prettify dart %}
fixedList[0] = 'red';
fixedList[1] = 'green';
fixedList[2] = 'blue';
print(fixedList); // ['red', 'green', 'blue']
{% endprettify %}


### 创建不可变的 List

#### 面对的问题

你想保护你的数据不被意外覆盖， 创建一个创建后不能修改的 List。
你不想让他人修改 list 的元素、添加新的元素或者从 list 中删除元素。

#### 解决的方式

用关键字 'const' 创建一个不可变 list：

{% prettify dart %}
const List<String> vowels = const ['A', 'E', 'I', 'O', 'U'];
{% endprettify %}

用 const 创建的 list 是编译期常量。 所以每个 list 的元素也需要为
编译期常量。

{% prettify dart %}
const List<String> vowels = const ['A', 'E', 'I', 'O', 'U'];
const List<String> rgb = const ['R', 'G', 'B'];
const List<List<String>> chars = const [vowels, rgb];
{% endprettify %}

尝试在 const list 中用非 const 值会导致编译失败：

{% prettify dart %}
// ILLEGAL.
const List<List<String>> chars = const [
    ['A', 'E', 'I', 'O', 'U'], ['R', 'G', 'B']];
{% endprettify %}

一旦 const list 创建后，就无法修改其长度：

{% prettify dart %}
vowels.add('Y'); // UnsupportedError
{% endprettify %}

并且也无法修改 list 中的元素内容：

{% prettify dart %}
vowels[0] = 'a'; // UnsupportedError
{% endprettify %}

两个 const list 只有满足如下条件才认为是相等和一样（ _equal and identical_）的：
长度一样、里面的值一样且顺序也一样。也就是说， const list 是规范化的（canonicalized）：

{% prettify dart %}
const List<String> colors = const ['R', 'G', 'B'];    
const List<String> rgb    = const ['R', 'G', 'B']; 
      
colors == rgb;                   // true
identical(colors, rgb);          // true
colors.hashCode == rgb.hashCode; // true
{% endprettify %}


### 创建一个用默认值初始化的 List

#### 面对的问题

你想创建一个新的 list 并且在 list 创建的时候设置
所有元素的默认值。

#### 解决的方式

用 `List.generate()` 构造函数。参数为一个用来生成默认值的
方法。

{% prettify dart %}
var filledList = new List<bool>.generate(3, (_) => false);
print(filledList); // [false, false, false]

filledList.add(true);
print(filledList); // [false, false, false, true]
{% endprettify %}

如果你想创建一个固定长度的 list ，则设置可选的参数 `growable` 为 
`false` (该参数默认值为 `true`  )：

{% prettify dart %}
var fixedAndFilled = new List<bool>.generate(3, (_) => false, growable: false);
{% endprettify %}

可以动态的生成所有的值：

{% prettify dart %}
List<List<int>> grid = new List.generate(3, (x) => [x, x + 1, x + 2]);
{% endprettify %}

上面的代码生成了一个 3 X 3 的矩阵：

{% prettify dart %}
print(grid); // [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
{% endprettify %}

#### 延伸讨论

另外，你也可以用 `List.filled()` 构造函数来创建带有默认
值的 list：

{% prettify dart %}
var filledList = new List<bool>.filled(3, false);
print(filledList); // [false, false, false]
{% endprettify %}

`List.filled()` 和 `List.generate()` 相比，有两个限制
条件：

- 只能创建长度固定的 list 。
- 不能动态的生成默认值。

如果上面两个限制条件对你的需求无影响，
则可以用 `List.filled()` 来替代  `List.generate()`。


### 复制一个 List

#### 面对的问题

你想用其他 list 的值创建一个新的 list。

#### 解决的方式

用原来的 list 作为参数调用  `List.from()` 构造函数：

{% prettify dart %}
var fruit1 = ['orange', 'banana', 'mango'];
var fruit2 = new List.from(fruit1);
{% endprettify %}

#### 延伸讨论

`List.from()` 构造函数创建一个新的独立的 list：

{% prettify dart %}
identical(names, namesCopy); // false
{% endprettify %}

但是， 新创建的 list 里面的元素和 原来的 list 还是一样的：

{% prettify dart %}
var names = [{'first': 'Reggie', 'last': 'Jackson'}, 
             {'first': 'Cy', 'last': 'Young'}];

var namesCopy = new List.from(names);
identical(names.first, namesCopy.first); // true
{% endprettify %}

修改任意一个 list 中的元素值，另外一个 list 中对应的值也会
改变：

{% prettify dart %}
names[0]['last'] = 'Jefferson';
print(namesCopy[0]['last']); // 'Jefferson'
{% endprettify %}

由于 list 自己并没有共享同一个引用，所以在一个 list 中添加
元素并不影响另外一个 list：

{% prettify dart %}
names.add({'first' : 'Micky', 'last' : 'Mantle'});
names.length;     // 3
namesCopy.length; // 2
{% endprettify %}

##### 固定长度 vs. 长度可变 的 list

默认情况下，创建的 list 是长度可增加的。
即使用一个 `const` list 作为参数来调用 `List.from()` 构造函数生成的 list 也是如此：

{% prettify dart %}
const List<String> vowels1 = const ['A', 'E', 'I', 'O', 'U'];
var vowels2 = new List.from(vowels1);

vowels2.add('Y');
print(vowels2); // ['A', 'E', 'I', 'O', 'U', 'Y']

vowels2[0] = 'Y';
print(vowels2[0]); // 'Y'
{% endprettify %}

要复制一个固定长度的 list， 设置 `List.from()` 构造函数的  `growable`
参数为 `false`：

{% prettify dart %}
const List<String> vowels1 = const ['A', 'E', 'I', 'O', 'U'];
var vowelsFixed = new List.from(vowels1, growable: false);
var fruitFixed = new List.from(fruit1, growable: false);
{% endprettify %}

可以修改其中的一个元素：

{% prettify dart %}
vowelsFixed[0] = 'Y';
print(vowelsFixed[0]); 'Y'
{% endprettify %}

但是无法删除和添加元素：

{% prettify dart %}
vowelsFixed.add('Y');     // UnsupportedError
vowelsFixed.removeLast(); // UnsupportedError
{% endprettify %}


### 在 List 中添加内容

#### 面对的问题

你想知道如何在 list 末尾添加一个元素，也想知道
添加元素最高效的方式。

#### 解决的方式

用 `add()` 函数在 list 末尾添加一个元素：

{% prettify dart %}
var names = ['Seth', 'Timothy', 'John'];
names.add('Kathy');
names.add('Mary');
print(names); // ['Seth', 'Timothy', 'John', 'Kathy', 'Mary']
{% endprettify %}

如果要添加的元素已经位于一个 list 中了，则可以
用函数  `addAll()` 添加所有的元素：

{% prettify dart %}
var names = ['Seth', 'Timothy', 'John'];
names.addAll(['Kathy', 'Mary']);
print(names); // ['Seth', 'Timothy', 'John', 'Kathy', 'Mary']
{% endprettify %}

或者你可以增加  `length` 成员变量。 这样的话新的 list 元素的
默认值为 null。

{% prettify dart %}
names.length += 2; // Creates 2 more null items.
print(names);      // ['Seth', 'Timothy', 'John', null, null]
{% endprettify %}

然后可以用真实的值替代这些 `null`：

{% prettify dart %}
var names = ['Seth', 'Timothy', 'John'];
var moreNames = ['Kathy', 'Mary'];
      
var oldLength = names.length;
names.length += 2;
      
for (var i = 0; i < moreNames.length; i++) {
  names[i + oldLength] = moreNames[i];
}

print(names); ['Seth', 'Timothy', 'John', 'Kathy', 'Mary']
{% endprettify %}

通过增加 length 来添加内容比用 `add()` 或者 `addAll()`
更高效。



## Numbers

### 把字符串转换为数字

#### 面对的问题

解析一个字符串并转化为数字。

#### 解决的方式

用 `int.parse` 把字符串转换为 int：

{% prettify dart %}
print(int.parse('231')); // 231
{% endprettify %}

字符串可以用 '+' 或者 '-' 作为前缀：

{% prettify dart %}
print(int.parse('+231')); // 231
print(int.parse('-231')); // -231
{% endprettify %}

第二个参数可以设置安装几进制解析：

{% prettify dart %}
print(int.parse('231', radix: 16));  // 561
print(int.parse('F34A', radix: 16)); // 62282
{% endprettify %}

以'0x'、 '-0x' 或者 '+0x' 开头的字符串默认按照 16 进制数字解析：

{% prettify dart %}
print(int.parse('0x231')); // 561
{% endprettify %}

用 `double.parse` 把字符串转换为 double：

{% prettify dart %}
print(double.parse('3.14')); // 3.14
{% endprettify %}

该函数支持指数表达形式：

{% prettify dart %}
print(double.parse('3.14e5')); // 314000.0
{% endprettify %}

如果字符串不可解析为数字，则 `int.parse` 和 `double.parse` 都会抛出一个 FormatException 。


### 把数字转换为字符串

#### 面对的问题

你想把数字转化为字符串。

#### 解决的方式

用 `toString()` 把数字转换为对应的字符串：

{% prettify dart %}
1234.toString();   // '1234'
3.1519.toString(); // '3.1519'
{% endprettify %}

如果要指定数字的位数，则用 `toStringAsPrecision()`
函数：

{% prettify dart %}
1234.toStringAsPrecision(5);   // '1234.0'
3.1519.toStringAsPrecision(8); // '3.1519000'
{% endprettify %}

如果要指定小数点后的位数，则用  `toStringAsFixed()`:

{% prettify dart %}
1234.toStringAsFixed(2);   // '1234.00'
3.1519.toStringAsFixed(2); // '3.15'
{% endprettify %}

要转换为指数表达方式，则用
`toStringAsExponential()` 函数： 

{% prettify dart %}
1234.toStringAsExponential();   // '1.234e+3'
{% endprettify %}

当把数字转换为字符串的时候还可以指定按照几进制来转换：

{% prettify dart %}
64.toRadixString(2);  // '1000000'
64.toRadixString(8);  // '100'
64.toRadixString(16); // '40'
{% endprettify %}


## JSON

JSON (JavaScript Object Notation) 是用文本的方式来描述对象和集合。
你可以用 'dart:json' 库中的类来解析和编码 JSON 对象。

本节的示例需要先导入 `dart:json` 才能运行。
推荐用如下的方式来导入库，这样可以提供一个
友好的命名空间来调用顶级方法：

{% prettify dart %}
import 'dart:json' as json;

void main() {
  json.stringify( ... );
  json.parse( ... );
  ...
}
{% endprettify %}

关于 dart:json 的 API 文档请访问：http://api.dartlang.org/docs/releases/latest/dart_json.html.


### 编码为 JSON 格式

#### 面对的问题

你想把 Dart 对象编码为 JSON 字符串。

#### 解决的方式

用 `stringify()` 函数来把 Dart 对象编码为 JSON 格式字符串。

下面的 Dart 对象通过
`stringify()` 可以自动编码为 JSON 字符串：

* int
* double
* String
* bool
* null
* List
* Map

{% prettify dart %}
import 'dart:json' as json;

void main() {
  var person = {'name': 'joe', 
                'born':  2002,
                'into': {'films' : ['crime', 'noir']},
                'aliases': []};
  
  json.stringify(person);
  // '{"name":"joe","born":2002,"into":{"films":["crime","noir"]},"aliases":[]}'
}
{% endprettify %}

注意 `stringify()` 函数通过递归的方式来编码  List 和 Map 对象。

如果 `stringify()` 的参数不是上面的对象，则 `stringify()` 会调用该对象的
`toJson()` 函数：

{% prettify dart %}
import 'dart:json' as json;

class Person {
  String name;
  num age;
  
  Person(this.name, this.age);
  dynamic toJson() => {"name": name, "age": age};
}

void main() {
  var person = new Person('john', 32);
  json.stringify(person); // '"{\"name\":\"john\",\"age\":32}"'
}
{% endprettify %}

如果该对象也没有定义 `toJson()` 函数，则
`stringify()` 抛出一个异常：

{% prettify dart %}
import 'dart:json' as json;

class Book {
  String title;
  num numPages;
 
  Book(this.title, this.numPages);
}

void main() {
  var book = new Book('War and Peace', 1089);
  json.stringify(book); // json.JsonUnsupportedObjectError
}
{% endprettify %}

有可能 `stringify()` 调用了很多个对象的 `toJson()` 函数，
但是其中有一个没有实现
`toJson()` 函数；则可以用
 `JsonUnsupportedObjectError`的 `cause` 成员变量来查看是
 谁触发了该异常：

{% prettify dart %}
void main() {
  var person = new Person('john', 32);              // toJson() defined.
  var book = new Book('War and Peace', 1089);       // toJson() not defined.
  var object = {'person': person, 'reads' : book};

  try {
    json.stringify(object);
  } catch(e) {
    print(e.cause.toString());
    // "Class 'Book' has no instance method 'toJson'..."
  }
}
{% endprettify %}

### 解析 JSON 格式

#### 面对的问题

你想把 JSON 字符串转换为 Dart 对象。

#### 解决的方式

用 `parse()` 函数把 JSON 字符串转换为 Dart 对象：

{% prettify dart %}
import 'dart:json' as json;

void main() {
  var jsonPerson = '{"name" : "joe", "date" : [2013, 3, 10]}';
    
  var person = json.parse(jsonPerson);
  
  person['name'];         // 'joe'
  person['date'];         // [2013, 3, 10]
  person['date'] is List; // true
}
{% endprettify %}

有时候你可能需要转换 `parse` 解析的内容。例如，
你可能用一个 DateTime 对象来代表日期，而不是用一个年月日的数字 list 来表达。
用 'reviver' 方法作为 `parse` 的第二个参数可以实现转换功能。

该方法会在每个解析的对象或者 list 属性上执行，并使用 reviver 方法返回的值
替代原来的值：

{% prettify dart %}
import 'dart:json' as json;

void main() {
  var jsonPerson = '{"name" : "joe", "date" : [2013, 10, 3]}';

  var person = json.parse(jsonPerson, (key, value) {
    if (key == "date") {
      return new DateTime(value[0], value[1], value[2]);
    }
    return value;
  });

  person['name'];             // 'joe'
  person['date'] is DateTime; // true
}
{% endprettify %}


## URIs

注意 本节所有的示例代码都需要导入 'dart:uri'：

{% prettify dart %}
import 'dart:uri';
{% endprettify %}


### 编码和解码完整的 URI


用 `encodeUri()` 来编码一个完整的 URI：

{% prettify dart %}
encodeUri('http://www.example.com/file with spaces.html')
// 'http://www.example.com/file+with+spaces.html'
{% endprettify %}

在  URI 中具有特殊作用的字符 (例如 #;,/?:@&=$) 不会
被转义：

{% prettify dart %}
encodeUri('http://example.com/?x=10&y=20#last');
// 'http://example.com/?x=10&y=20#last'

encodeUri('mailto:bob@example.com'); // 'mailto:bob@example.com'
{% endprettify %}

用 `encodeUriComponent()` 来编码任何用户提交需要作为 URI 的一部分提交到
服务器的数据：

{% prettify dart %}
var params = encodeUriComponent('?param1=10&param2=20');
print(params); // '%3Fparam1%3D10%26param2%3D20'

encodeUri('http://www.example.com/') + params;
// 'http://www.example.com/%3Fparam1%3D10%26param2%3D20'));
{% endprettify %}

注意：不要在完整的 URI 上调用 `encodeUriComponent()` 。
这样会导致 URI 中的特殊字符被转义：

{% prettify dart %}
encodeUriComponent('http://www.example.com/'); 
// 'http%3A%2F%2Fwww.example.com%2F'
{% endprettify %}

用 `decodeUri()` 来解析之前用 `encodeUri()` 编码的 URI  ：

{% prettify dart %}
var uri = 'http://www.example.com/file with spaces.html';
var encodedUri = encodeUri(uri);
decodeUri(encodedUri) == uri; // true
{% endprettify %}

用 `decodeUriComponent()` 解析之前
 `encodeUriComponent()` 编码过的 URI：

{% prettify dart %}
var params = encodeUriComponent('?param1=10&param2=20');
var encodedParams = encodeUriComponent(params);
decodeUriComponent(encodedParams) == params; // true
{% endprettify %}


### 解析 URI

#### 面对的问题

你想访问 URI 的部分内容。

#### 解决的方式

用 `Uri()` 构造函数创建的 URI 对象可以直接访问如下
成员变量：

{% prettify dart %}
var uri = new Uri('http://example.org:8080/content/a.html#intro');

uri.scheme;     // 'http'
uri.userInfo;   // ''
uri.port        // ''
uri.domain;     // 'example.org'
uri.path;       // '/content/a.html'
uri.fragment;   // 'intro'
{% endprettify %}

通过 URI 的  `query` 成员变量来获取 URI 的查询参数：

{% prettify dart %}
var params = 'name=john&age=32';
var uri = new Uri('http://example.org/?name=john&age=32');
uri.query; // 'name=john&age=32'
{% endprettify %}

对于 http/https 协议，可以通过 `origin` 来查询主机信息：

{% prettify dart %}
var uri = new Uri('http://example.org:8080/content/a.html#intro');
uri.origin;     // 'http://example.org:8080'
{% endprettify %}

#### 延伸讨论

所有不是以 URI 协议开头的 URL ， Uri 类都认为是相对的：

{% prettify dart %}
new Uri('//example.org:8080/content/').isAbsolute; // false
new Uri('example.org:8080/content/').isAbsolute;   // false
{% endprettify %}

以协议开头但是同时包含片段的 URI 也被认为是相对的：

{% prettify dart %}
new Uri('http//example.org:8080/content/#intro').isAbsolute; // false
{% endprettify %}

相对 URI 的 `scheme` 和 `domain` 是空的。
而 相对 URI 是从一个路径开始的：

{% prettify dart %}
var uri = new Uri('example.org/content/a.html#intro');
      
uri.isAbsolute; // false
uri.scheme;     // ''
uri.domain;     // ''
uri.path;       // 'example.org/content/a.html'
{% endprettify %}

访问相对 URI 的 `origin` 成员变量会抛出一个异常：

{% prettify dart %}
var uri = new Uri('example.org/content/a.html#intro');
uri.isAbsolute; // false

try {
  var origin = uri.origin;
} catch(e) {
  print(e); // 'Illegal argument(s): Cannot use origin without a scheme'
}
{% endprettify %}


### 创建 URI

#### 面对的问题

你想从各个组成部门创建一个 URI。

#### 解决的方式

用 `Uri.fromComponents()` 构造函数从各个组成部分创建 URI：

{% prettify dart %}
var uri = new Uri.fromComponents(
  scheme: 'http',
  domain: 'example.org',
  path: '/content/a.html',
  query: 'name=john');

uri.isAbsolute;        // true
print(uri.toString()); // 'http://example.org/content/a.html?name=john'
{% endprettify %}

如果没有提供协议参数，则 `Uri.fromComponents()` 
创建一个相对 URI，并用 '//` 作为 URI 的起始字符：

{% prettify dart %}
var uri = new Uri.fromComponents(domain: '/content/a.html');
         
uri.isAbsolute;       // false
print(uri.toString(); // '//content/a.html'
{% endprettify %}

在使用该 URI 之前需要先删除 '//' 字符。


## 测试

### 只运行一个测试

#### 面对的问题

你想只是运行一个单一的测试。可能是当前你正在编码的一个测试，你想让该测试
通过后再运行所有的测试。
或者，该测试是一个你想在调试器中调试的失败测试，只运行该测试可以避免其他测试的干扰。

#### 解决的方式

要隔离一个测试，把  `test()` 修改为 `solo_test()` 即可。

{% prettify dart %}
test('if y == 0', ()  => expect(() => ...));
solo_test('if y != 0', () => expect(() => ...));
{% endprettify %}

只有 `solo_test()` 会执行：

{% prettify dart %}
unittest-suite-wait-for-done
PASS: if y != 0

All 1 tests passed.
unittest-suite-success
{% endprettify %}

注意，不要使用多个  `solo_test()` ：

{% prettify dart %}
solo_test('if y == 0', () => expect(() => ...));
solo_test('if y != 0', () => expect(() => ...));
{% endprettify %}

上面的代码会抛出异常，并且只有第一个  `solo_test()` 被执行：

{% prettify dart %}
unittest-suite-wait-for-done
Exception: Only one test can be soloed right now.
PASS: if y == 0

All 1 tests passed.
unittest-suite-success
{% endprettify %}


### 过滤要运行的测试

#### 面对的问题

你想只运行一部分测试。可能你用 `group()`来把你的测试给分组了，并需要执行一组或者机组测试。
或者，你在测试中设置有关键字，并且只想运行带有某些关键字的测试。

#### 解决的方式

用 Unittest 库提供的  `filterTests()` 方法。
该方法的参数为一个字符串或者一个 RegExp，每个测试描述符合该参数才会执行。

Unittest 默认配置运行 `main()` 中的所有测试。
你需要修改该默认行为。 继承 Configuration 类来提供一个自定义的配置并禁用
自动运行所有测试的行为：

{% prettify dart %}
class CustomConfiguration extends Configuration {
  get autoStart => false;
}
{% endprettify %}

在告诉测试执行者新的配置后，可以定义你的测试并通过
`filteredTests()` 来过滤测试，
用 `runTests()` 来运行你的测试：

{% prettify dart %}
void main() {
  unittestConfiguration = new CustomConfiguration();
  
  // Your tests go here.

  filterTests(someStringOrRegExp);
  runTests();
}
{% endprettify %}

下面有一个完整使用 `filterTests()` 的示例。
你可以在命令行中运行该示例，命令行输入的命令将作为
 `filterTests()` 的参数： 

{% prettify dart %}
$ dart filter_tests.dart <keyword>
{% endprettify %}

下面是代码：

{% prettify dart %}
import 'package:unittest/unittest.dart';
import 'package:args/args.dart';
import 'dart:io';

class CustomConfiguration extends Configuration {
  get autoStart => false;
}

void main() {
  unittestConfiguration = new CustomConfiguration();
  
  // Get the args from the command line.
  ArgParser argParser = new ArgParser();
  Options options = new Options();
  ArgResults results = argParser.parse(options.arguments);
  List<String> args = results.rest;

  test('a test',     () => expect(1 + 0, equals(1))); 
  test('crucial test', () => expect('crucial'.length, 7));
  test('another crucial test',  () => expect('crucial'.startsWith('c'),
    isTrue));

  group('case change', () {
    test('to upper', () => expect('this'.toUpperCase(), equals('THIS'))); 
    test('to lower', () => expect('THAT'.toLowerCase(), equals('that')));
  });

  if (!args.isEmpty) {
    filterTests(args[0]);
  }
  runTests();
}
{% endprettify %}

用 'crucial' 作为参数来运行：

{% prettify dart %}
$ dart filter_tests.dart crucial
{% endprettify %}

只有测试描述中包含 'crucial' 的测试被执行：

{% prettify dart %}
unittest-suite-wait-for-done
PASS: crucial test
PASS: another crucial test

All 2 tests passed.
unittest-suite-success
{% endprettify %}

用  'case' 参数运行：

{% prettify dart %}
$ dart filter_tests.dart case
{% endprettify %}

只有位于 'case change' 组中的测试被执行：

{% prettify dart %}
unittest-suite-wait-for-done
PASS: case change to upper
PASS: case change to lower

All 2 tests passed.
unittest-suite-success
{% endprettify %}

关键字参数是可选的，如果没有提供，则运行所有测试。


### 在测试前后运行代码

#### 面对的问题

你想在每个测试运行之前初始化一些数据，在测试运行后清理现场，并且
避免重复的代码。

#### 解决的方式

在每个 `group()` 中，用 `setUp()` 来执行初始化任务；用 `tearDown()` 来执行清理任务。
 `setUp()` 的参数在每个测试运行之前运行，`tearDown()` 的参数在每个测试运行之后运行。

##### setUp() example（示例）

假设你定义了一个包含几个函数的 Point 类。
你想测试该类的每个函数，并且在每个测试中都需要一个函数。
把 Point 类的初始化函数放到 `setUp()` 中，然后在每个测试中就
可以用 Point 对象了：

{% prettify dart %}
void main() {
  group('test Point with setUp()', () {
    Point point;
    setUp(() {  
      point = new Point(3, 4);
    });

    test('toString',  () => expect(point.toString(), equals(...)));
    test('[](index)', () => expect(point[0], equals(...)));
  });
}
{% endprettify %}

##### setUp() and tearDown() example（示例）

在测试完成后，需要把测试生成的文件以及文件夹都删除掉。
下面是在一个文件夹中创建文件的方法：

{% prettify dart %}
// Writes a file in 'dir' directory.
Path writeFileToDirectory(dir) {
  ...
}
{% endprettify %}

下面的代码在 `setUp()` 中创建目录。在
`tearDown()` 中删除目录中的文件和目录：

{% prettify dart %}
void main() {
  group('test writeFileToDirectory()', () {
    var tempDir;
    
    setUp(() {
       tempDir = new Directory('').createTempSync();
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('creates the correct path', () => ...);
    test('throws with a non-existent directory', () => ...);
  });
}
{% endprettify %}

不管 `setUp()` 中的代码是否执行成功，也不管测试是否成功， `tearDown()` 中的
代码都会执行。如果在测试中有个测试失败了， `tearDown()` 依然执行：

{% prettify dart %}
group('tearDown behavior when', () {
  var tempDir;

  setUp(() {
    print('setting up');
    tempDir = new Directory('').createTempSync();
  });

  tearDown(() {
    print('tearing down');
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('test has error in it', () {
    22 ~/ 0; // Trigger an IntegerDivisionByZeroException.
    ...
  });
});
{% endprettify %}

下面是测试的输出结果：

{% prettify dart %}
unittest-suite-wait-for-done
setting up
tearing down

FAIL: tearDown behavior when test has error in it
  Caught IntegerDivisionByZeroException
  ...

0 PASSED, 1 FAILED, 0 ERRORS
Uncaught Error: Exception: Some tests failed.
Stack Trace:
...
{% endprettify %}

##### setUp() and tearDown() in nested group()s

在新的 `group()` 中，`setUp()` 和 `tearDown()` 方法会被重置。
即使在嵌套的 `group()` 中，里面的 `group()` 也无法访问外面 `group()` 的 `setUp()` 代码：

{% prettify dart %}
group('test Point with nested setUp()', () {
  Point point;
  setUp(() {  
    point = new Point(3, 4);
  });
  
  group('[]()', () {
    // setUp() from outer group() does not run here. point is null.
    test('with valid index', () => ... );
    test('with invalid index', () => ... );
  });
});
{% endprettify %}

可以在每个 `group()` 中都设置一个
`setUp()` 和 `tearDown()` 来解决该问题。


### 测试同步异常

#### 面对的问题

如果你想测试代码中的异常。你想知道你的代码是否正确的返回了，还是抛出异常了。或者你想测试函数抛出
的特定异常信息。

#### 解决的方式

在 Unittest 包中的 Matcher 库提供了一些处理异常的方法。 

用 `throws` matcher（匹配器）来测试异常： 

{% prettify dart %}
expect(() => 10 ~/ 0, throws);
{% endprettify %}

用 `returnsNormally` matcher 来测试代码
正常执行而无异常：

{% prettify dart %}
expect(() => 10 ~/ 1, returnsNormally);
{% endprettify %}

Unittest 库提供了处理常见异常和错误
的 matcher：

{% prettify dart %}
throwsException
throwsFormatException
throwsArgumentError
throwsRangeError
throwsNoSuchMethodError
throwsUnimplementedError
throwsStateError
throwsUnsupportedError
{% endprettify %}

你可以用这些 matcher 来测试你代码中
抛出的异常：

{% prettify dart %}
expect(() => throw new StateError('functions called in the wrong order'), 
    throwsStateError);
{% endprettify %}

还可以用 `throwsA()` 和 `predicate()`方法来详细的控制异常
信息。

`predicate()` 根据提供的参数返回一个匹配
特定异常或者错误的 Matcher：

{% prettify dart %}
Matcher isIntegerDivisionByZeroException =
  predicate((e) => e is IntegerDivisionByZeroException);
{% endprettify %}

`throwsA()` 方法用 `predicate()` 返回的 Matcher 
来判断测试代码是否抛出匹配的异常：

{% prettify dart %}
expect(() => 10 ~/ 0, throwsA(isIntegerDivisionByZeroException));
{% endprettify %}

通过组合 `throwsA()` 和 `predicate()` 你可以测试
错误信息：

{% prettify dart %}
expect(() => throw new ArgumentError('bad argument'), 
  throwsA(predicate((e) => e.message == 'bad argument')));
{% endprettify %}

还可以同时测试错误类型和错误消息：

{% prettify dart %}
expect(() => throw new RangeError('out of range'), 
  throwsA(predicate((e) => (e is RangeError && e.message == 'out of range'))));
{% endprettify %}


### 测试双精度数字相等

#### 面对的问题

在数学中关于 double 类型是不精确的。你想比较两个 double 来看看
他们是否相等。

#### 解决的方式 

用 `closeTo()` matcher 来测试数字近似相等：

{% prettify dart %}
closeTo(value, delta)
{% endprettify %}

该测试会检查测试的数字是否误差在一个变量范围 内。

例如，下面两个测试两点之间距离的代码：

{% prettify dart %}
Point point1 = new Point(-2, -3);
Point point2 = new Point(-4, 4);

print(point1.distanceTo(point2)); // 7.280109889280518.  
{% endprettify %}

下面是测试近似相等的方法：

{% prettify dart %}
expect(point1.distanceTo(point2)), closeTo(7.28, .001)); 
{% endprettify %}

## HTML DOM

### 用 CSS 选择器查找 DOM 元素

#### 面对的问题

你想查找页面中的 DOM 元素。

#### 解决的方式

用 `dart:html` 库的顶级方法 `query()` 和 `queryAll()`。
两个方法都支持 CSS 选择器参数。
`query()` 方法返回第一个匹配的元素，
`queryAll()` 返回所有匹配的元素。

#### Example（示例）

下面是一些  `query()` 和 `queryAll()` 的示例代码，用
CSS 选择器来查找 DOM 元素：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body>
    <h1>Breakfast</h1> 
    <ul>
      <li id='first' class='must-have'>Milk</li>
      <li class='must-have'>Cereal
        <ul>
          <li>Bran Flakes</li>
          <li><a href='https://en.wikipedia.org/wiki/Nut_(fruit)'>Nuts</a></li>
        </ul>
      </li>
      <li>Juice</li>
    </ul>    
    
    <script type="application/dart">
      import 'dart:html';
      
      void main() {
    
        // 通过 ID 查找
        Element element = query('#first');
        print(element.id);                 // 'first'
        print(element.text);               // 'Milk'
        
        // 通过 class 查找
        List<Element> elements = queryAll('.must-have');
        print(elements.length);            // 2
        
        // 通过  ID 或者 class 查找
        elements = queryAll('#first, .must-have');
        print(elements.length);            // 2
        
        // 通过  tag 查找
        elements = queryAll('li');
        print(elements.length);            // 5
        
        // 用继承选择器
        elements = queryAll('li > ul > li');
        print(elements.first.text);        // 'Bran Flakes'
        
        // Use pseudo-elements.
        element = query('li:nth-child(1)');
        print(element.text);               // 'Milk'
        
        // 通过 attribute 查找
        elements = queryAll('[href *= Nut]');
        print(elements.length);            // 1
      
      }
    </script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

所有可用的 CSS 选择器请参考：
http://www.w3.org/TR/css3-selectors/[CSS 选择器规范指南]。

#### 延伸讨论

方法 `queryAll()` 返回一个 DOM 元素的 list：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body>   
    <ol>
      <li>Google</li>
      <li>StackOverflow</li>
      <li>Reddit</li>
      <li>Github</li>
    </ol>
     
    <script type="application/dart">
      import 'dart:html';
      
      void main() {
        List<Element> elements = queryAll('li');
      }
    </script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

用 `[]` 操作符访问每个元素。
还可以用 `first` 和 `last` getters:

{% prettify dart %}
print(elements[2].text);    // 'Reddit'
print(elements.first.text); // 'Google'
print(elements.last.text);  // 'Github'
{% endprettify %}

可以遍历该 list，并把该 list 内容映射为一个新的 list，并过滤里面的内容：

{% prettify dart %}
for (var element in elements) {
   doSomethingWith(element);
}

Iterable sites = elements.map((site) => site.text);
print(sites.join(', ')); // "Google, StackOverflow, Reddit, Github"

sites = elements.where((site) => site.text.length != 6);
print(sites.first.text); // "StackOverflow"
{% endprettify %}

还可以获取 list 的子列表：
        
{% prettify dart %}
var sublist = elements.sublist(1, 3); // Get the elements at positions 1 and 2.
print(sublist.first.text);            // 'StackOverflow'
print(sublist.last.text);             // 'Reddit'
{% endprettify %}

由于 `queryAll()` 方法返回的 lsit 为只读的，你无法在里面添加、修改或者删除元素。
通过任何方式修改里面的元素都会导致错误:

{% prettify dart %}
elements.length = 2; // Error message: 'Cannot resize immutable List.'
{% endprettify %}

该书中其他妙方将介绍如何创建和在 DOM 中插入元素，
以及如何修改已有的 DOM 元素。


### 在一个限定的范围内使用 CSS 选择器

#### 面对的问题

你想查找特定元素内的元素。

#### 解决的方式

在一个 DOM 元素上调用 `query()` 或者 `queryAll()`。
在 DOM 元素上调用这些函数，将查找返回限制为该元素的子元素中：

{% prettify dart %}
containerElement.query(cssSelector);
containerElement.queryAll(cssSelector);
{% endprettify %}

#### Examples（示例）

例如，如下示例中：

{% prettify dart %}
<table>
  <tr><td>Jose</td><td class='status'>Accepted</td></tr>
  <tr><td>Marie</td><td class='status'>Accepted</td></tr>
  <tr><td>Kwame</td><td class='status'>Accepted</td></tr>
  <tr><td>Rohan</td><td class='status'>Accepted</td></tr>
</table>
{% endprettify %}

下面的代码在每个 <tr> 上注册一个事件处理函数。 当点击 <tr> 的时候，
查找该元素内的 <td> 元素并修改其内容：

{% prettify dart %}
queryAll('tr').forEach((element) {
  element.onClick.listen((event) {
    var record = event.currentTarget.query('.status');
    record.innerHtml = record.innerHtml == 'Accepted' ? 'Declined' : 'Accepted';
  });
});
{% endprettify %}

上面的代码在点击的元素上调用函数 query ， 参数为 'status' 类。
所以其他非点击的行不受影响。

同时，注意上面的示例代码中用 `queryAll()` 来查找文档中的所有匹配的
元素。


### 从一个特定的元素来遍历 DOM

#### 面对的问题

你手上有一个 DOM 元素，你想查找该元素的 父节点、兄弟节点和子节点。

#### 解决的方式

dart:html API 提供了用来从一个 DOM 元素遍历
其他元素的方法。

如下示例中：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <ol>
    <li>Head</li>
    <li>Shoulders</li>
    <li>Knees</li>
    <li>Toes</li>
  </ol>
    
  <body>   
    <script type="application/dart">
      import 'dart:html';

      void main() {
        LIElement knees = query('ol > li:nth-child(3)');       
        print(knees.text); // 'Knees'
      }
    </script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>

{% endprettify %}

用  `query()` 方法可以获取一个
<li> 元素。该元素是访问其他元素的起点。

用 `nextElementSibling` 和 `previousElementSibling` 来访问该元素
紧邻的兄弟元素：

{% prettify dart %}
print(knees.nextElementSibling.text);     // 'Toes'
print(knees.previousElementSibling.text); // 'Shoulders'
{% endprettify %}
        
用 `parent` 来访问该元素的直接父节点：

{% prettify dart %}
print(knees.parent.tagName);              // 'OL'
print(knees.parent.parent.tagName);       // 'BODY'
{% endprettify %}

用 `children` 来访问该元素的直接子节点：

{% prettify dart %}
print(knees.parent.children.length);      // 4
{% endprettify %}

一个元素的 `children` 是一个 list，你可以定义一个方法
来过滤该 list：

{% prettify dart %}
List<Element> previousSiblings(item) {
  return item.parent.children.takeWhile(
      (element) => element != item).toList();
}

List<Element> nextSiblings(item) {
  Element nextElement = item.nextElementSibling;
  return item.parent.children.skipWhile(
      (element) => element != nextElement).toList();
}
{% endprettify %}

 `knees` 元素前面有两个兄弟元素，后面有一个兄弟元素：

{% prettify dart %}
List<Element> previousSiblings = previousSiblings(knees);
print(previousSiblings.first.text);    // 'Head'
print(previousSiblings.last.text);     // 'Shoulders'

print(nextSiblings(knees).first.text); // 'Toes'
{% endprettify %}


### 创建 DOM 元素

#### 面对的问题

你想创建一个新的 DOM 元素。

#### 解决的方式

dart:html 库提供了几个创建 DOM 元素的方法。

你可以用特定元素的构造函数来创建：

{% prettify dart %}
var item = new LIElement();
{% endprettify %}

这些类继承 Element 类。
下面的一些示例演示了这些类提供的属性：

{% prettify dart %}
var anchor = new AnchorElement();
anchor.href = 'http://dartlang.org';
print(anchor.outerHtml); // '<a href="http://dartlang.org"></a>'

var label = new LabelElement();
label.htmlFor = 'color';
label.text = 'Color';
print(label.outerHtml); // '<label for="color">Color</label>'

var form = new FormElement();
form.method = 'PUT';
print(form.outerHtml); // '<form method="PUT"></form>'
{% endprettify %}

还可以用 Element 类的构造函数。

用 `Element.tag()` 构造函数来创建一个特殊 tag 的元素：

{% prettify dart %}
LIElement item = new Element.tag('li');
print(item.tagName); // 'LI'
{% endprettify %}
        
然后可以用该元素的 text 属性来设置文本：

{% prettify dart %}
item.text = 'learn Dart';
print(item.outerHtml); //  '<li>learn Dart</li>'
{% endprettify %}

如果 `Element.tag()` 的参数为非法的 tag 名字，则会创建一个 UnknownElement 对象:

{% prettify dart %}
var newElement = new Element.tag('bogusTag');
print(newElement is UnknownElement); // true
{% endprettify %}

可以用 Element 类的静态函数 'isTagSupported' 来测试 tag 是否
是合法的：

{% prettify dart %}
print(Element.isTagSupported('bogusTag')); // false
{% endprettify %}

还可以用 `Element.html()` 构造函数来创建元素。
该函数的参数为一个合法的 HTML 片段：        

{% prettify dart %}
DivElement div = new Element.html('<div>I love Strawberries.</div>');
{% endprettify %}

注意：创建的元素并没有插入到 DOM 中。
该书的其他妙方介绍如何把元素插入到 DOM 树中。


### 在 DOM 元素中添加一个子元素

#### 面对的问题

你想在存在的 DOM 中掺入元素。

#### 解决的方式

获取 DOM 元素的子节点并在里面添加元素。

例如下面包含一个空的 <ul> 的网页。你想用 Dart 代码
动态的往 <ul> 中插入 <li> 子元素：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body>
    <ul></ul>
    
    <script type="application/dart" src='main.dart'></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

在对应的 Dart 代码中， 先获取该 ul 元素：

{% prettify dart %}
import 'dart:html';

void main() {
  var ul = query('ul');
  // Code for inserting elements goes here.
}
{% endprettify %}

用 `add()` 来在父节点的子节点中添加元素：

{% prettify dart %}
var li = new LIElement();
li.text = 'One banana';
ul.children.add(li);

print(ul.children.last.outerHtml); '<li>One banana</li>'
{% endprettify %}

用级联操作符可以让上面的代码更加简洁，在下面的示例中我们将用
级联操作符的方式来演示代码：

{% prettify dart %}
items.add(new LIElement()..text = 'Three banana');                                       
{% endprettify %}

用 `addAll()` 可以一次添加多个元素：

{% prettify dart %}
List<LIElement> items = [];                                                      
items.add(new LIElement()..text = 'Three banana');                                       
items.add(new LIElement()..text = 'Four banana');
ul.children.addAll(items);  
{% endprettify %}
                
现在该 list 看起来如下所示：

{% prettify dart %}
One banana
Three banana
Four banana
{% endprettify %}

这里少了一个元素，我们可以用 `insert()` 来插入缺少的元素：

{% prettify dart %}
ul.children.insert(1, new LIElement()..text = 'Two banana');
{% endprettify %}

这样，在第二个元素后面插入一个新的 <li>。现在的列表内容如下：

{% prettify dart %}
One banana
Two banana
Three banana
Four banana
{% endprettify %}

也可以用 `insert()` 在最前面插入元素：

{% prettify dart %}
ul.children.insert(0, new LIElement()..text = 'Zero banana');
print(ul.children.first.outerHtml == '<li>Zero banana</li>');
{% endprettify %}

Element 类还提供了一些辅助的方法来简化在父元素中添加元素的
操作。

用 `append()` 在父节点中添加一个元素：

{% prettify dart %}
ul.append(new LIElement()..text = 'Five banana');
{% endprettify %}

或则用 `appendHtml()` 元素。这个函数解析 HTML 参数内容并把解析
到的元素添加到该元素的子节点中：

{% prettify dart %}
ul.appendHtml('<li>Six banana</li>');
{% endprettify %}

下面是该列表的最终内容：

{% prettify dart %}
Zero banana
One banana
Two banana
Three banana
Four banana
Five banana
Six banana
{% endprettify %}

### Inserting elements adjacent to an existing DOM element

#### 面对的问题

你想在一个元素前面或则后面插入元素

#### 解决的方式

用元素的 `insertAdjacentElement()` 函数在元素前后添加元素。或则用
 `insertBefore()` 函数。
 下面示例中演示了这两个函数。

#### Examples（示例）

在如下示例 HTML 中，你想在 <ul> 中添加两个 <li>，
一个在带有 ID 为 'target' 元素之前一个在其后面：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body>   
    <ul>
      <li>First item</li>
      <li id='target'>Target item</li>
      <li>Last item</li>
    </ul>
    
    <script type='application/dart' src='main.dart'></script>
    
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

在 Dart 代码中，先获取 target <li> 元素。 然后调用该元素的
`insertAdjacentElement()` 函数来添加新的元素：

{% prettify dart %}
import 'dart:html';

void main() {
  var targetItem = query('#target');

  var li = new LIElement();
  li.text = 'Added before target';
  targetItem.insertAdjacentElement('beforeBegin', li);
  
  li = new LIElement();
  li.text = 'Added after target';
  targetItem.insertAdjacentElement('afterEnd', li);
}

{% endprettify %}

`insertAdjacentElement()` 的第一个参数代表新元素插入的位置。
如果是 'beforeBegin'，则新元素紧邻目标元素之前插入；如果是
'afterEnd' 则新元素紧邻目标元素之后插入。

插入两个新元素后的列表如下：

{% prettify dart %}
First item
Added before target
Target item
Added after target
Last item
{% endprettify %}

也可以用 `insertBefore()` 函数来插入元素。
在目标元素的父节点上调用 `insertBefore()` ：

{% prettify dart %}
import 'dart:html';
      
void main() {
  var targetItem = query('#target');

  var li = new LIElement();
  li.text = 'Added before target';
  targetItem.parent.insertBefore(li, targetItem);
  
  li = new LIElement();
  li.text = 'Added after target';
  // Insert after the target element.
  targetItem.parent.insertBefore(li, targetItem.nextElementSibling);
}
{% endprettify %}


### 复制 DOM 元素

#### 面对的问题

你想复制一个 DOM 元素。

#### 解决的方式

调用 Element 的 `clone()` 函数。

在如下示例中，复制  <ul> 元素：

{% prettify dart %}
<ul>
  <li>Sam</li>
  <li>Green Eggs</li>
  <li>Ham</li>
</ul>
{% endprettify %}

首先获取这个 ul 元素：

{% prettify dart %}
UListElement ul = query('ul');
{% endprettify %}

然后调用 `clone()` 函数，该函数参数为布尔值。
该参数指定是深度克隆还是影子克隆（a deep or a shallow copy）。

如果 `clone()` 的参数为 `true`，则是深度克隆，目标节点的所有子节点都被克隆：

{% prettify dart %}
UListElement deepCopy = ul.clone(true);
print(deepCopy.children.length); // 3
{% endprettify %}

如果 `clone()` 的参数为 `false`，则是影子克隆，
则目标元素的子元素没有被克隆：

{% prettify dart %}
UListElement shallowCopy = ul.clone(false);
print(shallowCopy.children.length); // 0
{% endprettify %}

克隆一个节点则复制该节点的所有属性和值。

假设一个包含如下代码的网页：

{% prettify dart %}
<input type="text" name="username" maxlength="10">
{% endprettify %}

克隆的 \<input\> 元素包含同样的属性和值：

{% prettify dart %}
import 'dart:html';

void main() {
  var original = query('input');
  var clone = original.clone(true);

  print(original.attributes['type'] == original.attributes['type']); // true
  print(original.attributes['name'] == original.attributes['name']); // true
  print(original.attributes['size'] == original.attributes['size']); // true
}
{% endprettify %}


#### Example（示例）

这里创建一个显示有趣的 [Google
Doodles](www.google.com/doodles) 的网页，该页面在加载的时候
并不载入所有的图片。当用户点击每个 doodles 的时候再载入图片。

用一个 \<template\> 元素来作为每个 doodles logo 和 文字的模板。
\<template\> 可以定义标记片段作为模板。

\<template\> 元素是新的标签，目前有些浏览器还不支持该元素。
关于该新元素的介绍，请参考：
[HTML's New Template Tag](http://www.html5rocks.com/en/tutorials/webcomponents/template/).

在下面的 \<template\> 中包含 \<img\>、 <div> 和 <hr> 标签。
\<img\>
标签没有 src 和 alt 属性，并且 <div> 元素也没有 文本。
这些标签只是占位符。

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body>   
    <template id='myTemplate'>
      <img width='150px'>
      <div class='caption'></div>
      <hr>
    </template> 
    
    <div><a href=''>Click to see Google Doodles</a></div>
      
    <script type='application/dart' src='main.dart'></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>

{% endprettify %}

当用户点击链接查看 logo 的时候，我们用代码中的数据来填充缺少的标签内容。然后再克隆
模板内容并插入到页面中：

{% prettify dart %}
import 'dart:html';

void main() {
  
  var data = [
    {'src': 'http://www.google.com/logos/2013/parents_day_2013-1508005-hp.jpg', 
      'alt': "Parent's Day",
      'caption': "Parent's Day"},
    {'src': 'http://www.google.com/logos/2013/new_years_day_2013-983008-hp.jpg',
     'alt': "New Year's Day",
     'caption': "New Year's Day"},
    {'src': 'http://www.google.com/logos/2013/zamboni-1005006-hp.jpg',
     'alt': 'Zamboni',
     'caption': 'Zamboni'}
  ];

  AnchorElement link = query('a');
  
  link.onClick.listen((event) { 
    event.preventDefault();

    var content = document.query('#myTemplate').content;
    ImageElement img = content.query('img');
    DivElement div = content.query('div');

    for (Map item in data) {
      img.src = item['src'];
      img.alt = item['alt'];
      div.text = item['caption'];

      document.body.append(content.clone(true));
    }
    event.target.remove();
  });
}
{% endprettify %}

用 template 的 `content` 属性来获取模板内容。

{% prettify dart %}
var content = document.query('#myTemplate').content;
{% endprettify %}

在元素上查询 \<img\> 和 <div> 标签：

{% prettify dart %}
ImageElement img = content.query('img');
DivElement div = content.query('div');
{% endprettify %}

把克隆的 \<template\> 内容插入到网页中来更新网页内容，
然后用户就可以看到图片了：

{% prettify dart %}
document.body.append(content.clone(true));
{% endprettify %}


### 替换 DOM 元素

#### 面对的问题

你想用其他的元素来替换一个或者多个 DOM 元素。

#### 解决的方式

调用 DOM 元素的  `replaceWith()` 函数，参数为替代的元素。

#### Example

下面的示例用户可以编辑一小段文本。文本显示在 <span> 元素中。
当用户点击文本的时候，就用 \<input\> 替代 <span> 来编辑内容。
当用户编辑完后，再用 <span> 替代
\<input\>:

{% prettify dart %}
<!DOCTYPE html>

<html>
  <body> 
    <span>You can edit this.&nbsp;</span><a href='#'>Edit</a>
       
    <script type="application/dart">
      
      import 'dart:html';
      
      void main() {
      
        var span = query('span');
        var link = query('a');
        
        // Create input but don't insert into DOM.
        var input = new Element.html(
            "<input type='text' value='${span.innerHtml}' />");  

        bool editing = false;
        
        // Add event-listener to replace a span with an input, and vice-versa.
        link.onClick.listen((event) {
          editing = !editing; 
          if (editing) {
            span.replaceWith(input);
            link.innerHtml = 'Done';
          } else {
            input.replaceWith(span);
            link.innerHtml = 'Edit';
          }
          event.preventDefault();
        });     
      }
    </script>

    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}


### 从 DOM 中删除元素

#### 面对的问题

你想查找并删除 DOM 元素。

#### 解决的方式

调用元素的 `remove()` 函数即可从 DOM 中删除该元素。

#### Example

下面示例中显示一个水果列表，有些水果断货了。
用户可以点击一个连接来隐藏断货的水果。
点击连接会触发一个删除元素的回调函数。下面是
示例 HTML 代码：

{% prettify dart %}
<!DOCTYPE html>
<head>
  <style> .out-of-stock {color: #aaa}; </style>  
</head>
<html>
  <body>
    <ul>
      <li>Rambutan</li>
      <li>Jackfruit</li>
      <li class='out-of-stock'>Passion Fruit</li> 
      <li>Lychee</li>
      <li class='out-of-stock'>Kumquat</li>           
    </ul>
  
    <p><a href='#'>Show only in-stock</a></p>
   
    <script type="application/dart" src='main.dart'></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

下面是删除元素的 Dart 代码：

{% prettify dart %}
import 'dart:html';
      
void main() {
  
  query('a').onClick.listen((event) {
  
    // Find all out of stock items and remove them from the DOM.
    queryAll('.out-of-stock').forEach((item) {
      item.remove();
    });
    
    event.preventDefault();
    
    // Remove the link from the DOM.
    event.target.remove();
  });
}
{% endprettify %}

#### 延伸讨论

如果你有要删除的元素对象，则用 `remove()` 函数即可。但是，有时候你拿到的是该元素的父节点。
例如，你想删除一个 <li> 元素，但是你拿到的是该元素的父节点 <ul> 或者 <ol>  对象。

在这种情况下，从父节点中获取子节点的列表。然后从该子节点列表中删除
这个元素即可。

用 `removeAt()` 来删除对应位置的元素：

{% prettify dart %}
element.children.removeAt(1); // Removes the second child.
{% endprettify %}

用 `removeLast()` 来删除最后一个元素：

{% prettify dart %}
element.children.removeLast();
{% endprettify %}

用 `remove()` 函数还可以删除符合要求的所有子节点元素。
下面的代码用 `largest` class 选择器查找到第一个元素并删除。

{% prettify dart %}
element.children.remove(element.query('.largest'));
{% endprettify %}

用 `clear()` 函数删除所有子元素：

{% prettify dart %}
element.children.clear();
{% endprettify %}


### 获取和设置 DOM 元素的属性

#### 面对的问题

你有一个 DOM 元素，你想获取或者设置元素属性的值。

#### 解决的方式

大部分元素属性都有对应的成员变量来获取或者设置元素的值。
还可以用元素的 `attributes` map 变量。
简单来说，用成员变量更加符合 Dart 风格，成员变量可以让工具来
检查属性的名字和类型。

#### Examples

如下元素：

{% prettify dart %}
<input type='text' name='fname' id='fname' data-purpose='informational' />
{% endprettify %}

对应的 Element 类定义了几个成员变量，例如 `id` 和 `classes`。 下面是
一些示例：

{% prettify dart %}
print(element.id);                 // 'fname'

element.classes.add('first-name');
print(element.classes.first);      // 'first-name'
{% endprettify %}

Element 的子类定义了其他额外的成员变量，
例如 AnchorElement 类的 href ，InputElement 类的 size 和 maxLength 等：

{% prettify dart %}
element.size = 30;
element.maxLength = 10;
{% endprettify %}

当一个元素属性没有对应的成员变量时，或者用成员变量不太方便时，你可以用
attributes map 变量：

{% prettify dart %}
print(element.attributes['id']);                   // 'fname'
print(element.attributes['name']);                 // 'fname'
{% endprettify %}

用 attributes map 来访问元素的 data-* attributes：

{% prettify dart %}
print(element.attributes['data-purpose']); // 'informational'
{% endprettify %}
        
如果你_只_获取或者设置 data-* 属性，则可以用
`dataset` 成员变量：

{% prettify dart %}
print(element.dataset.length);     // 1

// The key is 'purpose', not 'data-purpose'.
print(element.dataset.keys.first); // 'purpose'
print(element.dataset['purpose']); // 'informational'

element.dataset['purpose'] = 'biographical';
print(element.dataset['purpose']); // 'biographical'
{% endprettify %}

`attributes` 和 `dataset` 都返回 Map 对象。
修改该 Map 对象会同时应用到元素上：

{% prettify dart %}
// Change attribute value.
element.attributes['id'] = 'first-name';
print(element.attributes['id']);        // 'first-name'

// Create a new attribute.
element.attributes['maxLength'] = 10;
print(element.attributes['maxLength']); // '30'

// Remove an attribute.
element.attributes.remove('id');
print(element.attributes['id']);       // null
{% endprettify %}


### 获取和设置元素样式属性

#### 面对的问题

你想获取或者设置元素的 CSS 样式值。

#### 解决的方式

有三中方式：
 
* 用 `getComputedStyle()` 函数来获取 CSS 样式
 
* 用 `classes` 来访问或者设置元素的 class 

* 用 `style` 直接设置元素的样式。


#### Examples
 
假设有如下 HTML 代码：

{% prettify dart %}
<!DOCTYPE html>

<html>
  <head>
    <title>manipulating_styles</title>
    <link rel='stylesheet' type='text/css' href='main.css'>
  </head>
  <body>
    <div class='bold'>Dart Cookbook</div>
    
    <script type='application/dart' src='main.dart'></script>
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
{% endprettify %}

下面是对应的 CSS 样式定义：

{% prettify dart %}
// main.css

body {font-family: sans-serif;}
div:after {content: ' rocks!';}
.bold {font-weight: bold;}
.underlined {text-decoration: underline;}
{% endprettify %}

##### Getting an element's CSS styles（获取一个元素的 CSS 样式）

用 `getComputedStyle()` 函数来获取应用到该元素上的所有
 CSS 值：

{% prettify dart %}
// main.dart

import 'dart:html';

void main() {
  DivElement element = query('div');

  print(element.getComputedStyle().fontFamily); // 'sans-serif'

  // Inherited style.
  print(element.getComputedStyle().fontWeight); // 'bold'
}
{% endprettify %}

用 `getComputedStyle()` 函数查询伪元素的样式信息。
参数为 伪元素 ：

{% prettify dart %}
print(element.getComputedStyle(':after').content); // "' rocks!'"
{% endprettify %}

##### Accessing the classes associated with an element（获取一个元素相关的 class）

用 `classes` 来查询一个元素上的 CSS class ：

{% prettify dart %}
print(element.classes.first); // 'bold'
{% endprettify %}

你可以通过如下方式在一个元素上添加一个新的 class 样式：

{% prettify dart %}
element.classes.add('underlined');
print(element.classes.contains('underlined'));    // true
print(element.getComputedStyle().textDecoration); // 'underline'
{% endprettify %}

通过如下方式来删除一个元素上的 class 样式：

{% prettify dart %}
element.classes.remove('underlined');
print(element.getComputedStyle().textDecoration); // 'none'
{% endprettify %}

用 class 列表的 `toggle()` 函数来切换一个 class：

{% prettify dart %}
element.classes.toggle('underlined');
print(element.classes.contains('underlined')); // true

element.classes.toggle('underlined');
print(element.classes.contains('underlined')); // false
{% endprettify %}

##### Directly applying a style property（直接应用一个样式属性）

虽然，用 class 定义属性是一个常见的做法，但是有时候你也需要直接在元素上指定样式属性，
可以通过如下方式实现：

{% prettify dart %}
element.style.color = 'rgb(120, 120, 120)';
element.style.border = '1px solid rgb(0, 0, 0)';
{% endprettify %}

在 Dart 中通常用 级联操作符来实现上面的代码：

{% prettify dart %}
element.style
  ..color =  'rgb(120, 120, 120)';
  ..border = '1px solid rgb(0, 0, 0)';
{% endprettify %}

## Web UI

<aside class="alert alert-danger" markdown="1">
<strong>Web UI 已经不建议使用了。</strong>
从 0.5 版本之后，推荐用 [Polymer.dart](/polymer-dart/)
来替代 Web UI。（译者注： 由于 Web UI 废弃了，所以不再浪费人力翻译了，见谅！）
</aside>
The Web UI package provides web components and templates to help you write web
applications at scale.

The examples in this chapter can be compiled and run. The instructions below
for how this can be done assume you are using Dart Editor. For information 
on how to compile Web UI apps from the command line (and to read more about the
Web UI compile process), see http://www.dartlang.org/articles/web-ui/tools.html.

#### Pub dependency 

The Web UI package is available from Pub, Dart's package manager.  In a Dart
application that you have opened in the Editor, add the dependency to the Web
UI package:

{% prettify dart %}
dependencies:
  web_ui: any
{% endprettify %}

This is what a sample `pubspec.yaml` file looks like:

{% prettify dart %}
name: sample
description: A sample web application
dependencies:
  browser: any
  web_ui: any
{% endprettify %}

Run `pub install` from the Editor's Tools menu to install the web_ui package.

#### Example file

Copy any example from this chapter in a new file in the top level `web/`
directory (create that directory if it does not exist). Call the new file
`main.html`.

#### Build file

Create a top level `build.dart` file with the following contents:

{% prettify dart %}
import 'package:web_ui/component_build.dart';
import 'dart:io';

void main() {
  build(new Options().arguments, ['web/main.html']);
}
{% endprettify %}

This assumes that you called your example file `main.html`. Modify the filename
in `build.dart` if you picked a different name for your example file.

#### Compiling the example

Right-click the `build.dart` file, and choose `Run` from the drop down menu.

This runs the Web UI compile script (`packages/web_ui/dwc.dart`) and generates
an `out` directory containing the compiled files. 

Right-click on `web/main.html`, and select either the `Run in Dartium` or
"Run as JavaScript" option to run the example.

#### Making changes

You need to go through the manual compile process only once. After the intial
compilation is done, Dart Editor detects changes you make to the example file,
and automatically invokes the `dwc.dart` compiler script. You can directly run
the example file (`web/main.html`) and Dart Editor automatically runs the
compiled file.


### Using a Dart expression inside HTML

#### 面对的问题

You want to inject the value of a Dart expression in your markup.

#### 解决的方式

Place the Dart expression within `{{'{{'}} }}`. At runtime, the Web UI framework
evaluates the expression, and injects the result into the HTML.  Commonly used
Dart expressions include identifiers, method and function calls, getters, string
interpolation, and raw strings:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>

<html>
  <body>
    <ul>
      <li>Using identifiers: var x = {{x}} and var y = {{y}}</li>
      <li>Calling a method: {{x}} in hex is {{x.toRadixString(16)}}</li>
      <li>Calling functions: (x ~/ y) = {{intDivision()}} and (x / y) = 
        {{doubleDivision().toStringAsPrecision(4)}}</li>
      <li>Using a getter: {{cityNameAsChars}}</li>
      <li>Using string interpolation: {{'city = ${city.toUpperCase()}'}}</li>
      <li>Using a raw string: {{r'$city'}}</li>
    </ul>

    <script type="application/dart">
      import 'package:web_ui/web_ui.dart';

      num x = 32;
      num y = 3;
      String city = 'Boston';
      
      int intDivision() => x ~/ y;
      double doubleDivision() => x / y;
      
      List<String> get cityNameAsChars => city.split(''); 

      void main() {}
    </script>
  </body>
</html>
{% endraw %}
{% endprettify %}

Building and running the above code displays the following in the browser:

{% prettify dart %}
Using identifiers: var x = 32 and var y = 3
Calling a method: 32 in hex is 20
Calling functions: (x ~/ y) = 10 and (x / y) = 10.67
Using a getter: [B, o, s, t, o, n]
Using string interpolation: city = BOSTON
Using a raw string: $city
{% endprettify %}

The expression interpolation shown in the code above creates a _static_ binding
between a Dart variable and its representation in the UI. When the page loads,
all expressions inside `{{'{{'}} }}` are evaluated. If the evaluated variable's value
changes later on, the UI does not automatically update.

We will look at how we can make the binding between Dart variables and the UI
live in other recipes in this chapter.


### Observing a Dart variable for changes

#### 面对的问题

You want to sync a variable and its display. Every time the variable's value
changes, you want its display to automatically change. You want this to happen
without a page refresh, and without having to do any manual DOM manipulation.

#### 解决的方式

Add an `@observable` declaration right before you define the variable:

{% prettify dart %}
@observable 
var myVar;
{% endprettify %}

Then, put that variable within `{{'{{'}} }}` in the HTML:

{% prettify dart %}
{% raw %}
<li>The value is {{myVar}}</li>
{% endraw %}
{% endprettify %}

This creates a dynamic binding between that variable and its display in the UI.
If the variable's value changes, the UI updates automatically.

#### Example

Imagine you have a collection of movie quotes, and you want to display them on
a web page one by one in slideshow fashion.

Begin by creating a collection of quotes. Then, define a variable to store the
current quote, and make that variable observable:

{% prettify dart %}
class Quote {
  final String quote, saidBy; 
  Quote(this.quote, this.saidBy);
}

List<Quote> quotes = [ ... ];

@observable 
Quote currentQuote;
{% endprettify %}

Wrap the observable variable inside `{{'{{'}} }}` in the UI to get its value:

{% prettify dart %}
{% raw %}
<div><em>{{currentQuote.quote}}</em> - {{currentQuote.saidBy}}</div>
{% endraw %}
{% endprettify %}

Now, cycle through the collection of quotes, picking a new quote every few
seconds:

{% prettify dart %}
var i = 0;
currentQuote = quotes[i];

new Timer.periodic(new Duration(seconds: 2), (_) {
  i = (i == quotes.length - 1) ? 0 : i + 1;
  currentQuote = quotes[i];
});
{% endprettify %}

The quote displayed on the page changes as the observable variable's value
changes. The rest of the page remains the same, and you don't have to modify
the page's markup!

Here is the entire script:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>

<html>
  <body>
    <div><em>{{currentQuote.quote}}</em> - {{currentQuote.saidBy}}</div>
  
    <script type="application/dart">
      
      import 'dart:async';
      import 'package:web_ui/web_ui.dart';
      
      class Quote {
        final String quote, saidBy; 
        Quote(this.quote, this.saidBy);
      }
      
      @observable 
      Quote currentQuote;
        
      void main() {
        List<Quote> quotes = [
          new Quote('This agression will not stand, man.', 'The Dude'),
          new Quote('You are entering a world of pain', 'Walter'),
          new Quote('The rug really tied the room together.', 'The Dude'),
          new Quote('Sometimes you get the bar, sometimes the bar gets you.',
          'The Stranger'),
          new Quote('Mark it zero, dude', 'Walter')
        ];
            
        var i = 0;
        currentQuote = quotes[i];
         
        new Timer.periodic(new Duration(seconds: 2), (_) {
          i = (i == quotes.length - 1) ? 0 : i + 1;
          currentQuote = quotes[i];
        });
      }   
    </script>
  </body>
</html>
{% endraw %}
{% endprettify %}


### Creating a bidirectional binding using text elements

#### 面对的问题

You are using a text field (text input or textarea) to set the value of a Dart
variable. You want that variable to be modified in real time, without a page
refresh.

#### 解决的方式

First, make the variable observable:

{% prettify dart %}
{% raw %}
@observable
var myVar = value;
{% endraw %}
{% endprettify %}

Then, bind a text input or a textarea to that variable. Use 'bind-value='
syntax:

{% prettify dart %}
<input type='text' bind-value='myVar'>
<textarea bind-value='myVar'></textarea>
{% endprettify %}

This creates a bidirectional binding: changing the variable's value updates 
the UI, and changing the UI updates the variable's value.

#### Example

You've started micro-blogging. You have a webpage where you display one of your
posts, along with a simple textarea to edit that post. You're restricting
yourself to 140 characters, and want the UI to tell you how many characters
you have remaining when you type.

To enable real-time editing of a post, make the post variable observable:

{% prettify dart %}
@observable
var post = 'This is my very first post about Dart, and the' + 
           ' only thing I have to say is ...it is awesome!!!';
{% endprettify %}

Use `{{'{{'}} }}` syntax for displaying the post and its length:

{% prettify dart %}
{% raw %}
<p>{{post}}</p>
<p><em>Post Length:</em>  {{post.length}}</p>
{% endraw %}
{% endprettify %}

Then, create the binding in the textarea for editing the post, along with a
tracker that tells you how many characters you have remaining:

{% prettify dart %}
{% raw %}
<textarea rows='4' cols='40' bind-value="post"></textarea>
<p><em>Chars remaining:</em> {{MAXLENGTH - post.length}}</p> 
{% endraw %}
{% endprettify %}

That's it, you're done!

By sprinkling a few declarative statements in your code, you get to enjoy all
the functionality that bidirectional binding gives you:

* You need to do nothing to make the textarea sticky: it automatically contains
the post text.
* Modifying the post in the textarea changes the post object in real
time. There is no DOM manipulation required.
* By observing the post object, you get to observe its attributes (in this
case, the `length` property) for free.

Here is the entire script:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>

<html>
<body>
  <h3>Post</h3>
  <p>{{post}}</p>
  <p><em>Post Length:</em>  {{post.length}}</p>

  <p>
    <em>Edit Post:</em><br>
    <textarea rows='4' cols='40' bind-value="post"></textarea>
  </p>
  <p><em>Chars remaining:</em> {{MAXLENGTH - post.length}}</p>

  <script type="application/dart">
    import 'package:web_ui/web_ui.dart';

    @observable
    var post = 'This is my very first post about Dart, and the' + 
               ' only thing I have to say is ...it is awesome!!!';
    const num MAXLENGTH = 140;

    main() {}

  </script>
</body>
</html>
{% endraw %}
{% endprettify %}


### Creating a binding using radio buttons

#### 面对的问题

You want to use radio buttons to allow a user to select a single value from a
set of choices. You want to bind the value of the selected radio button to a
Dart variable.

#### 解决的方式

First, make the Dart variable used to store the value of the radio button
observable:

{% prettify dart %}
@observable
var myVar = '';
{% endprettify %}

Then, use 'bind-value=' syntax to bind the value of a radio button to that
variable:

{% prettify dart %}
<input type='radio' name='someName' value='someValue' bind-value='myVar' />
{% endprettify %}

As the user selects a button, its value is automatically stored in the
observable variable. The display of the observable variable is updated as its
value changes if it is placed within `{{'{{'}} }}` in the HTML.

To bind multiple radio buttons to the same variable, assign the same value to
each radio button's name attribute. See the example below.

#### Example

Here is a simple example of how you can create a bidirectional binding when
using radio buttons. Giving the observable variable a value selects the
radio button with that value:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>

<html>
  <body>
    <div>
      <input type='radio' name='veggies' value='kale' bind-value='veg'>
        Kale<br>
      <input type='radio' name='veggies' value='spinach' bind-value='veg'>
        Spinach<br>
      <input type='radio' name='veggies' value='carrots' bind-value='veg'>
        Carrots
    </div>
    
    <p>veg = {{veg}}</p>
     
    <script type='application/dart'>
      
      import 'package:web_ui/web_ui.dart';

      @observable
      String veg = 'spinach'; // Sets an initial value. Button with 
                              // value == 'spinach' is auto-selected.

      void main() {}
      
    </script>
  </body>
</html>
{% endraw %}
{% endprettify %}


### Creating bindings for booleans using checkboxes

#### 面对的问题

You want to use a checkbox to store the value of a boolean object. And because
you have parts of your UI dependent on that boolean object, you want its value
to update automatically as a user checks or unchecks the checkbox.

#### 解决的方式

Make the boolean observable:

{% prettify dart %}
@observable
bool someBool = false;
{% endprettify %}

Bind the checkbox to a boolean using `bind-checked=` syntax:

{% prettify dart %}
<input type='checkbox' bind-checked='someBool'>
{% endprettify %}

Checking the checkbox sets the boolean value to true, and unchecking it sets
the value to false:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>
<html>
  <body>
    <input type='checkbox' bind-checked='someBool'>Check or uncheck<br>

    <p>The checkbox is {{someBool ? 'checked' : 'unchecked'}}</p>
 
 
    <script type='application/dart'>
      import 'package:web_ui/web_ui.dart';
       
      @observable
      bool someBool = true;
      
      void main() {}
   
    </script>
    <script src='packages/browser/dart.js'></script>
  </body>
</html>
{% endraw %}
{% endprettify %}


#### Example

The code below demonstrates the use of checkboxes to toggle the boolean
attributes of an object:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>
<html>
  <head>
    <style>
      th, td {border: 1px solid black; padding: 20px}  
    </style>
  </head>
  <body>
    <div>
      Edit record for student <em>{{student.studentId}}:</em><br>
      <input type='checkbox' bind-checked='student.isGraduating' />
          Graduating?<br>
      <input type='checkbox' bind-checked='student.isHonorStudent' />
          Honor Student?<br>
    </div> 
    
    <br>
    
    <table>
      <tr><th>Student Id</th><th>Graduating?</th><th>Honor Student?</th></tr>
      <tr>
        <td>{{student.studentId}}</td>
        <td>{{student.isGraduating ?   'Yes' : 'No'}}</td>
        <td>{{student.isHonorStudent ? 'Yes' : 'No'}}</td>
      </tr>
    </table>  
    
    <script type='application/dart'>
      import 'package:web_ui/web_ui.dart';

      class Student {
        final String studentId;
        
        @observable
        bool isGraduating;
        
        @observable
        bool isHonorStudent;
        
        Student(this.studentId, this.isGraduating, this.isHonorStudent);
      }
      
      Student student;
      
      void main() {
        student = new Student('12345678', false, true);
      }
      
    </script>

    <script src='packages/browser/dart.js'></script>
  </body>
</html>
{% endraw %}
{% endprettify %}

Note that we mark the boolean instance variables of the `Student` class as
@observable:

{% prettify dart %}
{% raw %}
class Student {
  final String studentId;
  
  @observable
  bool isGraduating;
  
  @observable
  bool isHonorStudent;
  
  Student(this.studentId, this.isGraduating, this.isHonorStudent);
}
{% endraw %}
{% endprettify %}

This creates a one-way binding between the values stored within the observable
attributes of any `Student` object and the UI:

{% prettify dart %}
{% raw %}
<td>{{student.isGraduating ?   'Yes' : 'No'}}</td>
<td>{{student.isHonorStudent ? 'Yes' : 'No'}}</td>
{% endraw %}
{% endprettify %}

We make the binding bidirectional using `bind-checked=` syntax. This allows us
to modify the observable instance variables using the bound checkboxes:

{% prettify dart %}
{% raw %}
Edit record for student <em>{{student.studentId}}:</em><br>
<input type='checkbox' bind-checked='student.isGraduating' />
    Graduating?<br>
<input type='checkbox' bind-checked='student.isHonorStudent' />
    Honor Student?<br>
{% endraw %}
{% endprettify %}

Note that setting one of the instance variables to `true` automatically checks
the corresponding checkbox when the page loads:

{% prettify dart %}
new Student('12345678', false, true);
{% endprettify %}


### Selecting multiple items from a list of checkboxes using data binding

#### 面对的问题

You want to use checkboxes to allow a user to select multiple values from a
set of choices. You want to keep track of the checkboxes that are checked
by the user, and want live updates in the UI every time the user checks or
unchecks a checkbox.

#### 解决的方式

Create a map to keep track of the checked state of the checkboxes. Make the
checkbox values the map keys, and assign each key a boolean value. Assign `true`
for a checked checkbox, and `false` for an unchecked one. 

Now, sync the checkboxes and the map by creating a bidirectional binding
between them.

First, make the map observable. You can do this by using the top-level
`toObservable()` function:

{% prettify dart %}
Map<String, bool> myMap = toObservable({'value1': true, 'value2': false});
{% endprettify %}

Then, bind each checkbox to the corresponding map key using `bind-checked=`
syntax:

{% prettify dart %}
{% raw %}
<input type='checkbox' bind-checked='myMap["value1"]'>{{value1}}
<input type='checkbox' bind-checked='myMap["value2"]'>{{value2}}
{% endraw %}
{% endprettify %}

When the page loads, checkboxes corresponding to map keys with `true` values
are checked.  As the user checks and unchecks checkboxes, the map values update
accordingly.

To know which checkboxes were checked by the user, select the map keys with
`true` values.

#### Example

Here is a short example that you can build and run:

{% prettify dart %}
{% raw %}
<!DOCTYPE html>
<html>
  <body>
    Pick your favorite colors:<br>

    <template repeat ='key in colors.keys'>
      <input type='checkbox' bind-checked='colors[key]'>{{key}}<br>
    </template>

    <template if='!selectedColors.isEmpty'>
      <br>
      You picked:
      <ul>
        <li template repeat='color in selectedColors'>{{color}}</li>
      </ul>
    </template> 
 
    <script type='application/dart'>
      import 'package:web_ui/web_ui.dart';
       
      final Map<String, bool> colors = toObservable(
        {'red': false, 'blue': false, 'green': false}
      );
      
      List<String> get selectedColors {
        return colors.keys.where((c) => colors[c]).toList();
      }
      
      void main() {}
   
    </script>
    <script src='packages/browser/dart.js'></script>
  </body>
</html>
{% endraw %}
{% endprettify %}

We bind the checkbox values to a map as described earlier in this recipes. We
implement a getter to keep track of the checked values. 

Note that getters and setters do not have to be marked as observable: you just
need to make sure that all fields they depend on are observable. In our example,
the `selectedColors` getter relies only on the `colors` map. Since we have
made `colors` observable, `selectedColors` executes when the values in
`colors` change. As a result, the parts of the UI responsible for displaying
the values of the checked checkboxes gets updated in real time:

{% prettify dart %}
{% raw %}
<ul>
  <li template repeat='color in selectedColors'>{{color}}</li>
</ul>
{% endraw %}
{% endprettify %}

{::options parse_block_html="true" /}
</div> <!-- End of "col-md-7" -->
</div> <!-- End of "row" -->
{::options parse_block_html="false" /}  
