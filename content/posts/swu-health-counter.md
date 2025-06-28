---
title: "SWU Health Counter"
date: 2025-06-28T15:30:24-04:00
draft: false
categories: ["eletronics"] 
---

A new electronics project! It's a simple circuit that just keeps track of base health for Star Wars Unlimited (SWU) trading card game. This was my first time making/ordering a PCB, and I learned a lot along the way.

<!-- more -->

## Problem Statement

To keep track of your base health in SWU, people usually use little damage tokens (in increments of 1/3/5/10), or dice. But I don't like these.

I don't like looking through a pile of tokens for the correct damage token, and dice never seem to cooperate with me. So instead of dealing with that, I decided it could be fun to build a little circuit that displays the current health. All the circuit needs to do is display the health and count up and down.

There's already existing mobile apps, and there's a little hockey puck like object you can buy that keeps track of base health, but I figured this project would also be a good chance for me to build and order my first PCB (printed circuit board).

## Version 1 (Arduino + 16x2 LCD)

The simplest version, and the ugliest. I had one of those Arduino starter kits that had some buttons and the 16x2 LCD. So I wired them together and glued them onto some piece of wood I found downstairs.

Ugly but I just wanted to get the quickest version out to see if there was any value to this idea. I brought it to the local store I play at, used it once, and then put it back into my backpack. It was way too bulky to use, but the idea seemed reasonable.

![swu-counter-v1](/swu-health-counter/swu-counter-v1)

## Version 2 (ICs)

It seemed a little overkill to use a Arduino kit just to count up and down. I did some googling, and it turns out there's ICs that pretty much do everything I need. Maybe I could get the power consuption to be trivial too and power off a coin battery.

Specifically:

* 74LS48: 7seg display driver from BCD
* 74LS192: Up/Down Counter
* 74LS14: Hex Schmitt Triggers for debouncing

![v2-kicad](/swu-health-counter/v2-kicad.png)

![swu-counter-v2](/swu-health-counter/swu-counter-v2.png)

But, this circuit was kind of complex! All those ICs take up a lot of space, the 7-segs are kind of ugly. It would never be that small.

It's also annoying to debug the circuit and hard to expand.

## Version 3 (PI Pico + Breadboard)

The first usable version! I decided to try out the Pi Pico Microcontrollers. They're made by the Raspberry Pi people, but instead of being a microprocessor it's just a microcontroller.

They're pretty neat, and you can program them in MicroPython using Thonny, which is super simple.

Around this time I also bought a 3d Printer (Bambu Labs P1S) to print a case and some other SWU accessories.

So I learned OpenSCAD and made a little shell for the breadboard and battery pack. I used this version for a few weeks.

![swu-counter-v3-scad](/swu-health-counter/v3-openscad.png)
![swu-counter-v3](/swu-health-counter/swu-counter-v3.png)

## Version 4 (PI Pico + PCB)

The goal was to make things smaller. So I swapped out the [display](https://www.amazon.com/dp/B09C5K91H7?ref_=ppx_hzsearch_conn_dt_b_fed_asin_title_1) to something smaller, found a smaller [LiPo battery](https://www.amazon.com/dp/B08FD39Y5R?ref_=ppx_hzsearch_conn_dt_b_fed_asin_title_1&th=1), and printed my first PCB!

The [library](https://github.com/makerportal/rpi-pico-ssd1306) I used for the display didn't have a way to increase text size, so I used [font-to-py](https://github.com/peterhinch/micropython-font-to-py) to generate 48px text. [Full code](https://gist.github.com/c0nrad/ad15086d213dd5e1d04d42016d883f62).

I again used OpenSCAD to make a little holder for the circuit ([code](https://gist.github.com/c0nrad/75333c5a1dd867883a01ded12bbefef3)).

![swu-counter-pcb](/swu-health-counter/pcb.jpg)
![swu-counter-v4](/swu-health-counter/swu-counter-v4.jpg)
![swu-counter-v4-kicad](/swu-health-counter/v4-kicad.png)
![swu-counter-v4-scad](/swu-health-counter/v4-openscad.png)

I used PCBWay for the PCB, it was very simple, I just went with all the defaults and it arrived 5 days later. You have to buy 5 and it ended up costing $60 in total, but overall very happy with the results.

I just finished it today, and haven't used it for anything. 

## Future

I'm not too sure if I'll do another iteration, but if I do, I'll probably do the following.

* Size
    * The Pico takes up a lot of room. But you can actually extract the Pico circuitry and place it directly on your own board. I think the total board size could be just the buttons and the screen.
* On/Off Switch
    * I think it'd be cool if the on/off switch was hanging off the side.
* Charge Controller
    * LiPo batteries are rechargable, so it'd be cool if I could charge the device via USB.
* eInk display
    * I want to test it, but maybe it'd be cool to have an e-ink display for lower power usage
* Trigger/Interrupts
    * The code is currently using a while loop to check for inputs, instead I should register interrupts and keep the decide in lower power mode
* Wifi/History
    * It's common to sometimes want to see what the health was previous. So maybe having a way to teather your phone and see the health values over time?

## Conclusion

I'm very happy with the results of the project! I always use the device now when I play SWU. I also feel very powerful now that I can order my own PCB circuits and do my own 3d-Print modeling for whatever my heart desires.

Off to the next project!