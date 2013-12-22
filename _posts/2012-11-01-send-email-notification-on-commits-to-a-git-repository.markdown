---
layout: post
status: publish
published: true
title: Send email notification on commits to a git repository
date: 2012-11-01 11:56:58.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Two things to do: configure the email parameters and enable the hook.

To configure the email parameters, add a section in the `config` file of the Git repository like this:

<pre>
`[hooks]
    showrev = "git show -C %s; echo"
    emailprefix = "[git-projectname] "
    mailinglist = "jack@example.com,mike@example.com"
    envelopesender = noreply@example.com
`
</pre>

Also edit the `description` file of the project, it should contain a single line with the name of the project, for example `ProjectName`. This name will appear in both the subject and the message body, it will be `UNNAMED PROJECT` by default if you don't customize it.

As a result the subject of emails should look like this:

<pre>
`[git-projectname] ProjectName branch master updated. [the SHA1]
`
</pre>

To enable email sending, copy the sample hook script `hooks/post-receive.sample` to `hooks/post-receive` and edit it. The last line of the file is usually commented out by default. Remove the comment to enable sending emails. Also make sure the script is executable.
