---
layout: post
status: publish
published: true
title: Highlighting current line in gvim
date: 2012-08-13 16:34:05.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
Didn't know you can do this until now, and it's so awesome!

Add this in `.vimrc`:


```
`set cursorline
highlight CursorLine guibg=#F1F5FA
`
```


To highlight the current line only in the active window, throw these in too:


```
`autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
`
```


More info:
- `:help :highlight`
- [http://vim.wikia.com/wiki/Highlight_current_line](http://vim.wikia.com/wiki/Highlight_current_line)
