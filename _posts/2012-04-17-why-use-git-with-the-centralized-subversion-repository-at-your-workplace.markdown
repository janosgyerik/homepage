---
layout: post
status: publish
published: true
title: Why use git with the centralized Subversion repository at your workplace
date: 2012-04-17 07:41:20.000000000 +02:00
categories:
- musings
- software
tags: []
---
Subversion is pretty mainstream these days. Luckily, git can work with a Subversion repository just fine. So, just because your workplace is using Subversion as the central repository, you can work with it using git if you want. Using git you can checkout from Subversion, use it locally enjoying all its benefits, and occasionally commit your work back to Subversion.

Let me give you some real practical reasons why you absolutely **should** use git instead of Subversion on the client side:

- With git you have the complete revision history locally. History operations do not need network access, and are therefore very fast. (You do know that git is the fastest version control system out there.)
- All commits are local, not automatically applied to the central repository. This way you can break down large tasks to several smaller commits which, being local only, will not have side effects on others. Temporary instabilities introduced by your changes as you make progress will never affect your coworkers. After your feature is completed and stable, you can push your local commits to the central Subversion repository.
- Creating local branches is easy and efficient. In git you can have multiple branches living inside the same working directory, and switch between them easily. This makes it very easy to switch between different tasks, or trying different implementations of the same task, without creating unnecessary copies of the project's workspace. Subversion handles branch operations very poorly, so you might not be used to using a lot of branches. Git handles branch operations very well, and you once you get used to branching often, you will benefit greatly from it.
- Subversion litters all sub-directories of the project with `.svn` directories. Git works differently, there is a single `.git` directory in the project's root directory. Among other things, a nice side effect of this is that you can easily do things like `grep -r`.

In short: if you are using a Subversion client instead of git, you are really missing out on a lot of benefits git could bring to you.

### Btw...

- Git is cross-platform (works on Linux, Windows, Mac)
- There is a nice plugin for Eclipse, and probably most other major IDEs as well
- On Windows it comes with a superb bash terminal and other core unix tools, which is a lot leaner than a cygwin beast when all you need is bash, awk, sed and perl...

### What's the catch?

- Eclipse integration does not work as well as Subversion:

	- The Team Synchronization function may not work well, depending on the repository. In particular if the line endings in the project are not consistent, using a mixture of windows-style and unix-style line endings.
	- I don't know how to do `git svn rebase` and `git svn dcommit` from Eclipse itself, so you might need the command line for that.

- You really have to spend some time to learn it properly. Git has a unique way of thinking which is different from Subversion. You will need to understand git before you can use it effectively.
- The first checkout takes a lot longer compared to Subversion, because git gets the entire repository history. But this is something you only need to do only once. As a nice side effect, you will have a backup of the central repository. Should the central repository die a horrible death, it could be rebuilt from a git checkout.

### Links

- [http://git-scm.com/book](http://git-scm.com/book) --- The official git book, completely free PDF and ebook versions
- `git --help`
- [http://trac.parrot.org/parrot/wiki/git-svn-tutorial](http://trac.parrot.org/parrot/wiki/git-svn-tutorial)
- [http://git.or.cz/course/svn.html](http://git.or.cz/course/svn.html)
- [http://whygitisbetterthanx.com/](http://whygitisbetterthanx.com/)
- [Why not use Git?](http://techsoftcomputing.com/faq/2262831.html)

