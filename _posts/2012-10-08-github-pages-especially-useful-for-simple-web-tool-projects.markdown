---
layout: post
status: publish
published: true
title: GitHub pages especially useful for simple web tool projects
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 781
wordpress_url: http://www.janosgyerik.com/?p=781
date: 2012-10-08 19:01:25.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
One of the great features of GitHub is free hosting for your projects. All you have to do is put your web content in a branch named gh-pages and push the branch to GitHub.

This is especially useful for simple web tool projects that contain only html/js/css/images that are ready to use without any setup, that is, when the master branch is <em>itself</em> the web content. For example, your jquery plugin or a CSS framework. In this case generating or updating gh-pages is a matter of this simple two-liner:
<pre>git branch -f gh-pages
git push origin gh-pages</pre>
After a few minutes, the branch will be visible at the URL:
<pre>http://USERNAME.github.com/REPONAME/</pre>
<strong>Be careful though:</strong> if you already have a gh-pages branch, the first command above will completely wipe it out! This script is useful really only in the special case when your master branch is itself the web content.

GitHub provides several ways to create beautiful web content. More details in the docs:

<a href="http://pages.github.com/">http://pages.github.com/</a>
