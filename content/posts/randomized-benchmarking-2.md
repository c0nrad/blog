---
title: "Randomized Benchmarking of a noisy quantum simulator Pt. 2"
date: 2021-07-27T15:09:55-07:00
draft: true
description: "Finishing the RB simulator"
categories: ["quantum computation"]
draft: false
---

The randomized benchmarking simulator is released!

<!--more-->

## Overview

You can check it out here:

https://blog.c0nrad.io/qc.js/rb/

## What went well

I don't think he'll read this, but thank you Daniel for your help fixing the noise model! I was following some paper, but their noise model wasn't preserving trace.

- From a code test-ability standpoint, I like that representing the state as a density operator means I don't need to have a vector class. When using the state vector, I found myself implementing a lot of similar functions for both vector and matrix (or I could subclass, but I never really liked that either)
- ng-katex is a very handy package for putting latex in html pages
- the progress bar took a little bit of effort, but it's neat. (I added a little bit of tech debt, the callback method is... questionable. I needed to use setTimeout so that the angular thread would update the UI, but getting rxjs to work correctly was being annoying, so I just have a progress callback and that checks if it's the last result...)

## What didn't go well

- The trace on the density matrix wasn't adding up for some gates, and I eventually found out I was using the transpose instead of dagger operator on some state evolution function.
- The fitting method is really bad. I wonder if there's a way to pin the fitting function to always use one point as the origin.

## Future

I probably won't, but if I do come back to this model, I should do the following:

- Fix the plotting so that it plots "survivability" (although I'm not sure how to calculate that. A random circuit is still correct half the time.)
- Fix the fitting function
- "Fidelity" of the circuit

## Conclusion

Overall a fun project and I learned a lot.

I think next will be creating an online circuit editor with noise that will allow "classical" processing to be interspersed so that I can test out some error correction schemes.
