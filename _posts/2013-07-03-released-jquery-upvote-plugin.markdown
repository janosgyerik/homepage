---
layout: post
status: publish
published: true
title: Released jQuery Upvote plugin
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 1036
wordpress_url: http://www.janosgyerik.com/?p=1036
date: 2013-07-03 22:33:36.000000000 +02:00
categories:
- Hacks
- News
- Software
tags: []
comments:
- id: 3183
  author: kanakiyajay
  author_email: kanakiyajay@yahoo.com
  author_url: ''
  date: '2013-09-02 06:42:00 +0200'
  date_gmt: '2013-09-02 06:42:00 +0200'
  content: |-
    Seems like the link to http://janosgyerik.github.io/jquery-upvote/ is broken.
    Might be a problem with gh-pages.
- id: 3184
  author: Janos Gyerik
  author_email: janos.gyerik@gmail.com
  author_url: ''
  date: '2013-09-02 16:00:00 +0200'
  date_gmt: '2013-09-02 16:00:00 +0200'
  content: Ouch, so I broke it... It's more or less back now, except some styling
    issues that got broken with the upgrade of bootstrap upstream. Thanks for pointing
    out!
---
Published my first ever jQuery plugin just now: jQuery Upvote

<a href="http://plugins.jquery.com/upvote/">http://plugins.jquery.com/upvote/</a>

The plugin simply generates a voting widget like the one used on Stack Exchange sites:
<ul>
	<li><span style="line-height: 14px;">You can either upvote or downvote, not both at the same time</span></li>
	<li>You can cancel an upvote or downvote by clicking again</li>
	<li>The count is update accordingly</li>
	<li>You can star (= favorite) and unstar</li>
	<li>A callback method is fired on any update (upvote, downvote, star, and their reverse)</li>
</ul>
See it in action: <a href="http://janosgyerik.github.io/jquery-upvote/">http://janosgyerik.github.io/jquery-upvote/</a>

Documentation: <a href="https://github.com/janosgyerik/jquery-upvote/blob/master/README.md">https://github.com/janosgyerik/jquery-upvote/blob/master/README.md</a>

I've been needing this BADLY to add voting features on <a href="http://www.bashoneliners.com/">http://www.bashoneliners.com/</a>. Hopefully that's coming soon too ;-)
