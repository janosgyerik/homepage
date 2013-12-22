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
---
I'm still new to git and it was not very clear at first how to handle the case when you encounter conflicts during a `git svn rebase`.  Some notes to help next time around:

- At any time, you can do `git rebase --abort` to undo the rebase and be back to your untouched git branch.
- There is NO:

	- `git svn rebase --abort`
	- `git svn rebase --continue`
	- `git svn rebase --skip`

- There are only:

	- `git rebase --abort`
	- `git rebase --continue`
	- `git rebase --info`

- Depending on the conflict you may have to do various things to resolve, such as:

	- Edit files and sort out the lines marked as conflicted.
	- Do `git add path/to/file`
	- Do `git rm path/to/file`

- After resolving a conflict, do: `git rebase --continue`

	- At this step if git complains that nothing has changed, then you have to do: `git rebase --skip`

- When resolving a conflict, if you know for a fact that the file in your master branch is the correct one, you can resolve the conflict with `git checkout master path/to/file`
- During my rebase, somebody committed to subversion, which cause my next `git rebase --continue` to fail. I don't know what is the best solution here, I did `git rebase --abort` and started over.

