---
layout: default
title: Dart 相关图书
description: 下面是关于 Dart 图书的整理。
---

# Dart 相关图书

下面是关于 Dart 图书的集合。
如果你发现新的图书，[请告诉我们](http://dartbug.com/new) 。

{% injectdata books books/books.yaml %}

{% for book in page.books %}
<div class="book row">
  <div class="col-md-3">
    <a href="{{ book.link }}" class="btn"><img src="covers/{{ book.cover }}" class="cover"></a>
  </div>
  <div class="col-md-9">
    <h3 class="title"><a href="{{ book.link }}">{{ book.title }}</a></h3>
    <h4 class="authors">作者： {{ book.authors || array_to_sentence_string }}</h4>
    <p>{{ book.desc }}</p>
  </div>
</div>
{% endfor %}