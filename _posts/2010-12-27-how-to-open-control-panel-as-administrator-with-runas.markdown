---
layout: post
status: publish
published: true
title: How to open Control Panel as Administrator with runas
date: 2010-12-27 17:34:14.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
<ol>
	<li>Open a cmd window as Administrator 
<pre>
runas /u:administrator cmd
</pre></li>
	<li>Keep a cmd window running as your non-Administrator user too</li>
	<li>Open task manager (Ctrl-Esc or with taskmgr command) and kill explorer.exe</li>
	<li>Run the command "control" in the Administrator cmd window</li>
	<li>Close task manager you opened previously, and run taskmgr in the Administrator cmd window (to open it as Administrator user)</li>
	<li>Kill explorer.exe (because it is still running as Administrator)</li>
	<li>Run explorer in the non-Administrator cmd window</li>
</ol>
