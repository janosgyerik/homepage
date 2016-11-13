---
layout: post
title: "Analyzing projects before creating pull requests, round 2"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

After playing for a few days with the [pre-push hook to analyze changed files in a branch](/analyzing-projects-before-creating-pull-requests),
I found it pretty useful. Despite its obvious shortcomings,
most notably the slowness of running one analysis for each file.

So I decided to take it a bit further:

- Forked [`sonarlint-cli`](https://github.com/janosgyerik/sonarlint-cli/tree/multi-src) temporarily to make it accept multiple `--src` and `--tests` options.
  With this change, now it's possible to analyze all the files of the changeset in a single analysis,
  so the hook can run much faster.

- Now it's possible to analyze test sources.

- Added helper scripts to make it easier to install the custom built `sonarlint` and the hooks.

- Added a `pre-commit` hook, which works very similarly to the `pre-push` hook,
  but it looks at the changeset in what is about to be committed, instead of a branch.

As before, see more details in the [README](https://github.com/janosgyerik/sonarlint-git-hooks).

Something that might be a big remaining weakness is these assumptions:

- Source files must match the pattern `src/`
- Test files must match the pattern `src/` and `test` or `Test`

These assumptions should be just fine for most Java projects,
but I'm not sure about others.
It would be great to have something that works for a wider audience,
but I won't know what exactly needs to be done until I get some feedback.
That's your job ;-)

Let me know what you think. If you have difficulties or find something strange,
feel free to [create an issue on GitHub](https://github.com/janosgyerik/sonarlint-git-hooks/issues).
