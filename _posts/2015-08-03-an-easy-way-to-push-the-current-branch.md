---
layout: post
title: "An easy way to push the current branch"
categories:
- hacks
tags: []
---
{% include JB/setup %}

When working with feature branches,
a common task is pushing the current branch to GitHub so that you can create a merge/pull request from it.
 
To push a single branch, the textbook command is:
 
    git push -u origin branchname
 
The purpose of the `-u` is to setup the local branch to track the remote branch,
so that when you do `git status`,
it will tell you when your local branch and the remote have some differences.
For example, if you do a commit after a push,
`git status` will tell you that your local branch is ahead of the remote branch.
You only need to specify `-u` on the first push.
 
Typing the branch name can be a bit tedious.
Especially if you consider that when working with feature branches,
it's recommended to give long descriptive names to branches,
such as `cleaner-constraints-factory`.
Auto-completion by pressing tab while typing a branch name helps.
 
An alternative way to push the current branch,
whatever it's called, is this:
 
    git push -u origin HEAD
 
Interestingly, in case insensitive filesystems like Windows and OSX,
`git push -u origin head` works too.
Sometimes this can be more convenient than typing the name.
For example I often search for recent commands in Bash using the `Control-r` shortcut which,
with a keyword `ori` for example,
typically gives me back the last `git push -u origin HEAD` command.
 
But my favorite solution for pushing the current branch is to create an alias called `mr` (as in Merge Request) in my `~/.gitconfig`:
 
    [alias]
        mr = push -u origin HEAD
 
So I can do simply `git mr` for the same effect.
 
For this and other convenient aliases, see my [`.gitconfig`](https://github.com/janosgyerik/dotfiles/blob/master/.gitconfig) file.
 
