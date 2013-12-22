---
layout: post
status: publish
published: true
title: How to browse JMX mbeans
date: 2011-09-12 20:36:58.000000000 +02:00
categories:
- Hacks
- Software
tags: []
---
Sun has a free tool for this called VisualVM. Simply download and run it. In the Applications tab you should see the various Java virtual machines currently running.

By default many plugins are not installed, for example to view MBeans you need to first install the plugin using the Tools / Plugins menu.

Also, some Java libraries may have MBeans off by default. For example with Ehcache (a cache library) you need to set monitoring="on" attribute on the root element in the xml configuration.

Finally, to figure out the JMX service URL of some remote process, it's easiest to look in the log of the service. An example URL:

service:jmx:rmi:///jndi/rmi://name_of_the_host:1188/jmxrmi/name_of_the_service
