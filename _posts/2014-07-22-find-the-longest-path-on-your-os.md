---
layout: post
title: "Find the longest path on your OS"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Somebody asked me today:

> Is there a command to run to find the longest path + filename on your OS?

This should do it in UNIX or similar:

    find / | awk '{print length($0), $0}' | sort -n | tail

Or, a faster but less accurate way, if you have the `locate` command:

    locate / | awk '{print length($0), $0}' | sort -n | tail

Of course, you can only find paths that your user has read permission for.

In Windows, using Git Bash, for drive `C:` and `D:` and `E:`:

    find /c /d /e | awk '{print length($0), $0}' | sort -n | tail

However, this might not work for very long paths (> 260),
due to a limitation in the [Windows API][1].

[1]: http://msdn.microsoft.com/en-us/library/aa365247%28VS.85%29.aspx#maxpath
