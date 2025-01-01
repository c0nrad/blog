---
title: "Reasons to Not Be Hard on Yourself (CTFs)"
date: 2024-12-31T16:04:30-05:00
draft: false
categories: ["CTFs"]
---


Every once in a while I either get a Discord message or see a post about someone who is feeling down about not doing well on CTFs. To be honest, I also sometimes make the mistake of feeling down when I compare myself to others.

As we go into 2025, here are my opinions on why we both shouldn't be too hard on ourselves.

**1. CTFs are not "Real World" Security**

Before CTF'ing, I worked with plenty of very valuable security engineers/practitioners that can not do basic exploits. I would still argue that they are great engineers.

This also applies to me. Before CTFing, when I worked at various software companies, I knew a tiny fraction of what I currently know. But I still think I provided adequate value to the companies I worked for.

If you’re doing CTFs in an attempt to get a job, just remember that a lot of jobs are about reducing and managing risk, which is mostly the very easy basics: "Do we not have MFA? Let's install MFA." "Are we not applying patches/upgrades? Let's do that." "Do we not have a scheduled yearly pentest? Let's find someone." "Are people reporting bugs to us? Let's respond to that email." “Do we have a process to rotate credentials?” etc.

I also was/worked with plenty of pentesters who are good enough at their job but have a small fraction of the knowledge I think a decent CTF player has. And that is totally fine. A SQLi in the wild is usually just a vanilla SQL injection. There's no crazy filtering, no blind timing leaks using ReDoS, no nothing. You usually don't even have to write an exploit (although PoC|GTFO is nice). It's just, "Hey, there's a SQL injection, this is why it's bad, here's how to fix it." You can be a good pentester without being a CTF god.

Things may be slightly different if you work in vulnerability research, but that is a super tiny minority of security. And even then, I think one could argue that target selection and persistence may be more important skills than being a CTF god.

Back when I was hiring people onto my security engineering team, I would make sure individuals knew the basics for their role (for example, if you do websec, you need to understand sessions, have no problem with at least the OWASP top 10 and mitigations, write scripts, etc.), but assuming you can do the essentials of your job, I really want to know: Can I trust you to communicate with other teams without messing up relationships? Can you discover areas of risk and find solutions? Are you humble and curious and not a drag to work with? "I do not know, but will find out" is almost always an appropriate response (as long as I can trust you to find out).

Currently I run a company involving CSP (Content-Security-Policy). Not once have I discussed CSP bypasses with anyone. No one cares. The average security engineer I talk to while doing deployments does not understand the basics of CSP (although usually during the intro sales call people will say they do, but then 5 minutes into a demo they will state they do not). But that’s okay; that is the reason why my company exists. I would still argue that they are great engineers, but not CTF gods.

It's easy to get wrapped up in the CTF world, but it is not close to the real world.

**2. Time in the field**

CTFs cover a very wide set of topics. I think "time in the field" is the biggest leg up you can have as a CTF player. So if you're younger, you're coming in with a serious disadvantage.

For me, starting out in security/programming was the hardest. You don't know what you don't know. Everything is new and slow. Everyone is smarter. There's an infinite amount of things to learn. How can you exploit HTTP request smuggling when you barely understand HTTP?

But I can say after 20 years in the field, it’s so much easier. Using the HTTP request smuggling attacks as an example, now that through various jobs I’ve written an HTTP fuzzer, familiar with ASCII codes, familiar with HTTP headers, written and played with HTTP proxies, thinking about how to abuse an HTTP request smuggling is much easier. And that applies to pretty much any topic. If you’re curious at work or in general, eventually you’ll visit all these topics, and the more you learn, the easier it gets.

So if you're just starting out in security, don't worry. It takes time. It's hardest now, but it will get easier as you learn all the pieces.

**3. Writeups are "polished."**

It's easy to sound smart in a writeup. You can hide all your mistakes (intentionally or not), and it distills potentially many hours/days of work into a 10-minute read/video. And that's a good thing.

Writeups do not show all the pain/struggle/mistakes, the hundreds of open tabs, collaboration with teammates, luck, the years of grinding, and previous experience. It would make them boring.

Also, sometimes bugs are found "dumbly" with a fuzzer, and then a story is constructed around the bug.

And writeups are just one person's experience; there's no writeup for the hundreds of people that attempted the challenge or target and didn't succeed.

Writeups for existing challenges (HTB, etc.) may even be copies of existing content.

If you get depressed reading writeups thinking you'll never be that good. Don't worry; I’d recommend doing your own writeup, waiting a year, and then rereading it. I think you'll be surprised how smart you sound.

Write-ups are also just great; please write more write-ups! (I prefer video, but anything works.)

**4. Social Media is Deceptive**

It may seem like everyone on social media platforms are absolutely crushing it. But I think it’s deceptive.

Vulnerability research companies must market themselves. They must make all their research sound like the biggest and best new bugs around. They have to market their work to get contracts. It must sound like the companies are always pushing out novel and interesting exploits and doing cutting-edge stuff. The hype isn't bad; it's just business.

Individuals also have to do the same; they have to market themselves. They are showing their very best accomplishments on a global stage.

But for every 10 people that are posting about some new exploit or project or accomplishment or bug bounty reward, there are 100(?), 1000(?), 10,000(?) people who are not showing anything.

People (usually) don't post about the months where nothing happened. And people usually make things sound more exciting than they really are.

Personally, I’ve been avoiding X more and more (although I’m about to post this on X), but I don’t think social media is real, and I don’t think it’s healthy (for me anyways).

**5. Cheating**

Sadly, cheating does happen in CTFs.

Cheating is such an assumed problem that it's "common knowledge" that we can't restrict team sizes because people will just cheat.

There's what I call "soft cheating." Maybe you're talking to a friend on another team about being stuck on a challenge, and they say, "Oh wow, I'm surprised you're stuck on it; I'm pretty sure you know how to solve that challenge." It's not sharing a solution, but that's usually all the hint that someone needs to help solve a challenge. Now they know the issue is not some idea they don't know; it's just that they missed something. It’s not “hard cheating,” but it’s still an unfair advantage in my opinion.

Another form of “soft cheating” can come from CTF admins. People have sent me screenshots of conversations with CTF admins during a CTF where they were able to beg for some "extra nudges" from an admin.

And of course, there is "real cheating," where teams have helped each other. There's been plenty of drama that you can google for. And they only get caught because they share the exact same flag hash. I would assume the majority of cheating involves just sharing an idea. "Oh, that chal was a House of Force" is all you need, and that is much harder to detect.

I personally believe that "soft cheating" is pretty high. Because of my YT channel, I used to get an absurd number of people asking me for hints during live CTFs. It doesn't have to be direct either. People will try to discuss challenges in case I leak something like, "Ha, this CTF is so fun, but I'm stuck on xxxx." If you've messaged me during a CTF, you may notice I do not respond to anyone. Partly because I am busy playing solo, but also because I do not want to accidentally leak any sort of hint.

But I personally believe the vast majority of players do not cheat. It is also my opinion that the more you play, the less likely you are to cheat. I think cheating occurs more on the junior level, but that’s just a guess.

In general, I think it's easy to get frustrated about cheating, but I don't think there's an obvious solution, and it's not worth getting worked up about. Do the best you can do, and don't worry about the rest. Cheaters hopefully exist in their little groups, and hopefully you can outskill them.

**6. Team Size**

If you're new to CTFs you may not realize how large some of the CTF teams are. Check out the members on the top teams on CTFTime. (The current second-place team has 70 players listed.) And that's not everyone on those teams; plenty of people don't care about CTFtime.

It makes sense that people merge into larger and larger teams. If you want to put a first on your resume, why not team up with 100+ other people? If you want to go to DEFCON, why compete with a bunch of sweaty teams when you can all go together?

I've jokingly considered asking my 3000 YouTube subscribers to form a temporary team at some point just to show how stupid the current system is. But I don't have a solution to the problem, so I'd just be creating drama for nothing.

**7. Solve count**

If you're playing a CTF and see that 30 people have already solved a challenge you are stuck on, it can sometimes be disheartening if you compare yourself. But you probably don't see the hundred-plus people who are currently struggling with the challenge. If there are 500 people grinding through the web category and one of the chals only has 10 solves, that's maybe 200-300 motivated people that spent a day or two and tried and failed.

Some teams also have a bit of specialization. You're not going against thousands of people who are like you. If you're playing in a CTF with 5000 participants, there's going to be a handful of people who specialize in kernel security for their work/PhD. It makes sense that those are the people who beat the hard kernel challenge, not as many average security professionals.

**8. CTFs are getting harder**

The first CTF I won was back in 2016, and one of the least solved chals was a basic buffer overflow (I think this was before pwntools). The web chal was some basic XSS with trivial filtering.

But now there’s more new content, more CVEs, more ideas, the challenges are more diverse/obscure and harder. As a challenge author, I’d rather make a challenge on something new. But this means that as a new player, you have to learn years of CTF challenge history.

In some ways it is easier; there are so many people writing writeups, and the tooling is amazing (pwn before pwntools/pwndbg/gef was pretty annoying).

There’s also a history/culture of problems and challenges. People release “revenge” challenges to previous challenges, and so the challenge is much easier if you’ve seen its evolution and read the writeups every step of the way.

But a new player is still required to learn years of history to catch up.

**9. CTF Sweats**

As CTFs become more popular, it raises the bar in multiple ways. Supposedly, hackthebox has 1.7 million accounts. I highly doubt that number, but still. That’s a lot of people who are interested in technical security!

If there are 1.7 million people who are vaguely interested in wargames/boxes/CTFs, and the “most interested/competitive” players play CTFS, that’s quite the talent funnel.

And as competition grows, more “sweats” join the game. Sadly, I consider myself a sweat now; I grind like 4-6 hours a day because I enjoy it.

CTFs are also global. If you're coming from high school/college and did competitions, you may be used to only competing with a talent pool that consisted of your city and neighboring cities. Now you're competing with the best in the entire world.

There are some people who have been playing CTFs for a very long time, and so naturally they’re extremely good. And that’s great! Depending on how long you’ve been playing, it makes sense that there will be many people who are so much better. They’re not savants (I think, maybe); they just have been playing for a long time and have seen the tricks and evolution.

So, accepting that some people are sweats in the game, and unless you're willing to sacrifice a lot, it is what it is.

**10. CTFs do not matter that much.**

Lastly, I would assume for most people's goals, there are probably more efficient avenues for success than grinding CTFs.

If you're not having fun playing CTFs, that is totally okay. You can be very successful without playing CTFs. They really don't matter that much. If you place first or last, no one really cares.

For me, I love that tickle when you see some code that seems very reasonable, but there’s supposedly a bug that I just don't see. I'm also very competitive and have nothing better to do.

For others, some say, "Maybe the real flags are the friends you make along the way.".

But whatever the reason is, I do hope your 2025 CTF year is happy, healthy, and fruitful, and that you are proud of how far you’ve come and that you won't be too hard on yourself.
-SJP
