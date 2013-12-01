--- 
layout: article
title: "Dart 混入（Mixins）"
description: "Mixins 让你实现一次就可在多个类中使用"
rel:
    author: gilad-bracha
has-permalinks: true
article:
  written_on: 2012-12-18
  collection: language-details
---

{% include toc.html %}

# {{ page.title }}

_作者：Gilad Bracha <br>
 2012 12月_ (2013 11月修订)

[Mixins 原文](http://www.dartlang.org/articles/mixins/)。

该文章介绍了 Dart 中的 mixins 功能。
为了减少对现有实现的破坏，
在语义上从多方面做了限制，
但是还允许朝完整的 mixin 实现发展。
这个限制版本的实现已经提供了相当大的价值。

## 基本概念

如果你已经熟悉关于 mixins 的论文了，
你可以跳过该部分。
否则，请看看这些重要的基本概念。
如果想深入研究请参考
[Mixins in Strongtalk](http://www.bracha.org/mixins-paper.pdf)。

在支持类和继承的语言中，
类已经隐式的定义了一个 _mixin_。
mixin 由类的函数来定义，包含了类和其父类的区别。
类其实是一个 _mixin application_。

名词 _mixin application_ 来自于 _function application_ 的类比。
在数学上，一个 mixin _M_ 可以看作一个从父类到子类的函数：
给 _M_ 提供一个父类 _S_，返回一个 _S_ 类的新子类。
在学术报告中通常记为：_M |> S_。

基于 function application 的概念可以定义一个 function composition。
这个概念贯穿 mixin composition；定义一个  mixins
<em>M<sub>1</sub></em> 和 <em>M<sub>2</sub></em> 的 composition，
记为 <em>M<sub>1</sub></em> * <em>M<sub>2</sub></em>：即
<em>(M<sub>1</sub> * M<sub>2</sub>) |> S =
M<sub>1</sub> |> (M<sub>2</sub> |> S)</em>。

由于方法可以应用不同的参数，所以方法非常有用。
而 mixins 也一样。
类定义的 隐式 mixin 通常在该类的父类中使用一次。
要使 mixin 应用到不同的父类中，
可以有两种方式：
在任意父类以外独立定义 mixin，
或者，提取一个类定义的隐式 mixin 并在其定义之外重用。
下面的部分来介绍第二种情况。

## 词法和语法

Mixins are implicitly defined via ordinary class declarations.
In principle, every class defines a mixin that can be extracted from it.
However, in this proposal,
a mixin may only be extracted from a class
that obeys the following restrictions:

1. The class has no declared constructors.
2. The class' superclass is Object.
3. The class contains no `super` calls.

Restriction (1) avoids complications that arise
due to the need to pass constructor parameters up the inheritance chain.
Under those circumstances, 
restriction (2) encourages mixins to be declared explicitly.
Restriction (3) means that implementations can continue
to statically bind `super` calls rather than either
rebinding them upon mixin application,
or binding them dynamically.

Example 1:

{% prettify dart %}
abstract class Collection<E> {
  Collection<E> newInstance();
  Collection<E> map((f) {
    var result = newInstance();
    forEach((E e) { result.add(f(e)); });
    return result;
  }
}

abstract class DOMElementList<E> = DOMList with Collection<E>;

abstract class DOMElementSet<E> = DOMSet with Collection<E>;

// ... 28 more variants
{% endprettify %}

Here, Collection\<E> is a normal class that is used to declare a mixin.
Both the classes DOMElementList and DOMElementSet are mixin applications.
They are defined by a special form of class declaration that gives them a name
and declares them equal to an application of
a mixin to a superclass, given via a `with` clause.
The class is abstract
because it does not implement the abstract method 
newInstance() declared in Collection. 

In the above, DOMElementList is effectively
<em>Collection mixin |> DOMList</em>,
while DOMElementSet is <em>Collection mixin |> DOMSet</em>.

The benefit here is that the code in class Collection
can be shared in multiple class hierarchies.
We list two such hierarchies above—one rooted in DOMList 
and one rooted in DOMSet.
One need not repeat/copy the code in Collection,
and every change made to Collection will propagate to both hierarchies,
greatly easing maintenance of the code.
This particular example is loosely based on a 
real and very acute case in the Dart libraries.

The above examples illustrate one form of mixin application,
where the mixin application specifies a mixin and a superclass
to which it applies,
and provides the application with a name.

In an alternative form, mixin applications appear in
the `with` clause of a class declaration
as a comma-separated list of identifiers.
All the identifiers must denote classes.
In this form, multiple mixins are composed and applied
to the superclass named in the extends clause,
producing an anonymous superclass. 
Taking the same examples again, we would have:

{% prettify dart %}
class DOMElementList<E> extends DOMList with Collection<E> {
   DOMElementList<E> newInstance() => new DOMElementList<E>();
}

class DOMElementSet<E> extends DOMSet with Collection<E> {
  DOMElementSet<E> newInstance() => new DOMElementSet<E>();
}
{% endprettify %}

Here, DOMElementList is not the application _Collection mixin |> DOMList._ 
Instead, it is a new class whose superclass is such an application.
The situation with respect to DOMElementSet is analogous.
Note that in each case,
the abstract method newInstance() is overridden with an implementation,
so these classes can be instantiated directly.

Consider what happens if DOMList has a non-trivial constructor:

{% prettify dart %}
class DOMElementList<E> extends DOMList with Collection<E> {
  DOMElementList<E> newInstance() => new DOMElementList<E>(0);
  DOMElementList(size): super(size);
}
{% endprettify %}

Each mixin has its own constructor called independently,
and so does the superclass.
Since a mixin constructor cannot be declared,
the call to it can be elided in the syntax;
in the underlying implementation,
the call can always be placed at the start of the initialization list.

The constructor would set the values for any fields
and for the generic type parameters.

This rule ensures that these examples run smoothly
and also generalize cleanly once one lifts restriction (1).

The second form is a convenient sugar
that allows multiple mixins to be mixed into a class
without the need to introduce multiple intermediate declarations. 
For example:

{% prettify dart %}
class Person {
  String name;
  Person(this.name);
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(name):super(name);
}
{% endprettify %}

Here, the superclass is the mixin application:

<em>Demented mixin \|> Aggressive mixin \|> Musical mixin \|> Person</em>

We assume that only Person has a constructor with arguments.
Hence _Musical mixin |> Person_ inherits Person's constructors,
and so on until the actual superclass of Maestro,
which is formed by a series of mixin applications.

In reality in this example we'd expect that
Demented, Aggressive, and Musical 
actually have interesting properties that are likely to require state. 


## Details

We now discuss a few issues in more detail:

* Privacy
* Statics
* Types


### Privacy

A mixin application may well be declared outside the library
that declared the original class.
This does not have any effect on
who can access members of a mixin application instance.
Access to members is determined based on
the library where they were originally declared,
exactly as with ordinary inheritance. 
This follows from the semantics of mixin application,
which are determined by the semantics of inheritance
in the underlying language.

### Statics

Can one use the statics of the original class
via the mixin application or not?  
Again, the answer (No) follows from the semantics of inheritance.
Statics are not inherited in Dart. 

### Types

What is the type of a mixin application instance?
In general, it is a subtype of its superclass,
and also supports the methods defined on the mixin.
The mixin name itself, however,
denotes the type of the original class,
which has its own superclass
and may not be compatible with a particular mixin application.

What about the interfaces a class supports?
Does its mixin support them?
In general, no, since interface support
may rely on inherited functionality.
This implies that a mixin application must declare
what interfaces it implements explicitly.

### Generics

If a class has type parameters,
its mixin necessarily has identical type parameters. 


