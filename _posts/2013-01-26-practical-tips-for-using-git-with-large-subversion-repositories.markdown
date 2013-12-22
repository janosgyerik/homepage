---
layout: post
status: publish
published: true
title: Practical tips for using Git with large Subversion repositories
date: 2013-01-26 15:00:51.000000000 +01:00
categories:
- Hacks
- Software
tags: []
---
So you want to use Git with Subversion? That's a great idea! If the Subversion repository is small, you should not have too big problems. If on the other hand the repository is relatively large, you may have quite a few issues.

What is large? Let's define large as: cloning the trunk takes more than 4 hours.

Before you embark on this road and start using Git as your Subversion client, here are some warnings up front:
<ul>
	<li>Tracking all Subversion branches and tags will NOT be practical. If you are ok with tracking only the trunk and a bunch of selected branches, that's fine.</li>
	<li>The initial clone will take a long time, it may be interrupted, and you may need to resume manually several times.</li>
	<li>The initial clone of the trunk may crash completely and doesn't work at all. This doesn't happen often. But if it does, then game over, you're stuck with Subversion.</li>
	<li>You may have issues with line ending characters if LF and CR-LF are mixed in the project. The potential issues are not negligible, for example you may not be able to view the blame annotations. However this is something that can and should be fixed in the project.</li>
	<li>At the time of this writing you cannot push your commits back to Subversion from Eclipse. You have to use the command line for that.</li>
	<li>Do read the <strong>CAVEATS</strong> section in [http://www.kernel.org/pub/software/scm/git/docs/git-svn.html](http://www.kernel.org/pub/software/scm/git/docs/git-svn.html)</li>
</ul>
Scared? No? Ok let's do it then!
<h2>Clone the trunk from Subversion</h2>
Provided you have git-svn installed, clone the trunk with:

```
git svn clone http://example.com/path/to/project-x/trunk project-x
```

Do not clone the entire repository. Online tutorials will tell you that you can track branches and tags by parameterizing the initial clone. Unfortunately, most probably that won't work out very well with a large repository.

If the repository is sufficiently large, the cloning may be interrupted. You will have a `project-x` directory with only a `.git` subdirectory in it. Not to worry, go inside the `project-x` directory and resume with:

```
git svn fetch
```

Depending on the size of the repository, you may have to repeat this a couple of times. Eventually it should work.

By the way, git svn fetch is not very chatty at first. Usually for many minutes or even hours it may seem like nothing is happening, but actually it's working, so don't interrupt.

Once the clone is finally completed, you probably want to generate a `.gitignore` file based on Subversion's meta data:

```
git svn show-ignore &gt;&gt; .gitignore
```

<h2>Working with Git</h2>
Once you have the clone from Subversion, you have a Git repository, use it as usual...

However! To keep things clean, and to avoid impacting your coworkers, it might be a good idea to keep `master` "pristine". That is, never do any work on `master`, use it only for interacting with the remote Subversion repository such as pull updates and pushing local commits. Do all your work on branches, stay off the `master`.
<h2>Getting updates from Subversion</h2>
You might think that the right way to get new revisions from Subversion will involve a pull command. No. The right way is to rebase:

```
git checkout master
git svn rebase
```

I checkout `master` just to highlight that ideally you should be working on other branches, not the `master`. The rebase works as usual, and if you haven't touched the `master` than this is like a fast-forward merge with no possibility of conflicts.
<h2>Committing to Subversion</h2>
Let's assume you fixed a bug on a branch called `bug123` and never touched `master`. You have two main options:
<ol>
	<li>Preserve your individual commits in `bug123`</li>
	<li>Squash your individual commits in `bug123` and apply the changes in a single commit</li>
</ol>

### Preserving individual commits

Since Subversion doesn't have the notion of branches as Git, the easiest way to preserve your individual commits is to rebase your branch on top of the Subversion `trunk` (= `master`) and then push your commits to Subversion:

```
git checkout master  # first, update from the remote trunk
git svn rebase
git checkout bug123  # next, rebase bug123 on top of master
git rebase master
git checkout master
git merge bug123     # this should be a fast-forward
git svn dcommit
```


### Squashing individual commits

Nothing special is needed here. In the rare case that the Subversion repository has not changed since our last rebase and the `bug123` branch was based on that revision, then the merge operation will be a fast-forward by default, preserving individual commits. Normally this is not the case, and the merged revisions will be committed to Subversion as a single change.

```
git checkout master  # first, update from the remote trunk
git svn rebase
git merge bug123     # possibly but not likely a fast-forward
git svn dcommit
```

<h2>Getting other Subversion branches</h2>
To get other branches not only the trunk, we have to tell Git the urls of the branches and how to label them in Git commands. At the moment `.git/config` should look something like this:

```
[svn-remote "svn"]
        url = http://example.com/path/to/project-x/trunk
        fetch = :refs/remotes/git-svn```

The trick is to add multiple fetch configurations. The general format of a fetch configuration value is `RELPATH:refs/remotes/LABEL` where `RELPATH` is the relative path of the branch from the url configuration, and `LABEL` can be anything you want. At the moment `RELPATH` is blank, because url already corresponds to the url of the branch.

Let's say we want to get `branch1`, whose url is `http://example.com/path/to/project-x/branches/branch1`. Let's change `.git/config` to be like this:

```
[svn-remote "svn"]
        url = http://example.com/path/to/project-x
        fetch = trunk:refs/remotes/git-svn
        fetch = branches/branch1:refs/remotes/branch1
```

Note that although we changed the first fetch line, we did not change the meaning: the url of the git-svn remote is still http://example.com/path/to/project-x/trunk

In the second fetch line we tell Git the path to the other branch that we want, and the label to use for it in Git commands.

After adding more fetch lines, get the branches with:

```
git svn fetch
```

The same way as when cloning, this may get interrupted. Simply repeat the command to resume, as many times as it takes.

After the fetch is completed, you can confirm the new branch was correctly fetched with:

```
git branch -r
```

You can create a local branch based on the remote and switch to it with:

```
git checkout -b local-branch1 remotes/branch1
```

You can add more fetch lines easily using `git config`:

```
git config --add svn-remote.svn.fetch branches/branch2:refs/remotes/branch2
```

By the way, the documentation mentions this alternative configuration:

```
[svn-remote "svn"]
        url = http://example.com/path/to/project-x
        fetch = trunk:refs/remotes/git-svn
        branches = branches/{red,green}:refs/remotes/*
```

It's a great idea, except that as of version 1.7.10 this does not work well: it works only once!!! You create the settings, you do `git svn fetch`, it looks all good, but if you add another branch later and try to do `git svn fetch` again, it will do nothing. It's not the end of the world though, as you can just fall back to the technique of adding multiple fetch lines...
