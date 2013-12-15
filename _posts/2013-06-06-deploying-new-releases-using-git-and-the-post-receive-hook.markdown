---
layout: post
status: publish
published: true
title: Deploying new releases using Git and the post-receive hook
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 976
wordpress_url: http://www.janosgyerik.com/?p=976
date: 2013-06-06 21:39:30.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments:
- id: 2938
  author: Gabriel Patiño
  author_email: gepatino@gmail.com
  author_url: ''
  date: '2013-06-07 12:55:44 +0200'
  date_gmt: '2013-06-07 12:55:44 +0200'
  content: I was thinking of doing something like this, thanks for saving my time
    in the initial research!
---
I used to deploy new versions of my websites like this:
<ol>
	<li>ssh to the server</li>
	<li>cd to the website project directory (under version control)</li>
	<li>Update from VCS to the latest version</li>
</ol>
Doing this a few times is ok, but if you want to release frequently it's better to automate these steps. One way to do that is using the <code>post-receive</code> hook of Git like this:
<ol>
	<li>Setup a mirror repository on the server called "releases", with a branch called "beta"</li>
	<li>Make the deployment directory track the "beta" branch of the "releases" repository</li>
	<li>Setup a <code>post-receive</code> hook in the "releases" repository to trigger a script that updates the deployment directory (perform a <code>git pull</code> or <code>git checkout -f</code>)</li>
</ol>
The goal of this setup is to simplify the deployment steps to a single <code>git push</code> command from my local development/test environment to the releases repository. Then thanks to the <code>post-receive</code> hook, the pushed changes will be automatically propagated to the deployment directory, without manually logging in to the server.

First I created the releases repository from my deployment directory:

[gist id=5724915]

Next I created the <code>post-commit</code> hook:

[gist id=5725039]

(Hook scripts are in the <code>hooks/</code> directory of a Git repository, and must be executable.)

I typically use two branches: "beta" and "prod", and reuse the same "releases" repository for these. The above hook script checks the branch that is being pushed to, and checks if an upgrade script exists with the filename in the format "upgrade-BRANCHNAME.sh". The real upgrade scripts exist in my deployment directories, because I don't want to have too much logic inside the Git repository directory, I prefer that to be together with the project itself. In the Git repository root I put only symlinks to the real upgrade scripts.

Writing an upgrade script depends on your project. Here's an example from one of my Django sites:

[gist id=5745578]

The script is written in a way to be reusable in multiple of my Django sites, but you may need to adjust to match your typical deployment. The unset <code>GIT_DIR</code> is necessary, because it seems the variable is automatically set when the hook is executed, otherwise the <code>git pull</code> operation would result in the error:
<pre>remote: fatal: Not a git repository: '.'</pre>
Finally, I setup the releases remote in my local Git project:
<pre id="file-convert-deployment-to-release-mirror-sh-LC1"># go to the directory of my local project
cd ~/project/dir

# add the "releases" remote
git remote add releases ssh://user@example.com/home/user/path/to/project.git</pre>
With this setup in place, deploying a new version is as simple as:
<pre>git push releases master:beta</pre>
To make it even easier, I created aliases in my <code>.gitconfig</code>:
<pre>deploy-beta = push releases master:beta
deploy-prod = push releases master:prod</pre>
