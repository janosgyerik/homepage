---
layout: post
status: publish
published: true
title: How to handle git svn rebase with conflicts
date: 2011-12-01 07:09:13.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
I'm still new to git and it was not very clear at first how to handle the case when you encounter conflicts during a git svn rebase.  Some notes to help next time around:
<ul>
	<li>At any time, you can do `git rebase --abort` to undo the rebase and be back to your untouched git branch.</li>
	<li>There is NO:</li>
<ul>
	<li>`git svn rebase --abort`</li>
	<li>`git svn rebase --continue`</li>
	<li>`git svn rebase --skip`</li>
</ul>
	<li>There are only:</li>
<ul>
	<li>`git rebase --abort`</li>
	<li>`git rebase --continue`</li>
	<li>`git rebase --info`</li>
</ul>
	<li>Depending on the conflict you may have to do various things to resolve, such as:</li>
<ul>
	<li>Edit files and sort out the lines marked as conflicted.</li>
	<li>Do `git add path/to/file`</li>
	<li>Do `git rm path/to/file`</li>
</ul>
	<li>After resolving a conflict, do: `git rebase --continue`</li>
<ul>
	<li>At this step if git complains that nothing has changed, then you have to do: `git rebase --skip`</li>
</ul>
	<li>When resolving a conflict, if you know for a fact that the file in your master branch is the correct one, you can resolve the conflict with `git checkout master path/to/file`</li>
	<li>During my rebase, somebody committed to subversion, which cause my next `git rebase --continue` to fail. I don't know what is the best solution here, I did `git rebase --abort` and started over.</li>
</ul>
