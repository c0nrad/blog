---
title: "Sim 6: Ising Model Pt. 1"
date: 2022-01-25T15:50:49-08:00
draft: false
---

We build out a simple Ising model simulator for future expansion.

<!--more-->

## Overview

The Ising model is probably the most famous (real) physics simulation. It's a useful tool for studying phase transitions and critical phenomena.

Even though it's relatively simple, and almost 100 years old, it's still an area of [active research](https://arxiv.org/abs/1203.6064).

The most common usecase is for studying magnetization. We know that materials are composed of a huge quantity of electrons, and we also know that electrons have a property called spin that somewhat acts like a magnet. When a large number of these electrons spin in the same direction we get a bar magnet.

But it's a balancing act to have a bar magnet.

On one hand, a collection of electrons spinning in the same direction is lower energy, but there's also a non-stop barrage of collisions and vibrations in the quantum world that will upset the system from all pointing in the same direction.

If we take a room temperature bar magnet and heat it up, it will slowly lose its magnetism. The thermal jitters will disrupt the overall magnetism.

## Simulation

To model this, we imagine a 2D grid where each spot can either point up or down.

We then perform a number of steps where at each step we:

1. Pick a random spot
2. Calculate the energy difference if the spot was flipped
3. If the energy is less, accept and flip (nature likes minimum energy)
4. If \\( e^{-dE/T} \\) is greater than a randomly generated number (0,1), accept and flip
5. Otherwise reject and continue

## Results

[![/ising.png](/ising.png)](https://blog.c0nrad.io/sims/ising)

It's ugly and barebones, but it's a good starting ground, and the critical temperature came out correctly. (I'll describe critical temperature and the math in the next blog post).

## Conclusion

Good steps so far! I'm excited to dig into the math and solve analytically the 2D case, and also add some features to the simulation (charts of E/M, sim controls).
