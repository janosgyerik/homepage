---
layout: post
status: publish
published: true
title: How to handle git svn rebase with conflicts
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 438
wordpress_url: http://titan2x.wordpress.com/?p=438
date: 2011-12-01 07:09:13.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
I'm still new to git and it was not very clear at first how to handle the case when you encounter conflicts during a git svn rebase.  Some notes to help next time around:
<ul>
	<li>At any time, you can do <code>git rebase --abort</code> to undo the rebase and be back to your untouched git branch.</li>
	<li>There is NO:</li>
<ul>
	<li><code>git svn rebase --abort</code></li>
	<li><code>git svn rebase --continue</code></li>
	<li><code>git svn rebase --skip</code></li>
</ul>
	<li>There are only:</li>
<ul>
	<li><code>git rebase --abort</code></li>
	<li><code>git rebase --continue</code></li>
	<li><code>git rebase --info</code></li>
</ul>
	<li>Depending on the conflict you may have to do various things to resolve, such as:</li>
<ul>
	<li>Edit files and sort out the lines marked as conflicted.</li>
	<li>Do <code>git add path/to/file</code></li>
	<li>Do <code>git rm path/to/file</code></li>
</ul>
	<li>After resolving a conflict, do: <code>git rebase --continue</code></li>
<ul>
	<li>At this step if git complains that nothing has changed, then you have to do: <code>git rebase --skip</code></li>
</ul>
	<li>When resolving a conflict, if you know for a fact that the file in your master branch is the correct one, you can resolve the conflict with <code>git checkout master path/to/file</code></li>
	<li>During my rebase, somebody committed to subversion, which cause my next <code>git rebase --continue</code> to fail. I don't know what is the best solution here, I did <code>git rebase --abort</code> and started over.</li>
</ul>
