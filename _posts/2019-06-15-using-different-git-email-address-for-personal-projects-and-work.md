---
layout: post
title: "Using different Git email address for personal projects and work"
categories:
- hacks
tags: []
---
{% include JB/setup %}

In my `~/.gitconfig` I like to use an email address that includes the hostname,
for example on my laptop called `kronos` I have this:

    [user]
        name = Janos Gyerik
        email = info+kronos@janosgyerik.com

This is useful sometimes to locate the computer where I did a particular work,
which implies I must have a fully working environment.

However, for work on repositories of my day job,
I should use consistently my work email address.
On the occasion that I work from home,
I've been manually doing `git config user.email ...` in work repositories.

Unfortunately, sometimes I forget to do this,
a few times my personal email address leaked into work projects,
and I had to clean up later.

No more!
The not-so-recent [conditional includes][includes] feature to the rescue.

I added this in my `~/.gitconfig`:

    [includeIf "gitdir:~/dev/git/my-workplace/"]
        path = ~/dev/git/my-workplace/gitconfig

Created the file `~/dev/git/my-workplace/gitconfig` with the content:

    [user]
        email = my-work-email

And moved all my worktrees of work projects under `~/dev/git/my-workplace`.

[includes]: https://git-scm.com/docs/git-config#_includes
