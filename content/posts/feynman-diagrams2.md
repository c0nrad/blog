---
title: "Feynman Diagram Editor Pt 2"
date: 2020-10-20T20:37:28-04:00
draft: false
categories: ["physics", "simulation"]
---

It's alive! https://blog.c0nrad.io/feynman

<!--more-->

I just pushed out the first "version" of Feynman. The application is currently incredibly buggy. But I am excited to get this far so soon.

![/feynman_1.png](/feynman_1.png)

## What went well

- Fabric.JS is decently nice to use
- Programming in typescript is 10x better than programming in javascript for catching those dumb bugs
- VSCode's "rename symbol" was surprisingly useful this time around

## What was more difficult than planned

- Loading LateX onto canvas was more difficult than planned. It's some nasty poopoo. But I need latex so I cna use the correct particle names. And I don't want to have SVGs for everything.
  - I wanted to use Katex like I use for this blog, but they don't support canvas, nor exporting to SVG. So instead I'm using MathJax, which was a journey. So MathJax takes some latex, outputs a SVG string, and then I load that SVG onto the canvas. Loading SVGs is also asynchronous, and everything else I do is synchronous, which was frustrating to convert stuff to ascynchronus.
  - MathJax also isn't pretty, thankfully I found some very small project that simplified some of it. At the cost of like additional 1mb bundle size. I will definitely need to come back and optimize this.
- The bosons paths (the squiggly lines). I didn't want to use images for the bosons since I knew I wanted smooth scaling. So instead I'm manually generating the paths for the photons, weak, and strong bosons. The strong boson uses a cycloid path, which took some time to figure out the correct equation. Then the scaling/rotating to fit them into the correct paths.
- The dragging and dropping of lines is all done manually, and combining that with snap to grid was slightly more complex than anticipated. Particles need to be selected, and then I draw the circles for moving the lines, then I need up move everything associated with that line as it's being dragged. It was slightly more difficult since "moving" the latex symbols means they need to be redrawn which is again asynchronous (I can't move/scale the latex symbols because then they're sheared or upside down).

## Things that were frustrating

- I wish Fabric.js had a userData attribute similar to Three.JS. I have to save a bunch of custom stuff on the individual fabric objects (most of the stuff I save is related to the underlying interaction model so I know what is what), but typescript doesn't like me randomly using random properties on the object. (Nor do I like it, I don't trust that the custom attributes will be honored). So instead I'm using a bunch of @ts-ignores.

## Future

- Lots of bug fixes. The bosons aren't scaling well, the drag and drop is nasty, the arrows don't always align
- Upper toolbar for adding new particles
- State saving in the URL
- Side tool bar allowing you to swap replace/delete/modify the particles
- More examples
- mesons/baryons should be labeled as a particle, not just individual quarks (this one is surprisingly tricky. How do you represent a particle that is in a super position of two different states of quarks?)

But overall I'm excited! It's coming along nicely. I think it will be a very useful tool.
