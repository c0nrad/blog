---
title: "Vector Calculus Part 3: Electric Dipole"
date: 2020-07-21T18:37:01-04:00
draft: false
tags: ["programming", "numerical", "vector", "EM"]
---

More fun with vector calc/electromagnetism.

<!--more-->

## Electric Dipole

<div style="width: 100%; text-align: center">
<canvas width="700" height="600" id="canvas_dipole"></canvas>
</div>

So in the above diagram there's a positive and negative charge, and the little floaty red dots are "test charges". (You may need to zoom in with mouse scroll)

I'm trying to figure out the best way to visualize electric fields. I think this is better than the [previous attempt](https://blog.c0nrad.io/posts/vector-2-viz/#vector-field), but still not great. 

I worry that it will give the impression that there are things moving in the electric field.

Some other ideas:
* Have it like a gif, where every second it resets
* Have the test points leave a "path" 
* Keep it simple, only show 2D slices
* Go back to vectors, and keep them all the same size, but change alpha based on magnitude

Some inspiration:
* https://youtu.be/LB8Rhcb4eQM?t=200
* https://youtu.be/rB83DpBJQsE?t=154 (I like how the length is based on the magnitude)

I thought about using a density, but E is a vector field, and so needs to display direction.

We'll see. But progress is being made!

<script src="https://cdn.jsdelivr.net/gh/c0nrad/vector/examples/dipole/app_v1.js"></script>