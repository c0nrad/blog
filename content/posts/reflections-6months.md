---
title: "Reflections on 6 months solo SaaS startup"
date: 2020-06-16T07:59:02-04:00
draft: false
description: "Reflections on 6 months solo SaaS startup"
tags: ["startup"]
---

It's crazy to think my startup is already over 6 months old. This post is some informal reflections on that period.

<!--more-->

To set the context for people who are not me, this was my first foray into startups. The startup is pretty lean (it's a saas security startup), only on the verge of profitability. Single digit customers.

A lot of this may sound complain-y, they're definitely first world problems. But they are things I wish I had fully internalized.

## Nobody cares

It sounds very negative, and I don't mean it in a bad way. But I think it applies to many aspects of building the startup.

People want a tool that solves the problem. No one cares about the effort involved in creating little features. No one cares about the story, no one cares how it works. They just want to be re-assured it will work, so they can focus on their 1000 other problems.

There's nothing wrong with that, it's just important to remember.

The fact that no one cares also has positive aspects! I was worried about my two hours of planned downtime when I was doing a large migration. Literally no one cared. I think my startup could have been down for a few days, and no one would of cared that much. Unfortunately or fortunately I focused a lot on reliability (which was kind of wasted effort now that I realize it).

## Careful with free trials 

I thought it would be cool if I had a free sandbox plan. Let people kick the tires. When they see the amazing value they'll upgrade!

Not so much.

The free sandbox offering attracted over 1000 businesses. Super neat! The only problem was... no one upgraded to paying plans. So I'm supporting 1000 customers on my platform. Goodbye life savings (kidding, but it does cost non-trivial money).

I don't want to dive into the specifics of content-security-policy report-uri, but having a sandbox account created weird dynamics/incentives. My startup focuses on making this specific security tool easier. And I charge based on "usage" of the feature. But by making this security tool easier, there was less need for usage. So every feature I included made the Sandbox account a better solution, no need to upgrade for more usage.

So I had 1000+ people using the platform, and they had no incentive to upgrade. And every feature I released solidified that SANDBOX was all your need. I could of limited key features, but I hate it when other companies do that, and it wasn't obvious to me what features to limit. It also feels dis-honest. Instead I'd rather focus on making the best product. So instead I went with a free trial period and made the choice to discontinue SANDBOX accounts. (If you were a sandbox user of Csper, against I apologize, but it had to be done).

There's way less usage, but now people pay for the service. And I'm not fronting the bill for >1000 customers (which I can not do for long since i'm self bootstrapped).

## SEO / Pipeline / Ads

It sounds so obvious now, but wasn't fully fully internalized when I started. 

People aren't just going to "stumble" onto your product.

When Csper was released, I made sure it could handle a lot of load. I was worried that it would spread like wildfire. So I made sure everything could scale. Autoscaling k8s, autoscaling database. I setup observability on everything to debug issues, tracing, logging, monitoring dashboards, etc.

Long story short, almost no one showed up.

SEO / Marketing are the name of the game. (not an endorsement), but getting setup with SEM rush to track my SEO (specifically content marketing).

## People like "open source"... a lot

I built a similar open source product about 5-6 years ago. It's crazy how fast people will refer an open source product compared to a paid product. 

It's a huge marketing advantage I never really considered. The product today is SIGNIFICANTLY better than the 5-6 year old product, yet people still share links to my old defunct product. 

"open source" seems to trump reliability. I'm probably the same way, so I can't complain too much. Just interesting to watch it happen.

I was very tempted to shift to "open source" and then have a paid plan. But, never did.

## On the plus, working for yourself is... amazing

I loved all my previous jobs. For better or worse, work is usually the center of my life. 

But, there's something about waking up in the morning, making yourself some coffee, and pouring your heart into something you own. For awhile I would shoot out of bed at 6am (without an alarm) because I was so excited to get to work. I'd work for 12 hours, and then do it all again, and I was excited about it. 

And it's so nice knowing where everything is. At some point I had to do a decent sized migration across 125 files. Knowing how everything works and where it is makes every project nice and fun. No hidden side effects.

## Delayed reward

More of a psychological thing. But it's hard to remove the feeling of working hard and getting a reward.

I did two large migrations on Csper. One was a re-write of "projects" and "organizations" to consolidate billing and other stuff. It was like 4500 lines of code over 125 files. Then doing all the data base migrations and testing... It was a lot of work to make sure it all worked correctly. And it was a bit stressful.

After the release went smoothly, it was a hurah! But, it's not like I would instantly get any new customers.

After the migration is done, I'm still just staring at my computer, nothing has changed. 

Being generous, let's say the different of consolidated billings increased conversions by 5%, I'd have to wait awhile to see that impact. I don't think I even got a new customer that week.

It can be dis-heartening when you work super hard, but then nothing happens. It was a mental barrier to separate that.

## It's a bit of a rollercoaster

It seems like when things go bad, a lot of things go bad at once. A customer will leave, the firefox extension store will remove my addon, some feature will be acting up, and your competitors just signed a big deal. 

That emotional buffer is important. I should have remembered to leave some room in my emotional tank to take hits. Wearing thin and then taking a couple of hits is not fun. 

In the movies/books/interwebs every startup is successful. When you see people working hard, it's like "no duh, the payoff and reward will be huge!" But in real life you have to face that most likely it will fail. When do you cut your losses? When you take a number of hits at once, those questions go to the front of your mind.

## Lonely

Probably the biggest downside to this adventure so far is not working on a team. I miss is celebrating wins. Giving yourself a high five when a customer signs up is cool, but experiences are better shared with someone.

My girlfriend and I recently worked out a system where I get a twinkie when I get a new customer. Which is very nice. We celebrate the wins, but there's something about a group working towards a goal and achieving that goal.

## Bug Fixes are... meh

Previously as an engineer I would hate publishing bugs in my code. Where's the attention to craft!

But now being honest about my todo list, most bugs don't matter _that_ much. The chance of defering a customer from paying because of a bug here and there is pretty small. (I mean, it depends on the bug, and you should try super hard not to have bugs. It's no excuse for being sloppy).

But, I have a bug tracker pretty full of little bugs here and there. But when I assign dollar values to them, SEO/marketing is almost always more important than fixing a bug.

If an article attracts two new customers, and a weird edge case defers one customer, by the numbers it's better to focus on the article. When you're a non-bootstrapped solo startup, you have to run towards the money. You also can't make everyone happy.

## Others

Some things that I already knew, and thankful that I did:

* Staging/prod. Staging saved my butt a number of times. And made things way less stressful when doing big changes. Worth every penny.
* k8s on gke was pretty nice. it took a day or two to get my infra setup, and then I never really thought about it. it just scales here and there.
* Single command deploys, and lots of makefiles. Any command that could be useful later I store in a makefile. i never want to think about things.

Things that were surprisingly frustrating:

* Browser extension review processes!
    * Chrome takes weeks and weeks to review extensions
    * Firefox is super picky about making sure that they can compile your code and it exactly matches what's in the app store
* SaaS trails/charges. You rely on a number of services for your startup, and they start to add up. Some companies are also very sneaky about not emailing you before they charge your credit card. There was one company that charged me for 6 months without sending a single email.
    * I should of been reviewing my credit card statements, but when you're already working long days, it's near the bottom of the chopping block. At the end of the day, writing another article for SEO is more important than checking a hypothetical
* Kind of weird point, but I tried advertising on linkedin/google/facebook/twitter. I left with a very negative view of all the platforms and try very hard not to read from them anymore. Everyone knows that those platforms are about advertising, but it wasn't until I was trying to shove my agenda down other peoples throats did I realize how disgusting it was. Now I see all the other businesses doing what I was doing, pushing their own agenda. I want no part of anyone else's agenda. I was probably doing ads wrong, but I saw no drop in signups after I stopped them. I'm going to fully focus on SEO instead. I feel good about that, when people have a problem, they'll google for it, and my company will be there.

## Conclusion

Overall, building Csper has been a interesting experience. Maybe less interesting than I would have hoped (I think I spend too much time on HN, startups are idolized a lot for some reason). At the end of the day I'm just shuffling bits and trying to make people happy. But definitely no regrets so far.