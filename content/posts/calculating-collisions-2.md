---
title: "Calculating Collisions Pt. 2"
date: 2020-05-18T12:30:26-04:00
draft: false
description: "Calculating the resulting velocities from an elastic collision"
categories: ["newtonian", "simulation", "physics"]
---

Programming the equation we derived in the [last post](/posts/calculating-collisions/).

<!--more-->

## Background

So in the last post we were able to generate the following equation. It can be used to determine the resulting velocities of a collision of two spheres:

$$ v*{1f}^2 + v*{1f} \frac{(- 2 p*{i} m*{1} m*{2})}{m*{2} m*{1}^2 + m^2_2 m*{1}} + \frac{p*{i}^2 m*{2} - 2 m^2*2 K*{i}}{m*{2} m*{1}^2 + m^2*2 m*{1}} = 0 $$

## Results

This morning I codified the equations into `simp`, and they turned out pretty nicely!

<div style="text-align: center">
<video controls src="/sphere_collisions.mp4" style="width: 75%;" autoplay loop ></video>
</div>

They line up to the math we worked out in the last blog post.

### Vector Fun

In the last post I assumed that the vector math would just work out. Which ended up mostly being true.

But, it took me some time to figure out what I was supposed to do with the vectors when multiplying them together.

For Kinetic Energy, it almost seemed to make sense to take the dot product of the velocity vectors. Do we really want the "kinetic energy" for all the individual components? It feels weird to directly multiply two velocity vectors together.

$$ K\_{i} = \frac{1}{2} m v^2 $$

$$
\begin{bmatrix} v_x \\\\ v_y \\\\ v_z \\\\ \end{bmatrix}^2 = v_x^2 + v_y^2 + v_z^2
$$

But this didn't work. When I treat kinetic energy like a scalar instead of a vector, I had to add/subtract scalars from a vector (during the quadratic equation step) which was also weird (and the results I got were less than ideal...):

<div style="text-align: center">
<video controls src="/bad_collision.mp4" style="width: 75%;" autoplay loop ></video>
</div>

So instead I just multiply the vectors across:

$$
\begin{bmatrix} v_x \\\\ v_y \\\\ v_z \\\\ \end{bmatrix}^2 = \begin{bmatrix} v_x^2 \\\\ v_y^2 \\\\ v_z^2 \\\\ \end{bmatrix}
$$

And it seems to work. /shrug

## Next up

Turns out there's another big problem!

The equations don't take into account how the spheres are collide!

<div style="text-align: center">
<video controls src="/bad_sphere_angle.mp4" style="width: 75%;" autoplay loop ></video>
</div>

Back to the drawing board. It has something to do with the normal forces, but I'm not 100% sure how the math will look yet. Stay tuned!
