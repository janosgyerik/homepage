---
layout: post
title: "Slicing and dicing PDFs"
categories:
- hacks
tags: []
---
{% include JB/setup %}

The other day I needed to trim down a lengthy PDF file:
extract some pages in the middle into a new file.
I thought my regular PDF viewer might be smart enough *today* to do this kind of thing easily,
but no such luck.
Back to good old command line tools :-)

Here's one way using `psutils`, extracting from page 11 until the end:

    pdftops input.pdf - | psselect -p11- | ps2pdf14 - shorter.pdf

Here's another way using `pdftk`, cutting out page 11-20:

    pdftk A=input.pdf cat A11-20 output out.pdf

Or using `gs`:

    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dFirstPage=11 -sOutputFile=input.pdf out.pdf

