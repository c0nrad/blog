---
title: "Matrix Inversion"
date: 2020-08-07T18:37:01-04:00
draft: false
categories: ["programming", "numerical", "matrix"]
---

Some fun inverting matrixes.

<!--more-->

## Overview

I'm currently reading through Griffiths' Particle Physics book, and problem 3.7 ask you to find the inverse of this matrix:

$$
\Lambda = \begin{vmatrix}
\gamma & -\gamma\beta & 0 & 0 \\\
-\gamma\beta & \gamma & 0 & 0 \\\
0 & 0 & 1 & 0 \\\ 0 & 0 & 0 & 1 \end{vmatrix}
$$

It's been awhile since I took Linear Algebra, I wasn't sure if it was even possible to easily invert a matrix. Something about \\( det(A) \\)?.

I figured it'd be a fun problem to solve pragmatically. So I jumped to wiki and found this boss equation:

![cayley](/cayley.png)
[link](https://en.wikipedia.org/wiki/Invertible_matrix#Cayley%E2%80%93Hamilton_method)

I'm not even going to try and replicated that in LaTeX. But it looks cool.

Off to coding!

## Solution

Well the code is done:
https://github.com/c0nrad/matInv/blob/master/matrix.ts

I ended up not using Cayley-Hamilton equation.

Turns out instead you can take the "adjugate" of the matrix and multiply it by the inverse of the determinate. This is related to [Cramer's Rule](https://en.wikipedia.org/wiki/Cramer%27s_rule#Finding_inverse_matrix). (No idea what that is.)

The adjugate is the co-factor of the matrix (again, don't really know what that is), but you can calculate it by taking a bunch of little determinates of the matrix. The determinate is sort of the area "scaling" factor of a matrix. Highly recommend the [3Blue1Brown](https://www.youtube.com/watch?v=Ip3X9LOh2dk&vl=en) video on the subject.

The code is kind of cool, it uses a [recursive solution](https://github.com/c0nrad/matInv/blob/master/matrix.ts#L143) to find the determinate, and should work fine on larger matrixes ('fine' as in correct, not fast, it's a slow algorithm). To do the recursive det's I made up this matrix operator 'splice' that'll return a new matrix without the specified row and col. No idea if it's original, but it worked super well.

## Solving the problem

Sadly, I should have spent 1 extra second thinking before I rushed to programming a solution. Programming won't help me here (unless I was to use a symbolic system).

The solution to this problem plays on the relation of \\( \gamma \beta \\) in a pretty clever way.

(I tried to be clever with the numerical solver and substitute in primes and try to deduce the relation, but I quickly gave up.)

To invert between position vectors, you just switch the sign! It's actually pretty neat that it works.

$$ x\prime = \gamma (x - vt) $$
$$ t\prime = \gamma(t-\frac{v}{c^2}x) $$

With:

$$ \gamma = \frac{1}{\sqrt{1-\frac{v^2}{c^2}}} $$

Then to switch back:

$$ x = \gamma (x\prime + v t\prime) $$
$$ t = \gamma (t\prime + \frac{v}{c^2} x\prime) $$

So the actual matrix of inversion is:

$$
\Lambda^{-1} = \begin{vmatrix}
\gamma & \gamma\beta & 0 & 0 \\\
\gamma\beta & \gamma & 0 & 0 \\\
0 & 0 & 1 & 0 \\\ 0 & 0 & 0 & 1 \end{vmatrix}
$$

And if you multiple them together, you get \\( \bm{I} \\)

## Conclusion

Two seconds of thinking could have saved me 2hrs of programming. But it was a fun exercise. [No ragrets](https://i.imgflip.com/1ubz5z.jpg).
