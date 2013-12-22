---
layout: post
status: publish
published: true
title: Using git with Eclipse 2
date: 2011-08-14 18:58:37.000000000 +02:00
categories:
- Musings
- Software
tags: []
comments: []
---
I've been using git with Eclipse for about a month now.
<ul>
	<li>git svn rebase does not work in Eclipse gui. All the gui methods I tried say the repo is up to date, even though it's not.</li>
	<li>Synchronize workspace was very slow the few times I tried, so I don't use it anymore.</li>
	<li>Not sure yet how to work with maven sub-projects. It seems for all sub-projects I have to do "share project" to associate with git. Otherwise I don't get the git actions in the Team menu of sub-projects.</li>
</ul>
About git on the command line, and in general...

<ul>
	<li>Branch switching is nice and easy, quite fantastic actually.</li>
	<li>I'm sure in speed benchmarks git will always beat all other VCS. In practice, I don't notice a difference, at all.</li>
	<li>git svn dcommit is nice, git will commit each commit one by one. Not sure bzr can do this so easily.</li>
	<li>The git shell in windows is great! Since cygwin is not an option for me, the git bash shell is a fantastic alternative.</li>
	<li>Browsing repository history is not nearly as easy and intuitive as bzr.</li>
	<li>SHA as revision identifier is uncomfortable to use. I need to grab for the mouse all the time for copy-and-paste.</li>
	<li>Before trying git the staging area looked the most attractive feature to me, with the ability to commit only hunks. In practice, I hardly ever want to commit specific hunks only, and it's a bad practice anyway to commit untested code. Overall, having to stage every modification is not practical for me.</li>
</ul>

Overall, I really like git. I will use it when it's the right tool for a job, but for now I will continue to use bzr for my personal (and admittedly light-weight) projects.
