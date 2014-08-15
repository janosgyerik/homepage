---
layout: post
title: "Checklists from the book: Code Complete"
categories:
- musings
- hacks
tags: []
---
{% include JB/setup %}

I [blogged about Code Complete before][1].
It's awesome. Really.

What's also extremely awesome is that the author has compiled *checklists* based on the chapters,
that should help you organize and keep track of the various construction stages of your software projects.
The checklists are publicly available on [the author's website][2],
you have to create an account to access the content but it's FREE.

I find these checklists **absolutely invaluable** for doing proper requirements analysis,
and designing software architecture.
To make it easy to use in my projects,
I'm in the process of copying the checklists to a [GitHub repository][3]
as a collection of plain text files in markdown format.

In every new project, I start by making a copy of these files,
and then go through the checklists during the construction process.
You can do this easily using the following `git` commands:

    # add a remote called "checklists", pointing to my repo
    git remote add checklists https://github.com/janosgyerik/software-construction-notes

    # get the commits of the "master" branch only
    git fetch checklists master

    # get the "checklists" folder from the "master" branch
    git checkout checklists/master checklists

    # commit the files in your project
    git commit -m 'added checklists files from code complete'

Happy architecting ;-)

*Note: so far I copied up to chapter 11. Little by little I will copy the rest too. Or, feel free to send me pull requests!*

*Note 2: the checklists are copyrighted material and belong to the author, but FREE to use as long as you include the following notice:*

> This material is copied and/or adapted from the Code Complete 2 Website at cc2e.com. This material is Copyright (c) 1993-2004 Steven C. McConnell. Permission is hereby given to copy, adapt, and distribute this material as long as this notice is included on all such materials and the materials are not sold, licensed, or otherwise distributed for commercial gain.

[1]: http://www.janosgyerik.com/code-complete/
[2]: http://www.cc2e.com/
[3]: https://github.com/janosgyerik/software-construction-notes
