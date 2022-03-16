---
title: "Density Operators"
date: 2021-07-20T21:24:02-07:00
description: "Transitioning from pure states to mixed states"
categories: ["quantum computation"]
draft: false
---

This post covers my transition from using pure states to mixed states in my quantum simulator.

<!--more-->

## Density Operators

I am constantly impressed with how impatient and dumb I am. I remember reading about density operators in a number of my quantum computation books, and everytime they pop up I'm very frustrated. "I just want to do quantum computation! Why do I need to learn another formulation!!! State vectors work fine."

Well, it turns out it's important. (Although for me, it hasn't been important until recently.) But a big reason you might consider using density operators is if you want your quantum simulator to take **noise** into account.

After working at a quantum computing for ~4-5 months, I feel I now appreciate that the name of the game is mitigating noise.

### Quantum Noise

In classical circuits, noise is bad, but it isn't quite as insidious. What's nice is that even if there is an unexpected bit flip somewhere, we can easily read the state at any point to verify and flip back, and it's also a "full" bit flip. You won't ever get "half" a bit flip. (Well, maybe if the circuit was really messed up and jittery you could get oscillations...).

But in the quantum world, (1) we can't just read the circuit as we please (no cloning, and measurement collapses the state), and (2) the error can be anywhere along a continuous spectrum. Instead of a full bitflip, the "error" could just be a super small shift away from \\( |0\rangle \\) to \\( |1\rangle \\). There's nothing pushing the states to \\( |0\rangle \\) or \\( |1\rangle \\), they can just drift away.

### Sources of Noise

There's a bunch of different places noise can pop up.

1. **Decoherence**

Probably the biggest source of errors that all quantum computers have to mitigate against. Decoherence is a general term, but it essentially means the quantum computation system is interacting with the environment. An example would be is if you're using an atom as your quantum qubit, and a stray photon wacks the atom, putting it into a weird state.

2. **Coherent Errors**

This is the error that happens when you try to do things with your qubits in a slightly incorrect way. Most quantum computing systems "pulse" something to get the qubit to do something (such as pulsing a laser). But you have to calibrate those pulses to determine the optimal duration. What if the perfect pulse duration is 151ns, but you pulse for 149ns. The qubit won't be fully rotated. These calibrations are always fluctuating on temperature, jitter, humidity, even someone touching the table where a quantum machine sits.

3. **SPAM**

State Prep and Measurement. I'm not too familiar with how errors occur in state prep, but it's easy to understand for measurement. For atomic based quantum systems, we measure the atoms by getting them to fluoresce. But we're literally measuring the photons from a single atom, what if our camera doesn't pick up all the photons necessary?

4. **Leakage**

This one is also dependent on the qubit system being used. But for neutral atom computing using strontium 87, we define our qubit states as part of the nuclear spin manifold. (That just means two different states that are defined by the electron/nucleus interaction). But because of the way we transition between those two states (ground(-9/2) and excited(-7/2)), it's possible that the qubit state could go into a different state. ([More info](https://youtu.be/eLYfnJtgtzk?t=947)). (We fix it by applying an AC stark shift to the -5/2 levels to close the transition.)

## Density Operators

Density operators provides a way to model these errors (along with pretty much most quantum states).

### Construction

Density operators (also called density matrixes) are composes of a set of pure states (pure states being the standard ket structure).

For each ket we assign a probability and then project the state and add them:

$$ \rho = \sum_i p_i | \psi_i \rangle \langle \psi_i | $$

For example, the density operator corresponding to \\( |0\rangle \\) is just:

$$ \rho = \sum_i p_i | \psi_i \rangle \langle \psi_i | = \sum_0 1 [1, 0]^T [1, 0] = \begin{bmatrix} 1& 0 \\\ 0 & 0 \\ \end{bmatrix} $$

### Evolution

To perform a unitary evolution of a density matrix we simply apply:

$$ \rho = U \rho U^{\dagger} $$

So to apply a X (NOT) gate to our state, we simply apply:

$$ \rho = U \rho U^{\dagger} = \begin{bmatrix} 0& 1 \\\ 1 & 0 \\ \end{bmatrix} \begin{bmatrix} 1& 0 \\\ 0 & 0 \\ \end{bmatrix} \begin{bmatrix} 0 & 1 \\\ 1 & 0 \\ \end{bmatrix} = \begin{bmatrix} 0& 0 \\\ 0 & 1 \\ \end{bmatrix} $$

### Measurement

Now we can project a measurement. So the probability of getting \\( |1\rangle \\) is:

$$ p( |1\rangle ) = tr(M^{\dagger}\_m M_m \rho) = tr( \begin{bmatrix} 0& 0 \\\ 0 & 1 \\ \end{bmatrix} \begin{bmatrix} 0& 0 \\\ 0 & 1 \\ \end{bmatrix} \begin{bmatrix} 0&0 \\\ 0 & 1 \\ \end{bmatrix} ) = 1$$

(Where \\( tr \\) is trace).

Wow. Applying a NOT gate to the \\( |0\rangle \\) gets us \\( |1\rangle \\). Cutting edge stuff.

## Code

While it's not much, I can now support the very basics of this new density operator approach.

```javascript
let d1 = DensityMatrix.fromInitialState([0]);
d1 = d1.evolve(XGate.matrix);
let result = d1.measure(MZ1);
expect(result.equals(new Complex(1, 0))).true;

d1 = d1.evolve(XGate.matrix);
expect(d1.measure(MZ1).equals(new Complex(0, 0))).true;
expect(d1.measure(MZ0).equals(new Complex(1, 0))).true;
```

I'm also rewriting the simulator in Javascript so that the simulator can be interacted with. I hope that people will be able to specify an error model and then run circuits such as RPE (robust phase estimation) and RB (randomized benchmarking), to understand how different errors impacts fidelity and error measurements.

## Future

Overall I'm very excited, it's been a fun project.

In the above examples I'm still modeling pure states, but soon I'll start playing with error channels, and modeling circuits that way seems very interesting.

Long term (after finishing RPE and RB), it'd be amazing to start simulating some basic QECC (quantum error correction codes). But we're a ways away.
