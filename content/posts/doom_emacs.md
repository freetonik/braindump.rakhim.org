+++
title = "Doom Emacs"
author = ["Rakhim Davketkaliyev"]
lastmod = 2020-06-18T00:23:08+03:00
slug = "doom_emacs"
draft = false
+++

Doom is a configuration framework for [Emacs]({{< relref "emacs" >}}) tailored for Emacs bankruptcy veterans who want less framework in their frameworks, a modicum of stability (and reproducibility) from their package manager, and the performance of a hand rolled config (or better). It can be a foundation for your own config or a resource for Emacs enthusiasts to learn more about our favorite operating system.


## Good configs {#good-configs}

-   [Jethro Kuan (developer of Org Roam)](https://github.com/jethrokuan/dots/tree/master/.doom.d)
-   [Brett Mandler](https://github.com/Brettm12345/doom-emacs-literate-config)


## Configuration {#configuration}

Examples of `map!`:

```elisp
(map! :leader
      (:prefix ("j" . "journal") ;; org-journal bindings
        :desc "Open next entry" "n" #'org-journal-open-next-entry
        :desc "Search journal" "s" #'org-journal-search-forever))

(map!
 (:map calendar-mode-map
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))

(map!
 :map (calendar-mode-map)
 :localleader
 "m" #'org-journal-search-calendar-month
 "y" #'org-journal-search-calendar-year)
```
