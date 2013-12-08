---
layout: post
status: publish
published: true
title: How to install java and set JAVA_HOME correctly in Ubuntu
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 23
wordpress_url: http://titan2x.wordpress.com/2008/03/18/installing-java-and-setting-java_home-in-ubuntu/
date: 2008-03-18 13:46:00.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
Install Java 6 like this: (Note: the package is in <em>multiverse</em>)
<blockquote>sudo apt-get install sun-java6-jdk</blockquote>
Edit <code>/etc/jvm</code>, add this line to the top of the list: <code>/usr/lib/jvm/java-6-sun</code>

Thanks to the above step, the <code>java</code> executable will find the <em>right</em> version of java. You can confirm this with <code>java -version</code>. However, setting <code>JAVA_HOME</code> is a completely different matter.

These commands will detect set and verify <code>JAVA_HOME</code>:
<blockquote>. /usr/share/java-common/java-common.sh
eval $(jvm_config)
export JAVA_HOME
echo $JAVA_HOME</blockquote>
