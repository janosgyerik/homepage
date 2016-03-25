---
layout: post
status: publish
published: true
title: How to install java and set JAVA_HOME correctly in Ubuntu
date: 2008-03-18 13:46:00.000000000 +01:00
categories:
- hacks
tags: []
---
Install Java 6 like this: (Note: the package is in *multiverse*)
<blockquote>sudo apt-get install sun-java6-jdk</blockquote>
Edit `/etc/jvm`, add this line to the top of the list: `/usr/lib/jvm/java-6-sun`

Thanks to the above step, the `java` executable will find the *right* version of java. You can confirm this with `java -version`. However, setting `JAVA_HOME` is a completely different matter.

These commands will detect set and verify `JAVA_HOME`:
<blockquote>. /usr/share/java-common/java-common.sh
eval $(jvm_config)
export JAVA_HOME
echo $JAVA_HOME</blockquote>
