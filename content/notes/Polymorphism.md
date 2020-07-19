+++
title = "Polymorphism"
+++


The word Polymorphism comes from Ancient Greek:

- poly: many
- morphe: form

Something is polymorphic when it can take on many forms and behave differently in different contexts. In computer programming, a polymorphic function can, for example, operate on objects of different types, dynamically dispatch different actions depending on the incoming argument values.

There are three major types of polymorphism:

1. Ad hoc polymorphism.
	- function/operator overloading (e.g. `+` in js/python)
2. Parametric polymorphism.
	- Generics in [Golang]({{< ref "Golang" >}}) 
3. Subtype polymorphism.
	- Enabled if [Liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle) is respected

## Polymorphism in Clojure
- [Polymorphism in Clojure: Protocols and Multimethods | Clojure Documentation | Clojure Docs](http://clojure-doc.org/articles/language/polymorphism.html)
- [Creating and Extending Abstractions with Multimethods, Protocols, and Records | Clojure for the Brave and True](https://www.braveclojure.com/multimethods-records-protocols/)
- [Clojure - Multimethods and Hierarchies](https://clojure.org/reference/multimethods)
- [Clojure - Protocols](https://clojure.org/reference/protocols)

---
## Backlinks
* [The Expression Problem]({{< ref "The Expression Problem" >}})
	* The problem related to [Polymorphism]({{< ref "Polymorphism" >}}) known as “The Expression Problem” was first observed by John Reynolds in 1975. Philip Wadler, an American computer scientist known for his contributions to programming language design and type theory, has coined and explained the term as follows:

