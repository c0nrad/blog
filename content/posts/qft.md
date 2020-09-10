---
title: "Simulating Quantum Fourier Transform"
date: 2020-07-07T11:01:25-04:00
draft: false
tags: ["quantum computation"]
---

I'm pretty excited. I'm somewhat in disbelief that it even works. But I was able to implement Quantum Fourier Transform on my little [quantum computation simulator](https://github.com/c0nrad/qrad).

<!--more-->

## Demo

<div style="text-align: center">
<video controls src="/iqft.mp4" style="width: 100%;" autoplay loop ></video>
</div>

In the above simulation, the simulator is stepping through the circuit step by step. 

Each step is called a "moment". The wires are the little qubits, and the boxes are the quantum gates.

Each step in the circuit is represented by a 2**4 matrix (4 because there are 4 qubits). Most of the work involved in this simulator is constructing those matrixes corresponding to each step. For each step you multiply that matrix against the systems overall state. Just like that you're simulating quantum systems.

The bottom left is the amplitude and phases of the different states. Normally the phases are displayed a little differently, but it's on a terminal so I just used a bar chart to represent them. (They're complex numbers).

## Fourier Transform

I went to school for electrical engineering, and a big part of those four years was learning about the applications of fourier transforms. I never thought I'd be using it again, and I definitely did not expect to be using it for quantum computation. But it turns out it's incredibly useful and fundamental to many quantum algorithms.

The math for fourier transforms looks scary, but the concept is pretty simple. 

It turns out that in some cases, knowing the frequencies of a signal greatly simplifies a system. 

For example, if you had a sound signal made up of the combination of two sin waves, and you wanted to represent it by some function like f(t), it'd be a pretty "verbose" function. If you wanted to recreate the wave, you'd need to sample a lot of points to make any sense of it. 

<img src="/fourier.png">

But if I told you the function was just a combination of two sin waves at frequency 150 and 350, you only need those two frequencies to recreate the function.

Using the fourier transform, you can get the frequencies of some signal.

## Usage of Quantum Fourier Transform

In Quantum Computation you can't just "ask" the quantum system what state it is in. You can only ask a few yes or no questions. (This is due to fundamental limits of nature, not limits of engineering).

So a lot of the effort in creating quantum algorithms is "massaging" the problem in a way that allows us to ask a few specific questions.

One trick that quantum algorithm designers like to use is to pose the question in a way that the answer repeats at some frequency, then take the fourier transform of those answers, and then just pluck out the frequency (solution).

One example of this is Shor's algorithm, an algorithm for factoring large numbers. Normally factoring large numbers is extremely difficult (believed near impossible), but can massage that problem into a similar problem that has a cyclic solution, implement it on a quantum computer, then use QFT to pluck out that frequency (solution).

(I'm currently trying to implement Shor's algorithm, but the cyclic algorithm (a**x mod N) is a little difficult on a quantum computer, but slowly getting there)

## Simulator

The simulator was written using https://github.com/mum4k/termdash.

It's a neat little library for displaying charts in terminal.

A little overkill, but it's nice to step through and see the phase and amplitudes evolve with time.

## Crack Pot Idea

Implementing a**x mod N on a quantum circuit has been surprisingly difficult. Also implementing CRC4. I don't like having to think. 

One crack pot idea i'd like to test out is:
* What if I wrote some algorithm to sample the functions (a**xmodN / CRC4) and create a truth table for those functions.
* Using that I can create some matrix that represents the function
* Then maybe I can take the "Reverse Kronocker product"(?) or brute force I, X, and CNOTs gates together until I find the circuit that makes up that matrix

No more thinking when I have a function I want on a quantum computer. We'll see.

(My double-down crack pot idea: maybe I could use grover's algorithm to generate them for me. quantum algorithms building quantum algorithms). We'll see.

## Improvements to QRAD

* QFT/iQFT
* Basic arithmetic
* The simulator using https://github.com/mum4k/termdash

## Things that were frustrating/took longer than planned

* Kind of silly, but I get my endianness mixed up a bit. Should the MSB (most significant bit), but on the top or the bottom of the circuit?
    * Eventually I need to pick a convention and stick with it.
* I thought that QFT would be the hard part of shor's, but turns out it's that a**xmodN. There's some resources online, but it's going to require some time understanding the solutions, they don't look trivial. 
    * There's plenty of solutions that work for specific cases, but I want to be able to just say Factor(33) and have the circuit pop out

## Future

Next up I'm working on a couple of things:

* Implement Shor's algorithm
* Implement the quantum hash cracker using grover's algorithm
* Quantum Registers