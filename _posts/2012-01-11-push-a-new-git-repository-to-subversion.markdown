---
layout: post
status: publish
published: true
title: How to push a new git repository to Subversion
date: 2012-01-11 23:32:16.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Sometimes you start to work on a new project in git, and sometimes you might have to push it to a Subversion repository. Luckily you can do that, and not just in the dumb way of a single export with no history, but with preserving the history by replaying each of your commits in git to Subversion.

1. Create the target location inside the Subversion repository

```
svn mkdir https://reposerver/path/to/repo/path/to/project
```

2. Edit your git repository configuration to make the connection with git-svn

```
[svn-remote "svn"]
  url = https://reposerver/path/to/repo/path/to/project
  fetch = :refs/remotes/git-svn```

3. Import the empty Subversion history

```
git svn fetch
```

4. Replay your commits on top of the empty Subversion history

```
git rebase remotes/git-svn```

5. Push the commits to Subversion

```
git svn dcommit
```

&nbsp;
