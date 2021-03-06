---
layout: post
status: publish
published: true
title: Deploying new releases using Git and the post-receive hook
date: 2013-06-06 21:39:30.000000000 +02:00
categories:
- hacks
- software
tags: []
---

I used to deploy new versions of my websites like this:

- `ssh` to the server
- `cd` to the website project directory (under version control)
- Update from VCS to the latest version

Doing this a few times is ok, but if you want to release frequently it's better to automate these steps. One way to do that is using the `post-receive` hook of Git like this:

1. Setup a mirror repository on the server called "releases", with a branch called "beta"
2. Make the deployment directory track the "beta" branch of the "releases" repository
3. Setup a `post-receive` hook in the "releases" repository to trigger a script that updates the deployment directory (perform a `git pull` or `git checkout -f`)

The goal of this setup is to simplify the deployment steps to a single `git push` command from my local development/test environment to the releases repository. Then thanks to the `post-receive` hook, the pushed changes will be automatically propagated to the deployment directory, without manually logging in to the server.

First I created the releases repository from my deployment directory:

<script src="https://gist.github.com/janosgyerik/5724915.js"></script>

Next I created the `post-receive` hook inside `~/repos/git/releases/project.git/hooks`:

<script src="https://gist.github.com/janosgyerik/5725039.js"></script>

Make sure the hook script file is executable (`chmod +x` on it).

I typically use two branches: "beta" and "prod", and reuse the same "releases" repository for these. The above hook script checks the branch that is being pushed to, and checks if an upgrade script exists with the filename in the format `upgrade-BRANCHNAME.sh`. The real upgrade scripts exist in my deployment directories, because I don't want to have too much logic inside the Git repository directory, I prefer that to be together with the project itself. In the releases Git repository root I put only symlinks to the real upgrade scripts.

That is, the files I added or modified inside `~/repos/git/releases/project.git` are like this:

    ├── hooks
    │   ├── post-receive
    │   └── ...
    ├── upgrade-beta.sh -> ~/websites/project/upgrade-beta.sh
    └── upgrade-prod.sh -> ~/websites/project/upgrade-prod.sh

Writing an upgrade script depends on your project. Here's an example from one of my Django sites:

<script src="https://gist.github.com/janosgyerik/5745578.js"></script>

The script is written in a way to be reusable in any of my Django sites, but you may need to adjust to match your typical deployment. The unset `GIT_DIR` is necessary, because it seems the variable is automatically set when the hook is executed, otherwise the `git pull` operation would result in the error:

    remote: fatal: Not a git repository: '.'

Finally, I setup the releases remote in my local Git project:

    # go to the directory of my local project
    cd ~/project/dir
    # add the "releases" remote
    git remote add releases ssh://user@example.com/home/user/path/to/project.git

With this setup in place, deploying a new version is as simple as:

    git push releases master:beta

To make it even easier, I created aliases in my `.gitconfig`:

    deploy-beta = push releases master:beta
    deploy-prod = push releases master:prod
