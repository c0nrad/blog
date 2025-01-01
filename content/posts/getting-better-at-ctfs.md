<!-- ---
title: "How to win more CTFs"
date: 2024-10-06T10:20:23-07:00
draft: true
categories: ["CTFs"]
---

These are my thoughts/plan on how to win more CTFs. I'd love your feedback!

<!--more-->

## Introduction

After a CTF ends I like to ask myself: "why didn't I win this CTF?", or "why didn't I do better?". 

I'm not particularliy dissapointed in myself. On the contrary, I can't believe at how much I've learned in the last few years! 

But, to state the obvious, if I want to win, I need to not lose.

So, why am I losing, and what can I do to fix it?

### Thoughs on why I lose

* Mental Stamina
    * During an average day, I can only focus hard for about 5-6 hours.
    * During a competition, I can only focus for about 12-16 hours (but it's not sustainable for multiple days).
    * If I could focus more, I could solve more challenges.
* Lack of knowledge
    * I think this is the most obvious, and the easiest to grow. No one knows everything. And I personally believe a "good" ctf player is just someone who has seen the tricks before. Sometimes it's an extension/combination of the tricks, but you have to know the tricks.
    * So, figuring out what skills/tricks I was missing during the CTF, and then rapidly learing those techniques. As an example, on a recent CTF I left points on the table becuse I'm slow at browser-pwn, and I'm also not good at constructing custom lattices for LLL. So those are two things I'm working on. Maybe you don't know that "fl" can be one unicode character to bypass pyjails. Etc.
* Guessy Chals
    * Since I play solo, time/mental-energy are my most key resource. 
    * Sourceless web, certain misc, forensics, etc, can be huge time sinks with less reliable points
* Incorrect tooling
    * On a recent CTF I left points on the table because I used Ghidra instead of Ida. I love Ghidra, but I'm beginning to see the short comings when reversing more complex binaires. Certain critical memcpys didn't show up in the disassembly, the function databases aren't as good, etc. Sadly I think I'll need to buy an Ida license.
    * I'm not good at windows tooling either. When doing windows forensics, I have to manually reverse everything instead of running malware in a sandbox/debugger.
* Motivation/burnout
    * Sometimes I quit a CTF early because I don't think I can solve a challenge and I'm tired, but I find out while reading the writeups I had the skills to solve it.
    * There are some weekends where I question why I'm playing CTFs, or I just don't have the moitivation. It's rare, but it needs to be managed.
* CTF event selection
    * Not all CTFs are well suited for solo players. 
    * Specifically any team-based guessy/reverse heavy CTFs without source
* Wrist issues
    * This is a personal point, but for years I've had issues with my wrists. Probably spending 12+ hours every day on the computer since I was 10 doesn't help. Sometimes I quit because my wrist flare up.
* Life
    * This is a very individual bucket, and ad-hoc. But sometimes life gets in the way. We're not robots, and I have a wife and extended family/friends and a job (csper.io). These things are all more important than CTFs. But, effort and forthought can be done to make sure that they succeed in harmony. 

### What am I doing to improve at the above issues?

* Mental Stamina
    * General Health
        * As part of a push for longevity/wellbeing, but also to be able to focus for longer, I've encorporated a number of health habits over the last 12 months:
            * Tracking my sleep with WHOOP, and trying to get a 100% average. (currently at 89%. Life gets in the way, but I want to keep working at it, I've learned a lot about my sleep over the last year). I think if we ever stop doing monthly AirBnB travel I can perfect a setup that allows me to get 100%. 
            * Tracking my micro/macro nutrients with cronometer. I found a diet that works for me that hits all the micro/macro. Lots of veggies, legumes, nuts, etc.
            * Exercise program. Supposidly there's a link between weigh lifting and learning/memory, so I workout a 3-4 times a week. On off days I jog or walk. And rarely I'll do some HIT/sprints. But that's more for longevity, not CTFs.
            * Limiting alchohol. Sadly I know that for myself alchohol is terrible for performance and memory. So I try to have no more than one drink a month. But I do partake in edibles. If I was perfect I probably wouldn't. But it's nice to relax here and there and just veg out on a movie/show while buzzed. 
        * To be honest, I don't know how much (if any) these health changes have an impact on my CTF playing. But I think at least mentally being happy with your body is one less thing to worry about so you can focus more on CTFs. 
    * Context Switching
        * I think a lot of mental energy is spent switching between different tasks and thought patterns. To combat this:
            * I have a CTF script for ctfd and a few other platforms that automatically downloads and organizes all the challenges directories. This allows me to efficnetly leave notes and switch between tasks in a clean way. I think having a structured place to leave notes is useful so I don't have to keep it in my brain.
            * Sort life before the CTF starts. If I have a work email looming over me, or a bunch of chores that need to be done, get those done before the CTF so I can clear my brain of all reminders.
            * I have a notepad where I sometimes write down a list of everything that is bothering me at that moment. I think writing it down helps get it out so it doesn't randomly pop up while playing CTFs.
    * During the CTF
        * I'm working on this one. But an idea I want to test is taking a walk during the CTF, depending on the length of the CTF. 
        * Drinking water during the event
        * If anything is bothering me, write it down for later
    * Other mental hacks
        * Meditation? A quick google doesn't leave me to convinced though.

* Lack of Knowledge
    * I have about 4-6 hours a day I can grind to learn as much stuff as possible for CTFs. What is the most effective way to spend this time?
    * Writeups
        * The most obvious, but reading the writeups for all CTF challenges I missed! I find this is pretty much irresistable. I would guess/hope everyone does this. 
    * Learning strategies
        * Books, tutorials, read old writeups, grind wargames/live challenges, VR, bug bounty...
        * I think grinding challenges that have writeups/help is best strategy for me 
            * I don't think struggling over a hard or no-writeup challenge over multiple days is the most efficient use of time. 
                * If you're unable to solve the chal, you've gain nothing
                * Maybe when I was younger, it was useful to spin my wheels, but I don't think so anymore
                * When I'm stuck for awhile, I read the writeup, I have the "aha!" moment, and I continue
            * I think it's super important that I try the challenge first though. I find that blindly reading writeups is not that useful for me. I need to try the challenge first
            * I use pwn.college, HTB retired chals, cryptohack. They either have writeups, or friendly staff to help when you get stuck
        * Previously I used to watch YT videos of writeups from CryptoCat/LiveOverflow/AlmondForce/JohnHamond. But, I don't learn from that content anymore. But they can be great to level up at the start. I hear SloppyJoePirates is also really good.
    * 
        
    


### Other considations

* Burnout
* Shift in priorities -->
