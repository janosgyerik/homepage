---
layout: post
status: publish
published: true
title: Practical tips for using Git with large Subversion repositories
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 844
wordpress_url: http://www.janosgyerik.com/?p=844
date: 2013-01-26 15:00:51.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments:
- id: 3178
  author: CaptainOfCrush
  author_email: njdumar@gmail.com
  author_url: ''
  date: '2013-07-25 21:30:00 +0200'
  date_gmt: '2013-07-25 21:30:00 +0200'
  content: |-
    If you add a new branch to your branches list eg.
    branches = branches/{red,green}:refs/remotes/* -&gt; branches = branches/{red,green,blue}:refs/remotes/*, and want the git svn fetch to work correctly, just delete the /.git/svn/.metadata before your fetch. You'll get the added branch then without having to re-clone the repo..
- id: 3185
  author: Vincent Yang
  author_email: mscsharp@gmail.com
  author_url: ''
  date: '2013-09-24 00:05:00 +0200'
  date_gmt: '2013-09-24 00:05:00 +0200'
  content: No matter how many times I ran the git svn fetch, I am not able to get
    the branches from svn at all. I also tried to delete the .metadata file, neither
    of the solution was working.
- id: 3186
  author: Janos Gyerik
  author_email: janos.gyerik@gmail.com
  author_url: ''
  date: '2013-09-24 05:43:00 +0200'
  date_gmt: '2013-09-24 05:43:00 +0200'
  content: Thanks, I'll try that next time!
- id: 3187
  author: Janos Gyerik
  author_email: janos.gyerik@gmail.com
  author_url: ''
  date: '2013-09-24 05:48:00 +0200'
  date_gmt: '2013-09-24 05:48:00 +0200'
  content: If deleting .metadata didn't work, and adding multiple fetch lines didn't
    work, and your git-svn version is fairly recent, and you specified the repo base
    url and branch paths correctly, and without typos, then I'm out of ideas.
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
	<li>Do read the <strong>CAVEATS</strong> section in <a href="http://www.kernel.org/pub/software/scm/git/docs/git-svn.html">http://www.kernel.org/pub/software/scm/git/docs/git-svn.html</a></li>
</ul>
Scared? No? Ok let's do it then!
<h2>Clone the trunk from Subversion</h2>
Provided you have git-svn installed, clone the trunk with:
<pre>git svn clone http://example.com/path/to/project-x/trunk project-x</pre>
Do not clone the entire repository. Online tutorials will tell you that you can track branches and tags by parameterizing the initial clone. Unfortunately, most probably that won't work out very well with a large repository.

If the repository is sufficiently large, the cloning may be interrupted. You will have a <code>project-x</code> directory with only a <code>.git</code> subdirectory in it. Not to worry, go inside the <code>project-x</code> directory and resume with:
<pre>git svn fetch</pre>
Depending on the size of the repository, you may have to repeat this a couple of times. Eventually it should work.

By the way, git svn fetch is not very chatty at first. Usually for many minutes or even hours it may seem like nothing is happening, but actually it's working, so don't interrupt.

Once the clone is finally completed, you probably want to generate a <code>.gitignore</code> file based on Subversion's meta data:
<pre>git svn show-ignore &gt;&gt; .gitignore</pre>
<h2>Working with Git</h2>
Once you have the clone from Subversion, you have a Git repository, use it as usual...

However! To keep things clean, and to avoid impacting your coworkers, it might be a good idea to keep <code>master</code> "pristine". That is, never do any work on <code>master</code>, use it only for interacting with the remote Subversion repository such as pull updates and pushing local commits. Do all your work on branches, stay off the <code>master</code>.
<h2>Getting updates from Subversion</h2>
You might think that the right way to get new revisions from Subversion will involve a pull command. No. The right way is to rebase:
<pre>git checkout master
git svn rebase</pre>
I checkout <code>master</code> just to highlight that ideally you should be working on other branches, not the <code>master</code>. The rebase works as usual, and if you haven't touched the <code>master</code> than this is like a fast-forward merge with no possibility of conflicts.
<h2>Committing to Subversion</h2>
Let's assume you fixed a bug on a branch called <code>bug123</code> and never touched <code>master</code>. You have two main options:
<ol>
	<li>Preserve your individual commits in <code>bug123</code></li>
	<li>Squash your individual commits in <code>bug123</code> and apply the changes in a single commit</li>
</ol>
<h3>Preserving individual commits</h3>
Since Subversion doesn't have the notion of branches as Git, the easiest way to preserve your individual commits is to rebase your branch on top of the Subversion <code>trunk</code> (= <code>master</code>) and then push your commits to Subversion:
<pre>git checkout master  # first, update from the remote trunk
git svn rebase
git checkout bug123  # next, rebase bug123 on top of master
git rebase master
git checkout master
git merge bug123     # this should be a fast-forward
git svn dcommit</pre>
<h3>Squashing individual commits</h3>
Nothing special is needed here. In the rare case that the Subversion repository has not changed since our last rebase and the <code>bug123</code> branch was based on that revision, then the merge operation will be a fast-forward by default, preserving individual commits. Normally this is not the case, and the merged revisions will be committed to Subversion as a single change.
<pre>git checkout master  # first, update from the remote trunk
git svn rebase
git merge bug123     # possibly but not likely a fast-forward
git svn dcommit</pre>
<h2>Getting other Subversion branches</h2>
To get other branches not only the trunk, we have to tell Git the urls of the branches and how to label them in Git commands. At the moment <code>.git/config</code> should look something like this:
<pre>[svn-remote "svn"]
        url = http://example.com/path/to/project-x/trunk
        fetch = :refs/remotes/git-svn</pre>
The trick is to add multiple fetch configurations. The general format of a fetch configuration value is <code>RELPATH:refs/remotes/LABEL</code> where <code>RELPATH</code> is the relative path of the branch from the url configuration, and <code>LABEL</code> can be anything you want. At the moment <code>RELPATH</code> is blank, because url already corresponds to the url of the branch.

Let's say we want to get <code>branch1</code>, whose url is <code>http://example.com/path/to/project-x/branches/branch1</code>. Let's change <code>.git/config</code> to be like this:
<pre>[svn-remote "svn"]
        url = http://example.com/path/to/project-x
        fetch = trunk:refs/remotes/git-svn
        fetch = branches/branch1:refs/remotes/branch1</pre>
Note that although we changed the first fetch line, we did not change the meaning: the url of the git-svn remote is still http://example.com/path/to/project-x/trunk

In the second fetch line we tell Git the path to the other branch that we want, and the label to use for it in Git commands.

After adding more fetch lines, get the branches with:
<pre>git svn fetch</pre>
The same way as when cloning, this may get interrupted. Simply repeat the command to resume, as many times as it takes.

After the fetch is completed, you can confirm the new branch was correctly fetched with:
<pre>git branch -r</pre>
You can create a local branch based on the remote and switch to it with:
<pre>git checkout -b local-branch1 remotes/branch1</pre>
You can add more fetch lines easily using <code>git config</code>:
<pre>git config --add svn-remote.svn.fetch branches/branch2:refs/remotes/branch2</pre>
By the way, the documentation mentions this alternative configuration:
<pre>[svn-remote "svn"]
        url = http://example.com/path/to/project-x
        fetch = trunk:refs/remotes/git-svn
        branches = branches/{red,green}:refs/remotes/*</pre>
It's a great idea, except that as of version 1.7.10 this does not work well: it works only once!!! You create the settings, you do <code>git svn fetch</code>, it looks all good, but if you add another branch later and try to do <code>git svn fetch</code> again, it will do nothing. It's not the end of the world though, as you can just fall back to the technique of adding multiple fetch lines...
