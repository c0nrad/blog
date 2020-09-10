---
title: "Interference"
date: 2020-08-18T18:53:54-04:00
draft: false
tags: ["simulation"]
---

Double Slit Interference Pattern demo.

<!--more-->

## Overview

Some fun news, I'm officially going back to college for Physics!

I got my first homework assignment, and one of the questions was on double slit interference. I figured I'd make a little demo.

## Double Slit Interference

The double slit experiment was one of the most famous experiments in history. I don't want to cover it here since it's been covered a million times.

But it blows my mind that scientist have done the experiment by firing single electrons and it still worked. Nature is crazy.

## Setup

So I made a little tool to play with some values of the experiment.

Here's a diagram of the setup:

<img style="border: 1px solid" src="/inter.png">

I assume there's two point light sources, and instead of using the standard \\( d sin(\theta) = m \lambda \\) equation for finding the maxima, I calculated the wavelength of each source independently, and then just add the phase to calculate intensity.

Source:
[https://github.com/c0nrad/interference](https://github.com/c0nrad/interference)

## Simulation

<iframe src="https://blog.c0nrad.io/interference" style="border: 1px solid; width: 100%; height: 300px">
</iframe>

[Raw Link](https://blog.c0nrad.io/interference)

Some fun things to note:
* The chart color changes based on wavelength. 
* It kind of blows my mind that the interference pattern appears in the [mm] scale, but the wavelengths are in the nm scale.

## Things that went well

* Javascript's precision wasn't high enough at first, specially since the wall is 4m away and the wavelength is in the nanometer scale. So the nanometer components were being truncated. I ended up using some library called decimal.js that worked well.

## Open questions

* How does the intensity drop off as the fringes get further away from the middle? It looks like a \\( sinc \\) function, but not sure.

## Future

Probably nothing. It was a fun little exercise. Although it ended up taking the better part of a day to complete. (I was playing with Preact for a bit, but I love angular's two-way data-binding. So I switched back.)

I've also been working on a computer algebra system (called [Meth.js](https://github.com/c0nrad)). I'm hoping it soon gets to the point where I can just feed it a couple of equations and some input with units, and it'll figure out any other value I'd be interested in calculating. 

Toodles.