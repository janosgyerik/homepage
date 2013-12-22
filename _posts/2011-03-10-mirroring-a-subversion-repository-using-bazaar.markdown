---
layout: post
status: publish
published: true
title: How to mirror a Subversion repository using Bazaar
date: 2011-03-10 11:36:12.000000000 +01:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
With Subversion alone you cannot mirror projects across repositories. Luckily with Bazaar this works out of the box.
<pre>
bzr co https://url_to_svn_repo/proj1/trunk proj1
cd proj1
bzr push https://your_other_repo/vendor/proj1/trunk
</pre>
Easy and intuitive. This will check out the entire history of the source repository and replay the changes one by one in the target repository. The repository where you push will have the same commits as the source repository, except the committer information, which will be lost. Also note that in this example we push to a Subversion repository with Bazaar. Both the source and target repositories are Subversion, the local Bazaar repository in the middle just bridges the gap.

Keeping the mirror up to date is simple:
<pre>
cd proj1
bzr up &amp;&amp; bzr push
</pre>
Keep in mind that you should NEVER commit to the mirror except with the bzr mirror script. It's best if you setup access controls to prevent regular developer accounts to commit to the mirror. Typically you want to branch from the mirror and work on the branch. You can even push your branch back to the source repository (to a new branch, not the original project). And when you do that, bazaar will replay only the changes in your branch, not the full history.

If you want to schedule the mirroring script in a Windows environment there may be some gotchas. I've seen error message dialogs popping up when bzr is trying to access Subversion repositories, for example:
<ul>
	<li>"the procedure entry point could not be located in the dynamic link library libsvn_subr-1.dll"</li>
	<li>"the ordinal 4540 could not be located in the dynamic link library libeay32.dll"</li>
</ul>
Even if the script works just fine after you dismiss these popups, it won't work in non-interactive mode (when running as a scheduled batch).

In my case the cause was the wrong libsvn_subr-1.dll library was found. Probably this can be solved by fixing library path settings. I simply uninstalled the Subversion client on the machine to remove the duplicate (and apparently incompatible) libraries.

Another gotcha you may have is with repository authentication. You can make it work with a correct authentication.conf file. The directory to put this file is in the output of the "bzr version" command, look for the line "Bazaar configuration".
