---
title: "Quantum Circuit Editor Pt. 1"
date: 2021-08-10T09:31:09-07:00
draft: true
description: "Quantum Circuit Editor"
categories: ["quantum computation"]
draft: false
---

Initial version of a quantum circuit editor.

<!--more-->

## Overview

Here's the result so far:

![QCE Classical](/circuit.gif)

The key detail is the two \\( f(x) \\) blocks. This circuit performs classical computing on the measured qubits mid-circuit to allow for additional insertion of mid-circuit gates.

## Why care?

Quantum Error Correction! I'll go more into detail later, but essentially to do QEC, we need a way to make mid circuit measurements and update the circuit for errors.

Why care about Quantum Error Correction? Quantum computers are super sensitive to noise ([see the density operator post](/posts/density-operators/) for more info. We need Quantum Error Correction to build usable Quantum Computers.

## What went well?

- The circuit is built entirely out of HTML!
  - This is a little overkill... I probably should have gone with canvas, but it's neat that you can build something like that with just HTML. I didn't even use `z-index`. Everything is explicitly checked and added. (Lots of flexbox). Technically the LaTeX might be using canvas, not sure.
- Mid-circuit measurements works! This is something my last quantum simulator didn't have. The ability to measure a single qubit during mid execution is pretty cool (and it was easier than I thought. Just tensor some projection state between a bunch of identity matrixes)
- For building gates like CCCNOTCCC, I used to have some pretty [complex algorithm](https://github.com/c0nrad/qrad/blob/master/moment.go#L144), but now that I'm one quantum smarter, it turns out I can do it a little simpler by being smart about the projection operators for the conditionals.
- Adding classical functions "works":

```typescript
c1.appendFunction((classicalBits: number[]): Moment[] => {
  let out = [];
  if (classicalBits[0]) {
    out.push(new Moment(XGate, [0], [], [], 2, 2));
  }
  if (classicalBits[1]) {
    out.push(new Moment(XGate, [1], [], [], 2, 2));
  }

  return out;
});
```

It's a little ugly, but I'll clean that up in the future. Each `moment` is a slice in time, with the gate, the gateIndexes, controlIndexes, classicalIndexes, and then circuit size.

## What didn't go well?

- Well, it went fine. But building circuits in HTML is a little bit of a pain. I'm holding off on adding barriers and muli-wire gates because I don't want to touch it. But I will one day. I think overall I prefer HTML to canvas (for portability and interoperability)

## Future

I have an ever increasing list of todo's. But I think the main ones are:

- Start implementing different QEC schemes! I think I have all the pieces.
- Allow the user to turn on the noise models as seen in the [RB playground](https://blog.c0nrad.io/qc.js/rb/) to simulate errors
- Implement drag and drop (another thing I know how to do, I'm just dragging my feet on since it's a pain)
- More than like 8 qubits is pretty slow. Probably need to use one of the GPU matrix libraries instead of rolling my own matrix math.
- Deploy!

Hopefully within a week or two people can use the circuit build to play with different error correction schemes!
