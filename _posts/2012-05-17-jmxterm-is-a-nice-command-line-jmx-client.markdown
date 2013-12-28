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
---
Suppose you have exposed some mbeans using JMX. You can connect to the JMX service like this:

```
java -jar jmxterm.jar --url $service_url
```

where `service_url` is the URL of the JMX service, which you can usually find out in the logs when starting up your service. In my case, working in a Camel container, it looks like this:

```
service:jmx:rmi:///jndi/rmi://localhost:1188/jmxrmi/camel
```

Next you need to find the bean you want to manipulate, you can search for available beans with the `beans` command. To narrow down the list, it is helpful to specify the domain of the bean, for example:

```
beans -d net.sf.ehcache
```

Next, to do something with the bean you need to select it with the `bean` command, for example:

```
bean -d net.sf.ehcache $bean
run someMethodOfTheBean
```

where `bean` is the full name of the bean as you found previously with the `beans` command. It's pretty long, so you definitely want to copy &amp; paste rather than typing.

You can put this commands in text file and run them non-interactively like this:

```
java -jar jmxterm.jar --url $service_url -i /path/to/my-jmx.script
```

You can get jmxterm from here, with good documentation:

[http://wiki.cyclopsgroup.org/jmxterm](http://wiki.cyclopsgroup.org/jmxterm  )

If you need a GUI tool, VisualVM (the official tool by Sun) is fantastic.

[http://visualvm.java.net/](http://visualvm.java.net/)

I actually blogged about that a while back:

[http://www.janosgyerik.com/how-to-browse-jmx-mbeans/](http://www.janosgyerik.com/how-to-browse-jmx-mbeans/)
