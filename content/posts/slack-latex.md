---
title: "Slack LaTeX"
date: 2021-10-11T17:44:54-07:00
draft: true
description: "Building a new product"
categories: ["programming"]
draft: false
---

I had fun building a new product with my partner called [Slack LaTeX](https://slacklatex.com). It's a slack app for embedding formatted equations (through LaTeX). This post covers some of the motivation and some of the fun technical architecture design decisions.

<!--more-->

![slack latex demo](https://slacklatex.com/static/media/demo_img.e6305cbf.png)

## Motivation

I find myself without a job again, and "idle hands are the devil's workshop". It's also been awhile since I built anything fun. My partner (a frontend developer) and I have talked about building a product together for awhile, and now the stars aligned so we decided to give it a go.

Why Slack LaTeX? Well two things. My previous employer (a physics based company) sometimes typed really confusing equations into slack. Sometimes parantheses monsters, sometimes equations were just ambiguous. They looked for a solution and couldn't find anything.

There's also a stack overflow question with 52k views looking for a solution. Although the question specifically says "no image based rendering" which is what we ended up doing. But if you want a solution that every platform can use without installing anything, it sadly has to be image based.

It seemed there was at least a little demand, so we decided to quickly build something and see if there was any real demand.

## Architecture

Here's the architecture we ended up building:

### Backend

![backend](/slack-latex-backend.png)

The ec2 servers have a nodejs server installed with express that services the latex rendering. They internally run phantomjs (headless chrome) and render the LaTeX using [KaTeX](https://katex.org/).

At first I tried to build this infrastructure using Lambda. I really want to like Lambda, but it's just a pain to develop with. The logging is confusing, the infrastructure is confusing. The iteration speed is slow. I don't feel like I'm in control. I actually got it all setup on Lambda (using Applications and Cloudformation), but I didn't like it. (There was some hacky stuff with bundling chrome so that it'd hit the allowed size
limit). Making changes is a pain, and when I return to this project in 6 months to make a fix, I'm going to hate myself for using lambda.

But I'm pretty happy with the setup. It's not in an ec2-autoscaling group, but it's ready to be when we get heavier traffic. And I wrote a playbook on how to setup the ec2s for when we get there.

I love logs, so there's special middleware for logging each request (in json), along with other events of note. These logs are sent to aws cloudwatch. (Cloudwatch also handles our uptime health checks). Emails are also sent to a google group when we get a new customer.

### Frontend

![frontend](/slack-latex-frontend.png)

My partner built the frontend. It's very nice having someone to help with the frontend work!

She built it using React, no special libraries.

We setup a makefile so she can one command deploy to s3 and invalidate the cache. Developing at lightspeed.

Overall it looks very snazzy.

## What went well

- [Stripe Checkout](https://stripe.com/payments/checkout) and [Stripe Customer Portal](https://stripe.com/docs/billing/subscriptions/customer-portal) are amazing.
  - I don't ever have to see or think about a credit card. Customers can swap out their own credit card, cancel subscriptions, update billing addresses, etc, all without contacting support
  - I didn't mention it in this article, but it involves setting up a webhook to listen to stripe events (there's one nasty thing with nodejs middleware parsing the response body before stripe has a chance to validate with a signature, but it's easy to work around)
- I know I'm a broken record, but MongoDB Atlas / Charts are amazing. Dead simple auto scaling, super easy to modify a schema, and it just works. I also setup an internal dashboard using MongoDB Charts to monitor application metrics.
- Kind of silly, but slack is pretty nice for us to collaborate. We have channels for bot design, infrastructure, and general company stuff. It's nice to keep all threads of communication separated.

But overall I just can't believe how easy it is these days to launch a new product. Everything is taken care of for you. Just a little bit of glue and you can solve real problems.

## What didn't go well

As mentioned earlier, I wish Lambda was smoother. I really want to like it, and I feel like the apps I build should be good usecases for lambda.

There was some annoying issue related to the AWS region and using a route53 top level ALIAS with cloudfront. I think you can only use them if your bucket is in us-east-1 or something? I didn't quite understand. Also handling redirects from www.slacklatex.com to slacklatex.com was a little awkward. You have to use the custom URL in the CDN settings (the s3 website), not the default.

But otherwise everything went well! We're excited to see how this product grows. We have many ideas for V2.
