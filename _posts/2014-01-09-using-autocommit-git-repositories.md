---
layout: post
title: "Using autocommit Git repositories"
categories:
tags: []
---
{% include JB/setup %}
http://stackoverflow.com/questions/20832697/two-git-repos-for-the-same-files/20834196#20834196

I don't think your setup is bizarre. I know at least one guy who has an emacs hook to commit his repo every time he saves a file (he's an xemacs maintainer btw).

There is a perfectly clean way of doing what you want, thanks to the `GIT_DIR` and `GIT_WORK_TREE` variables. For example, given any Git repository, you can setup an "autocommit" repository that's independent from the "official" repository that you push to GitHub.

### Initializing an autocommit repo

    cd /path/to/project
    export GIT_DIR=/tmp/autocommit.git
    export GIT_WORK_TREE=$PWD
    git init
    git add .
    git commit -m init

### Updating an autocommit repo = autocommit.sh

    #!/bin/sh
    export GIT_DIR=/tmp/autocommit.git           ## same path as you initialized
    export GIT_WORK_TREE=/path/to/real/project   ## same path as you initialized
    git add --all                                ## --all takes care of deletes too
    git commit -m auto-commit

That's it. The two repos don't even need to know of the existence of the other.

**UPDATE**

To answer to your follow-up questions:

> if I used GIT_DIR to create a second repo in the same directory, would I also have to export GIT_DIR=/tmp/.git before committing my manual commits? 

For your manual commits, don't use these variables at all. Use the Git repository as you normally would. The autocommit repo is completely independent, it doesn't affect your regular repo in any way. In short, no setup needed for your regular use.

> I work mostly on Windows and I'm not sure if the GIT_DIR environment variable will work - can I use git --git-dir=... <command> just as effectively?

I suggest to wrap the autocommiter into its own script, where it can setup the environment variables it needs. Since you have multiple autocommit repos, maybe you want to create a common `autocommit.sh` that takes parameters, which you call from wrapper scripts, one per repo. For example. This is just one way of doing it.
 		
> is it possible to change the git directory of an existing repo? Is it as easy as renaming the .git folder? Because I already have four or five projects auto-committing to the default repo instead of autocommit.git and I would like to change these.

I suggest to keep your regular repo as is. Create new clones for autocommit like this:

    git clone --bare /path/to/proj1 /my/autocommits/proj1.git

http://stackoverflow.com/a/20834196/641955
