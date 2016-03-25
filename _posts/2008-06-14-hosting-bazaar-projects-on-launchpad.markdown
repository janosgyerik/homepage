---
layout: post
status: publish
published: true
title: Hosting Bazaar projects on Launchpad
date: 2008-06-14 23:38:00.000000000 +02:00
categories:
- hacks
- musings
- software
tags: []
---
What is [Launchpad](https://launchpad.net/)?

> Launchpad is a free software hosting and development website. We make it easy to collaborate across multiple projects.

You can use it to:

- Develop your custom Ubuntu packages.
- Host your projects in the [Bazaar VCS](http://bazaar-vcs.org/).

All the projects you host on Launchpad will be public.
Write operations are authorized using SSH public keys. 

Setup steps:

1. Login to Launchpad, go to the `Code` tab. [This is mine](https://code.launchpad.net/~janos-gyerik)
1. Click on `Register a branch` button.
1. There are different hosting options. I chose `Hosted` to make Launchpad the primary location of my project. Projects of this type are updated with `bzr push` command.
1. Before you can push to Launchpad you need two things. 
1. Add your SSH public key. (Launchpad | Overview | Update SSH keys)
1. Login to Launchpad with Bazaar, for example: 

    ```
    bzr lp-login janos-gyerik
    ```

1. Go to the Bazaar project directory and do `bzr push` like this: 

    ```
    bzr push lp:~janos-gyerik/+junk/software-cache
    ```

After this, anybody will be able to checkout the project with :
```
bzr co lp:~janos-gyerik/+junk/software-cache
```
and authenticated users will be able to push or commit to it.
