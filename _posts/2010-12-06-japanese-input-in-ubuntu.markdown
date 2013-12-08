---
layout: post
status: publish
published: true
title: How to set up Japanese input in Ubuntu
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 240
wordpress_url: http://titan2x.wordpress.com/?p=240
date: 2010-12-06 00:29:23.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
The authoritative documentation is here:
<a href="https://help.ubuntu.com/community/JapaneseInput">https://help.ubuntu.com/community/JapaneseInput</a>

A couple of steps are missing though, this is how I did it in Ubuntu 10.10.
<ol>
	<li>sudo apt-get install anthy ibus-anthy</li>
	<li>Go to System / Preferences / Keyboard Input Methods
<ol>
	<li>It asked me <strong>twice</strong> if I want to start the ibus service. Probably some bug, just say yes.</li>
</ol>
</li>
	<li>Go to Input Method tab</li>
	<li>Select Anthy from the <strong>Select an input method</strong> drop-down menu</li>
</ol>
After this you should be able to switch between Japanese/English input with Control + Space.

To make this permanent, you need to set one more thing.
<ol>
	<li>Go to System / Administration / Language Support</li>
	<li>Set <strong>Keyboard input method system</strong> to <strong>ibus</strong></li>
</ol>
