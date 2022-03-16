---
title: "Randomized Benchmarking of a noisy quantum simulator Pt. 1"
date: 2021-07-22T22:18:37-07:00
description: "Performing (simulated) randomized benchmarking experiments"
categories: ["quantum computation"]
draft: false
---

This post covers the simplest of error models and some simulated randomized benchmarking results.

<!--more-->

## Overview

I did a bit more work on the new density operator quantum simulator. It now can model "Depolarizing errors", and has a "circuit model" of execution. So, time to combine the two and produce some pretty plots!

# Results

The following plot shows the decays for different amounts of simulated error.

![Randomized Benchmarking](/rb.png)

## Background

### Depolarizing Noise

For the first error model, it was recommended that I use Depolarizing Noise (thanks Daniel and Miro!). I copied the operators from [this paper](https://arxiv.org/abs/2101.02109). (I believe these are called Kraus operators:)

$$ K*{D_0} = \sqrt{1-p_1} I $$
$$ K*{D*1} = \sqrt{ \frac{p_1}{3}} X $$
$$ K*{D*2} = \sqrt{ \frac{p_1}{3}} Y $$
$$ K*{D_3} = \sqrt{ \frac{p_1}{3}} Z $$

And then using the operator sum representation:

$$ \rho^{\prime} = \sum^3*{i=0} K*{D*i} \rho K^{\dagger}*{D_i} $$

Which is pretty easy to represent in code:

```typescript
class DepolarizingNoise {
  //...
  evolve(density: DensityMatrix): DensityMatrix {
    let out = DensityMatrix.fromZero(1);

    for (let operator of this.operators) {
      out = new DensityMatrix(
        out.add(
          operator.mulMatrix(density).mulMatrix(operator.adjoint())
        ).components
      );
    }

    return out;
  }
}
```

This noise essentially "shrinks" the bloch sphere. It represents "non-ideal" gates and is applied after each gate.

### Randomized Benchmarking

Randomized Benchmarking is a simple way to calculate the average error of your clifford gates.

Basically you just create a bunch of random circuits of depth/2, and then append the inverse of all those gates. The inverse is important so we know that all the circuits should results in zero. Repeat this for increasing depths, and you can see how fast your circuits fall off.

For my particular simulation I used 1000 shots, with depths from [0, 10, 20, 30, ... 250].

![RB Plot](/rb_plot.png)

The code for generating this data is again pretty simple:

```typescript
export class RandomizedBenchmarking {
  depths: number[];
  shot_count: number;
  gates: Gate[];
  noise: DepolarizingNoise;

  results: number[];

  constructor(
    depths = [2, 4, 8, 16, 32, 64],
    shot_count = 25,
    gates = CliffordGates,
    noise = new DepolarizingNoise(0.01)
  ) {
    this.depths = depths;
    this.shot_count = shot_count;
    this.gates = gates;
    this.results = [];
    this.noise = noise;
  }

  execute() {
    this.results = Array(this.depths.length).fill(0);

    for (let shot = 0; shot < this.shot_count; shot++) {
      for (
        let depth_index = 0;
        depth_index < this.depths.length;
        depth_index++
      ) {
        let depth = this.depths[depth_index];

        let c1 = new Circuit(1);
        c1.noise = this.noise;

        let gates: Gate[] = [];
        let uncompute_gates: Gate[] = [];

        for (let i = 0; i < depth / 2; i++) {
          let random_gate =
            this.gates[Math.floor(Math.random() * this.gates.length)];

          gates.push(random_gate);
          uncompute_gates.unshift(random_gate.inverse());
        }
        c1.moments = gates.concat(uncompute_gates);

        if (c1.execute()[0] == 0) {
          this.results[depth_index] += 1;
        }
      }
    }
  }
}
```

## Conclusion

I'm pretty tired, so only a quick post. But next I want to look at different ways of calculating the fidelities of these results.

Then up next is some different error models!
