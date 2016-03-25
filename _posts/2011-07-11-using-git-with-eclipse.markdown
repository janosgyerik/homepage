---
layout: post
status: publish
published: true
title: Using git with Eclipse
date: 2011-07-11 22:23:44.000000000 +02:00
categories:
- Hacks
- Musings
- software
tags: []
---
I just started using git so I'm really only at the beginning of an adventure.

At the moment I'm a happy user of Bazaar. I'm sure it's much slower than git, but it's been absolutely perfect for my purposes.

Well, until about recently when a new need arose for me to work with Eclipse with a version control plugin. I've been using Bazaar projects with Eclipse without the Bazaar plugin, and it's been fine. However, now I'm working on a huge project where it would be really unproductive to try to keep track of everything on the command line. So I tried the Bazaar plugin for Eclipse. Which at present is so buggy it's unusable to me.

Then I heard from a colleague that the git plugin "seems to be ok", so here I am, that's a good enough excuse for me to finally try git.

It's too early to comment on my experience and making comparisons, and it's neither the subject of this post nor something a casual reader would give a damn about. For now let's just say there is a learning curve, even for an experienced DVCS user like myself.

So this is what I did for using Eclipse+git with a Subversion repository.

1. Install the plugin, follow the steps here: [http://www.vogella.de/articles/EGit/article.html](http://www.vogella.de/articles/EGit/article.html)

2. Clone the Subversion trunk: `git svn clone REPO_URL`

3. **Import / Existing Project into Workspace**

4. Tell Eclipse about the git repo: right-click on the project, and select **Team / Share Project... / Use or create Repository** in the parent folder of the project

These would be the typical steps I reckon. My setup is hardly typical, so I had a few additional steps here and there:

- Ignoring files in git:

	- Add patterns to `.gitignore` and add `.gitignore` to the repo to share with your team
	- ...or, add patterns to `.git/info/exclude` to keep them local (not shared with the team)
	- If you are in windows, be careful with line endings, for example `echo pattern >> .gitignore` will add a pattern that will never match

- Copy uncommitted changes from svn checkout:

    ```
    svn export path/to/svn/checkout path/to/git/repo
    ```


### Quick tips

- To get changes from Subversion upstream: `git svn rebase`
- To commit back to Subversion: `git svn dcommit`

	- This will replay each of the local commits, NOT one big chunk in one
	- And like all git commands, it has tons of options to fine tune

- Create a branch: `git branch name_of_branch`
- Switch to a branch: `git checkout name_of_branch`
- View the list of branches: `git branch`

### First impressions?

- Unlike the Subversion plugin in Eclipse, I like that the changes are shown only on the parent project, not on sub-projects.
- Unlike Bazaar and Subversion, git doesn't seem to like shortcuts like "st" or "ci", you have to spell out "status" and "commit". (Probably you can configure aliases though, but that's not the same.)
- Unlike Bazaar or Subversion, the command line client is very colorful, which could be nice, except in windows it can get corrupted quite easily (Sometimes a git command alters the cursor color). It also beeps the PC speaker when you do something invalid.

### References

- http://git-scm.com/course/svn.html
- http://www.vogella.de/articles/EGit/article.html
- http://wiki.titan2x.com/index.php?title=Git_cheat_sheet

