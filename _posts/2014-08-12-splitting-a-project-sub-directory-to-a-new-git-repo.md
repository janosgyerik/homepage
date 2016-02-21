---
layout: post
title: "Splitting a project sub-directory to a new Git repo"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Recently I realized that a sub-directory in a Git project
would be better as an independent project.
Luckily this is such a common need,
Git has a nice command to make this easy called `subtree split`.
It creates a new branch in the project,
with only the commits that involved the specified sub-directory.

Let's say you have a project with a sub-directory called `plugins/media` and you want that in an independent repository:

    git subtree split -P plugins/media -b media

This will put all commits related to `plugins/media` in a new branch named `media`. You can confirm the result with `git log media`.

Next, create the target repository, for example on GitHub,
or locally:

    git init --bare /tmp/proj-media.git

Create a remote for the repository,
add a remote for it,
and push the `media` branch to the remote with the name `master`:

    git remote add proj-media /tmp/proj-media.git
    git push proj-media media:master

Note that the original repository is unchanged:
the `plugins/media` directory still exists, untouched.
Most probably you want to replace the directory with the new project as a submodule:

    git rm -r plugins/media
    git submodule add url_to_repo plugins/media
    git commit -m 'replaced plugins/media with a submodule'

For more on submodules, see this chapter in the Pro Git book:

http://git-scm.com/book/en/Git-Tools-Submodules
