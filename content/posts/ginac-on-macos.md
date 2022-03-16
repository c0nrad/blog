---
title: "GiNaC on Macos"
date: 2020-05-27T18:43:40-04:00
draft: false
description: "A quick guide on getting started with GiNaC on macos."
categories: ["quantum mechanics", "simulation", "ginacs"]
---

A quick guide on getting started with GiNaC on macos.

<!--more-->

## Background

I decided to start my next project which will be calculating the "orbitals" of electrons in Hydrogen.

I was going to write it in Go, but calculating the Rodrigues formula and the associated Legendre Functions require performing an arbitrary polynomial derivative, and I couldn't find a good symbolic differentiator in GoLang. (And I'd like to see the results, not use a numerical differentiator).

Turns out there's a good library in C/C++ that some particle physicists use called [GiNaCs](https://www.ginac.de/tutorial/#Introduction). It has nice clean docs, and one of the starter examples was generating the [hermite polynomials](https://en.wikipedia.org/wiki/Hermite_polynomials)! (Which is similar to what I needed to do! (In that it's built off of differentiating \\( e^{-x} \\) some amount of times.)

## Installing GiNaCs

On Macos it's extremely easy! First you need to install [CLN](https://www.ginac.de/CLN/) (Class Library for Numbers), and then GiNaC. But they're both in homebrew!

```sh
brew install cln ginac
```

It's possible you'll need to install xcode if you haven't already. This is so gcc(clang) is setup. To install it you just run `xcode-select --install`.

## Setting up VSCode

Then I setup my IDE (I use Visual Code):

1. Set the C++ Standard to gnu++17. The commit messages within GiNaCs made it look like they're working on c++20 so I assume they're already on 17.

![c-standard](/c-standard.png)

2. Set the include paths

![c-include-path](/c-include-path.png)

To find the exact version for your include paths, open up terminal, and `cd` into the package directories (/usr/local/Cellar) to find the correct version numbers.

After this intelitype should work.

## Build the example

I had to modify the default example a little bit. It was complaining about not knowing which version of `pow` to use. So I just removed the namespaces (which I wanted to do anyways as I'm getting back into C++ and remember what belongs to what package)

```c++
#include <iostream>
#include <ginac/ginac.h>

GiNaC::ex HermitePoly(const GiNaC::symbol &x, int n)
{
    GiNaC::ex HKer = exp(-pow(x, 2));
    return GiNaC::normal(GiNaC::pow(-1, n) * GiNaC::diff(HKer, x, n) / HKer);
}

int main()
{
    GiNaC::symbol z("z");

    for (int i = 0; i < 6; ++i)
        std::cout << "H_" << i << "(z) == " << HermitePoly(z, i) << std::endl;

    return 0;
}
```

To build I ran:

```bash
g++ -std=gnu++17 hermitePoly.cpp -o hermitePoly -L/usr/local/Cellar/ginac/1.7.9/lib -lginac -L/usr/local/Cellar/cln/1.3.6/lib -lcln
```

Again, you'll need to know your exact package versions. For me it was ginac=1.7.9 and cln=1.3.6 on May 27th, 2020.

And then to execute your hard work:

```bash
./hermitePoly
```

I keep everything in a Makefile, so really I just type "make":

```Makefile
run: build
	./hermitePoly

build:
	g++ -std=gnu++17 hermitePoly.cpp -o hermitePoly -L/usr/local/Cellar/ginac/1.7.9/lib -lginac -L/usr/local/Cellar/cln/1.3.6/lib -lcln
```

## Conclusion

I can't believe how easy it was, I'm excited to start calculating the orbitals!
