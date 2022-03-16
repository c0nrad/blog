---
title: "Klein Gordon Eqn via Connected Springs"
date: 2020-09-12T14:35:23-04:00
draft: false
categories: ["physics", "simulation"]
---

Simulations Klein Gordon Eqn as a set of connected springs.

<!--more-->

## Introduction

I'm currently reading [No-Nonsense Quantum Field Theory](https://www.amazon.com/No-Nonsense-Quantum-Field-Theory-Student-Friendly/dp/3948763011). I like it a lot more than the other QFT books I have (purely because it's dumbed down significantly.)

It's a chunky book, and is doing an amazing job of introducing some pretty complex topics, but in a way that makes some intuitive sense.

I finally got to one of the free field equations in the book, and I figured it'd be fun to codify a dumbed down version of the equation.

## Background

First some background material before we talk about the equation.

This will be pretty hand wavey. (Partly because it takes a decent amount of background knowledge to get to this point, and partly because I don't understand that much).

### Fields

But in QFT, everything is treated as a "Field". Fields are super simple to understand if you're a programmer. Basically fields are functions that take in an X, Y, Z, and return a number. You can imagine having a function that gives you the temperature in the room based off the X, Y, Z coordinates.

There's two complications to add to fields.

### Special Relativity

First off, in quantum field theory the fields (and emergent particle excitations) will be moving near the speed of light, so we need to take into account special relativity.

Special relativity is the idea that all reference frames are equally valid, and the speed of light is a constant for everyone. These two rules create some inconsistencies in the old way of thinking about space and time. If I'm moving near the speed of light and hold up a flash light, the light to me will appear to me to be going \\( c = 300,000,000\frac{m}{s} \\) . But to someone who is watching me go near the speed of light, my flashlight light will also look like it's going \\( c \\) (not \\( 2 c \\) as we would have expected). That's pretty weird.

They key is that "time" isn't quite what we thought, and it appears to be intimately related to space (hence spacetime).

At any time we are moving through some combination of space or time. (And that sum is equal to a constant). For us humans, we almost exclusively move through "time". But if you're moving near the speed of light, you move mostly through space, and less through time. It's said that photons are "timeless" because they move purely through space, and not through time. (since they are traveling at the speed of light.) I don't think it's too insightful to take that literally though.

So, when dealing with things moving near the speed of light, we need to be careful that we respect the sum of space and time such that it's constant with all frames. That constant is:

$$ (\Delta s)^2 = (c \Delta t)^2 - (\Delta x)^2 - (\Delta y)^2 - (\Delta z)^2 $$

This is known as the spacetime interval.

That notation can be cumbersome, so scientist instead created a construct known as a four-vector:

$$
x_\mu = \begin{pmatrix} ct \\\\ x \\\\ y \\\\ z \\\\ \end{pmatrix}
$$

Now space and time are on the same footing. \\( x_0, x_1, x_2, x_3 \\) are just components of a vector

They also define something called the Minkowski metric:

$$
\eta = \begin{pmatrix} 1 & 0 & 0 & 0 \\\\ 0 & -1 & 0 & 0 \\\\  0 & 0 & -1 & 0 \\\\ 0 & 0 & 0 & -1 \end{pmatrix}
$$

So instead we can say:

$$ (\Delta s)^2 = x*\mu \eta^{\mu \nu} x*\nu $$

We also need a derivative (velocity) of space time. This can be defined as:

$$ \partial*\mu = \frac{\partial}{\partial \eta^{\mu \nu} x*\nu } = \frac{\partial}{\partial x^\mu } = \begin{pmatrix} \frac{\partial}{c \partial t} \\\\ - \frac{\partial}{\partial x} \\\\ - \frac{\partial}{\partial y} \\\\ - \frac{\partial}{\partial z} \\\\ \end{pmatrix}$$

### Types of Fields

There can also be different types of Fields! For the programmer, this just means that those functions can return something other than a float!

For example we can have a vector field, this means that at each X, Y, Z, we'll get back a Vector{X: 1, Y: 3, Z: 3}. This could be useful for example if you want to model wind at each point in space. We know that window is blowing in some direction, so at each point you put a vector there to represent how fast and in which direction the wind is blowing.

There's one last important type of Field (besides scalar (float), and Vector), and that's a spinor field. Spinors are very interesting, and of extreme importance for our current map of reality, but we won't be talking about them in this post. They can be represented by two complex numbers, and they "spin" onto each other, they're very weird, and not easy to visualize. But all fermions (matter particles), are represented by spinor fields, so I'm sure I'll write about them one day.

We'll only talk about scalar fields. (The Higgs field is an example of a scalar field, but that doesn't matter).

### Lagrangian

I'll write a full post about this another day, but Lagrangian mechanics is another formulation of physics that can be used to derive equations of motions based off the idea that "nature is lazy". If you accept the assumption that nature wants to minimize the "Action" of a system (usually defined classically as Kinetic (T) - Potential (V) energy), you can figure out the laziest path possible, and that's the correct one!

For example when you throw a ball in the air, why doesn't the ball go any higher or lower in it's arc? What's to stop it from going at a slightly higher or lower in it's trajectory if it going to end in the same spot? There's an infinite amount of paths that it could go.

You can get the same answers using Newtons formulation. Normally for simple systems newton's methods are easier \\( (\bm{F} = m \bm{a}) \\), but in other situations, the Lagrangian (or another formulation called Hamiltonian mechanics) are easier to use!

Back to the ball, if you assume nature is lazy and wants to minimize the Action (T-V), you'll also get the correct path. It's very similar to Fermat's principle which showed that light takes the path of least time.

In everyday usage of Lagrangian, you figure out the Lagrangian \\( L \\) and then plug it into the Euler-Lagrange Equation:

$$ \frac{\partial L}{\partial q} - \frac{d}{dt} \left( \frac{\partial L}{\partial \dot{q}} \right) = 0 $$

For relativistic fields, a slightly different version of the Euler-Lagrange equation is used:

$$ \frac{\partial \mathcal{L}}{\partial \phi} - \partial*\mu \left( \frac{\partial \mathcal{L}}{\partial (\partial*\mu \phi)} \right) = 0 $$

They look pretty similar, except \\( \phi \\) is used instead of position. And instead of \\( \dot{q} \\) as velocity, the relativistic derivative is used \\( \partial\_\mu \phi \\).

## Klein Gordon Equation

The Klein Gordon is the simplest of the free field wave equations. Free field just means "non-interacting". The Klein Gordon equation describes how scalar fields evolve over time.

For example, you could imagine using the Klein Gordon equation to understand how temperature mixes around in a room over time. Except instead of temperature you use relativistic quantum scalar fields.

### The Lagrangian

The Lagrangian for the klein gordon equation is the following. Don't ask how to figure it out (I don't know). If I understand correctly, people in the past figured out the Klein-Gordon equation, and then worked back to get the Lagrangian (normally it's the other way, but the quantum world is weird and non-intuitive).

$$ \mathcal{L} = \frac{1}{2} ( \partial\_\mu \phi \partial^\mu \phi - m^2 \phi^2 ) $$

It's a weird equation, but it kind of intuitively makes sense if we pull it apart. Remember L is of the form of kinetic - potential. And the first term kind of looks like kinetic energy. It's the velocity of the field squared, similar to \\( \frac{1}{2} m v^2 \\). And the second term is the potential which is \\( - \frac{1}{2} m^2 \phi^2 \\). For a spring the potential is \\(-\frac{1}{2}kx^2 \\). Not that different.

You may notice that the \\( \mu \\) is upstairs on one of the partial derivatives, and downstairs on another partial derivative. That's to satisfy the relativistic spacetime interval we talked about earlier. \\( (\Delta s)^2 = x*\mu \eta^{\mu \nu} x*\nu = x\_\mu x^\mu \\).

### Klein Gordon Equation

So, we plug the Lagrangian into the Euler-Lagrange for fields and get back the **Klein Gordon Equation**:

$$ (\partial\_\mu \partial^\mu + m^2) \phi = 0 $$

What does it mean? Well it can kind of be thought of as a set of springs where each spring is also attached to the spring next to it.

If we expand the Lagrangian (in one direction x) we get:

$$ \frac{1}{2} \left( \left(\frac{\partial}{c \partial t} \phi\right)^2 - \left(\frac{\partial \phi}{\partial x} \right)^2 -m^2 \phi^2\right) $$

The first term, \\( \left(\frac{\partial}{c \partial t} \phi\right)^2 \\), is the kinetic energy of the harmonic oscillators. It's related to the "change of the field over time" similar to the velocity of the field.

The second term, \\( - \left(\frac{\partial \phi}{\partial x} \right)^2 \\), is subtracted, meaning it's a potential, and deals with the change of the field in relation to space. So the parts of the field that are significantly higher than nearby points will be brought down. It's similar to rubber bands connected to neighboring elements of the field.

The last term \\( -m^2 \phi^2 \\) is the potential energy of the individual elements of the field, similar to a spring. If \\( \phi \\) is high at some point, it will be brought down quickly.

So overall the Klein Gordon kind of seems like an array of springs that are connected to each other!

We can easily program that!

### Simulation

<div style="text-align: center">
<video controls src="/k1j10.mp4" style="width: 75%;"  loop ></video>
</div>

So, each of the little "\*" are a mass element attached to a string. I start the simulation by pulling one of the springs up 10 units and then releasing it. You can see all the resulting waves.

It's pretty cool to watch all the resulting frequencies of waves that are created by a single pluck. Another day I might perform some Fast Fourier Transforms and watch which frequencies become dominate based off of different parameters and interactions.

Also, I connected the left and right side of the springs. So it warps around. It's actually a "circle" of connected springs.

#### Tunning K and J

There's two main constants to tune. The first K, is the standard spring constant. The second (J) is the strength of the band between the springs.

##### K=10, J=1

The individual springs dominate the bands between the springs.

<div style="text-align: center">
<video controls src="/k10j1.mp4" style="width: 75%;"  loop ></video>
</div>

##### K=1, J=10

The bands between springs dominates over the spring constant.

<div style="text-align: center">
<video controls src="/k1j10.mp4" style="width: 75%;"  loop ></video>
</div>

##### K=5, J=5

The two terms are equal:

<div style="text-align: center">
<video controls src="/k5l5.mp4" style="width: 75%;"  loop ></video>
</div>

#### Two Plucks

Two plucks in the field:

<div style="text-align: center">
<video controls src="/2k1j10.mp4" style="width: 75%;"  loop ></video>
</div>

## What went well

- Everything went pretty well. I used semi-implicit euler as my integrator, the standard terminal ansi escape codes for drawing the display, the code is pretty small.

## Thoughts

- Somewhat unrelated, but the fact that \\( cos(kx - wt) \\) is what we use to model waves for some many phenomena, and that the minkowski metric can be written as -1,1,1,1 or, (x-t) just seems too beautiful. The fact that waves travel both through time and space was always very weird to me. At any point you can travel either through time or space and get to the same "spot". The fact that relativity puts them together like that makes so much sense. I absolutely love it.

## Future

I think it'd be super cool to extract out the resulting frequencies from each pluck.

More importantly, it's time to move to the most important equation... the Dirac Equation. Time to understand spinors.
