---
layout: post
title: "You can roll back anything you had on index with Git"
categories:
tags: []
---
{% include JB/setup %}

http://stackoverflow.com/questions/21099974/anyway-to-roll-back-working-directory-after-git-rm-r-f/21100244#21100244

Based on the linked answers, everything that you added to index with git add should be possible to recover with:

git fsck --lost-found
This will create the files that you added to the index but never committed in the .git/lost-found/other directory. The filenames will be SHAs instead, so you will have to look inside one by one to know which is which.

