---
layout: post
title: "Copy a disk image with progress indicator"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Assuming you want to save the image of a 4GB disk at `/dev/disk2`:

    sudo dd if=/dev/disk2 bs=4000 | pv -s 4G | dd of=disk.image bs=4000

Key points:

- `bs=4000` means buffer size 4000 bytes. On GNU versions of `dd` you can use the shorter `4m` notation for the same effect.
  + It's important to specify a buffer size, otherwise the default might be too small, and then the transfer will be very slow.
  + The upper limit for the buffer size is practically the bandwidth of the I/O channel (speed of the disk). Specifying a higher value will make no difference.
- `pv` is a tool to monitor the progress of data through a pipe. The `-s 4G` flag is the estimated size of the data to transfer. This value should match the size of the disk, and it's used by the progress indicator calculation and display.
- The first `dd` reading the disk typically needs to run as root, the second `dd` writing to a file doesn't

When doing the reverse,
before writing an image file back to disk,
**double-check the destination disk first**.
The specified disk will be overwritten,
its previous data will not be recoverable.

    dd if=disk.image bs=4000 | pv -s 4G | sudo dd of=/dev/disk2 bs=4000

Key points:

- The file and the image device parameters are in inverse order
- The `sudo` is now at the disk writing side
