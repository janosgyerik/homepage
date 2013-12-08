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

Add this in <code>.vimrc</code>:

<pre><code>set cursorline
highlight CursorLine guibg=#F1F5FA
</code></pre>

To highlight the current line only in the active window, throw these in too:

<pre><code>autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
</code></pre>

<p>More info:
- <code>:help :highlight</code>
- <a href="http://vim.wikia.com/wiki/Highlight_current_line">http://vim.wikia.com/wiki/Highlight_current_line</a></p>
