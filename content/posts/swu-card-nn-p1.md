---
title: "SWU Card Neural Net P1"
date: 2025-07-09T18:08:34-04:00
draft: true
---

New project! Using AI to read SWU card aspects. 

I just finished a coursera course on [Deep Learning and Neural Networks](https://www.coursera.org/learn/neural-networks-deep-learning#modules) so figured I'd try to do something with my newfound knowledge!

In this project I'll be building some NN (Neural Networks) manually that will take in a Star Wars Unlimited card image and determine if "isHeroic", "isVillainous", and "isNeutral" by reading the aspects on the top left.

At this point I only know how to do binary classifiers... so yes or no questions. So this will be part 1, in the future I should be able to ask more interesting questions of the models like "Who is the artist", "How many resources does this card cost", "what are the traits", etc.

## Background Theory

### SWU Cards

First off, why use a Star Wars Unlimited card?

Well, one, I like Star Wars Unlimited, but two, they are a pre-labeled dataset! I can easily scrape the cards and their information. For example, here's a recent [vader card](https://swudb.com/card/LOF/037). I need a labeled dataset so I can train the models. (swudb, sorry for scraping. I was very gentle. >5s/req. Only downloaded the images, which I assume are CDN'd from a bucket).

For this starter project, I was specifically playing with 'Aspects', which are the blue and black hexagons near the top left. The model I wanted to build will take in a card image, and tell you if the card is villany or heroism or neutral. 

### Neural Nets

If you'd like to learn more about Neural Nets in depth, I'd highly recommend the coursera course [Deep Learning and Neural Networks](https://www.coursera.org/learn/neural-networks-deep-learning#modules) by Andrew Ng. You'll learn how to craft neural nets by scratch (using numpy), and can do projects similar to this one, which is a pretty exciting tool to have in your toolbelt! If you're a confident programmer, you can have it wrapped up in ~24 hours. If you're not a confident programmer, the module can be a little difficult to debug sometimes, but gotta put in those reps somehow!

The neural network implementation is basically a bunch of matrix mulitplication. It's composed of a few layers of activation nodes, and results in a single node that outputs "is this card heroism".

The model looks like following:

![villian_nn](/swu-nn/isVillianNN.png)

The core unit is the little activation nodes. Each node does some matrix math of the form:

$$ \vec{A}_{next} = activation(\vec{W}^T * \vec{A} + b) $$

This basically says take the previous input values from all previous nodes, multiple each value by some weights, and then add a number.

And then each node has an final activation function (we need something non-linear). For this project I used "RELU" which is just a flat line less than zero, and then a sloped line abve zero. Other common activations functions are tanh/sigmoid.

In the end we get out a final value, 0 or 1, which tells us if the card was villianous or not.

### Training

What's cool about neural nets is that we don't have to tell it anything. To train the neural net, I just show it cards and tell it if it is villainous or not, and through examples it will learn.

It does this through a technique called back propogation. The model will run forward, and we will calculate something called the cost function. Since this is a binary classifier (the only thing I know how to do), we'll use a "Binary Cross-Entropy" cost function.

$$ cost = - (1/n) ((\vec{Y} * \log(\vec{A_L})) + (1 - \vec{Y}) * \log(1 - \vec{A}_L)) $$

The cost measures how far away we were from correct answers. \\( A_L \\) was the final results for each test case, and \\( Y \\) is the correct answer.

Then with the cost function we can walk backwards through our neural network by upgrading the weights in such a way that'd we be closer to the correct answer. This is called gradient descent since we are taking the partial derivative of the cost with respect to each input and see which way we need to scootch the weight.

## Implementation

The code can be found [here](https://github.com/c0nrad/swu-card-reader-nn/blob/main/nn.py). It takes about 5 minutes to train, and is 99% accurate, which makes sense, it's really just doing two pixel color checks at exact spots. I could program this check in just a few lines, but it was exciting to see the neural net learn!

![villian_nn](/swu-nn/finalRun.png)

At first the model was not correctly learning, and after some debugging I found out that my learning rate was set wayyy to high. Since the cases are all so similar, the gradient descent was jumping too far and the learning was too sporadic and not making progress.

## Next Steps

A bunch of stuff:
* The next chapter in the coursera course is on optimizations, so maybe I'll optimize this code a bit.
* Normally for image NN you use something called convolution (kind of like applying pattern matching as a first step), so learning about that (ch. 3)
* Upgrading to TensorFlow (this impelemtnation only uses the CPU, and is very slow, TensorFlow will also trivialize this problem).
* I think the next project will be two steps:
    * Read the artist names
    * Based on the art, guess the artist

## Conclusion

Super fun project! I shot out of bed at 6am the last two days to work on it. Excited to continue!