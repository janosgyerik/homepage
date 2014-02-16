---
layout: post
title: "Easy way to delete unused local branches in Git"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

If you use a new feature branch for every new feature you develop,
you'll end up with a lot of unused local branches.
The laziest way to delete all unused branches safely except `master`:

    git checkout master
    git branch | xargs git branch -d

This is safe, because `git branch -d` only deletes branches that have been merged into another branch,
and it won't delete the current branch, in this case `master`.

But it's lazy,
because it will produce error messages for every branch that cannot be deleted,
and for the `* master` line in the output of `git branch`:

    error: The branch 'cool-feature' is not fully merged.
    error: branch '*' not found.
    error: Cannot delete the branch 'master' which you are currently on.

If you want to be more accurate,
you can exclude branches that have not been merged into `master`:

    git checkout master
    git branch --merged master | xargs git branch -d

And if you want to be *really* accurate,
then you can exclude `master` too:

    git checkout master
    git branch --merged master | grep -v ^\* | xargs git branch -d
