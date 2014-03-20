---
layout: post
title: "Easy way to git push the current branch"
categories:
- hacks
tags: []
---
{% include JB/setup %}

When working with feature branches, I tend to use long-ish branch names. Then when I push to a remote for the first time (for code review), it's a bit tedious to spell out the full name of the branch, for example:

    git push -u origin cool-new-feature

An equivalent and more ergonomic way:

    git push -u origin HEAD

In case insensitive systems like Windows and Mac OS X this works too and even easier:

    git push -u origin head
