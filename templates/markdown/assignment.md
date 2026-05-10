---
toc: true
lang: "en"
date: 01-01-2026
book: true
title: "Foo"
author: ["Bar"]
subject: "Bazz it Around"
titlepage: true
colorlinks: false
toc-own-page: true
header-left: "\\hspace{1cm}"
header-center: "\\leftmark"
header-right: "Page \\thepage"
footer-left: "\\thetitle"
footer-center: "Bazz it Around"
footer-right: "\\theauthor"
classoption:
  - oneside
header-includes:
  - |
    ```{=latex}
    \usepackage{tcolorbox}
    \usepackage{awesomebox}
    \newtcolorbox{answer-box}{colback=green!5!white,arc=0pt,outer arc=0pt,colframe=green!80!black}
    \newtcolorbox{question-box}{colback=cyan!5!white,arc=0pt,outer arc=0pt,colframe=cyan!60!black}
    \newtcolorbox{error-box}{colback=red!5!white,arc=0pt,outer arc=0pt,colframe=red!75!black}
    \newtcolorbox{warning-box}{colback=orange!5!white,arc=0pt,outer arc=0pt,colframe=orange!80!black}
    ```
pandoc-latex-environment:
  # awesomebox
  tipblock: [tip]
  noteblock: [note]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
  # tcolorbox
  tcolorblock: [box]
  question-box: [qbox]
  warning-box: [wbox]
  answer-box: [abox]
  error-box: [ebox]
---

# Foo

# Bar

# Bazz
