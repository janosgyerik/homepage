---
layout: post
status: publish
published: true
title: Bash co-processes and other tricks
date: 2011-03-22 03:20:13.000000000 +01:00
categories:
- Hacks
- Musings
tags: []
comments: []
---
I thought I already knew all the most practical tricks in bash. But I have a feeling I found something I will use a lot, check it out:

<!-- p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 6.1px 'Andale Mono'; color: #005f91} -->
<pre>paste &lt;(ls -1) &lt;(ls -1|tr 'A-Z' 'a-z')| 
{ while read old new; do echo mv -v $old $new; done; }</pre>
This also brings me to the other tip. When doing tricky stuff like this, it's good to first print the commands you want to execute. If it all looks good, just pipe the output to bash to execute.
