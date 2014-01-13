---
layout: default
title: "Dart 教程"
description: "Dart 教程 &mdash; 创建优秀 web 应用指南"
has-permalinks: true
rel:
  author:
    - mary-campione
    - rain
tutorial:
  id: tut-home
next: get-started/
next-title: "开始"
---

{% capture content %}

<img class="scale-img-max" src="images/banner.png">

**Dart 教程**告诉你如何用 Dart 语言、工具和
 API 创建 web 应用。

<strong>前提条件</strong>
<ul>
<li> 你已经知道如何编写结构化程序语言，例如 C 或者 Java。</li>
<li> 你熟悉面向对象编程概念。</li>
<li> 你可以不了解如何通过
     DOM (Document Object Model)来实现浏览器编程。</li>
</ul>

<strong>出发吧！</strong> 你可以按照从左到右的顺序
逐步学习本教程，也可以直接选择你需要的部分。

<div class="tute-tabs">
<div class="tabbable">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#basics" data-toggle="tab">开始</a></li>
    <li><a href="#dom" data-toggle="tab">浏览器</a></li>
    <li><a href="#packages" data-toggle="tab">Packages</a></li>
    <li><a href="#polymer" data-toggle="tab">Polymer</a></li>
    <li><a href="#futures" data-toggle="tab">Async</a></li>
    <li><a href="#forms" data-toggle="tab">表单和数据</a></li>
    <li><a href="#commandline" data-toggle="tab">独立应用</a></li>
    <!--<li><a href="#mobile" data-toggle="tab">移动浏览器</a></li>-->
  </ul>

  <div class="tab-content">

  <!-- BASICS TAB -->
    <div class="tab-pane active" id="basics">

              下载软件并且看看里面包含那些工具
              和类库。
              并运行如下两个示例程序。

      <div class="row">

        <!-- Getting Started -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="get-started/"><img src="images/target.png" height="20" width="20">&nbsp;开始</a></h4>
            <p>下载 Dart。运行两个示例应用。
            </p>
          <img src="images/clickme-screenshot.png" width="300">
          </section>
        </div>
        <div class="col-md-6">
          <section>
            <h4 class="no-permalink">下载示例代码</h4>
                            在继续下一步之前，
                            先下载该教程中的所有示例代码。
            <ol>
              <li><a href="https://github.com/dart-lang/dart-tutorials-samples/archive/master.zip">
                    下载示例代码 ZIP 压缩包。
                  </a>
              </li>
              <li>
                                  解压。
              </li>
              <li>
                在 Dart 编辑器中打开 dart-tutorials-samples 目录。
              </li>
              <li>
                找到下一个教程
                <a href="/docs/tutorials/connect-dart-html">
                  连接 Dart 和 HTML。
                </a>.
              </li>
            </ol>
            </a>
          </section>
        </div>

      </div> <!-- end row -->
    </div> <!-- end Getting Started tab -->

  <!-- DOM TAB -->
    <div class="tab-pane" id="dom">

      网页用 HTML 编程并且在浏览器中显示为一个
      被称为 DOM(Document Object Model) 
      的树形结构。
      Dart 应用可以通过代码修改 DOM，
      这样可以动态的修改网页内容。
      首先，学习如何把 Dart 和 HTML 串联起来。
      然后再学习如何 添加、移动和删除 DOM 元素。

      <div class="row">
        <!-- Connect Dart & HTML -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="connect-dart-html/"><img src="images/target.png" height="20" width="20">&nbsp;连接 Dart 和 HTML</a></h4>
            <p>在 HTML 页面中添加一个 Dart 脚本标签。
            </p>
          <img src="images/miniapp-screenshot.png" width="300">
          </section>
        </div>

        <!-- Add Elements -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="add-elements/"><img src="images/target.png" height="20" width="20">&nbsp;在 DOM 中添加元素</a></h4>
          <p>在网页中添加和移动元素。</p>
          <img src="images/todo-screenshot.png" width="300">
          </section>
        </div>

      </div>


      <div class="row">
        <!-- Remove Elements -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="remove-elements/"><img src="images/target.png" height="20" width="20">&nbsp;删除 DOM 元素</a></h4>
          <p>从网页中删除元素。</p>
          <img src="images/todo-with-delete-screenshot.png" width="300">
          </section>
        </div>
        <div class="col-md-6">
        </div>

      </div> <!-- end row -->
    </div> <!-- end DOM tab -->

  <!-- PACKAGES TAB -->
    <div class="tab-pane" id="packages">

      Dart 开发者一直忙于创建代码库来帮助你提高生产率。
      利用这些代码库或者把你的代码共享给其他人使用。

      <div class="row">

        <!-- Packages -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="shared-pkgs/"><img src="images/target.png" height="20" width="20">&nbsp;安装共享代码</a></h4>
          <p>在 <a href="http://pub.dartlang.org/">pub.dartlang.org</a>分享和组织代码。</p>
          <img src="images/add-packages-screenshot.png" width="300">
          </section>
        </div>
        <div class="col-md-6">

        </div>
      </div>
    </div> <!-- end Packages tab -->

  <!-- POLYMER TAB -->
    <div class="tab-pane" id="polymer">
      <div class="row">

        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="polymer-intro/"><img src="images/target.png" height="20" width="20">&nbsp;Define a Custom Element</a></h4>
          <p>使用 Polymer 创建自定义的 HTML 元素。</p>
          <img src="images/stopwatch-screenshot.png" width="200">
          </section>
        </div>

        <div class="col-md-6">
        </div>

      </div>
    </div>

  <!-- FUTURES & STREAMS TAB -->
    <div class="tab-pane" id="futures">
      <div class="row">

        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="futures/"><img src="images/target.png" height="20" width="20">&nbsp;Use Future-Based APIs</a></h4>
          <p>了解下 Future。</p>
          <img src="futures/images/futurescode.png" width="350">
          </section>
        </div>

          <section>
          <h4 class="no-permalink"><a href="streams/"><img src="images/target.png" height="20" width="20">&nbsp;Use Streams for Data</a></h4>
          <p>用 streams 来管理数据序列</p>
          <img src="images/streams-code.png">
          </section>
        <div class="col-md-6">
        </div>

      </div>
    </div>

  <!-- FORMS TAB -->
    <div class="tab-pane" id="forms">

      在 Dart 库中有很多类可以帮助你 获取、发送、接
      收和保存用户数据。
      你可以在 form 中用 input 元素来收集用户数据。
      你可以用 JSON 来格式化数据，并用 HttpRequest来发送和接收数据。
      最后，你可以用 IndexedDB 在客户端保存数据。

      <div class="row">

        <!-- Fetch Data -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="fetchdata/"><img src="images/target.png" height="20" width="20">&nbsp;动态获取数据</a></h4>
          <p>从静态文件或者服务器获取数据。</p>
          <img src="images/allaboutyou-screenshot.png" width="300">
          </section>
        </div>

        <!-- Forms -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="forms/"><img src="images/target.png" height="20" width="20">&nbsp;从表单中收集数据</a></h4>
          <p>使用 form 和 input 元素来收集数据。</p>
          <img src="images/slambook-screenshot.png" width="300">
          </section>
        </div>
      </div> <!-- end row -->

      <div class="row">
        <!-- IndexedDB -->
        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="indexeddb/"><img src="images/target.png" height="20" width="20">&nbsp;使用 IndexedDB</a></h4>
          <p>用 IndexedDB 在客户端保存数据。</p>
          <img src="images/countdown-screenshot.png" width="300">
          </section>
        </div>
        <div class="col-md-6">
        </div>
      </div> <!-- end row -->
    </div> <!-- end FORMS tab -->

    <!-- COMMAND-LINE APPS TAB -->
    <div class="tab-pane" id="commandline">
      <div class="row">

        <div class="col-md-6">
          <section>
          <h4 class="no-permalink"><a href="cmdline/"><img src="images/target.png" height="20" width="20">&nbsp;编写命令行应用</a></h4>
          <p>学习命令了应用的特性。</p>
          <img src="cmdline/images/sourceforhomepage.png">
          </section>
        </div>

        <div class="col-md-6">
        </div>

      </div>
    </div>
 
  <!-- MOBILE TAB -->
  <!--
    <div class="tab-pane" id="mobile">
      <div class="row">

        <div class="col-md-6" style="border-right:1px solid Lavender">
          <section>
          <h4 class="no-permalink"><a href="mobile/"><img src="images/target.png" height="20" width="20">&nbsp;适应移动设备</a></h4>
          <p>移动设备已经占领世界了！</p>
          <img src="images/countdown-screenshot.png" width="300">
          </section>
        </div>

        <div class="col-md-6">
        </div>

      </div>
    </div>
  -->

  </div> <!-- end tab content-->
</div> <!--end tabbable -->
</div> <!-- end of tute-tabs -->

{% endcapture %}

{% include tutorial_main_page.html %}
