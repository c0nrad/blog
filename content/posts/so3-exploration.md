---
title: "SO(3) Lie Group Generators via Brute Force"
date: 2020-10-03T19:39:08-04:00
draft: false
categories:
  - "physics"
---

Brute forcing the generators for SO(3).

<!--more-->

## Motivation

I'm currently reading through [Physics from Symmetry](https://www.amazon.com/Physics-Symmetry-Undergraduate-Lecture-Notes/dp/3319666304) by Jakob Schwichtenberg. One of the sections, (_4.4.1 The Generators and Lie Algebra of \\( SO(3) \\)_), talks about generating the SO(3) rotation matrixes by first determining a set of Lie Algebra generators, and then doing some exponential matrix math.

The book hands the reader a couple of linearly independent generator matrixes that can be used to generate the group elements. But I was curious if they were a unique set of matrices. It seemed like it would be fun to figure out by brute force.

## Background

A brief introduction to the vocabulary of the group theory being used.

## SO(3)

SO(3) are the set of rotation matrices in 3D. That means they preserve length when used in vector multiplication. Physicist care a lot about changing reference frames (transformations), and these matrixes allow you to change the orientation of a system without changing anything about the system (such as scaling or shrinking the system).

As an example: it doesn't matter if you face north when bouncing a ball, or south, or east or any direction. We'd say that those rotations are invariant. It sounds like super simple stuff, but it's actually very important.

SO(3) is the group of "Special", "Orthogonal" 3 dimensional rotation matrixes.

- Special means that its determinate is zero. \\( det(O) = 1 \\). We require S because O(3) is also a group, but includes transformations via flips, but requiring det(O) = 1, means we only get rotations.
- Orthogonal means that \\( O^T O = 1 \\). Being orthogonal means that the matrix is length preserving.

The standard rotation matrices in 3D are:

$$
R_x = \begin{pmatrix}
1 & 0 & 0  \\\
0 & \cos(\theta) & -\sin(\theta)  \\\
0 & \sin(\theta) & \cos(\theta) \end{pmatrix}
$$

$$
R_y = \begin{pmatrix}
\cos(\theta) & 0 & \sin(\theta)  \\\
0 & 1 & 0  \\\
-\sin(\theta) & 0 & \cos(\theta) \end{pmatrix}
$$

$$
R_z = \begin{pmatrix}
\cos(\theta) & -\sin(\theta) & 0  \\\
\sin(\theta) & \cos(\theta) & 0  \\\
0 & 0 & 0 \end{pmatrix}
$$

So if you had a vector you wanted to rotate around some axis, you could take one ot those matrixes, plug in \\(\theta\\), and you'd have a length preserving rotation!

## Lie Group

Lie Groups deal with groups of continuous symmetry transformation, as opposed to discrete symmetry transformations. For example if you're looking at a square, you can only rotate it so many ways such that it'll still look the same (by 0, 90, 180, 270 degrees). But you can rotate a circle by any angle, and it's still the same looking circle. Since the square only allows a set number of rotations it is a discrete group, whereas a circle is a continuous group.

## Lie Algebra

Lie Algebras are a way of classifying and generating the lie groups. Many lie groups can belong to a lie algebra.

I mentioned in the introduction of this blog post that I wanted to generate the SO(3) matrixes. But what's the point if we already have them?

Well, we have them in 3-dimensions. But what about higher dimensions? There's also many ways to represent rotations (for example SU(2), special unitary matrixes are also very similar to SO(3) (SU(2) is the double cover of SO(3), meaning there's two different points in SU(2) that map to SO(3)). Which group is more fundamental?

Lie Algebra is given by matrices X such that \\( e^{tX} \in G\\), where G is the lie group, and the Lie Algebra includes a new operator called the Lie bracket \\( [,] \\) which instructs how to combine the matrices.

### Exponential Matrix

One thing that's very fun is that in the Lie Algebra X is a matrix, and we're putting it in an exponential. \\( e^{tX} \\). What does it even mean to raise a matrix by an exponential?

It turns out that Taylor series expansions save us again. The taylor series expansion of \\( e^x \\) is:

$$ e^x = \sum^{\infty}\_{n=0} \frac{x^n}{n!} $$

Meaning, if you wanted to calculate e^x for some x, you could instead solve the above infinite series. Which doesn't sound too useful, but usually what happens is you plug in some value of x, (maybe, \\( i \theta \\)), and you'll be able to fish out other infinite taylor series (such as \\( \cos(\theta) \\) and \\( i \sin(\theta) \\) (you can prove Euler's formula this way).

So, if we plug in \\( e^{tX} \\):

$$ e^{tX} = I + t X + \frac{t^2 X^2}{2!} + \frac{t^3 X^3}{3!} + ...$$

We can solve that!

## Generator Matrixes

So to calculate members of a lie group using the lie algebra, we need a set of generator matrixes. We'll then take these generator matrices, raise them to \\( e^{tX} \\) and get some group elements.

We know a little bit about how these generator matrices should look.

We know that the resulting matrices (we will call the group matrices O, and the generator matrices J) must have the properties such that:

$$
\begin{aligned}
   O^T O = I &   &   &   & \det(O) = 1 \end{aligned}
$$

And since:

$$ O = e^{\theta J} $$

We have our first condition on the generators J:

$$ O^T O = e^{(\theta J)^T} e^{\theta J} = 1 \implies J^T + J = 0 $$

There's also a handy property, \\( det(e^A) = e^{tr(A)} \\), using that:

$$ det(O) = 1 \implies det(e^{\theta J}) = e^{\theta tr(J)} = 1 $$
$$ \implies tr(J) = 0 $$

So, we have two conditions on \\( J \\), \\( J^T + J = 0 \\), and \\( tr(J) = 0 \\).

That's enough to start brute forcing!

## Brute Forcing Generators

So we specifically want something of the following:

```javascript
let a = random3();
if (a.transpose().add(a).equals(Zero3) && a.trace() == 0) {
  // do something
}
```

(full code can be found [here](https://github.com/c0nrad/group_brute))

Random3() randomly adds either 1, 0, -1 to each spot in a 3x3 matrix.

What's was somewhat interesting is that I get back 27 unique matrixes that fulfil that requirement.

Some example matrixes:

$$
J_{random1} = \begin{pmatrix}
0 & -1 & 0  \\\
1 & 0 & 0  \\\
0 & 0 & 0 \end{pmatrix}
$$

$$
J_{random2} = \begin{pmatrix}
0 & 1 & -1  \\\
-1 & 0 & 0  \\\
1 & 0 & 0 \end{pmatrix}
$$

$$
J_{random3} = \begin{pmatrix}
0 & 0 & 0  \\\
0 & 0 & -1  \\\
0 & 1 & 0 \end{pmatrix}
$$

They all make sense, they're symmetric across the diagonal axis (requirement of \\( O^T O = I \\)).

But, we can also see that \\( J*{random1} \\) contains similar elements from \\( J*{random2} \\). We know there's three rotation matrixes, maybe instead we try to find sets of three matrixes that are linear independent in the set of 27 matrxies that fulfil the initial requirements.

## Linear Independent

So maybe of our 27 matrixes, maybe there's only a couple that are linearly independent.

We can iterate over this too via code.

For three matrixes to be linearly independent we need it such that the only solution to the following below is when \\( 0 = k_1 = k_2 = k_3 \\) (this means that you can't build one of the matrix from a combination from others):

$$ k_1 J_1 + k_2 J_2 + k_3 J_3 = 0 $$

To do this we have to solve a system of equations! In our above example:

$$
k_1 J_1 + k_2 J_2 + k_3 J_3 = \begin{pmatrix}
0 & -k_1 + k_2 & -k_2  \\\
k_1 -k_2 & 0 & -k_3  \\\
k_2 & k_3 & 0 \end{pmatrix} = \begin{pmatrix}
0 & 0 & 0  \\\
0 & 0 & 0  \\\
0 & 0 & 0 \end{pmatrix}
$$

So from that we get our system of equations:

$$
\begin{aligned}
-k_1 + k_2 = 0 \\\ -k_2 = 0 \\\ k_1 - k_2 = 0 \\\ -k_3 = 0 \\\ k_2 = 0 \\\ k_3 = 0 \end{aligned}
$$

But there's an easier way, for there to be a solution, there must be a non-zero determinate. So we can take the determinate of our system to quickly check.

But we hit a problem, after brute forcing through the determinates for all the combinations I found: **All of the matrixes and their linear combinations have determinate zero**! So that doesn't help reduce the set.

## Generators

Well, maybe we'll find a requirement on the J matrixes as we continue forward with generating the SO(3) group elements.

Once we have a J, we're going to calculate \\(R_1 = e^{\theta J_1} \\). Since we're going to do some taylor series expansions, we might as well calculate \\( J^0, J^1, J^2, J^3, J^4, J^5\\) now.

$$
J^0 = \begin{pmatrix}
1 & 0 & 0  \\\
0 & 1 & 0  \\\
0 & 0 & 1 \end{pmatrix}, J^1  = \begin{pmatrix}
0  &  0  &  0  \\\
0  &  0  &  1  \\\
0  &  -1  &  0 \end{pmatrix}, J^2 = \begin{pmatrix}
0  &  0  &  0  \\\
0  &  -1  &  0  \\\
0  &  0  &  -1 \end{pmatrix}
$$

$$
J^3  = \begin{pmatrix}
0  &  0  &  0  \\\
0  &  0  &  -1  \\\
0  &  1  &  0  \end{pmatrix}, J^4 = \begin{pmatrix}
0  &  0  &  0  \\\
0  &  1  &  0  \\\
0  &  0  &  1  \end{pmatrix}, J^5 = \begin{pmatrix}
0  &  0  &  0  \\\
0  &  0  &  1  \\\
0  &  -1  &  0 \end{pmatrix}
$$

There's something pretty amazing there. They form their own cyclic group! \\( J^1 = J^5 \\). It turns out this is a very important property. Some of them also somewhat look like the identity matrix! \\( J^4 == I - \delta\_{111} \\). Let's just call that \\( K \\).

So we know that:

$$
\begin{aligned}
    J^1_1 & = J_1 \\\
    J^2_1 & = -K \\\
    J^3_1 & = -J_1 \\\
    J^4_1 & = K \\\
    J^5_1 & = J_1 \end{aligned}
$$

Let's start generating!

## Generating SO(3)

We're going to use the \\( J^1 \\) from above, and plug it into \\( e^{\theta J_1} \\).

$$ R*1 = \sum^{\infty}*{n=0} \frac{(\theta J_1)^n}{n!} \approx \left(\frac{1 I}{1} \right) + \left(\frac{\theta J_1^1}{1}\right) + \left(\frac{\theta^2 J^2_1}{2!} \right) + \left(\frac{\theta^3 J^3_1}{3!}\right) + \left(\frac{\theta^4 J^4_1}{4!}\right) + \left(\frac{\theta^5 J^5_1}{5!}\right) + ... $$

And we know some interesting things about the \\( J \\) powers:

$$ = I + (\theta J_1) + \frac{\theta^2-K}{2!} + \frac{\theta^3-J_1}{3!} + \frac{\theta^4+K}{4!} + \frac{\theta^5 + J_1}{5!} + ... $$

Then, doing some careful rearranging:

$$ = \delta\_{111} + K(1 - \frac{\theta^2}{2!} + \frac{\theta^4}{4!}) + J_1(\theta - \frac{\theta^3}{3!} + \frac{\theta^5}{5!}) $$

And, we have two other useful taylor expansions:

$$ \cos(x) = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \frac{x^6}{6!} ... $$
$$ \sin(x) = x - \frac{x^3}{x!} + \frac{x^5}{x!} - \frac{x^7}{7!} ... $$

Making the substitions we get the following:

$$
R_1 = \delta_{111} + K \cos(\theta) + I \sin(\theta) = \begin{pmatrix}
1 & 0 & 0  \\\
0 & \cos(\theta) & -\sin(\theta)  \\\
0 & \sin(\theta) & \cos(\theta) \end{pmatrix}
$$

Holy guacamole batman! We generated \\( R_1 \\).

## Other choices of J

But we used only one of the 27 J matrices, what happens if we pick any of the others?

Well, one of the important properties we exploited was that raising the J matrix to a power eventually cycled back to itself ( \\( J_1^5 = J_1 \\)). Do all the 27 J matrixes have that property?

Well, \\( -J_1 \\) was also a matrix. Its powers also have that cyclic property. Following the math through, we'd get \\( -R_1 \\), which is just a rotation in the opposite direction. (\\( R_1^{-1} = -R_1 \\)).

We also have \\( J_2, J_3 \\) which will result in our standard \\( R_2, R_3 \\) matrixes, and their negatives, \\( -J_2, -J_3 \implies -R_2, -R_3 \\).

The zero matrix also fulfils the requirements to be a J matrix, and it results in the I transformation.

The other matrix are combinations of \\( J_1, J_2, J_3 \\), let's see what \\( J_1 + J_2 \\) generates:

$$
J_{12} = J_1 + J_2 = \begin{pmatrix}
0  &  0  &  1  \\\
0  &  0  &  -1  \\\
-1  &  1  &  1  \end{pmatrix}
$$

And calculating some powers:

$$
J^0 = \begin{pmatrix}
1 & 0 & 0 \\\
0 & 1 & 0 \\\
0 & 0 & 1 \\\
\end{pmatrix} J^1 = \begin{pmatrix}
0 & 0 & 1 \\\
0 & 0 & -1 \\\
-1 & 1 & 0 \\\
\end{pmatrix} J^2 = \begin{pmatrix}
-1 & 1 & 0 \\\
1 & -1 & 0 \\\
0 & 0 & -2 \\\
\end{pmatrix}
$$

$$
J^3 = \begin{pmatrix}
0 & 0 & -2 \\\
0 & 0 & 2 \\\
2 & -2 & 0 \\\
\end{pmatrix}
J^4 = \begin{pmatrix}
2 & -2 & 0 \\\
-2 & 2 & 0 \\\
0 & 0 & 4 \\\
\end{pmatrix}
J^5 = \begin{pmatrix}
0 & 0 & 4 \\\
0 & 0 & -4 \\\
-4 & 4 & 0 \\\
\end{pmatrix}
$$

$$
J^6 = \begin{pmatrix}
-4 & 4 & 0 \\\
4 & -4 & 0 \\\
0 & 0 & -8 \\\
\end{pmatrix}
J^7 = \begin{pmatrix}
0 & 0 & -8 \\\
0 & 0 & 8 \\\
8 & -8 & 0 \\\
\end{pmatrix}
J^8 = \begin{pmatrix}
8 & -8 & 0 \\\
-8 & 8 & 0 \\\
0 & 0 & 16 \\\
\end{pmatrix}
$$

$$
J^9 = \begin{pmatrix}
0 & 0 & 16 \\\
0 & 0 & -16 \\\
-16 & 16 & 0 \\\
\end{pmatrix}
$$

Very odd. So, \\( J^9 = J^1 2^{n/2} \\)

$$
\begin{aligned}
    J^0 &  = I \\\
    J^1 &  = J \\\
    J^2 & = -I -(-\delta_{12} + -\delta_{21} + \delta_{33})  \\\
    J^3 & = -2 J \\\
    J^4 & = 2I + 2(-\delta_{12} + -\delta_{21} + \delta_{33}) \\\
    J^5 & = 4J \\\
    J^6 & = -4I - 4(-\delta_{12} + -\delta_{21} + \delta_{33}) \\\
    J^7 & = -8J \\\
    J^8 & = 8I + 8(-\delta_{12} -\delta_{21} + \delta_{33}) \\\
    J^9 & = 16 J \end{aligned}
$$

Curiouser and Curiouser. We can sneakily pull out a couple of things. The \\(J^1, J^3, J^5, J^7, J^9 \\) terms look like our taylor expanded friend \\( \sin(x) \\). (Ignoring the \\( 2^{n/2} \\)). We also have two different groupings of \\( \cos(x) \\), the I and the weird off elements thing (let's call it \\( K = (-\delta*{12} -\delta*{21} + \delta\_{33}) \\).

So, ignoring all the \\( 2^{n/2} \\) elements, we know the solution will look something of the form:

$$ R_12 = J \sin(\theta) + I \cos(\theta) + K \cos(\theta)$$

$$
= \begin{pmatrix}
0 & 0 & \sin(\theta)  \\\
0 & 0 & -\sin(\theta)  \\\
-\sin(\theta) & \sin(\theta) & 0 \end{pmatrix} + \begin{pmatrix}
\cos(\theta) & 0 & 0  \\\
0 & \cos(\theta) & 0  \\\
0 & 0 & \cos(\theta) \end{pmatrix} + \begin{pmatrix}
0 & -\cos(\theta) & 0  \\\
-\cos(\theta) & 0 & 0  \\\
0 & 0 & \cos(\theta) \end{pmatrix}
$$

$$
= \begin{pmatrix}
\cos(\theta) & -\cos(\theta) & \sin(\theta)  \\\
-\cos(\theta) & \cos(\theta) & -\sin(\theta)  \\\
-\sin(\theta) & \sin(\theta) & 2\cos(\theta) \end{pmatrix}
$$

Well it turns out that looks suspiciously like:

<img src="/r_xy.png" style="border: 1px solid">

Which is just rotating around X and Y by \\( \theta \\).

And it turns out if we had been a bit smarter and multiplied the matrix by \\( \sqrt{2} \\) before doing the expansion, we would have gotten that!

$$
J^0 = \begin{pmatrix}
1 & 0 & 0 \\\
0 & 1 & 0 \\\
0 & 0 & 1 \\\
\end{pmatrix}
J^1 = \begin{pmatrix}
0 & 0 & \sqrt{2} \\\
0 & 0 & -\sqrt{2} \\\
-\sqrt{2} & \sqrt{2} & 0 \\\
\end{pmatrix}
J^2 = \begin{pmatrix}
-.5 & .5 & 0 \\\
.5 & -.5 & 0 \\\
0 & 0 & -1 \\\
\end{pmatrix}
$$

$$
J^3 = \begin{pmatrix}
0 & 0 & -\sqrt{2} \\\
0 & 0 & \sqrt{2} \\\
\sqrt{2} & -\sqrt{2} & 0 \\\
\end{pmatrix}
J^4 = \begin{pmatrix}
.5 & -.5 & 0 \\\
-.5 & .5 & 0 \\\
0 & 0 & 1 \\\
\end{pmatrix}
J^5 = \begin{pmatrix}
0 & 0 & \sqrt{2} \\\
0 & 0 & -\sqrt{2} \\\
-\sqrt{2} & \sqrt{2} & 0 \\\
\end{pmatrix}
$$

## Linear Combinations of Generators

So, the 27 matrxies are all the different combinations of rotations possible!

And this answers our original questions, are the matrixes that the book gave us the unique solution. No, they're all valid rotation groups, but in terms of standard convention yes. We have a standard definition of \\( R_x(\theta) \\), and \\( J_1 \\) and only \\( J_1 \\) maps to that.

So now, we can build a map of all the other different rotations!

$$
0 \implies I, \\\
J_1 \implies R_x(\theta), \\\
J_2 \implies R_y(\theta), \\\
J_3 \implies R_z(\theta), \\\
-J_1 \implies R_x(-\theta), \\\
-J_2 \implies R_y(-\theta) , \\\
-J_3 \implies R_z(-\theta), \\\
J_1 + J_2 \implies R_x(\theta) R_y(\theta), \\\
J_1 + J_3 \implies R_x(\theta) R_z(\theta), \\\
J_1 + -J_2 \implies R_x(\theta) R_y(-\theta) , \\\
J_1 + -J_3 \implies R_z(\theta) R_z(-\theta) , \\\
-J_1 + J_2 \implies R_x(-\theta) R_y(\theta), \\\
-J_1 + J_3 \implies R_x(-\theta) R_z(\theta), \\\
-J_1 + -J_2 \implies R_x(-\theta) R_y(-\theta) , \\\
-J_1 + -J_3 \implies R_x(-\theta) R_z(-\theta) , \\\
J_2 + J_3 \implies R_y(\theta) R_z(\theta), \\\
J_2 + -J_3 \implies R_y(\theta) R_z(-\theta), \\\
-J_2 + J_3 \implies R_y(-\theta) R_z(\theta), \\\
-J_2 + -J_3 \implies R_y(-\theta) R_z(-\theta), \\\
J_1 + J_2 + J_3 \implies R_x(\theta) R_y(\theta) R_z(\theta), \\\
J_1 + J_2 + -J_3 \implies R_x(\theta) R_y(\theta) R_z(-\theta), \\\
J_1 + -J_2 + J_3 \implies R_x(\theta) R_y(-\theta) R_z(\theta) , \\\
J_1 + -J_2 + -J_3 \implies R_x(\theta) R_y(-\theta) R_z(-\theta), \\\
-J_1 + J_2 + J_3 \implies R_x(-\theta) R_y(\theta) R_z(\theta), \\\
-J_1 + J_2 + -J_3 \implies R_x(-\theta) R_y(\theta) R_z(-\theta), \\\
-J_1 + -J_2 + J_3 \implies R_x(-\theta) R_y(-\theta) R_z(\theta) , \\\
-J_1 + -J_2 + -J_3 \implies R_x(-\theta) R_y(-\theta) R_z(-\theta)
$$

We have now accounted for the 27 matrixes.

## Conclusion

That was a fun project. It ended up being a little bit longer than planned, but it was very neat to explore.

The code can be found here:

https://github.com/c0nrad/group_brute

I actually just covered a number of these topics in class (taking matrix X to an exponential e^X, linear independence definition, orthogonal, determinants), so it was pretty cool to apply them.

### What went well

- Not at all related to this blog, but I recently got a surface book 3 laptop, I really like it for taking notes. The notes sync on OneNote to my laptop, so I did a lot of math on the tablet, and then copied it over to LaTeX.

### What didn't go as well

- The matrix library has a little error (the X,Y are swapped for certain operations). Next time I use this code I'll need to swap the ordering of some operations.

### What's next?

I'm going to generate some of the other groups, but I probably won't blog about it unless something exciting happens. I imagine the next blog post will be about Poincare group or spinors.
