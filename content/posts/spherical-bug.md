---
title: "Spherical Bug"
date: 2020-09-09T09:16:42-04:00
draft: true
---

Discussion of one of my longest living software bugs.

<!--more-->

# Overview

Many moons ago I built a little tool to visualize the electron orbitals of hydrogen:

https://blog.c0nrad.io/posts/hydrogen-pt1/
https://blog.c0nrad.io/hydrogenjs

At the time I thought it was correct, but on reddit and HN a few people mentioned that it didn't look correct. People quoted "rotational symmetry" but someone else (who had a degree in physics) said it looked fine. From my experience in computer security, normally there's a lot of people who don't know what they're talking about, so I wasn't really sure what's right or wrong. 

Well, thankfully someone who did know what they were talking about opened a github issue on the code and explained the issue a little more clearly, (and pointed out a separate issue!).

The issue made a little more sense, and after downloading some mobile app that also showed the states, I could see that my diagrams were indeed a little bit different.

So I messed around quite a bit, it looked wrong, but I had no idea why. I tried different integration strategies, different ranges, different strategies for normalizing the probabilities. Nothing seemed to work.

So then last weekend I re-wrote the whole thing in Javascript (https://github.com/c0nrad/hydrogenjs). It still didn't work. 

I verified all the equations:

(This page is very slow, it calculates all the equations dynamically):
https://blog.c0nrad.io/hydrogenjs#formulas

And they all looked fine.

Eventually I reached out to one of my professors here at college (I went back to college!), and he suggested that maybe something to do with complex wavefunctions? 

# The problem / solution

It ended up being something very dumb. It turns out that not everyone uses phi/theta the same way for spherical coordinates. I was using phi/theta the way Griffiths uses it in his Quantum Mechanics book uses them, but my 3D library threats phi/theta in reverse. (phi=theta, theta=phi). 

It's frustrating that the charts looked relativity okay, had there been giant gaps or something it would have been obvious something was wrong, but only on some of the states did it look obviously wrong. 

Anyways, once I made the one line change, it worked fine. 

A little frustrating, but also exciting. This had been bugging me for almost 4 months now.

But now it's live, and a full dynamic javascript version:

https://blog.c0nrad.io/hydrogenjs

# Next

It's possible i'll be doing some research with one my professors here at MTU. So many one of my models will have "practical" use! We'll see.

Until then, I have a huge list of things I want to program, I plan on doing one this weekend, see ya then!