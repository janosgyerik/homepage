---
layout: post
status: publish
published: true
title: jmxterm is a nice command line JMX client
date: 2012-05-17 20:33:21.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Suppose you have exposed some mbeans using JMX. You can connect to the JMX service like this:
<pre>java -jar jmxterm.jar --url $service_url</pre>
where `service_url` is the URL of the JMX service, which you can usually find out in the logs when starting up your service. In my case, working in a Camel container, it looks like this:
<pre>service:jmx:rmi:///jndi/rmi://localhost:1188/jmxrmi/camel</pre>
Next you need to find the bean you want to manipulate, you can search for available beans with the `beans` command. To narrow down the list, it is helpful to specify the domain of the bean, for example:
<pre>beans -d net.sf.ehcache</pre>
Next, to do something with the bean you need to select it with the `bean` command, for example:
<pre>bean -d net.sf.ehcache $bean
run someMethodOfTheBean</pre>
where `bean` is the full name of the bean as you found previously with the `beans` command. It's pretty long, so you definitely want to copy &amp; paste rather than typing.

You can put this commands in text file and run them non-interactively like this:
<pre>java -jar jmxterm.jar --url $service_url -i /path/to/my-jmx.script</pre>
You can get jmxterm from here, with good documentation:

<a href="http://wiki.cyclopsgroup.org/jmxterm  ">http://wiki.cyclopsgroup.org/jmxterm</a>

If you need a GUI tool, VisualVM (the official tool by Sun) is fantastic.

<a href="http://visualvm.java.net/">http://visualvm.java.net/</a>

I actually blogged about that a while back:

<a href="http://www.janosgyerik.com/how-to-browse-jmx-mbeans/">http://www.janosgyerik.com/how-to-browse-jmx-mbeans/</a>
