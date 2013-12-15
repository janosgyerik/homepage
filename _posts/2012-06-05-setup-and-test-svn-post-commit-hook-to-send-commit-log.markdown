---
layout: post
status: publish
published: true
title: Setup and test svn post-commit hook to send commit log
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 652
wordpress_url: http://www.janosgyerik.com/?p=652
date: 2012-06-05 07:08:40.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments:
- id: 572
  author: Andy B
  author_email: andyb@ubiquitous.co.uk
  author_url: ''
  date: '2012-12-10 19:11:38 +0100'
  date_gmt: '2012-12-10 19:11:38 +0100'
  content: "Hi, thanks for the above tut. I'm getting the following error: \r\n\r\nline
    50: mailer.py: command not found\r\n\r\nAny ideas on what it might be?"
- id: 627
  author: janos
  author_email: info@titan2x.com
  author_url: ''
  date: '2012-12-16 19:44:55 +0100'
  date_gmt: '2012-12-16 19:44:55 +0100'
  content: "This is most probably because your post-commit script does not specify
    the path to mailer.py. The article assumes that the post-commit script calls the
    mailer like this:\r\n\r\n\"$REPOS\"/hooks/mailer.py commit \"$REPOS\" $REV \"$REPOS\"/mailer.conf\r\n\r\nI
    updated the article now to clarify this point. Let me know if you still have issues."
- id: 1148
  author: Yasmina
  author_email: chitti@ai.sri.com
  author_url: ''
  date: '2013-01-25 23:01:57 +0100'
  date_gmt: '2013-01-25 23:01:57 +0100'
  content: "Thanks for this example! That saved me a lot of time. Now I looked everywhere
    for a documentation about formatting the subject line but did not find any. I
    don't get the examples in the file itself\r\nIn particular, I would like the commit_subject_prefix
    to automatically add the name of the repos. Right now I have to edit manually
    the mailer.conf (as I'm creating every single svn project from a script, I'd like
    the mailer.conf to reprensent that project without having the script editing that
    file or worse me manually). \r\n My search \"mailer.py format subject\" didn't
    return anything useful\r\nI tried to understand [maps] in that file but I failed
    every time I tried to make a \"regular expression\" that should map to the repos.\r\nThanks"
- id: 1159
  author: janos
  author_email: info@titan2x.com
  author_url: ''
  date: '2013-01-26 12:23:31 +0100'
  date_gmt: '2013-01-26 12:23:31 +0100'
  content: "I looked at the mailer.py script, it simple doesn't offer such option.
    I modified the script in a way that if you put <code>%(repos_basename)s</code>
    in <code>commit_subject_prefix</code> it will be replaced with the directory name
    of the repository when formatting the subject. For example if your repository
    is in <code>/path/to/test1</code> and <code>commit_subject_prefix = [svn-%(repos_basename)s]</code>,
    then the subject of commit emails will be prefixed with <code>[svn-test1]</code>\r\n\r\nI
    hope this answers to your need. The modified mailer script is here:\r\nhttps://raw.github.com/janosgyerik/svn-mailer/master/mailer.py\r\n\r\n<strong>UPDATE</strong>\r\nThis
    has been accepted by the Subversion project maintainers and committed into the
    trunk.\r\nhttp://svn.apache.org/repos/asf/subversion/trunk/tools/hook-scripts/mailer/mailer.py"
- id: 2087
  author: Nate
  author_email: curry@mosaicatm.com
  author_url: ''
  date: '2013-04-03 15:49:21 +0200'
  date_gmt: '2013-04-03 15:49:21 +0200'
  content: "I have followed your instructions but I am getting the following error
    when I try to run the hook script:\r\n\r\n  File \"/svn/repos/as/hooks/mailer.py\",
    line 971\r\n    class DifflibDiffContent():\r\n                                                ^\r\nSyntaxError:
    invalid syntax\r\n\r\nDo you have any ideas why?"
- id: 2117
  author: janos
  author_email: info@titan2x.com
  author_url: ''
  date: '2013-04-05 21:30:44 +0200'
  date_gmt: '2013-04-05 21:30:44 +0200'
  content: |-
    That's strange. Try to change line 971 like this:

    <pre>class DifflibDiffContent(object):</pre>

    or this:

    <pre>class DifflibDiffContent:</pre>

    I hope this helps. This is only a workaround, not a good solution. The problem must be something in your environment, maybe the version of python, or the version of Subversion's python bindings, or PYTHONPATH, I don't really know... Normally this mailer script should work without hacking it like this.
---
It's been a while since I've done this, and the tools have evolved since then. Follow these steps to configure, test first, and in the end activate the hook.
<h3>Get the sample mailer script</h3>
This may depend on your distro/OS, usually there is a package called <code>subversion-tools</code>.
<pre>cd $REPOROOT
cp /path/to/subversion-tools/hook-scripts/mailer/mailer.py hooks
cp /path/to/subversion-tools/hook-scripts/mailer/mailer.conf.example mailer.conf</pre>
<h3>Edit <code>mailer.conf</code></h3>
In my case I only needed to override/uncomment these settings:
<pre>mail_command = /usr/sbin/sendmail
commit_subject_prefix = [svn-myproject]
from_addr = noreply@mydomain.com
to_addr = commits-myproject@mydomain.com  # this is a mailing list</pre>
<h3>Pick a revision number for testing</h3>
You can pick any revision, just make sure it exists. You can find the latest revision like this:
<pre>svnlook info $REPOROOT
svnlook youngest $REPOROOT</pre>
<h3>Test the hook script</h3>
Confirm that the last line of the hook script template (<code>$REPOROOT/hooks/post-commit.tmpl</code>) is the same as this:
<pre>"$REPOS"/hooks/mailer.py commit "$REPOS" $REV "$REPOS"/mailer.conf</pre>
This is the default on recent versions of Linux. It uses the absolute path to <code>mailer.py</code> and <code>mailer.conf</code>, at the locations where we copied them in an earlier step. The correct path is important, otherwise you will get errors like "mailer.py: command not found"

Run the hook script:
<pre>sh $REPOROOT/hooks/post-commit.tmpl $REPOROOT $REVNO</pre>
where <code>$REVNO</code> is some revision number (for example the one returned by <code>svnlook youngest</code>). After this you should receive an email with the details of the commit, or some error message should appear in the terminal that you can debug.
<h3>Activate the hook</h3>
<pre>cd $REPOROOT
chmod +x hooks/post-commit.tmpl
mv hooks/post-commit.tmpl hooks/post-commit</pre>
That's it!  Note that it is important to remove <code>hooks/post-commit.tmpl</code> file (or truncate to 0 size), otherwise the real hook script (without .tmpl extension) will be ignored. The hook script should be executable, otherwise Subversion will not run it.
