---
title: "Thermoshat Pt. 1"
date: 2021-01-05T10:12:00-05:00
draft: false
categories: ["electronics"]
---

Introducing the thermoshat. A raspberry pi to adjust my manual thermostat with the added of thrill of increased fire danger.

<!--more-->

![/thermoshat](/thermoshat.jpg)

## Background

I'm currently living in Houghton, MI, which is a bit cold in the winter. I wake up at 7am to turn on the heat in the apartment, but turning on the heat means going downstairs into the frigid cold and waiting 30 minutes for the house to heat up before I can start working.

Really all I need is a robot to turn the dial on the thermostat 30 minutes before I wake up...

Thermoshat was born.

## Details

Currently the thermoshat's only responsibility is to adjust the knob to keep the temperature around 74 degrees. I don't trust it yet to leave it on all night.

Every few minutes the thermoshat checks the current temperature, and if it's too cold it'll move the thermostat warmer (assuming it's not already at max), or colder.

To check of it's at max, it uses an accelerometer to determine the orientation of the knob.

All in all the project was done in about 24 hours (noon to noon). The trickiest part was building an enclosure that wasn't too abusive to the thermostat (this is an apartment, and eventually I need to disassemble everything).

The stepper motor I use wasn't build to work with Kinex, so I had to super glue the components together.

I ended up using every single GPIO on the raspberry pi. I'm actually only using two of the four 7seg displays because I needed the two control wires for something else.

### Components

- Raspberry PI
- Stepper Motor / Driver ULN2003
- Accelerometer / Thermometer MPU6050
- 2x 7seg display
- Kinex for the scaffolding
- Breadboard / 9v battery / RPI GPIO extension

### Code

https://github.com/c0nrad/thermoshat

## Lessons Learned

- The MPU6050 is a pretty neat chip. Originally I was going to use it for a self balancing robot I'm working on, but I took a break from that to build this project.
- The MPU6050 temp/accel fluctuate a lot, so I needed to keep a buffer to average them

### Mistakes

- Stepper motors get hot if you don't release them, and that doesn't work well with hot glue guns.
- Hot glue isn't the best when you want a very strong grip (brittle) for torque.

## Future

- I'd like to use a smaller chip. Maybe an arduino teensy.
- It could be a fun chance for me to finally do something with Rust
- Upload the data to my robotics server (I started building a little endpoint to collect sensor data, really it just dumps everything into mongodb and then I use mongo charts to view it)
- 7seg display is a little overkill in terms of the GPIOs.
- Put everything onto a PCB, and 3d print the enclosure

Will I actually do any of that stuff? Probably not. I'm supposed to be studying. But it was a fun project.
