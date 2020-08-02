+++
title = "E-book writing workflows"
+++


### Software
- [honkit/honkit: HonKit is building beautiful books using Markdown - Fork of GitBook](https://github.com/honkit/honkit)
- [rust-lang/mdBook: Create book from markdown files. Like Gitbook but implemented in Rust](https://github.com/rust-lang/mdBook)
	- requires custom toc
	- but allows non-numbered chapters (e.g. foreword)
	- good built in search
	- does not show sub-sections of a single file in the TOC sidebar
		- requires to write 
- [softcover](https://github.com/softcover/softcover)
	- cli tool by Michael Hartl
	- Good looking HTML and PDF out of the box
		- lots of dynamic JS
	- LaTeX
- [Bookdown](https://bookdown.org/)
	- R + R Studio + R Markdown
	- Lots of academic features (e.g. cross references and bib)

### Blog posts
- [Behind the scenes of my latest book on JavaScript](https://2ality.com/2018/08/impatient-js.html)
	- [pandoc-experiences.md](https://gist.github.com/rauschma/629d9babf101f5972c7a4c17f882d3aa)
- [Thorsten Ball - The Tools I Use To Write Books](https://thorstenball.com/blog/2018/09/04/the-tools-i-use-to-write-books/)
- [Scientific Writing with Markdown | Jaan Tollander de Balsch](https://jaantollander.com/post/scientific-writing-with-markdown/)

### Resources and services
- [Leanpub: Publish Early, Publish Often](https://leanpub.com/)
- [Markua Spec](http://markua.com/) "Markdown for books and courses"

### Etc
#### Ways to generate multipage HTML from MD via Pandoc

**export to epub and unzip**
- single page by default

**md -> texi -> html**
- single page per section by default

```
pandoc MANUAL.txt -s -o example19.texi
makeinfo --no-validate --force example19.texi --html -o example19
```

##### Probably the best UNIX way

Write chapter per file:

```
01_a.md
02_b.md
03_c.md
```

Merge into `full.md`, extract TOC, then update links:
- 1st level UL `#a` -> `a.html`
- 2nd level UL `#x` -> `a.html#x`
	- need to write a parser with memory

Then generate each chapter file:
1. rename `NN_x.md` -> `x.md`
2. convert to HTML with TOC and offset = `NN`

Left to do:
- client side search (lunr?)
- anchor link processor (ugh)
- free/paid metadata format (for lambda server)










