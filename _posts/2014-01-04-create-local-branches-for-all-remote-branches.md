---
layout: post
title: "Create local branches for all remote branches"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

If you ever want to create local branches for all remote branches in Git,
you can use this script:

```bash
#!/bin/bash -e
remote=${1:-origin}
for b in $(git branch -r | grep $remote/ | grep -v $remote/HEAD | cut -d/ -f2); do
    git show-ref --verify --quiet refs/heads/$b || git branch $b $remote/$b
done
```

It takes an optional command line argument:
the name of the remote,
or `origin` by default.
If a local branch with the same name already exists,
the script will leave it alone.
