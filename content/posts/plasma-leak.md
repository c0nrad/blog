---
title: "Plasma Leak"
date: 2021-01-18T15:25:22-05:00
draft: false
categories: ["physics", "simulation", "game"]
---

Plasma leak the game.

<!--more-->

## Introduction

Plasma leak is my latest game creation. It is a multiplatform open world MMORPG, releasing today.

(Kidding, it's a crappy 2D game), but you can play it here:

https://plasma-leak.github.io/plasma-leak/

You bend plasma beams using electromagnetic point charges.

### Motivation

The game was inspired by my other 3D EM visualizer [Emmy](https://emmy-viz.github.io/emmy/). I wanted to make a game out of electrostatic charge distributions.

I ended up only really using point charges. I was hoping to add conducting surfaces, capacitors, and maybe even magnetic fields (and maybe maybe special relativity effects). But I'm a little tired of working on this game. It's pretty much all I have worked on over the last 4 days.

### Technical Details

The game originally used math.js to symbolically calculate the electric field, but it was running a little sluggish, so I moved to just vanilla javascript for the vector calculus.

The rest is just HTML canvas/javascript (typescript). I didn't use a library on top of canvas so it was fun making my own event manager and buttons and such.

## Future

Maybe in the future I'll come back and add those other object types (capacitors, magnets, etc). But not today.
