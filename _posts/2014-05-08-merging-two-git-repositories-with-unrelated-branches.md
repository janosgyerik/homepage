---
layout: post
title: "Merging two Git repositories with unrelated branches"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Suppose you have a Git repository for your [Jekyll][1] blog.
Suppose you have another Git repository for your [Octopress][2] blog.
Suppose you realize they have similar text content,
and you prefer to have their branches in the same repository.
How to merge the two repositories into one,
while preserving the unrelated commit histories?

One way to do it:

- Pick one of the repositories where you would like to have all branches.
  Let's call this repository **repoA**, and the other one **repoB**.
- For each branch you want to copy from **repoB**,
  create an orphan branch, remove all content from it,
  and merge from the branch in **repoB**.

Git commands:

    # create a clean new clone of repoA
    git clone url_to_repoA /tmp/work
    cd /tmp/work

    # register repoB and fetch its branches
    git remote add repoB url_to_repoB
    git fetch repoB

    # create an unrelated (orphan) branch, wipe it clean, merge from repoB/master, and push to `origin`
    git checkout --orphan other-master
    git rm -fr .
    git merge repoB/master
    git push origin HEAD

[1]: http://jekyllrb.com/
[2]: http://octopress.org/
