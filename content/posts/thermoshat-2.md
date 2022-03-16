---
title: "Thermoshat Pt. 2"
date: 2021-01-07T14:38:37-05:00
draft: false
categories: ["electronics"]
---

Updates and finalizing the thermoshat project.

<!--more-->

## Background

Two days ago I made a custom thermostat. More can be read here: [Thermoshat Pt1](/posts/thermoshat/).

<div style="text-align: center">
<video controls src="/thermoshat.mp4" style="width: 100%;" autoplay loop ></video>
</div>

## Updates

It's been working surprisingly well!

A added two more features:

### Target temperature based on time

Now after 10PM it'll set the target temperature to 50F, and resume back to 74 at 6am.

### Run on raspberry pi startup

I added the script to /etc/rc.local so that it boots on startup, so I no longer need to ssh into the raspberry pi to start.

## Conclusion

I'm going to leave it on overnight. If I die in a fire, please inform the authorities of the cause.

(Obviously said in humor, I've been watching it, it looks fine, and we have a smoke detector).

But I think this project is done!
