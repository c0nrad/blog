---
title: "Hydrogen Spectral Diagram"
date: 2020-08-29T10:59:09-04:00
draft: false
---

Terminal application showing the spectral lines for electron transitions in hydrogen.

<!--more-->

## Overview

I thought it would be fun to create a little colorful application showing the spectral lines of hydrogen.

## Background

Electrons in hydrogen can be at different energy levels. The energy levels are designated by \\( n \\), and have the energy:

$$ E_n = -\left[ \frac{m_e}{2\hbar^2} \left( \frac{e^2}{4 \pi \epsilon_0} \right)^2 \right] \frac{1}{n^2} $$

When an electron jumps from one level to another (such as n=3 to n=1), a photon is emitted with the energy equal to the change in energy states.

We also know that the energy of the photon is related to it's frequency (and therefor wavelength).

$$ E = h f $$

$$ c = \lambda f $$

$$ \therefore \lambda = \frac{h c}{E} $$

So, we can iterate through each of the energy levels for an electron in hydrogen and see what types of photons they will let out. Some of those photons will be in the visible light spectrum!

## Code

I built a little Go app to build the spectral diagram. https://github.com/c0nrad/spectral. Here's the output of the program:

![Spectral Diagram](/spectral.png)

For the transitions, if the resulting wavelength was in the visible wavelength I printed it with it's corresponding color. 

I thought that there would be more color! I didn't realize that only the Balmer series (n=2) had color!

## What went well?

* GoLang's big.Float was useful for high precision floats.
* For the display I used the ANSI escape characters for cursor position and color. Works super smoothly.

## Other thoughts

* I need a better way to store the "units" along with my variables. I name the variables based on their units, but that's dumb, I wish the unit type information was stored with the value, but it's kind of overkill to build some struct for a small project like this.
    * But it'd be super nice to be able to just convert types without having to hardcode JoulesToEV and such.

# Closing Remarks

None really, it was a fun project. I wish the hydrogen spectrum had more colors! Next up I'm thinking of calculating Clebsh-Gordan coefficients. My quantum angular momentum/spin addition is not as good as it should be.