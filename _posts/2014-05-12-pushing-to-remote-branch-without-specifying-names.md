---
layout: post
title: "Pushing to remote branch without specifying names"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Pushing the current branch without specifying its name is easy:

    # push current branch without specifying its name
    git push origin HEAD

Git figures out the name of the current branch,
as its tip and `HEAD` are pointing at the same thing.
For example if you're on a branch named `somebranch`:

- If `somebranch` doesn't exist on `origin`, it will be created
- If `somebranch` already exists on `origin`, it will be updated, if needed

What if you don't want to name the remote explicitly?
If the current branch is tracking a branch on a specific remote,
how to make Git push to that remote?

Unfortunately there's no easy trick like `HEAD` for the branch name.
But it's possible to get the remote's name with `git rev-parse`:

    # get the current tracking remote/branch name
    git rev-parse --abbrev-ref --symbolic-full-name @{u}
    
This will output in the format `origin/somebranch`,
from which you can extract the remote's name with a little Bash:

    refname=$(git rev-parse --abbrev-ref --symbolic-full-name @{u})
    IFS=/ read -a arr <<< "$refname"
    remote=${arr[0]}
    branch=${arr[1]}

Now you can push to the right remote with:

    git push $remote $branch
    # or like this:
    # git push $remote HEAD

<div class="text-muted">
Inspired by this question on #stackoverflow: <a href="http://stackoverflow.com/q/23573968/641955">How to push a branch of unknown name to it's remote every time?</a>
</div>
