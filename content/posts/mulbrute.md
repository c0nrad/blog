---
title: "Mulbrute"
date: 2021-02-28T11:04:32-05:00
draft: false
categories: ["quantum computation"]
---

QHack 2021 submission project, a tool for brute forcing quantum multiplication circuits.

<!--more-->

## Overview

Last week I participated in the QHack 2021 hackathon and challenge board.

The challenge board was very cool. It was a set of 12 quantum computing challenges involving different machine learning quantum algorithms. The website was down for a bit at the start, but once they worked out the kinks it was a very well done set of challenges.

For the first time I can say I feel like I understand the basics of constructing quantum ansatz, doing different variational algorithms, training hamiltonians and more. It was a great learning experience and I look forward to participating again next year. (Team Sloppy Joe Pirates solved all the challenges, coming in 47th place.)

The event also included an open hackathon. For the hackathon I worked on an old problem that still frustrates me...

It's hard to multiply on quantum circuits!

Instead of being clever, I decided to see if I can just brute force circuits that do the multiplication for me.

## mulbrute

For the hackathon I built mulbrute, a brute force tool with an AFL inspired interface:

![mulbrute](/mulbrute_1bit.gif)

The full description and code can be found on the repo:
https://github.com/c0nrad/mulbrute

It didn't place well in the hackathon, but I still plan on working on it over the next few days. (Currently waiting to hear back about a job! So hoping this will keep me distracted.) But since i'm able to score the different circuits I think I can actually switch to a more intelligent depth first search and then use some tricks to simplify the test cases.

The tool could maybe even be made more general. Sometimes I need a circuit that puts qubits into a very specific state, why not have a tool that can construct arbitrary circuits based off truth tables?

We'll see, hopefully something happens and I'll report back.
