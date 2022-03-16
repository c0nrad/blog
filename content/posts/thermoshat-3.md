---
title: "Thermoshat Pt. 3"
date: 2021-01-08T16:29:21-05:00
draft: false
categories: ["electronics"]
---

Setting up a metrics endpoint for thermoshat.

<!--more-->

## Background

Before going back to the balance bot, I realized it would be good to setup a metrics server to collect information about the runtime environment.

Originally I was going to setup a quick endpoint to record data and dump it into MongoDB, but then I remembered I can use MongoDB <strike>Stitch</strike> Realm to accept HTTP requests and pipe it into MongoDB Atlas.

So that's what I did, all said and done it took about 30 minutes, and now I have a simple reporting server and dashboard (using MongoDB Charts).

## Data Pipeline

1. Every 30 seconds or so my program sends two json bodies with the angle and temperature. [code](https://github.com/c0nrad/thermoshat/blob/master/metrics.py#L11)

```json
{
  "version": GIT_VERSION,
  "ts": datetime.datetime.now().isoformat(),
  "name": "temperature",
  "temperature": 68
}
```

2. MongoDB Realm ingests the data, stores it into the appropriate database and collection in MongoDB Atlas

The code can be found here: https://gist.github.com/c0nrad/beb9dd7413b5b3438c94d83160bffefd

3. MongoDB Charts then reads from MongoDB Atlas and displays the dashboard

## Dashboard

<iframe src="https://charts.mongodb.com/charts-thermoshat-fkuyl/public/dashboards/edc6b9bd-db35-4b8f-af69-249d395a3ca4" style="width: 100%; height: 600px"> </iframe>

The angle is the orientation of the dial. 180 points directly up, which is medium heat.

## What went wrong

- Dates are stupid. It took a little bit of massaging to get MongoDB Charts to accept my datetime. I ended up parsing and re-serializing the data in the Realm HTTP Endpoint.

## Future

It would be nice to have a realtime data server, but that's for another day. I think when I start playing with camera's I'll setup a real server. Until then this will work well enough!
