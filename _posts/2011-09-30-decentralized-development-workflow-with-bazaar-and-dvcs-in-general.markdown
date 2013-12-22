---
layout: post
status: publish
published: true
title: Decentralized development workflow with Bazaar and DVCS in general
date: 2011-09-30 02:33:04.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
Many of my friends are getting into Bazaar or other distributed version control these days.

Bazaar is in the same class as git and mercurial = distributed version control software or DVCS. This class is significantly more powerful compared to traditional version control software (VCS) such as Subversion. The feature set of DVCS is often a superset of VCS, so usually you can do everything with DVCS that you could do with VCS, and a whole lot more.

The most significant consequence of being "distributed" is that a "checkout" is never "just a checkout", it's a whole repository, with full history.

There are two checkout commands in Bazaar, "checkout" and "branch", for two different workflows.

You use "bzr checkout" for a centralized workflow, like the one used with Subversion. That is, there is a central repository that all developers commit to, they checkout the project with "bzr checkout", and when they commit with "bzr commit" it gets written to the central repository. To merge the changes by other developers, you do "bzr update". And when you commit, if other developers had commits while you were working, then you have to do "bzr update" first before you can do "bzr commit". In this workflow bazaar works exactly the same way as Subversion, with the added benefits of having the entire history on your computer, so you can do diff and log without hitting the network.

You use "bzr branch" for a de-centralized workflow, radically different from Subversion. The repository you branched from is called the "parent" branch and is remembered for reference, but your local branch is not bound to it in any way. Practically it means that all your commits will be local only, to your local branch, and not to the parent. And since your local branch is its own master, "bzr update" will do nothing, because you are in fact always up to date ;-) To merge changes done by other developers in the parent, use "bzr rebase". This will basically rewind your local branch to the revision that you branched from, replay the changes made by others in the parent, and finally replay your own changes. The same way as with "svn update" (or "bzr update"), conflicts may happen during this operation. After resolving conflicts, you can continue with "bzr rebase-continue".

Side note: the "rebase" command is not a standard command in Bazaar, it is in the "rewrite" plugin. If you don't have the plugin you can accomplish basically the same with "bzr merge", but "bzr rebase" is a tad bit cleaner.

When your changes are ready to be merged into the parent branch, you push your branch to a place where your team can access it, and the manager of the parent branch can merge from it and commit into the parent branch. In the end, there is no practical difference between the "checkout" and "branch" workflows, the end result is the same. As such, with a DVCS there is little reason to use the "checkout" workflow.

Being disconnected from a central branch gives you a lot of freedom, for example you can create experimental branches of your own without affecting your team members, you can hack and commit even when you don't have internet, and of course have the entire project history with you at all times. There is also no central repository server that may crash, no need to setup one, no need to manage user accounts and authentication. Backup is almost unnecessary, if you have enough developers in your team, somebody will always have a copy of the repository so you could lose a few latest revisions only. Once you get comfortable with a DVCS, you will find that the tool doesn't get in your way, you can happily slice and dice repositories. Branching and merging of branches is straightforward and perfectly natural with any DVCS, there is none of the black magic Subversion needs to have that working.

You can read more about this and other variations of the decentralized workflow in the Bazaar documentation. I use mainly Bazaar for its intuitive simplicity, Git with Eclipse projects due to a lack of a good Bazaar plugin. The various DVCS certainly have some differences, but the essence is the same, and whichever you use, it will make you a happier developer with less stress.
