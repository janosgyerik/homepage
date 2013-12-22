---
layout: post
status: publish
published: true
title: Using custom fonts on Android
date: 2013-05-19 07:47:03.000000000 +02:00
categories:
- Hacks
- News
- Software
tags: []
comments: []
---
The default fonts you can choose from when developing for Android are not very interesting. Normally they are OK for my simple purposes, but for once I wanted something a little bit prettier for my new app, <a href="https://play.google.com/store/apps/details?id=com.happymoments.lite">Happy Moments</a>.

I found this tutorial very useful for using custom fonts on Android:

<a href="http://mobile.tutsplus.com/tutorials/android/customize-android-fonts/">http://mobile.tutsplus.com/tutorials/android/customize-android-fonts/</a>

And I found some pretty nice fonts on this site suitable for the concept of my app:

<a href="http://www.fontsquirrel.com/fonts/list/category/Handwritten">http://www.fontsquirrel.com/fonts/list/category/Handwritten</a>

Here's the gist:

Step 1: Find a nice font and put it in your `assets/` folder

Step 2: Set the custom font in code (which is the only way to do it), like this:

```
TextView message = (TextView) findViewById(R.id.message); 
Typeface font = Typeface.createFromAsset(getAssets(), "Chantelli_Antiqua.ttf");
message.setTypeface(font);
```

And voila, the result in the app itself:<em id="__mceDel" style="line-height: 1.714285714; font-size: 1rem;">*

<img class="alignnone" alt="" src="https://lh5.ggpht.com/JT1zIy-gj2x_httd31vwQ1X7p58xJqyl0sQdBTRY7q241JHaAAv7EJDGCx6mOaB2ow" width="320" height="480" />
