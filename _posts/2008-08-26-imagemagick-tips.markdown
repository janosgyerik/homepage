---
layout: post
status: publish
published: true
title: How to make banner images narrower or wider with ImageMagick
date: 2008-08-26 04:37:00.000000000 +02:00
categories:
- Hacks
tags: []
---
Recently I started playing around with WordPress. There are meny free themes that are absolutely cool. But don't you hate it when the included banner image is too wide or too narrow and it fixes your content to a specific size and you want to change it? Well I do. Luckily ImageMagick makes this easy, and that without firing up Gimp. You can make an image narrower by cutting out a slice. You can make it wider by duplicating a slice, that is, cut the image into 3 slices, left + middle + right, and paste it back together but with the middle slice multiplied.

An example:

1. Backup original images

```
cd wp-content/themes/modmat-j1/images; mkdir bak; cp *.gif bak
```

2. Find out the precise image size

```
identify bak/wrapperbg775.gif
```

This image is 775 pixels wide, hence the name. It's still good to check. The middle part is too wide for me, so I want to cut it out. I can do that by creating a left slice and a right slice and then paste it together.

3. Create the left slice, 200 pixels wide

```
convert -crop 200x+0+0 bak/wrapperbg775.gif slice-left.gif
```

Notice here that you don't need to specify the vertical dimension. ImageMagick will figure out you want to keep the original.

4. Create the right slice by cutting off 300 pixels from the left

```
convert -crop +300+0 bak/wrapperbg775.gif slice-right.gif
```

Again, notice here that we don't specify image dimensions, only the horizontal offset.

5. Paste together right and left horizontally

```
convert +append slice-left.gif slice-right.gif wrapperbg675.gif
```

Now if instead of making the image narrow you wanted to make it wider, you could do that by making one more slice with the middle part, and paste it together like:

```
convert +append slice-left.gif slice-middle.gif slice-middle.gif slice-right.gif wrapperbg675.gif
```

And, if you wanted to do the same thing vertically, follow the same logic with image dimensions and offset parameters, and use -append instead of +append, for example:

```
convert -append slice-top.gif slice-bottom.gif target.gif
```

