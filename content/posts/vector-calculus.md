---
title: "Vector Calculus"
date: 2020-07-19T10:10:01-04:00
draft: false
tags: ["programming", "numerical", "vector", "EM"]
---

Progress on a vector calculus library in javascript.

<!--more-->

## Motivation

I took a break from the numerical calculations book to try and apply some of the techniques I learned so far. 

(Also I applied to a few Ph.D. programs in computational physics, and I need to review some of the basics I've forgotten, so I figured this would be a good opportunity.)

And I've wanted to build an Electromagnetism simulation for awhile, so I've been reading [Griffith's E&M book](https://www.amazon.com/Introduction-Electrodynamics-David-J-Griffiths/dp/1108420419/ref=sr_1_2?dchild=1&keywords=electromagnetism+griffiths&qid=1595167901&sr=8-2&tag=techblast0f-20). I think I actually bought this book for college 8 years ago, but I never read it. Unfortunately all my books are in storage. 

Reading it page by page and doing the examples has been pretty fun. I'm even learning that I didn't understand a few concepts as well as I thought (line integrals are the dot product of the line vector, not the magnitude vector!). Which is always (frustrating at first), but exciting afterwards.

(Rant: I really wish there was a "Project Euler" but for physics. I don't really enjoy doing physics problems on paper. Every time I solve a problem on paper it seems like a waste. Had I instead codified the solution at least I'd have something when I was done. Now I just have notebooks of messy handwriting. Not to mention I don't really trust my math when the equations get long, it's too easy for me to mess up and accidentally cross of a term. I wish more math was done on a computer, but the ph.d. won't be that way, so I need to practice by hand.)

But afterwards I codified some of the stuff I had learned:

## vector.js 

https://github.com/c0nrad/vector

Chapter 1 is all about vectors and some calculus (and coordinate systems). A perfect thing to put into code.

I ended up implementing:

* vectors
    * basic operations, dot and cross product, etc
* vector fields
    * basic operations, "evaluate" at a point, etc
* vector operators
    * Gradient
    * Divergence
    * Curl
    * LaPlacian
* Integrals (numerical)
    * integrate (standard, simpsons)
    * integrate vector-field along line/path (simpsons)
    * integrate vector-field surface (flux) (center)
    * integrate volume (center)
* Examples
    * Divergence Theorem
    * Stokes' Theorem

All in all it was pretty fun, and super neat that divergence/stokes actually worked.

### Vector Calculus Operators

#### Gradient

The gradient is a nify little operator that is somewhat similar to a "3D slope". After taking the operator of a function, it'll return a vector that points "uphill".

$$ \nabla T = \frac{\partial T}{\partial x}  \hat{\bm{x}} + \frac{\partial T}{\partial y}  \hat{\bm{y}} + \frac{\partial T}{\partial z}  \hat{\bm{z}} $$

So if you had something like:

$$ A = 3x^2 + 5yz $$

And you took the gradient you'd get:

$$ \nabla A = 6x \hat{\bm{x}} + 5z \hat{\bm{y}} + 5y \hat{\bm{z}} $$

#### Divergence

The divergence is a measure of the "inward" or "outward" flow of a vector field at a point. You can think of it like a measure of a facet or a drain in a body of water. 

$$ \nabla \cdot \bm{v} = \frac{\partial \bm{v_x}}{\partial x} + \frac{\partial \bm{v_y}}{\partial y} + \frac{\partial \bm{v_z}}{\partial z} $$

Notice that it takes a vector field, and output a scalar function.

An example:

$$ \bm{v} = 6x^2 \hat{\bm{x}} + 5zy \hat{\bm{y}} + 5yz \hat{\bm{z}} $$

$$ \nabla \cdot \bm{v} = \frac{\partial (6x^2)}{\partial x} + \frac{\partial (5zy)}{\partial y} + \frac{\partial (5zy)}{\partial z} =12x + 5z + 5y $$

#### Curl 

The curl has a pretty apt name, it's the measure of how much a vector field "curls" or "swirls" around a point. 

The curl can be calculated by:

$$ \nabla \times \bm{v} = \det \begin{vmatrix}
\hat{\bm{x}} & \hat{\bm{y}} & \hat{\bm{z}} \\\ 
\partial / \partial x  & \partial / \partial y & \partial / \partial z \\\ 
v_x & v_y & v_z
\end{vmatrix}  = \hat{\bm{x}} \left(\frac{\partial v_z}{\partial y}-\frac{\partial v_y}{\partial z} \right) + \hat{\bm{y}} \left(\frac{\partial v_x}{\partial z}-\frac{\partial v_z}{\partial x} \right) + \hat{\bm{z}} \left(\frac{\partial v_y}{\partial x}-\frac{\partial v_x}{\partial y} \right) $$

A little bit messier. Thank you computers for never making me have to calculate these by hand.

### Divergence Theorem

The divergence theorem (also known as Green's/Gauss's theorem), is a nifty little vector calculus theorem that states the following:

$$ \int_{\nu} ( \nabla \cdot \bm{v}) d \tau = \oint_S \bm{v} \cdot d\bm{a} $$

The math looks harder than the concept it's trying to explain. 

On the left, it's taking the volume integral of the divergence of a vector field. In english, it's is a measure of how much the vector field is flowing in or out of the volume.

On the right, it's the surface integral of the flux in/out of the border. In english, it's measuring how much of the vector field is flowing in or out of the border.

The equation is saying something so obvious that it's almost non-sensical. If there's a change of volume of stuff on the inside, it must either have came from through the surface border.

You can imagine if you cut out a cube in the ocean and measured how much "ocean" was in the cube at any point. If there's more "ocean" in the cube, you know that it must have come into our imaginary cube from one of the cube sides.

To implement this with my new nifty library:

```javascript
let A = new VectorField(new Func("y^2"), new Func("2*x*y + z^2"), new Func("2 * y * z"))
let a = new Vector(0, 0, 0)
let b = new Vector(1, 1, 1)

expect(integrate_volume_cube(divergence(A), a, b)).to.closeTo(2, .0001)
expect(integrate_surface_cube(A, a, b)).to.closeTo(2, .1)
```

[code](https://github.com/c0nrad/vector/blob/master/src/integrals.test.ts#L51)

### Stoke's Theorem

The second nifty vector calculus theorem, stoke's theorem has to do with the curl of a vector field.

$$ \int_{S} ( \nabla \times \bm{v}) \cdot d \bm{a} = \oint_P \bm{v} \cdot d\bm{l} $$

(Quick note, those dots in the equation are not for "funz" the specifically mean dot-product.)

Again, the equation looks more complex that it really is.

On the left, we take the surface integral of the curl of some vector field. This is a measure of the overall swirling along some surface. 

On the right we have the line integral along a path of the vector field. The \\( P \\) means that we are following the perimeter of the surface. Since it's the dot product, it's measuring how much the vector field is "aligned" with our perimeter path through the vector field.

So, the right is almost a shortcut to the left side. (It kind of reminds me of the fundamental theorem of calculus (or fundamental theorem of gradients)).

Basically instead of measuring the "curl" at every point, you can just trace the outside perimeter and call it good enough. 

In code:
```javascript
let A = new VectorField(new Func("0"), new Func("2*x*z + 3 * y^2"), new Func("4 y z^2"))
let a = new Vector(0, 0, 0)
let b = new Vector(0, 1, 1)

expect(integrate_surface(curl(A), a, new Vector(0, 0, 1), b)).to.closeTo(4 / 3, .1)

let path: Vector[] = [
    new Vector(0, 0, 0),
    new Vector(0, 1, 0),
    new Vector(0, 1, 1),
    new Vector(0, 0, 1),
    new Vector(0, 0, 0)
]

expect(integrate_path(A, path)).to.closeTo(4 / 3, .00001)
```

[code](https://github.com/c0nrad/vector/blob/master/src/integrals.test.ts#L60)

### Conclusion

That's all, but next up I think I might work on a library with three.js to do some quick visualizations of the above. We'll see.