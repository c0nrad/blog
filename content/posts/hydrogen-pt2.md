---
title: "Electron Wavefunctions for Hydrogen Part 2"
date: 2020-06-20T14:37:31-04:00
draft: false
description: "Calculating the stationary states of an electron in a hydrogen atom"
tags: ["quantum mechanics","simulation"]
---

Part 2 of calculating the electron wavefunctions for hydrogen.

[View Visualization](https://blog.c0nrad.io/hydrogen/)

<!--more-->

# Background

It's done! (Technically it was done a month ago, I just never wrote about it).

[View Visualization](https://blog.c0nrad.io/hydrogen/)

https://www.reddit.com/r/Physics/comments/gt1set/interactive_electron_orbitals_of_hydrogen/

Source code can be found here:

https://github.com/c0nrad/hydrogen

## Technical Implementation Notes

* I ended up just sampling the wave functions, and saving it to a JSON file for the web component to read
    * https://github.com/c0nrad/hydrogen/blob/master/hydrogen.cpp#L199
* Originally each point was a three.js sphere, but that ran way to slow, so I got to try vertex/fragement shaders for the first time! (using a THREE.cloud)
    * https://github.com/c0nrad/hydrogen/blob/master/docs/index.html#L44
* The little control panel is actually pretty neat. Just a few lines of code
    * https://github.com/c0nrad/hydrogen/blob/master/docs/app.ts#L24

Overall super happy with it!

## Future

Done with this project, but already onto the next! Stay tuned!