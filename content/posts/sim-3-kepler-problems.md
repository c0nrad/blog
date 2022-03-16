---
title: "Sim 3: Kepler Problems"
date: 2021-12-22T10:07:03-08:00
draft: false
description: "Calculate the different orbit types"
categories: ["simulation", "classical mechanics"]
---

We solve for the different types of orbits of the [Kepler Problem](https://en.wikipedia.org/wiki/Kepler_problem) (two body central force problems).

<!--more-->

## Introduction

In the [previous post](https://blog.c0nrad.io/posts/sim-2-effective-potential/) we reduced our two body problem to a single effective potential problem:

$$ U\_{eff}(r) = U(r) + U\_{cf}(r) = U(r) + \frac{l^2}{2 \mu r^2} $$

We can now determine the allowed types of orbits. To do this we are going to do some variable substitution, and determine \\( r(\phi) \\) which will allow us to see the orbits more clearly. During this process we will define a new variable called eccentricity that determines the orbit.

## Solving for \\( r(\phi) \\)

We ended up last time with:

$$\mu \ddot{r} = F(r) + \frac{l^2}{\mu r^3} $$

For reasons I don't quite understand yet, the problem becomes simpler if we replace \\( r \\) with \\( 1/u \\) (something about quasilinear).

We also need to figure out how to write \\( \ddot{r} \\) in terms of \\( r(\phi) \\).

$$ \ddot{r} = \frac{d}{dt} \frac{d}{dt} r = \frac{d \phi}{dt} \frac{d}{d\phi} \frac{d \phi}{dt} \frac{d}{d\phi} r = \dot{\phi}^2 \frac{d^2}{d\phi^2} \frac{1}{u} = (\frac{l u^2}{\mu }) \frac{d}{d \phi} (\frac{l u^2}{\mu}) (- \frac{1}{u^2}) \frac{d u}{d \phi} = - \frac{l^2 u^2}{\mu^2} \frac{d^2 u}{d \phi^2} $$

In step four we used the chain rule to partially evaluate \\( \frac{d}{d \phi} \frac{1}{u} = - \frac{1}{u^2} \frac{d u}{d \phi} \\)

So now we can substitute our result back into the original equation of motion:

$$ u"(\phi) = -u(\phi) - \frac{\mu}{l^2 u(\phi)^2}F$$

Next we plug in our force equation: \\( F = -G m_1 m_2 / r^2 = -\gamma u^2\\):

$$ u"(\phi) = -u(\phi) - \frac{\mu}{l^2 u(\phi)^2} (- \gamma u^2) = -u(\phi) - \frac{\gamma \mu}{l^2}$$

This equation is surprisingly simple due to the fact that our force equation is an inverse squared force, the \\( u(\phi) \\) terms cancel out. (Coincidentally I'm in the process of solving a related problem in a [physics problem book](https://www.amazon.com/gp/product/0226121097/ref=ppx_yo_dt_b_asin_title_o05_s00?ie=UTF8&psc=1), page 8 problem 8). I believe this implies that only inverse-square forces have stable orbits, but I haven't proved it yet.

Since the last term is constant, the solution is just the constant plus a sinusoid:

$$ u(\phi) = \frac{1}{r} = \frac{\gamma \mu}{l^2} + A \cos\phi = \frac{\gamma \mu}{l^2} (1 + \epsilon \cos\phi) = \frac{1}{c}(1 + \epsilon \cos \phi) $$

In the last stage we defined a new variable we will call the eccentricity (which will become obvious why soon), and \\( c = \frac{l^2}{\gamma \mu} \\) for bookkeeping.

Solving for r:

$$
r(\phi) = \frac{c}{1 + \epsilon \cos \phi}
$$

## Types of orbits

### Bounded

Looking at our previous equation, if we assume \\( \epsilon < 1 \\), then r will oscillate between \\( r\_{min} = \frac{c}{1-\epsilon} \\) and \\( r\_{max} = \frac{c}{1+\epsilon} \\)), which looks suspiciously like an ellipse (which is why we call \\( \epsilon \\) the eccentricity). (You can prove it by converting to cartesian coordinates and using the identity \\( \cos(\tan^{-1}(y/x)) == \frac{1}{\sqrt{1 + y^2/x^2}} \\), you will get the equation for an ellipse \\( x^2/a^2 + y^2/b^2 = 1 \\)).

If \\( \epsilon = 0 \\) we will have a constant r, meaning a circle.

### Unbounded

We have two possible unbounded states, \\( \epsilon = 1 \\) and \\( \epsilon > 1 \\).

If \\( \epsilon = 1 \\), then r goes to infinity at \\( \pi \\) and \\( -\pi \\). We can show it's a parabola by converting to cartesian coordinates:

$$
r(\phi) = \frac{c}{1 + \cos\phi} = \sqrt{x^2 + y^2} = \frac{c}{1 + \frac{1}{\sqrt{1 + y^2/x^2}}}
$$

Plugging into mathematica we get:

$$ y^2 = c^2-2cx $$

Which is the equation of a (horizontal) parabola.

If \\( \epsilon > 1 \\) we will have a maximum \\( \phi\_{max} \\) which defines the range for some sort of hyperbola.

### Eccentricity Plot

There's a fun plot here showing the trajectories of different eccentricities:

https://en.wikipedia.org/wiki/Orbital_eccentricity

## Simulation

Not a huge update, but now the simulation shows the eccentricity of the orbit.

https://blog.c0nrad.io/sims/twobody/

## Conclusion

This is the last post on two body central force problems. I'm not sure what I'll do next, but hopefully something just as fun and insightful.
