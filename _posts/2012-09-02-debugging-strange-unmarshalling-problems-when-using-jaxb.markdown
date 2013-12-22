---
layout: post
status: publish
published: true
title: Debugging strange unmarshalling problems when using jaxb
date: 2012-09-02 10:31:37.000000000 +02:00
categories:
- Hacks
- Software
tags: []
---
The other day I had a very strange unmarshalling issue with jaxb: unmarshalling (deserializing) from an XML file and then marshalling (serializing) the same object to another XML file resulted in different content. There were no errors thrown in the process and I had no idea as to why.

Finally I found a way to debug it on this page <a href="http://jaxb.java.net/guide/Unmarshalling_is_not_working__Help_.html">http://jaxb.java.net/guide/Unmarshalling_is_not_working__Help_.html</a>

```
Unmarshaller u = ...;
// this implementation is a part of the API and convenient for trouble-shooting,
// as it prints out errors to System.out
u.setEventHandler(new javax.xml.bind.helpers.DefaultValidationEventHandler());

u.unmarshal(new File("foo.xml"));
```

Based on the errors reported by the event handler it was straightforward to fix the problem (some property files that relax some validation rules were not on the classpath).
