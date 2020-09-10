---
title: "Quantum Infinite Well"
date: 2020-05-22T12:30:26-04:00
draft: false
description: "Calculating the stationary states of an electron in a quantum infinite well"
tags: ["quantum mechanics","simulation"]
---

Calculating the stationary states of an electron in a quantum infinite well.

<!--more-->

<iframe class="full-width" src="https://qsimp.github.io/qsimp/examples/infinite_well/" style="border: 1px solid; height: 800px" ></iframe>
<br>
(Or visit URL: <a href="https://qsimp.github.io/qsimp/examples/infinite_well/">https://qsimp.github.io/qsimp/examples/infinite_well/</a>)


## Particle in a well 

The above charts are calculations for a hypothetical electron stuck in a well. 

It's a 1-dimensional well, and sides of the well are infinite in height. 

This model is kind of similar to a standard bouncy ball being placed into a hole, and we watch it slide back and fourth, unable to ever escape the hole. (And the hole has no friction).

But there's a couple of startling differences between the bouncy ball and particle in the well.

If we imagine the bouncy ball in the well, it can have pretty much any velocity as it bounces back and forth between the sides of the walls. It could be moving at 1m/s, 10m/s, .00001 m/s. Anything works.

But for our hypothetical particle, this is not possible. Not all "velocities" (or more correctly, energies) are allowed. The particle must be in a particular state, or a linear combination of states (more on linear combinations later).

The hypothetical particle also can't "sit still". It must be at one of the energy states (or a linear combination of those states).

## Schrödinger Equation

In classical mechanics, we can calculate the position of the ball by using Newton's \\( F=ma \\) and the equations of motion.

Quantum mechanics has a similar function called the Schrödinger Equation. Using it we can learn about the particle as we go forward/backwards in time.

$$ i \hbar \frac{\partial \Psi}{\partial t} = - \frac{\hbar^2}{2m} \frac{\partial^2 \Psi}{\partial x^2} + V \Psi $$ 

<ul>
    <li> \( \Psi \) is the wavefunction </li>
    <li> \( \hbar \) is plank's constant (over 2pi) </li>
    <li> \( m \) is the mass of the particle </li>
    <li> \( i \) is an imaginary i (complex number) </li>
    <li> \( V \) is the potential function  </li>
</ul>

### Potential Function 

To "solve" the Schrödinger for a particular system, you need the Potential Energy function. The easiest Potential function to get started with is the Infinite Well. 

$$ V(x) = \begin{cases} 0, & 0 <= x <= a \\\ 
\infty, & \text{otherwise} \end{cases}  $$

It just says that the particle must stay in the well. There's no escaping the well.

Then, with that potential function, we can plug it into the Schrödinger and determine a function that "fits". We eventually get: 

$$ \Psi_n (x, t) = \sqrt{ \frac{2}{a}} \sin{(\frac{n \pi}{a} x )} e^{-i (n^2 \pi^2 \hbar) / (2
m a^2 ) t} $$

<ul>
    <li> \( \Psi \) is the wavefunction </li>
    <li> \( n \) is the specific stationary states </li>
    <li> \( a \) is the width of the well </li>
    <li> \( x \) is the "position" of the wave within the well </li>
    <li> \( i \) is an imaginary i (complex number) </li>
    <li> \( \hbar \) is plank's constant (over 2pi) </li>
    <li> \( m \) is the mass of the electron </li>
</ul>

#### Stationary States

Each one of the \\( n \\) states is an energy level that the particle can be in. But oddly in the quantum mechanics world, the particle will usually occupy a mix of different energy levels at the same time! 

But, when we try to figure out what energy state the particle is in, it will collapse to only one of the states. 

The probability of finding a particle in a particular state is \( |c_n|^2 \):

$$ \Psi (x, t) = \sum_{n=1}^{\infty} c_n \sqrt{ \frac{2}{a}} \sin{(\frac{n \pi}{a} x )} e^{-i (n^2 \pi^2 \hbar) / (2 m a^2 ) t} $$

Each of the states has a particular energy (as shown by the table above). 

The coefficients are determined by "initial wave function" such as \\( \Psi (x, 0) = A x (a-x) \\).  Using some Fourier series magic you can fit the equation by properly setting the \\( c_n \\)'s.

## Imaginary Component 

In the above chart there's two lines for every state, one for both the real and imaginary components. 

The imaginary component comes from the trailing \\( e^i \\) in the solution. The book I'm reading calls this the "time independent wiggle room". 

What's interesting though is that the time component doesn't actually change the expectation values for the wave. (If we're being 100% honest, I'm not actually sure what the time component does. It's what I'm going to look into next. I have a feeling it'll play a bigger role when we look at multi-particle systems that interfere with each other).

## Expectation Values

Even more fun, t's not possible to know everything about the particle in the well. We believe this to be a limitation of the universe, not our understanding of the universe. 

But we can still calculate "expectation" values for different properties. These properties are the result if you were to measure a bunch of particles in similar configurations and average them out.

<p>To calculate some of the expectation values we can use the following formulas:</p>

### Position

$$ \langle x \rangle = \int_{-\infty}^{\infty} \Psi^{*} [x] \Psi dx $$

### Momentum 

$$ \langle p \rangle = \int_{-\infty}^{\infty} \Psi^{*} [-i \hbar \frac{\partial}{\partial x}] \Psi dx $$

### Uncertainty 

We can also verify that all states adhere to the uncertainty principle:

$$ \sigma_x \sigma_p \geq \frac{\hbar}{2} $$

Where:

$$ \sigma_x = \langle x^2 \rangle - \langle x \rangle^2 $$

$$ \langle x^2 \rangle = \int_{-\infty}^{\infty} \Psi^{*} [x]^2 \Psi dx $$

Thankfully from the above table we can see that our calculated uncertainty is  \\( \geq  \frac{\hbar}{2} \\) for all states. 

## Up Next

Next up will be the quantum harmonic oscillator. I also want to learn more about how the equation evolves with time. 

If anything is confusing, please let me know! c0nrad@c0nrad.io. 
