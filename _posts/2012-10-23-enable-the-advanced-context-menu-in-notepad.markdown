---
layout: post
status: publish
published: true
title: Enable the advanced context menu in Notepad++
date: 2012-10-23 19:39:53.000000000 +02:00
categories:
- Software
tags: []
comments: []
---
Notepad++ is not exactly my cup of tea (being a gvim fanatic), nonetheless it's a fine text editor in Windows.

Anyway, it has a pretty cool context menu (the one that pops up when you right-click somewhere inside the editor area) with lots of nice goodies, but for some reason it seems to be disabled in recent versions. The cause in my case was that the file %appdata%\Notepad++\context<wbr>Menu<wbr>.xml was missing. If you have this same problem, no worries, simply download the file from here, save in %appdata%\Notepad++\context<wbr>Menu<wbr>.xml and restart Notepad++:</wbr></wbr></wbr></wbr>

<a href="http://svn.tuxfamily.org/viewvc.cgi/notepadplus_repository/trunk/PowerEditor/src/contextMenu.xml?view=co" rel="nofollow" target="_blank">http:/<wbr>/svn.<wbr>tuxfamily.<wbr>org/<wbr>viewvc.<wbr>cgi/<wbr>notepadplus_<wbr>repository/<wbr>trunk/<wbr>Power<wbr>Editor<wbr>/src/<wbr>context<wbr>Menu<wbr>.xml?view=<wbr>co</wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></wbr></a>
