---
layout: post
status: publish
published: true
title: Using git with Eclipse
date: 2011-07-11 22:23:44.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
I just started using git so I'm really only at the beginning of an adventure.

At the moment I'm a happy user of Bazaar. I'm sure it's much slower than git, but it's been absolutely perfect for my purposes.

Well, until about recently when a new need arose for me to work with Eclipse with a version control plugin. I've been using Bazaar projects with Eclipse without the Bazaar plugin, and it's been fine. However, now I'm working on a huge project where it would be really unproductive to try to keep track of everything on the command line. So I tried the Bazaar plugin for Eclipse. Which at present is so buggy it's unusable to me.

Then I heard from a colleague that the git plugin "seems to be ok", so here I am, that's a good enough excuse for me to finally try git.

It's too early to comment on my experience and making comparisons, and it's neither the subject of this post nor something a casual reader would give a damn about. For now let's just say there is a learning curve, even for an experienced DVCS user like myself.

So this is what I did for using Eclipse+git with a Subversion repository.

1. Install the plugin, follow the steps here: <a href="http://www.vogella.de/articles/EGit/article.html">http://www.vogella.de/articles/EGit/article.html</a>

2. Clone the Subversion trunk: git svn clone REPO_URL

3. Import / Existing Projectin to Workspace

4. Tell Eclipse about the git repo: right-click on the project / Team / Share Project... / Use or create Repository in parent folder of project

These would be the typical steps I reckon. My setup is hardly typical, so I had a few additional steps here and there:
<ul>
	<li>Ignoring files in git:</li>
<ul>
	<li>Add patterns to .gitignore and add .gitignore to the repo to share with your team</li>
	<li>...or, add patterns to .git/info/exclude to keep them local (not shared with the team)</li>
	<li>If you are in windows, be careful with line endings, for example "echo pattern &gt;&gt; .gitignore" will add a pattern that will never match</li>
</ul>
	<li>Copy uncommitted changes from svn checkout: svn export path/to/svn/checkout path/to/git/repo</li>
</ul>
<h3>Quick tips</h3>
<ul>
	<li>To get changes from Subversion upstream: git svn rebase</li>
	<li>To commit back to Subversion: git svn dcommit</li>
<ul>
	<li>This will replay each of the local commits, NOT one big chunk in one</li>
<ul>
	<li>And like all git commands, it has tons of options to fine tune</li>
</ul>
</ul>
	<li>To create a branch, simply: git branch name_of_branch</li>
	<li>To switch to a branch: git checkout name_of_branch</li>
	<li>To see the list of branches: git branch</li>
</ul>
<h3>First impressions?</h3>
<ul>
	<li>Unlike the Subversion plugin in Eclipse, I like that the changes are shown only on the parent project, not on sub-projects.</li>
	<li>Unlike Bazaar and Subversion, git doesn't seem to like shortcuts like "st" or "ci", you have to spell out "status" and "commit". (Probably you can configure aliases though, but that's not the same.)</li>
	<li>Unlike Bazaar or Subversion, the command line client is very colorful, which could be nice, except in windows it can get corrupted quite easily (Sometimes a git command alters the cursor color). It also beeps the PC speaker when you do something invalid.</li>
</ul>
<h3>References</h3>
<ul>
	<li><a href="http://git-scm.com/course/svn.html">http://git-scm.com/course/svn.html</a></li>
	<li><a href="http://www.vogella.de/articles/EGit/article.html">http://www.vogella.de/articles/EGit/article.html</a></li>
	<li><a href="http://wiki.titan2x.com/index.php?title=Git_cheat_sheet">http://wiki.titan2x.com/index.php?title=Git_cheat_sheet</a></li>
</ul>
