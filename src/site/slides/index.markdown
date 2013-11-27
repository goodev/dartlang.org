---
layout: default
title: "视频、演讲和幻灯片"
description: "观看 Dart 语言和工具演讲的视频和幻灯片。"
js:
- url: /js/slides-analytics.js
  defer: true
snippet_img: imgs/dart-today-and-beyond.jpg
---

# Dart 演讲

观看 Dart 语言演讲视频和幻灯片。
你还可以观看五分钟 [ Dart 技巧视频](/dart-tips/)。

{% injectdata presos slides/presentations.yaml %}


<!-- XXXX don't set width/height on images, just use 640x360 -->

{% for preso in page.presos %}

<!-- create a row for every three presos -->
{% cycle '<div class="row">', '', '' %}

<div class="presentation col-md-4" id="{{ preso.short }}">
  <div class="thumbnail">
    <img class="screenshot" src="imgs/{{ preso.short }}.jpg">
    <div class="caption">
      <h4 class="title">{{ preso.title }}</h4>
      <p>
        作者： {{ preso.presenters | array_to_sentence_string }}<br>
        来源： {{ preso.event }}, {{ preso.date }}
      </p>
      <p class="buttons">
        {% if preso.video %}
        <a href="{{ preso.video }}" target="_blank" class="btn btn-primary"><i class="glyphicon glyphicon-film"> </i> 观看</a>
        {% endif %}
        {% if preso.slides %}
        <a href="{{ preso.slides }}" target="_blank" class="btn btn-primary"><i class="glyphicon glyphicon-picture"> </i> 幻灯片</a>
        {% endif %}
        {% if preso.ovideo %}
        <a href="{{ preso.ovideo }}" target="_blank" class="btn btn-primary"><i class="glyphicon glyphicon-film"> </i> 来源</a>
        {% endif %}
      </p>
    </div>
  </div>
</div>

{% cycle '', '', '</div>' %}
{% endfor %}


