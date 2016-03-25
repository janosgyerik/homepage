---
layout: post
status: publish
published: true
title: How to create a Subversion post-commit hook that runs in the background
date: 2012-02-12 13:29:13.000000000 +01:00
categories:
- Hacks
- software
tags: []
---
Recently I needed to do something in a post-commit Subversion hook that can take a long time, and unless the hook runs in the background, the repository would be unavailable until the hook completes.

The solution:

1. Create a separate script to perform the time-consuming task, the way you always create a script. The hook script (`hooks/post-commit`) will be like a wrapper, calling the main script.
1. In `hooks/post-commit`, start the main script in the background, and redirect all its output to `/dev/null`

For example `hooks/post-commit` will look like this:

```
./time-consuming-script.sh $* >/dev/null 2>/dev/null &
```

The catch here was redirecting error output (`2>/dev/null`). Without that, the process was not fully in the background.
By the another (small) catch is that the post-commit template file (`hooks/post-commit.tmpl`) should not exist, or have size 0, otherwise the real hook script is ignored.
