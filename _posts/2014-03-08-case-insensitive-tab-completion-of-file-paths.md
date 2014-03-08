---
layout: post
title: "Case insensitive tab completion of file paths"
categories:
tags: []
---
{% include JB/setup %}

At first I found it a bit strange that in Windows and Mac the tab completion of file paths ignores case. It works that way because they use a case insensitive file system by default, so `~/Documents` and `~/documents` are exactly the same thing.

After some time I got used to this behavior, which was easy, because I find it noticeably easier to type everything in lowercase without holding down the shift key. And when working in Linux/UNIX systems again I started missing it, and even became annoyed by having to press the shift key to spell things right again.

Luckily this is very easy to setup in Linux/UNIX, simply by adding this to your `~/.inputrc`:

    # case insensitive tab completion of file paths
    set completion-ignore-case on

After you do this and open a new terminal (or a tab), you should be able to type path names without worrying about the case, and let <kbd>TAB</kbd> complete and correct for you.
