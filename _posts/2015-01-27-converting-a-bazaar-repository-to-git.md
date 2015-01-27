---
layout: post
title: "Converting a Bazaar repository to Git"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Using *fastimport/fastexport* is a great way to migrate between version control systems.
Git already comes with fastimport built in.
As of Bazaar 2.6,
at least on Mac OS X, this is not the case.
The solution is not trivial, 
and the details are important.

To install the fastimport module,
I used a *virtualenv* of Python 2.x.
(I tried Python 3.x at first but that didn't work out.)

### Setup a virtualenv and dependencies

The simplest way to install `fastimport` is using `pip`.
To avoid cluttering your system (or even just your user home directory, when using the `--user` option),
it's good to create a throw-away virtualenv.

There is just one caveat:
if you already have `bzr` in your system,
it won't be aware of the fastimport library installed in the virtualenv.
A simple and clean way to fix that is installing `bzr` too inside the virtualenv.
This is easiest to do using Python 2.x (I tried with 2.7),
it's quite nightmarish using Python 3.x.

Create the virtualenv using Python 2.7:

    virtualenv-2.7 --distribute venv

Activate the virtualenv:

    . venv/bin/activate

Install Bazaar and fastimport:

    pip install bzr fastimport

### Migrate from Bazaar to Git

Create an empty Git repository, anywhere:

    git init /tmp/gitrepo

Assuming a Bazaar standalone branch is in `/tmp/bzrrepo`:

    bzr fast-export /tmp/bzrrepo | GIT_DIR=/tmp/gitrepo/.git git fast-import

Notice the `/.git` added to the repository path when setting `GIT_DIR`.

The step importing to Git doesn't create the files in the working directory,
it only updates the repository itself.
To checkout the files:

    cd /tmp/gitrepo
    git checkout -f

And that's it! Now you can get out of the virtualenv:

    deactivate

<div class="text-muted">
Inspired by this question on #stackoverflow: <a href="http://stackoverflow.com/q/19930832/641955">Converting big bzr repository to git, what to expect?</a>
</div>
