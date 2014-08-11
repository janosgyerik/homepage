---
layout: post
title: "Diff any two files anywhere in a Git repository"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

It's very handing in Git that you can `diff` any file with any other,
anywhere in the repository.
Here are some examples.

Grab a sample repository:
```
git clone git@github.com:janosgyerik/demo /tmp/demo
cd /tmp/demo
```

Difference between file in working tree and the same file in another branch:

    git diff HEAD:sh/hello.sh another:sh/hello.sh

Diff `sh/hello.sh` in another branch with the same file in the work tree:

    git diff another:sh/hello.sh sh/hello.sh

Keep in mind that the *direction* of diffing is important:
`diff a b` shows the changes going from `a` to `b`.
So for example if `b` has extra lines compared to `a`,
then `diff a b` will show that lines were added,
while `diff b a` will show that lines were deleted.

To do the same diff as earlier but in the other direction:

    git diff HEAD:sh/hello.sh another:sh/hello.sh

Notice that you have to prefix the path in the working tree with `HEAD:`,
or another 

All these work because `git diff` works with *blobs*,
strictly speaking "endpoints"
and all these different formats uniquely identify blobs.

Diff `sh/hello.sh` in another branch with the file in the work tree:

    git diff another:sh/hello.sh HEAD:sh/hello.sh

Difference between file

git diff remotename/branchname:remote/path/file1.txt local/path/file1.txt
This will show the differences going from the remote file to the local file. Or to view the differences in the other direction:

git diff HEAD:local/path/file1.txt remotename/branchname:remote/path/file1.txt
Basically you can diff any two files anywhere using this notation:

git diff ref1:path/to/file1 ref2:path/to/file2
where ref1 and ref2 could be branch names, remotename/branchname, or even commit SHAs.


<div class="text-muted">
Inspired by the question on #stackoverflow: <a href="http://stackoverflow.com/questions/21101572/git-diff-between-file-in-local-repo-and-origin/21101644#21101644">git diff between file in local repo and origin</a>
</div>
