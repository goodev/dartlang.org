---
layout: default
title: "Dart 小技巧： 通过短视频介绍 Dart"
description: "介绍 Dart 语言和库的超级短视频"
---

{% injectdata tips dart-tips/episodes.yaml %}

# Dart 小技巧： 通过短视频介绍 Dart

有时候，你只有五分钟可用时间。通过观看超级短视频
来学习 Dart 语言和库。

{% for episode in page.tips.episodes %}

{% capture link %}dart-tips-ep-{{episode.num}}.html{% endcapture %}

<div class="row" style="margin-bottom:1em">
  <div class="col-md-2">
    <a href="{{ link }}"><img style="margin-top:25px; box-shadow: 5px 5px 10px #CCC; width:100%" src="{{episode.thumbnail}}"></a>
  </div>
  <div class="col-md-10">
    <h3><a href="{{ link }}">第{{ episode.num }}集： {{ episode.subtitle }}</a></h3>
    
    <p>{{ episode.description }}</p>

    <p>{{ episode.pubdate }}</p>
  </div>
</div>

{% endfor %}

<a href="http://marakana.com"><img src="imgs/marakana-logo.png" alt="Marakana Logo"></a>

非常感谢 [Marakana](http://www.marakana.com) 制作
了该系列视频。