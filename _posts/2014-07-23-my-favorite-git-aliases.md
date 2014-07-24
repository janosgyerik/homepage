---
layout: post
title: "My favorite Git aliases"
categories:
- hacks
tags: []
---
{% include JB/setup %}

I don't like pending changes lying around in my workspace.
I like to commit often.
As a result, I run a lot of Git commands, all the time.
Git aliases are more than just a "nice feature".
They are vital to me.

### Short and sweet for high-frequency operations

If you do something often enough,
like multiple times *per minute*,
it's good to keep the aliases short and sweet:

```
[alias]
    st = status
    s = status -sb
    ci = commit
    co = checkout
    rev = merge --no-ff --no-commit
    br = branch
    ls = ls-files
    add = add -v
```

### Descriptive for low-frequency / critical / dangerous operations

For less frequent operations I prefer aliases with longer names that describe themselves loud and clear,
so I can know what they do without guessing or remembering.
To avoid tedious typing,
it's crucial to get tab-completion working well,
and using a unique prefix to make tab-completion easier.
(Sometimes tab-completion "just works" out of the box,
for example in Git Bash on Windows,
but sometimes it can be a bit tricky,
for example in [Mac OS X][1].)

#### Creating merge requests / pull requests

After a feature branch is done,
I just want to push the current branch and create it with the same name at the remote,
and setup the current branch to track that remote branch for possible further pushes.

    mrequest = push -u origin HEAD

#### Deleting unused branches

When you work on short-lived feature branches,
they tend to accumulate and clutter your repository.
This is a lazy, lossy shortcut:
it tries to delete *all* branches, if possible safely.
It will produce errors for branches that haven't been fully merged anywhere,
which can be nice reminders that "hey, I still have those branches to sort out..."

    delete-unused-branches = "!f() { git branch | xargs git branch -d; }; f"

#### Comparing the commits between branches

Sometimes I lose track of which branch contains which other branch.
This shortcut (an idea borrowed from [Bazaar][2]) shows the unique revisions in the current branch and the specified branch.

    missing = "!f() { git rev-list ..$1 --oneline | sed -e '1 iOnly in other:'; git rev-list $1.. --oneline | sed -e '1 iOnly in HEAD:'; }; f"

[1]: http://www.janosgyerik.com/enabling-git-shell-completions-in-osx/
[2]: http://bazaar.canonical.com/en/
