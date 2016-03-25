---
layout: post
status: publish
published: true
title: Installing Subversion plugin in Eclipse
date: 2012-05-14 11:08:30.000000000 +02:00
categories:
- Musings
- software
tags: []
---
Sometimes Eclipse really sucks. Today I wanted to upgrade my subversion plugin and ended up wasting a lot of time on it.

How to upgrade a plugin in Eclipse?

- **Help / Check for Updates**

	- This will scan all your plugins, taking a long time, when I want to upgrade one specific plugin
	- In this case it's also pointless (as I found out later), as the Subversion plugins are on separate upgrade sites per version (different site for 1.6, 1.8, etc)

- **Help / Install New Software**

	- It seems this is the way to go, but why so non-intuitive name?


Well this didn't work. I got all kinds of errors that didn't make much sense:

- `Cannot install XYZ plugin because it already exists. Upgrading instead.`

- Except it could not upgrade, due to some conflicts in dependencies which again, didn't make much sense.

- Next I tried uninstalling all Subclipse related plugins to resolve the conflicts.

- The uninstall seems to work successfully, but when I try again the install, it still complains that XYZ plugin is still installed.

- Next I tried removing all the files in `ECLIPSE_HOME/plugins` that seem related.

- Then I get stuck when downloading the new jars, "read timed out"

	- ... despite the fact that I can download those files in a browser
	- ... despite the fact that some of the mentioned files are already downloaded in the plugins directory
	- ... same result even if I manually download the jars and put them in plugins directory


The final solution was to download the ZIP file from the Subclipse site and install locally, from here:

http://subclipse.tigris.org/servlets/ProjectProcess?pageID=p4wYuA

Eclipse is (usually) pretty great. If only they could iron out these kind of issues already. They existed for as long as I can remember...
