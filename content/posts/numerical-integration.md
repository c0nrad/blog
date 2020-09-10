---
title: "Numerical Integration Pt. 1"
date: 2020-07-11T23:12:13-04:00
draft: false
tags: ["physics", "computational physics"]
---

Some exploration into numerical integration.

<!--more-->

## Introduction

It's insane how good Gauss-Legendre quadrature is at integrating functions numerically. With just a few points from a dataset it calculates the integral to an absurd amount of precision.

I'm legit having a good time implementing all these computational physics algorithms. When building out some of my previous physics simulators I just wrote some naive algorithms to perform these tasks (such as a rectangle integrator). It's cool to see just how much better a tool like Gauss-Legendre is comparatively.

In this post we'll compare the most popular numerical integrators

### Comparison of Integrators

[![Integrator Comparison](https://github.com/c0nrad/csim/blob/master/examples/integrate/integrate_example.png?raw=true)](https://github.com/c0nrad/csim/blob/master/examples/integrate/integrate_example.png?raw=true)

([Image](https://github.com/c0nrad/csim/blob/master/examples/integrate/integrate_example.png?raw=true) | [Source](https://github.com/c0nrad/csim/blob/master/examples/integrate/integrate_example.go))

The above chart shows the error for four different functions, using four different integrators, across a number of sample points (N) from the original functions. It took me most of the day to make this image.

The four functions are: 

$$ f_{topleft} = \int_{-1}^{1} \frac{1}{1+x} dx $$

$$ f_{topright} = \int_{-10}^{10} 2 x^4 + 3 x^3 + 4 x^2 + 5 x + 6 dx $$ 

$$ f_{bottemleft} = \int_{0}^{1} sin(x^2) dx $$ 

$$ f_{bottomright} = \int_{0}^{2} e^{-2x} dx $$ 

### Integrators

Four different integrators were compared, rectangle, trapezoidal, simpson, gauss-legendre.

#### Rectangle

The simplest and most logical. Taken directly from the definition of the Integral. It just splits a function into a number of very small rectangles and adds them up.

#### Trapezoidal

A logical extension to the rectangle method. Sometimes the top of the rectangle's isn't flat, so instead treat the top linearly, and use trapezes to model the chunks instead of rectangles.

#### Simpson's Rule

The next logical extension, instead of treating the top of the rectangles as linear, treat them as cubic. 

#### Gauss-Legendre

I am honestly blown away by how accurate this function is. 

I'm going to dedicate part two to just this algorithm.

This model is different than the rest. The algorithm is used to determine the spacing of the different chunks along with weights for the sample points.

## Offtopic: Function Interceptor 

I also wanted to prove that none of the integrators were cheating by calling the base function more than the other integrators. (It turns out this was a little tricky with edge conditions, but the details are boring).

So I needed a way to determine how many times a function was called. I wrote this little funcintercept class that was pretty neat. It intercepts every call the function and records the argument it receives by wrapping the original function in a closure.

I imagine I'll probably use a similar construct for caching/memoization.

### Conclusion

A short post, I need to go to bed. But I'm excited to learn more of the theory of how gauss-legendre performs so well.

(I also need to implement a root's finding algorithm, I'm hard coding some of the legendre roots :nervous-face:. But excited to get that working too)

Cheers

```go
type FuncIntercept struct {
	In map[float64]int
}

func NewIntercept() FuncIntercept {
	return FuncIntercept{In: make(map[float64]int)}
}

func (c FuncIntercept) F(f csim.Func) csim.Func {
	return func(x float64) float64 {
		c.In[x]++
		return f(x)
	}
}

func (c FuncIntercept) Unique() int {
	return len(c.In)
}

...

// example usage
i := NewIntercept()
f = i.F(oldFunc)
f(1); f(2); f(3);
if i.Unique() != 3 {
    panic("Missed a call!")
}
```