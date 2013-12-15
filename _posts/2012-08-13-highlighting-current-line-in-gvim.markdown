---
layout: post
status: publish
published: true
title: Highlighting current line in gvim
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 705
wordpress_url: http://www.janosgyerik.com/?p=705
date: 2012-08-13 16:34:05.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Didn't know you can do this until now, and it's so awesome!

Add this in `.vimrc`:

<pre>`set cursorline
highlight CursorLine guibg=#F1F5FA
`</pre>

To highlight the current line only in the active window, throw these in too:

<pre>`autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
`</pre>

<p>More info:
- `:help :highlight`
- <a href="http://vim.wikia.com/wiki/Highlight_current_line">http://vim.wikia.com/wiki/Highlight_current_line</a></p>
