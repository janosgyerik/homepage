---
layout: post
status: publish
published: true
title: Setup and test svn post-commit hook to send commit log
date: 2012-06-05 07:08:40.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
It's been a while since I've done this, and the tools have evolved since then. Follow these steps to configure, test first, and in the end activate the hook.

### Get the sample mailer script

This may depend on your distro/OS, usually there is a package called `subversion-tools`.

```
cd $REPOROOT
cp /path/to/subversion-tools/hook-scripts/mailer/mailer.py hooks
cp /path/to/subversion-tools/hook-scripts/mailer/mailer.conf.example mailer.conf
```


### Edit `mailer.conf`

In my case I only needed to override/uncomment these settings:

```
mail_command = /usr/sbin/sendmail
commit_subject_prefix = [svn-myproject]
from_addr = noreply@mydomain.com
to_addr = commits-myproject@mydomain.com  # this is a mailing list
```


### Pick a revision number for testing

You can pick any revision, just make sure it exists. You can find the latest revision like this:

```
svnlook info $REPOROOT
svnlook youngest $REPOROOT
```


### Test the hook script

Confirm that the last line of the hook script template (`$REPOROOT/hooks/post-commit.tmpl`) is the same as this:

```
"$REPOS"/hooks/mailer.py commit "$REPOS" $REV "$REPOS"/mailer.conf
```

This is the default on recent versions of Linux. It uses the absolute path to `mailer.py` and `mailer.conf`, at the locations where we copied them in an earlier step. The correct path is important, otherwise you will get errors like "mailer.py: command not found"

Run the hook script:

```
sh $REPOROOT/hooks/post-commit.tmpl $REPOROOT $REVNO
```

where `$REVNO` is some revision number (for example the one returned by `svnlook youngest`). After this you should receive an email with the details of the commit, or some error message should appear in the terminal that you can debug.

### Activate the hook


```
cd $REPOROOT
chmod +x hooks/post-commit.tmpl
mv hooks/post-commit.tmpl hooks/post-commit
```

That's it!  Note that it is important to remove `hooks/post-commit.tmpl` file (or truncate to 0 size), otherwise the real hook script (without .tmpl extension) will be ignored. The hook script should be executable, otherwise Subversion will not run it.
