<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Product" xmlns:wb="http://open.weibo.com/wb">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <title>Frequently Asked Questions (FAQ) | Dart: 用于创建结构化的web应用</title>
  <meta property="wb:webmaster" content="a984f6440858ee44" />
  <meta property="twitter:account_id" content="376585411" />
  <meta itemprop="name" content="Frequently Asked Questions (FAQ) | Dart: 用于创建结构化的web应用">
  
  <meta itemprop="image" content="https://www.dartlang.org/imgs/dart-logo-wordmark-1200w.png">
  
  <meta itemprop="description" content="You have questions about Dart, we have answers.">


  <link rel='stylesheet' type='text/css' href='/css/bootstrap.min.css'>
<link rel='stylesheet' type='text/css' href='/css/dart-style.css'>
<link rel='stylesheet' type='text/css' href='/css/prettify.css'>
<link rel='stylesheet' type='text/css' href='/css/font-awesome.min.css'>

  
    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700|Roboto:300,400" rel="stylesheet">

	
	<link rel="author" href="/authors/eli-brandt.html">
	
	<link rel="alternate" type="application/atom+xml" href="http://dartnews.sinaapp.com/?feed=atom" title="Atom feed">
  <!-- 
  <link href="https://plus.google.com/109866369054280216564" rel="publisher">
  -->
  <link href="http://weibo.com/cndart" rel="publisher">

  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
  <![endif]-->

  <!-- 
<script type="text/javascript">

  //var _gaq = _gaq || [];
 // _gaq.push(['_setAccount', 'UA-26406144-4']);
  //_gaq.push(['_setDomainName', 'dartlang.org']);
  //_gaq.push(['_setSiteSpeedSampleRate', 50]);
  //_gaq.push(['_trackPageview']);

 // (function() {
   // var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
   // ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
   // var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 // })();

</script>
-->


  <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
</head>
<body onload="prettyPrint()">
    <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/"><i class="sprite-icon-dart-logo"></i></a>
        </div>

        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
           <li class="dropdown">
              <a href="/codelabs/darrrt/" title="Learn Dart in this short code lab.">
                                                       入门
              </a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                文档 <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <i class="sprite-icon-dd-tip"></i>
                <li><a href="/docs/tutorials/">教程</a></li>
                
                <i class="sprite-icon-dd-tip"></i>
                <li><a href="/dart-by-example/">Dart 示例</a></li>
                
                <li class="divider"></li>
                <li><a href="/docs/">开发者指南</a></li>
                <li><a href="http://api.dartlang.org">API 参考</a></li>
                <li><a href="/docs/spec/">语言规范</a></li>

                <li class="divider"></li>
                <li><a href="/docs/dart-up-and-running/">Dart: Up and Running</a></li>
                <li><a href="/books/">更多图书</a></li>

                <li class="divider"></li>
                <li><a href="/articles/">文章</a></li>
                <li><a href="/support/faq.html">FAQ</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                       工具  <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <i class="sprite-icon-dd-tip"></i>
                <li><a href="/tools/download.html">下载 Dart</a></li>
                <li class="divider"></li>
                </li><li><a href="/tools/editor/">Dart Editor</a></li>
                <li><a href="http://pub.dartlang.cc/">Pub 包管理器</a></li>
                <li><a href="/docs/dart-up-and-running/contents/ch04-tools-dart2js.html">dart2js</a>
                <li><a href="/tools/faq.html">工具 FAQ</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                     资源  <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
                <i class="sprite-icon-dd-tip"></i>
                <li><a href="/samples/">示例代码</a></li>
                <li><a href="/docs/synonyms/">和其他语言的相同点</a></li>
                <li><a href="/performance/">性能</a></li>

                <li class="divider"></li>
                <li><a href="/slides/">演示文稿</a></li>
                <li><a href="/dart-tips/">Dart 短视频</a></li>

                <li class="divider"></li>
                <li><a href="/community/who-uses-dart.html">谁在使用 Dart</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="/support/" title="Community and Support">
                                              支持
              </a>
            </li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li>
              <form class="navbar-search" action="/search.html" id="cse-search-box">
                <input type="hidden" name="cx" value="011220921317074318178:i4mscbaxtru">
                <input type="hidden" name="ie" value="UTF-8">
                <input type="hidden" name="hl" value="en">
                <input type="search" name="q" class="search-query placeholder-position-fix form-control" id="q" autocomplete="off" placeholder="Search">
              </form>
            </li>
            <li><a target="_blank" href="https://twitter.com/dart_lang" class="btn"><i class="sprite-icon-social-twitter"></i></a></li>
            <li><a target="_blank" href="https://plus.google.com/+dartlang/posts" class="btn"><i class="sprite-icon-social-gplus"></i></a></li>
            <li><a target="_blank" href="http://weibo.com/cndart" class="btn"><i class="sprite-icon-social-weibo"><img src="/imgs/weibo.png"></i></a></li>
          </ul>
        </div><!-- /.nav-collapse -->

      </div><!-- /.container -->
    </div><!-- /.navbar -->

  


<div class="container-page">
  <div class="container">
    <div class="container col-md-10 col-md-offset-1 sub-page">
      <div class="has-permalinks">
      {::options parse_block_html="true" /}
<div class="col-md-3">
<div class="bs-sidebar hidden-print affix-top" role="complementary">
{::options parse_block_html="false" /}	

1. ToC
{:toc .toc .nav .bs-sidenav}

{::options parse_block_html="true" /}
</div>
</div>
<div class="col-md-7"> <!-- Start of content -->
{::options parse_block_html="false" /}	


# Frequently Asked Questions (FAQ)

_2013 12月更新_

本页面收集了自从 Dart 开源以来社区中最常问的问题。
详细信息请访问
[Dart 语言概览][lang] 和 [Dart 库概览][libs]。

## Motivation（动机）

### Q. Why Dart（为何创建 Dart）?

在谷歌我们已经写出了很多优秀的WEB应用程序，
我们通过各种方法努力改进其开发过程，但不尽如人意，我们发现缺少引入一门新的语言。
现在时机到了。我们设计 Dart 是为了编写用于需要高的运行表现及适合最新应用开发的开发工具更容易。

### Q. Dart语言能否弥补目前 WEB 开发不足？

我们希望能够弥补所有的不足[fixallthethings]。这就是 Dart 语言以及 Dart 整个项目的目标。
Dart 项目认为WEB开发语言应该有所改变，但是同时我们也希望能够提升 DOM [improvethedom]
和其他的类库以及改善目前我们正在使用的开发工具。

同时，谷歌也认为 JavaScript 能进一步被改进，并且积极的投入到这份工作中来。
谷歌希望 WEB 开发变得更棒，如果这是由 JavaScript 带来的，我们同样会非常高兴。

### Q. Dart 会转移那些以 JavaScript 为基础的WEB开发团体的工作么？

如果人们喜欢 Dart 并且使用它，从某一方面来看，是的，但是任何一种对现有 WEB 开发的改进不都是这样么？
完全重新开始或者100%兼容都不可取，所以人们一般旧的和新的一起用。你可以这样看：谷歌重在做有意义的尝试无论是基于 Dart 
还是 JavaScript，选择发展中的 Dart同时继续广泛的使用 JavaScript 及其工具，实现，并且发展语言。
我们同时都在做，因为我们认为 Dart 值得这么做。

有很多语言用于 WEB 服务器开发：Python 转移了 Perl 的工作么， Java 取代了 C++ 么？
再次，从某一方面来看，是的，但是人们通常考虑健康的环境，多语言好于我们只使用单门语言开发，
多语言允许快速转换，这已经通过一种标准的过程取得了效果。此外，每种语言都有其自己的存在价值：Groovy 
亦不是与 C++直接竞争。人们面对不同工程权衡，选择不同的语言来应对。最后，我们希望客户端开发者们也可以有这种灵活性。

### Q. 谷歌打算把 Dart 语言交给标准团体控制么？

是的，我们希望那样。一旦 Dart 语言发展到一定程度并且被大众接受，我们期待标准化过程将作为下一步目标。

### Q. 在此之前，你们将怎样推进 Dart 的发展？

我们计划像控制 V8 项目那样控制 Dart。我们将聆听反馈和问题，
并且我们将检查外界 Dart 贡献者的修改。 
一个有着很好痕迹记录的贡献者将会为 Dart 仓库提交确认。
谷歌工程师也将会在公共仓库中工作，进行可见的修改。

### Q. 谷歌为什么不一开始就将 Dart 作为一个开放标准公布？

我们通过一般途径取得开放标准的程序语言：某人创建一个清晰的初版，
人们尝试它，然后我们使其标准化。开放标准 WEB 平台以这种方式整合小的改进，
经其他人的尝试后标准化就实现了：canvas就是一个例子。我们知道这种方式增加了大众参与，
但是我们认为这种方式只在某些时候有用，特别的，作为一门编程语言，其由开放团队设计是有风险的。

Haskell是近期成功的被开放社区设计的编程语言，始于1990年。
最广泛使用的是COBOL，从Ada演变而来。这不是一个程序语言设计的普通方式。在目前主要的编程语言中，
只有六个（数字存在争议）是通过这种方式设计的（其中之一是 ALGOL-68)。

### Q. 为什么 Google 不创建一个支持多种语言的字节码虚拟机？

每种方式都有优缺点，
我们认为有必要给 Dart 创建一个专门的 VM，有如下几个原因：

* Google 已经参与了多语言字节码项目：
[LLVM bitcode in PNaCl][pnacl]。

* 如果 Dart 被单语言字节码虚拟机所支持将有很大好处,
 单语言虚拟机将更简单更快，因为它可以专门为该语言进行优化—例如
 ，一个结构化控制流。这些专门的优化使得实现回收器和优化器更加简单。

* 一个通用的字节码虚拟机将会很大很慢，因为它包括了很多假设和额外的功能，这些对Dart都是没用的：例如，多线程共享堆。

* 没有字节码虚拟机是真正通用的；他们都假定给某些种类的语言以特权。
单语言虚拟机有更多的空间来提升性能，并能深入优化。
请详见 Dart 工程师写的关于虚拟机问题的[whynotbytecode]。

### Q. Google 想用 Dart 来替代 JavaScript 吗？

我们认为，开发者在开发 web 程序的时候应该有另外一种选择。
Dart 提供一种选择，并不意味着要替代现有的选择。


## Language（语言）

### Q. Dart 是否很像 JavaScript？

是也不是。
Yes and no.  The Dart project thinks that JavaScript can use some changes for
more productive software engineering, smarter editors and development
environments, and web apps that are as beautiful and pleasing as the best client
apps can be.  On the other hand, we don't think everything needs to change, and
why change what isn't broken?

Dart, like JavaScript, is a dynamically typed language.  It adds optional
type annotations to help you catch errors earlier.  It takes out a
few features of JavaScript, such as prototypes and the global object: this
streamlines the VM, enables faster execution, and makes it easier to do code
completion and refactoring.  And Dart adds some goodies.  To name a few:

* User-defined operator methods.  We like the lightweight, readable code
these give for <a href="/articles/improving-the-dom/">our DOM interface</a>.

* Lightweight syntax for anonymous functions.  You use them a lot in
web programming; now they look great.  And they come with correct
binding of <code>this</code> and full block-level lexical scoping, no gotchas.

Dart is more than a new syntax, it's a full language with its own semantics.
Dart differs from JavaScript in many ways, including:

* Only `true` is true.
* No `undefined`, only `null`.
* No automatic type coercion with `==`, `+`, and other operators.

When compared to JavaScript, Dart aims to be faster, more regular, and more
scalable to large programs.


### Q. Isn't Dart a lot like Java?

Well, Java is statically typed, and Dart is dynamically typed.  Dart has
optional static type annotations, where in Java they are required.  To us these
are big differences in the nature of the two languages.  But Dart is a
curly-brace language, and it shares some keywords with Java, such as
`extends` and `final`, so we can see why people make the
comparison.  Honestly, we like having a straightforward and familiar syntax
that's easy to pick up, even if that means it's less exciting.

A few of the many other [examples of how Dart differs from Java][dartisnotjava]
include:

* The JVM is a bytecode VM, requiring source to be compiled first. The Dart VM
runs source code.

* The Dart language supports collection literals for a terse way to create
lists and maps.

* Java supports public, protected, package protected, and private. Dart supports
public and library-private.

* Dart is purely object oriented. Java has objects and primitives.

* The Dart language has mixins, optional static types, named parameters, and
more.

### Q. How does Dart compare with using the Closure compiler on JavaScript?

The idea of optional type annotations is similar.  Dart's are nicer
syntactically.

Compare the following Closure compiler code:

<pre class="prettyprint lang-dart">// Closure compiler code

/**
 * @param {String} name
 * @return {String}
 */
makeGreeting = function(name) {
  /** @type {String} */
  var greeting = 'hello ' + name;
  return greeting;
}</pre>

With the following Dart code:

<pre class="prettyprint lang-dart">// Dart code

String makeGreeting(String name) {
  String greeting = 'hello $name';
  return greeting;
}</pre>

### Q. How does Dart compare with CoffeeScript?

Both Dart and CoffeeScript are inspired by JavaScript, and both can be
translated back to it.  They make different choices, particularly in the flavor
of their syntax.  As a language we think it's fair to say that Dart differs
semantically from JavaScript more than CoffeeScript does; that may result in a
less line-for-line translation, but we believe Dart-generated JavaScript can
have excellent size and speed.

Dart introduces new semantics, while CoffeeScript retains the semantics
of JavaScript.

If you like CoffeeScript for its more structured feel than raw JavaScript, you
may like Dart's optional static type annotations.

### Q. What does Google think of TypeScript?

TypeScript and Dart have similar goals; they make building large-scale web
applications easier. However, their approaches are fairly different. TypeScript
maintains backwards compatability with JavaScript, whereas Dart purposely made a
break from certain parts of JavaScript’s syntax and semantics in order to
eradicate large classes of bugs and to improve performance. The web has suffered
from too little choice for too long, and we think that both Dart and TypeScript
are pointing to a brighter future for web developers. You can read a
[more complete response][typescript] on our blog.

### Q. How does Dart relate to Go?

Dart and Go are both language projects started at Google, but they are
independent and have different goals.  As a result, they make different choices,
and the languages have very different natures, even while we all try to learn
from each others' work.

### Q. Why isn't Dart more like Haskell / Smalltalk / Python / Scala / other language?

Various reasons, depending on the language being asked about.

For languages that are quite different from JavaScript: it's important for Dart
to compile to efficient JavaScript.  Our experience in GWT is that if the source
language is too different from JavaScript, it creates some cases where complex
output code is needed to emulate the source language's behavior.  This can cause
performance to vary in ways that are not transparent to the programmer.

For languages that are less mainstream: we expect that modeling Dart on these
would, on the whole, hurt our adoption.  Our team includes fans of these
languages, and if we thought Dart could take up our favorite cool language
features and push them to widespread adoption we might be tempted, but really we
think we've got our hands full introducing a new language at all.

For languages that are "more dynamic" than Dart: Dart deliberately trades off
some of this arbitrary runtime modification for the goal of better performance
and tools.

### Q. Why isn't Dart syntax more exciting?

We did throw in some nice syntactic features such as `this.`
constructor args and `=>` for one-line functions,
but we'd agree that Dart chooses familiarity over excitement.
One team member's personal testimonial: "I wish it had a little more razzle
dazzle but I can't deny that literally on my first day of writing Dart code, I
was productive in it."

### Q. Is it really a dynamic language if it doesn't have eval() or adding fields to a value at run time?

Dart as initially released didn't have anything like these, but future versions
of Dart may look at adding dynamic features of this sort.  The feature set
won't match up exactly with the features in your question, but we hope to serve
very much the same purposes.  When we see what gets added, then everyone can
decide how they classify the language.

What's important to us is that what you want to do with a dynamic language, you
can do with Dart and not feel cramped.  You should be able to design your system
without interference from static rules, and to modify the live system during
development and sometimes at run time.

So, for example, Dart isn't likely to support evaluating a string as code in the
current context, but it may support loading that code dynamically into a new
isolate.  Dart isn't likely to support adding fields to a value, but it may
(through a mirror system) support adding fields to a class, and you can
effectively add methods using `noSuchMethod()`.  Using these features
will have a runtime cost; it's important to us to minimize the cost for programs
that don't use them.

This area is still under development, so we welcome your thoughts on what you
need from runtime dynamism.

### Q. Does Dart have reflection capabilities?

We have reflection support from
the <a href="/articles/reflection-with-mirrors/">mirrors API</a>.

### Q. Can Dart add tuples, pattern matching, non-nullable types, partial evaluation, optional semicolons, ...?

The language is now at 1.0, but we anticipate further language evolution
to occur in a standards group.  It might be able to include your feature,
although it can't include everything.  Some features don't fit the basic nature
of the language, and some don't play well with other features.  Simplicity is
the single most important gift we all can give to future programmers.

Please look at the [list of Dart issues][issues] to see if your request is
already there, and add a new issue if not.  Make a thoughtful argument for your
feature.  Sample code with and without your feature is good evidence; a sizeable
codebase that shows the need is even better evidence.

Please don't be surprised if the Dart designers say "no" by default, especially
for now.  It's far more painful to remove a language feature than to add it, so
Dart is likely to add the most obvious features first, and then revisit the next
tier later.  And there simply are more possible language features in the world
that can fit into any single language without making a total hash of it.   But
we do very much appreciate suggestions and evidence.  We hope you'll see our
appreciation through careful design choices and fair communication about them.

## Types

### Q. Does Dart have type inference?

Type inferencing is not something specified by the language specification, but
it is something that implementations are free to do. It's important to remember
that Dart has a dynamic type system, so type inferencing doesn't play the same
role as it does in languages such as Haskell. However, Dart Editor does do some
type inferencing, such as when you use var for local variables.

### Q. Why are type annotations optional?

We want to maintain the feel of a dynamically typed language, which is familiar
to web developers. Mandatory types don't fit with that goal. Experience
has also shown that full statically typed languages are sometimes too rigid,
and we wanted Dart development to be more flexible for a wide range of
developers.

### Q. Why is the type system designed to be unsound?

Rather than using a full, static type system, Dart has a dynamic type system
with optional static type annotations. Our main goals for the types are to
support tooling and documentation. We want to build a pragmatic tool that helps
web programmers without getting in their way.  In particular, we want our static
warnings to be optimistic rather than to complain about dynamically typed code
that may be valid and correctly written, such as "downcast" assignments.
Because Dart _execution_ is always type-safe, we can let some unsound cases
get through the static warnings and be caught at run time instead.

Typical object-oriented languages let you downcast, which also introduces
unsoundness into the type system and may result in a runtime type error.  In
Dart, we choose to allow downcasts without a syntax to mark them.

### Q. But don't you need sound typing information to get high performance?

Sound types can help with performance but aren't essential. What we need are
uniform, simple semantics. Modern VMs can use actual runtime behavior as a
valuable signal for optimizations.

### Q. Why do type annotations have no effect on the runtime behavior?

If type annotations affect the runtime, programs will change their behavior as
programmers add type information, even though the logic remains unchanged. The
normal mode of development is to gradually add types for documentation and
validation, and if that changes what the program does, programmers have no
stable foundation to work on. This is especially true given that types could be
inaccurate.

In addition, this policy helps us and others add additional type-checking tools
that implement different policies without unforeseen interactions with the
runtime.

### Q. Why are generics covariant?

Covariant generics fit a common intuition that programmers have, and very often
this intuition is correct, such as in the common "read-only" use of a generic.
Although this intuition isn't always correct, Dart doesn't need it to be.  Dart
has already chosen optimistic static checking, so why not continue down that
path and allow covariant uses of generics to pass static type checking?

Where covariant generics are too optimistic, Dart's type-safe execution allows
the static warnings to be optimistic without being dangerous.  Although
covariance can be pessimistic too, we think it will be rare that people run into
that, and and there's a simple workaround for any pessimism.

We are familiar with a variety of ways that languages try to mark or infer
variance.  We don't think any of them are suitable for Dart, where we want type
annotations to be optional and unobtrusive: it wouldn't fit to _require_
marking, and we feel that variance inference systems add too much complexity for
their benefit in Dart.

Again, we're trying to be pragmatic, and we think the outcome is reasonable.

## Browsers and compiling to JavaScript

### Q. What browsers do you support as JavaScript compilation targets?

We're currently aiming to support the following browsers:

* Internet Explorer, versions 9 and 10.
* Firefox, latest version.
* Chrome, latest version.
* Safari for desktop, version 6.

### Q. Why doesn't Dart support IE8 or earlier?

Supporting legacy browsers takes a lot
of engineering resources and testing infrastructure.
Dart is a bet for the future, and the project can't push forward if it needs
to spend valuable resources on supporting browsers that are dying or dead.
Also, dart2js can emit efficient code if it assumes a modern browser with
ECMAScript5 or greater features.

### Q. What browsers support the Dart VM now?

As of December 2013, no production browsers can execute Dart code unless it's
first compiled to JavaScript. However, [Dart Editor][editor]
ships with a version of Chromium (called [Dartium]) that has the Dart
VM integrated into it. Dartium not only executes Dart code natively, but it also
has really good interoperability with Dart Editor so that you can debug your
Dart applications directly from within Dart Editor.

### Q. Will the Dart VM get into Chrome?

The Dart team is working on integrating the VM into Chrome. We don't have a
timeline, but you can follow open-source projects such as [Oilpan] and
[Dartium] for a sense of progress. Meanwhile, Dart
is designed to compile to JavaScript to run across the modern web, and the
dart2js compiler is a top priority for the team.

### Q. Why is the code for "Hello, World" so big, compared to the original Dart code, after compilation to JavaScript?

We believe that it's important to create small and efficient JavaScript
from Dart, but most developers don't write "Hello, World" apps. It's all
relative, and with tree shaking (dead code elimination), minification, and
compression, Dart apps can be compiled to JavaScript fairly efficiently.

Kevin Moore [saw improvements][ppwsize] in the size of the generated
JavaScript from his real-world HTML5 game.

The dart2js team strives to generate smaller output, but is more focused on
real-world apps instead of trivial examples.

### Q. How do I debug Dart code after it's been compiled to JavaScript?

dart2js generates [source maps][sourcemaps],
so you can debug Dart code in browsers that don't support the Dart VM.
However, even in rare cases where you must inspect the raw JavaScript, it's
fairly debuggable using the browser's normal JavaScript development tools.

### Q. Will any valid Dart code compile to JavaScript, or are there limitations?

We intend for any valid Dart code to compile to JavaScript.  Of course, there
are some libraries that will only run on the server because they
don't make sense in a browser context. For example, the `dart:io` library
provides access to operating system files and directories with APIs not
available to the browser.

### Q. How can dart2js produce JavaScript that runs faster than handwritten JavaScript?

You are probably referring to these [performance charts][perf]. Think of dart2js
as a real compiler, which can analyze your entire program and make optimizations
that you probably can't or won't do. Just like gcc can output efficient code
by moving code around, dart2js can take advantage of Dart's structured nature
to implement global optimizations.

We don't claim that all Dart code will run faster
than handwritten JavaScript, when compiled to JavaScript. But we're working
to make the common cases fast.

### Q. Why not compile Dart to ASM.js instead of building a specialized VM?

Dart is both about making web developers more productive and making the web
faster.  ASM.js is only about making the web faster.

The subset of JavaScript that ASM.js targets does not match what
dart2js needs. For example:

* dart2js needs to verify the number of arguments match (calling convention).
* dart2js needs to do bounds checks.
* dart2js forbids unsafe accesses to non-existing fields.

The Dart VM can't be ported to ASM.js or emscripten because
the VM emits machine code, which would require a complete x86 emulator for
ASM.js.

## Usage and tools

### Q. Is Dart stable?

Dart is, at the time of this writing, at version 1.0. The core language and
core libraries are considered stable for production use.

### Q. How does Dart code interoperate with JavaScript libraries?

Although Dart and JavaScript are completely separate languages with
separate VMs, they can interoperate. For more information, read the
[article on Dart-JavaScript][jsinterop].

### Q. I have a large JavaScript codebase.  How can I migrate it to Dart?

Try migrating one major feature at a time, and use the
[JavaScript interoperability library][jsinterop]
only when necessary.

### Q. I have a large application written in GWT. How do I port it to Dart?

Java and Dart are syntactically similar, so this might be easier than you think.
You can rely on Dart Editor to flag any syntax problems. Alternatively, you may
consider porting one feature at a time to Dart and using the
[JavaScript interoperability library][jsinterop] as the common middle
ground. Be sure to watch our Google I/O 2012 talk <a
href="http://www.youtube.com/watch?v=EvACKPBo_R8">Migrating Code from GWT to
Dart</a>, but keep in mind that it predates our JavaScript interoperability
library.

### Q. Does Dart support JSON?

Yes.  See the [JSON] converters in the dart:convert library.

### Q. Can Dart run on the server?

Yes.  The dart:io library is aimed at server-side code that runs on the
standalone Dart VM. dart:io uses an asynchronous programming model inspired by
node.js, EventMachine, and Twisted. See
[An Introduction to the dart:io Library][io] to learn more.

### Q. How do I use 3rd party code, or share code?

You can find many packages on [pub.dartlang.org][pub], a service for hosting
packages of Dart code. Use the `pub` command to package your code and upload
to pub.dartlang.org.

### Q. Can I use Angular with Dart?

Yes! [AngularDart][] is a port of Angular to Dart.

### Q. Can I use web components with Dart?

Yes! [Polymer.dart] is a port of polymer to Dart. Polymer is a set of
polyfills and usability enhancements for web components.

### Q. Should I use Angular or polymer?

Both. Or either. It's really up to you. We envision a world where polymer
lets you create and use custom elements. You should be able to use custom
elements in any web app or web app.

### Q. Do I need to use Dart Editor to use Dart?

Nope. You can write Dart code with your favorite editor. Dart Editor is
designed to give new users a smooth onramp to Dart. We expect some developers
to graduate to full-featured IDEs like Eclipse or WebStorm, both of which have
Dart plugins. You can also try Dart plugins for Sublime, VIM, Emacs, and others.

### Q. Can I build an Android app with Dart?

We think that would be pretty cool, but you'd have to ask the Android team.
Both Dart and Android are open source, so maybe the community can make it
happen.

### Q. Can I build a Chrome App with Dart?

You can use the [chrome.dart] libraries, but as of December 2013 you
still need to compile to JavaScript. But otherwise, yes, you can build
a Chrome App with Dart.

### Q. Can I use Dart on App Engine?

We think that would be pretty cool, but you'd have to ask the App Engine team.
Meanwhile, star this bug:
<https://code.google.com/p/googleappengine/issues/detail?id=6092>

### Q. What CPU architectures does the Dart VM support?

The Dart VM works on IA-32, x64, MIPS, and certain kinds of ARM processors
(needs at least version 7 and VFP+SIMD).

### Q. What are some real-world production deployments of Dart?

The [Dart 1.0 announcement][announcement] lists a few, like
internal Google apps, external Google apps,
Mixbook, blossom.io, Soundtrap, Mandrill, and more.
Many more have been released or are in development.

[dartisnotjava]: http://programming.oreilly.com/2013/05/dart-is-not-the-language-you-think-it-is.html
[fixallthethings]: http://hyperboleandahalf.blogspot.com/2010/06/this-is-why-ill-never-be-adult.html
[improvethedom]: /articles/improving-the-dom/
[pnacl]: https://developers.google.com/native-client/overview#distributing-an-application
[whynotbytecode]: /articles/why-not-bytecode/
[typescript]: http://news.dartlang.org/2012/10/the-dart-team-welcomes-typescript.html
[issues]: http://code.google.com/p/dart/issues/list
[jsinterop]: /articles/js-dart-interop/
[editor]: /tools/editor/
[sourcemaps]: http://www.html5rocks.com/en/tutorials/developertools/sourcemaps/
[io]: /articles/io/
[pub]: http://pub.dartlang.org
[AngularDart]: http://pub.dartlang.org/packages/angular
[Polymer.dart]: /polymer-dart/
[ppwsize]: http://work.j832.com/2012/11/excited-to-see-dart2js-minified-output.html
[perf]: https://www.dartlang.org/performance/
[chrome.dart]: https://github.com/dart-gde/chrome.dart
[announcement]: http://blog.chromium.org/2013/11/dart-10-stable-sdk-for-structured-web.html
[lang]: https://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html
[libs]: https://www.dartlang.org/docs/dart-up-and-running/contents/ch03.html
[Oilpan]: https://groups.google.com/a/chromium.org/forum/#!msg/blink-dev/V1vJmirHUGE
[Dartium]: https://www.dartlang.org/tools/dartium/
[JSON]: http://api.dartlang.org/docs/channels/stable/latest/dart_convert.html#JSON
      </div>
    </div>
  </div>
</div>

  <footer class="footer container-full">
    <div class="container">
      <div class="row">
        <div class="col-md-5">
          <h3>一种用于创建可扩展 web 应用程序的语言、工具和代码库</h3>
          <p>Dart 是一个 <a href="https://code.google.com/p/dart/">开源项目</a>，由  Google 和其他人员参与。</p>
          <p class="sm">除非注明，该页面内容使用 the Creative Commons Attribution 3.0 License 发布，示例代码使用  BSD License 发布。</p>
          <!-- 
          <p><a class="saelogo" href="http://sae.sina.com.cn/activity/invite/15649/weibo" target="_blank"><img src="http://static.sae.sina.com.cn/image/poweredby/poweredby.png" title="Powered by Sina App Engine"></a></p>     	
          -->
        </div>
        <div class="col-md-2 col-md-offset-1">
          <h4>受欢迎的文章</h4>
          <ul>
            <li><a href="/polymer-dart/?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">Polymer.dart</a></li>
            <li><a href="/performance/">性能</a></li>
            <li><a href="/docs/dart-up-and-running/contents/ch02.html?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">语言概览</a> &amp;
            <a href="/docs/dart-up-and-running/contents/ch03.html?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">代码库概览</a></li>
            <li><a href="/samples/?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">示例代码</a></li>
            <li><a href="/docs/tutorials/?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">教程</a> &amp;
                <a href="/codelabs/darrrt/?utm_source=site&amp;utm_medium=footer&amp;utm_campaign=homepage">代码实验室</a></li>
          </ul>
        </div>
        <div class="col-md-2">
          <h4>资源</h4>
          <ul>
            <li><a href="http://pub.dartlang.org/">Pub packages</a></li>
            <li><a href="/docs/synonyms/">和其他语言的相同点</a></li>
            <li><a href="http://code.google.com/p/dart/issues/list">Dart bugs and feature requests</a></li>
          </ul>
        </div>
        <div class="col-md-2">
          <h4>社区</h4>
          <ul>
            <li><a href="/support/">邮件列表</a></li>
            <li><a href="http://forum.dartlang.cc">中文社区</a></li>
            <li><a href="http://weibo.com/cndart">中文微博</a></li>
            <li><a href="https://plus.google.com/communities/114566943291919232850">G+ 社区</a></li>
            <li><a href="https://plus.google.com/+dartlang/posts">G+ 新闻发布频道</a></li>
            <li><a href="http://stackoverflow.com/questions/tagged/dart">Stack Overflow</a></li>
          </ul>
        </div>
      </div>
    </div>
  </footer> <!-- End footer -->

<script type='text/javascript' src='/js/jquery.js'></script>
<script type='text/javascript' src='/js/bootstrap.min.js'></script>
<script type='text/javascript' src='/js/prettify.js'></script>
<script type='text/javascript' src='/js/lang-dart.js'></script>
<script type='text/javascript' src='/js/lang-yaml.js'></script>
<script type='text/javascript' src='/js/scripts.js'></script>




<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F76b2695e71e6cec6e6af036d76afa367' type='text/javascript'%3E%3C/script%3E"));
</script>

<!-- Baidu Button BEGIN -->
<script type="text/javascript" id="bdshare_js" data="type=slide&amp;img=1&amp;pos=left&amp;uid=590574" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
var bds_config={"bdTop":367};
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
</script>
<!-- Baidu Button END -->
</body>
</html>

