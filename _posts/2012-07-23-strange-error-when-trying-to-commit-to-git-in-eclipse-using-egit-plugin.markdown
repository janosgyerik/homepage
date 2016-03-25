---
layout: post
status: publish
published: true
title: Strange error when trying to commit to git in Eclipse using egit plugin
date: 2012-07-23 08:48:37.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
Looking at the Error Log:


```
!ENTRY org.eclipse.egit.ui 4 0 2012-07-23 10:28:12.912
!MESSAGE An internal error occurred
!STACK 0
org.eclipse.jgit.api.errors.JGitInternalException: Exception caught during execution of commit command
    at org.eclipse.jgit.api.CommitCommand.call(CommitCommand.java:277)
    at org.eclipse.egit.core.op.CommitOperation.commit(CommitOperation.java:255)
    at org.eclipse.egit.core.op.CommitOperation.access$7(CommitOperation.java:233)
    at org.eclipse.egit.core.op.CommitOperation$1.run(CommitOperation.java:197)
    at org.eclipse.core.internal.resources.Workspace.run(Workspace.java:1975)
    at org.eclipse.core.internal.resources.Workspace.run(Workspace.java:1957)
    at org.eclipse.egit.core.op.CommitOperation.execute(CommitOperation.java:207)
    at org.eclipse.egit.ui.internal.commit.CommitUI$2.run(CommitUI.java:220)
    at org.eclipse.core.internal.jobs.Worker.run(Worker.java:54)
Caused by: java.io.EOFException: Input did not match supplied length. 6774 bytes are missing.
    at org.eclipse.jgit.storage.file.ObjectDirectoryInserter.shortInput(ObjectDirectoryInserter.java:237)
    at org.eclipse.jgit.storage.file.ObjectDirectoryInserter.toTemp(ObjectDirectoryInserter.java:168)
    at org.eclipse.jgit.storage.file.ObjectDirectoryInserter.insert(ObjectDirectoryInserter.java:105)
    at org.eclipse.jgit.api.CommitCommand.createTemporaryIndex(CommitCommand.java:363)
    at org.eclipse.jgit.api.CommitCommand.call(CommitCommand.java:195)
    ... 8 more
```


This bug report suggested setting `core.autocrlf=false`. 
[https://bugs.eclipse.org/bugs/show_bug.cgi?id=369780](https://bugs.eclipse.org/bugs/show_bug.cgi?id=369780)

It worked, now I can commit. My setting before was `core.autocrlf=true`.
