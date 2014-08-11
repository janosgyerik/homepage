---
layout: post
title: "Getting started with Android Bootstrap"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

In the past,
I tried to make Android apps compatible with the oldest phone I have:
HT03 Magic, running SDK version 4 and cannot be upgraded.
Until I came across this article:
http://dannyroa.com/2013/10/17/why-its-time-to-support-only-android-4-0-and-above/

Yeah, that's been really tough.
I had a lot of struggle with really basic stuff,
such as using a light theme instead of the dark default,
styling buttons, static top bar, and many others.

As much as I would like to support old devices,
it's really taking too much time, and frustration.
The article is right,
supporting old versions takes a big toll on deeloper time,
preventing me from making better apps.


Edit `build.gradle`:
```
task wrapper(type: Wrapper) {
    gradleVersion = '1.8'
}
```

http://www.gradle.org/docs/current/userguide/gradle_wrapper.html

Run:

    gradle Wrapper

Run `gradle`, but:
```
FAILURE: Build failed with an exception.

* What went wrong:
A problem occurred configuring project ':app'.
> Failed to notify project evaluation listener.
   > Could not resolve all dependencies for configuration ':app:_DebugCompile'.
      > Could not find any version that matches com.android.support:appcompat-v7:18.0.+.
        Required by:
            myproj:app:unspecified
      > Could not find com.android.support:support-v4:13.0.0.
        Required by:
            myproj:app:unspecified > com.actionbarsherlock:viewpagerindicator:2.4.1
            myproj:app:unspecified > com.github.kevinsawicki:wishlist:0.9
```

Run:

    android sdk

Install **Android Support Repository**.

Install:

- **Android SDK 18**
- **Android SDK Build-tools 18.0.1**

Finally:

    ./gradlew assembleDebug
