---
title: "Prime Walker"
date: 2021-07-24T22:23:16-07:00
draft: False
description: "Playing with prime numbers"
categories: ["prime"]
---

Another attempt at a factoring algorithm.

<!--more-->

## Background

I spent another couple of hours today attempting to factor numbers. It's such a simple and fun problem.

### Walking the linear line

Todays idea was to create a walking algorithm. I'm sure it's been done before.

But the idea was that maybe I could factor \\( N = p\*q \\) by starting with \\( p=2 \\) and \\( q=N/2 \\) and increase p as much as possible (such that the product is less than N), and then decrease q as much as possible (so that it's close to N), and then continue walking q and p closer and closer.

```go
func small_step(N int, a int, b int) (int, int) {
	if a*b < N {
		step := int(math.Ceil(float64(((N - a*b) / b))))
		return a + step, b
	} else {
		step := int(math.Ceil(float64(float64(a*b-N) / float64(a))))
		return a, b - step
	}
}
```

It's kind of similar to the different root finding methods, where you jump along the line and get closer and closer.

Would it be at all efficient? I was thinking/hoping that I could make big steps and skip lots of checks.

And it works decently well, but nothing ground breaking. The diagrams are kind of neat though:

![119](/119.png)

![361](/361.png)

It starts at (2, N/2), and walks down along the linear line. I converted it to golang's big.Int and tried some larger prime numbers, and there's no way it'll factor anything useful.

In the future I'm wondering if maybe I can do some random modulus jumping and play off similar relations that shor's algorithms play with:

$$ a^x = 1 mod N, gcd(a^{p/2}-1, N) $$

But very dubious.

### Other silly idea

I was reading some book on Quantum Information theory, and they were again deriving the probability/information equation (rareness of event gives `log` information).

And then I was thinking maybe I could convert a factoring algorithm from a multiplication problem to a log addition problem.

$$ \log(p\*q) = \log(p) + \log(q) $$

But I don't think this helps at all. Really what makes primes an interesting problem is that they are integers, and we depart from that with logrithms. Maybe if I did a log change of base, and summed over all bases and could find something like orthagonality constraint and cancel out the non-integer answers. But I've never heard of anything like that.

### Conclusion

Not much, but it was a fun couple of hours.
