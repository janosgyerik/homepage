---
layout: post
status: publish
published: true
title: How to create a Subversion post-commit hook that runs in the background
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 546
wordpress_url: http://www.janosgyerik.com/?p=546
date: 2012-02-12 13:29:13.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Recently I needed to do something in a post-commit Subversion hook that can take a long time, and unless the hook runs in the background, the repository would be unavailable until the hook completes.

The solution:
<ol>
	<li>Create a separate script to perform the time-consuming task, the way you always create a script. The hook script (<code>hooks/post-commit</code>) will be like a wrapper, calling the main script.</li>
	<li>In <code>hooks/post-commit</code>, start the main script in the background, and redirect all its output to <code>/dev/null</code></li>
</ol>
For example <code>hooks/post-commit</code> will look like this:
<pre>./time-consuming-script.sh $* &gt;/dev/null 2&gt;/dev/null &amp;</pre>
The catch here was redirecting error output (<code>2&gt;/dev/null</code>). Without that, the process was not fully in the background.
By the another (small) catch is that the post-commit template file (<code>hooks/post-commit.tmpl</code>) should not exist, or have size 0, otherwise the real hook script is ignored.
