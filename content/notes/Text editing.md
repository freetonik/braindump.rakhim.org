+++
title = "Text editing"
+++


## Requirements
A good text editor must:
- be suitable for any text, not just programming or prose
- must be fast (which eliminates most Electron-based solutions)
- must enable open formats, including [Markdown]({{< ref "Markdown" >}})

## Editors worth learning
- [Emacs]({{< ref "Emacs" >}})
- vim
- Sublime Text

## Resources
- [Build Your Own Text Editor](https://viewsourcecode.org/snaptoken/kilo/index.html)
- [The Craft of Text Editing](http://www.finseth.com/craft/) . This book is addressed to anyone who implements large software systems or who wants to know the considerations that go into such systems. It focuses around text editors. Although not required, an understanding of programming will be helpful.
- [CppCon 2017: Juan Pedro Bolivar Puente “Postmodern immutable data structures” - YouTube](https://www.youtube.com/watch?v=sPhpelUfu8Q&feature=youtu.be). about [Relaxed Radix Balanced trees]({{< ref "Relaxed Radix Balanced trees" >}}) and how they're a great data structure for writing a text editor that can handle unlimited sized documents without locking up, and allows for editing while saving and opening, and an easy way to support an undo command.