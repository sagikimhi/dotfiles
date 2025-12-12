---
toc: true
lang: "en"
date: 12-07-2025
title: "Maman 01"
author: ["Foo Bar"]
subject: "Bazz"
titlepage: true
colorlinks: false
toc-own-page: true
classoption:
  - oneside
header-includes:
  - |
    ```{=latex}
    \usepackage{tcolorbox}
    \usepackage{awesomebox}
    ```
pandoc-latex-environment:
  tipbox: [tip]
  notebox: [note]
  warningbox: [warning]
  cautionbox: [caution]
  importantbox: [important]
  tcolorbox: [box]
header-left: "\\hspace{1cm}"
header-center: "\\leftmark"
header-right: "Page \\thepage"
footer-left: "\\thetitle"
footer-center: "Foo Bar - Bazz it Around"
footer-right: "\\theauthor"
...

# Foo

# Bar

# Bazz
