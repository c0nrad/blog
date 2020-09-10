---
title: "Vector Calculus Part 2: Visualization"
date: 2020-07-20T21:04:09-04:00
draft: false
tags: ["programming", "numerical", "vector", "EM"]
---

Playing with three.js to do some vector visualizations.

<!--more-->

## Overview

So I started building out a toolkit for visualizing the vector library.

Eventually I'd like to create a little playpen where you can add different types of electrostatic objects (points, lines, surfaces, volumes), and you can see their effect on the E vector field.

Until then, I'm trying to figure out how to best display stuff! 

I'm happy with the progress, but not particularly happy with the results.

### Vector Addition

<div style="text-align: center" >
<canvas id="canvas_add" width="600" height="400"></canvas>
</div>

Here's two vectors being added together. Blue + Green = Red.

```javascript
let canvas_add = document.getElementById("canvas_add") as HTMLCanvasElement
var v = new viz.Viz(canvas_add);

var origin = new Vector(0, 0, 0)
var a = new Vector(3, 3, 4);
var b = new Vector(4, 1, 0);
var c = a.add(b)

var a_color = 0x0000ff
var b_color = 0x00ff00
var c_color = 0xff0000

v.drawVector(origin, a, a_color)
v.drawVector(origin, b, b_color)
v.drawVector(origin, c, c_color)

v.drawVector(a, b, b_color)
v.drawVector(b, a, a_color)
```

## Dot Product
<div style="text-align: center" >
<canvas id="canvas_dotproduct" width="600" height="400"></canvas>
</div>

I do not like any type of visualization I could find for dot product. I'm going to think more about this, but I think the best way to understand dot product is to just look at the math:

$$ \bm{a} \cdot \bm{b} = | \bm{a}| |\bm{b}| cos(\theta) $$

The length of the two vectors multiplied, times the cos of the angle between the two. So the closer aligned the two vectors are, the bigger the dot product.

It's important to note that the dot product results a scalar, not a vector.

## Cross Product
<div style="text-align: center" >
    <canvas id="canvas_crossproduct" width="600" height="400"></canvas>
</div>

```javascript
let canvas_dotproduct = document.getElementById("canvas_dotproduct") as HTMLCanvasElement
let v_dotproduct = new viz.Viz(canvas_dotproduct)

var dotproduct = a.dotProduct(b)
v_dotproduct.drawVector(origin, a, a_color)
v_dotproduct.drawVector(origin, c, b_color)
```

The cross product is pretty similar to the dot product, but it returns a vector that is orthogonal to the two original vectors.

$$ \bm{a} \times \bm{b} = | \bm{a}| |\bm{b}| sin(\theta) \hat{\bm{n}} $$

I think you can say that the magnitude of the vector is equivalent to the area of the parallelogram of two vectors? Which makes sense, because you can determine the area of a triangle using a similar formula:

$$ Area_{triangle} = \frac{1}{2} * a * b * sin(C) $$

## Vector Field

<div style="text-align: center" >
<canvas id="canvas_vf1" width="600" height="400"></canvas>
</div>

My first attempt at plotting a vector field, I _really_ don't like this one. It's super hard to glean what it's trying to say. 

```javascript
let vf1 = new VectorField(new Func("x* y"), new Func("x"), new Func("0"))
let canvas_vf1 = document.getElementById("canvas_vf1") as HTMLCanvasElement
let viz_vf1 = new viz.Viz(canvas_vf1);

viz_vf1.drawVectorField(vf1)
viz_vf1.drawVectorField(curl(vf1), 0x00ff00)
```

## Conclusion

I'm happy I have my toolkit all set up to start experimenting, but disappointed at the results so far. The graphs are very messy and hard to understand. I might ~~steal~~ borrow some visualization techniques from 3blue1brown, I'm guessing he's tackled 3D visualizations of vector fields at some point, and his stuff is amazing.

<script src="https://cdn.jsdelivr.net/gh/c0nrad/vector/examples/vector/app.js"></script>