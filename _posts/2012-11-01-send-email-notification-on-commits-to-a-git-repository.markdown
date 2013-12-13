---
layout: post
status: publish
published: true
title: Send email notification on commits to a git repository
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 818
wordpress_url: http://www.janosgyerik.com/?p=818
date: 2012-11-01 11:56:58.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Two things to do: configure the email parameters and enable the hook.

To configure the email parameters, add a section in the <code>config</code> file of the Git repository like this:

<pre><code>[hooks]
    showrev = "git show -C %s; echo"
    emailprefix = "[git-projectname] "
    mailinglist = "jack@example.com,mike@example.com"
    envelopesender = noreply@example.com
</code></pre>

Also edit the <code>description</code> file of the project, it should contain a single line with the name of the project, for example <code>ProjectName</code>. This name will appear in both the subject and the message body, it will be <code>UNNAMED PROJECT</code> by default if you don't customize it.

As a result the subject of emails should look like this:

<pre><code>[git-projectname] ProjectName branch master updated. [the SHA1]
</code></pre>

To enable email sending, copy the sample hook script <code>hooks/post-receive.sample</code> to <code>hooks/post-receive</code> and edit it. The last line of the file is usually commented out by default. Remove the comment to enable sending emails. Also make sure the script is executable.