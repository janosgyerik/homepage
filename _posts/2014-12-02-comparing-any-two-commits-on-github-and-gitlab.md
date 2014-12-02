---
layout: post
title: "Comparing any two commits on GitHub and GitLab"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Recently I wanted to preserve a diff between two branches.
If it's a pull request, that's easy,
as pull requests normally remain visible even if closed.
But I didn't want to create one just for preserving a diff.

Luckily, GitHub and GitLab both provide a way to view the diff between any two branches, using this URL format:

    https://github.com/USER/PROJECT/compare/SOURCE...TARGET
    https://gitlab.example.com/USER/PROJECT/compare/SOURCE...TARGET

For example:

    https://github.com/janosgyerik/bd/compare/simplify...master

In fact, the SOURCE and TARGET don't have to be branches,
they can be any *ref*, for example commit SHA,
even short versions, like this:

    https://github.com/janosgyerik/bd/compare/1e0a...636b

Just be careful,
if you shorten too much,
they might not remain unique forever!
