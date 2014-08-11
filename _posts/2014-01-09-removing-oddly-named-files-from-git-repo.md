---
layout: post
title: "removing oddly named files from git repo"
categories:
tags: []
---
{% include JB/setup %}
http://stackoverflow.com/questions/20860731/trouble-removing-oddly-named-files-from-github-repo/20860821#20860821

It's not Git that has problem removing that file, the problem is telling it to Git the right way in the shell. Due to the special symbols this is tricky, but you can do it like this:

    git rm $(echo -e "path/to/\001\006@@x\021@8")

Btw, in your specific case, and based on the output of your `git status`, you could actually skip the `git rm` and simply `git commit -a`. The `-a` or `--all` flags makes `git` commit all pending changes, including unstaged changes and deleted files.


http://stackoverflow.com/a/20860821/641955
