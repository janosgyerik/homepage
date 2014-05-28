---
layout: post
title: "Downloading a subdirectory from GitHub without history"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Ever wanted to get just a subdirectory of a large project from GitHub without history?
Thanks to GitHub supporting Subversion clients,
and thanks to the `svn` command line client if you have it,
you can,
very easily:

1. Browse to the project and subdirectory you want to clone, for example:
    https://github.com/xbmc/xbmc/tree/master/docs

2. Replace `tree/master` with `trunk` in the URL,
    and run `svn export` on it, for example:

        svn export https://github.com/xbmc/xbmc/trunk/docs

This will create a local directory `docs`,
with the content of the subdirectory on GitHub,
without version control history.

You can give a different name to the local directory with an extra command line argument, for example:

    svn export https://github.com/xbmc/xbmc/trunk/docs /tmp/xbmc-docs

<div class="text-muted">
Inspired by this question on #stackoverflow: <a href="http://stackoverflow.com/a/18324458/641955">Download a single folder or directory from a GitHub repo</a>
</div>
