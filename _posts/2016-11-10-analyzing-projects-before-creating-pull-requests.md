---
layout: post
title: "Analyzing projects before creating pull requests"
categories:
- hacks
tags: []
---
{% include JB/setup %}

I'm not the best user of SonarLint (yet).
For example, it's not my habit yet to verify using [SonarLint](http://www.sonarlint.org/) my changes before every commit.
And sure enough, I tend to add new issues,
which will end up in [SonarQube](http://www.sonarqube.org/) later,
and eventually I'll have to fix them before the project can be released
(must pass the [Quality Gate](http://www.sonarqube.org/quality-gates-shall-your-projects-pass/)).

So I came up with a crutch, or rather, a stick,
a Git pre-push hook to slap my wrists if I try to push something prematurely.
That is, before every `git push`,
it would be great to analyze all the files I touched in my branch,
and prevent the push if there are issues.
The key pieces to this:

- The [`sonarlint`](http://www.sonarlint.org/commandline/) command line tool
- The pre-push hook in `.git/hooks` in the work tree
- The `git diff --name-only origin/master... --diff-filter=AM` command to get the list of changed files: file names added or modified since `origin/master`. Notice the `...` after `origin/master`, it's important, to only include files by the new commits in the current branch.

Highly experimental,
but in any case,
the hook is on [GitHub](https://github.com/janosgyerik/sonarlint-git-hooks).
The readme explains how to use it, and the many limitations.
