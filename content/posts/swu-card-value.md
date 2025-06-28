---
title: "SWU Card Value"
date: 2025-06-25T18:17:08-04:00
draft: true
---

I'm very impressed with how balance Star Wars Unlimited is. A large variety of different cards accross different aspects can be used to win P.Qs. To achieve this, I'm wondering if FFG uses an equation to value cards to ensure that cards remain roughly equal in value. 

So inspired by https://garbagerollers.com/2024/11/13/understanding-the-cost-curve-twilight-edition/, I'm trying to see if I can reverse engineer a point system that FFG potentially uses to ensure cards have the correct value.

Then with this equation, we could use it to search across the card database to see which cards are above curve and if any aspects have a surplus of above value cards.

## HP and Power

We can look at some vanilla cards for an idea of where to start the cost curve.

Take Battlefield Marine, a 3Power/3HP for 2cost. To start the calculating points, lets say the Power and HP are each worth a point.

So we can start by saying a 2 cost card should have 6 points. One resource is worth 2 points.

So for a first pass to make sure our script works lets see if there are any cards that are above curve. 

These are the results. It includes a bunch that have bounties or harm themselves on deploy.

Above Curve
Card: R2-D2, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SOR/236/fake
Card: Warrior Drone, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/TWI/057/fake
Card: Kintan Intimidator, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SHD/183/fake
Card: BB-8, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/JTL/145/fake
Card: R2-D2, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/JTL/245/fake

Bounty
Card: Hylobon Enforcer, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SHD/027/fake
Card: Clone Deserter, Power: 2, HP: 3, Cost: 1 https://swudb.com/card/SHD/095/fake
Card: Guavian Antagonizer, Power: 2, HP: 3, Cost: 1 https://swudb.com/card/SHD/134/fake
Card: Cartel Turncoat, Power: 2, HP: 3, Cost: 1 https://swudb.com/card/SHD/195/fake
Card: Stolen AT-Hauler, Power: 4, HP: 5, Cost: 3 https://swudb.com/card/JTL/221/fake

Self Harming
Card: Royal Guard Attaché, Power: 2, HP: 5, Cost: 2 https://swudb.com/card/TWI/059/fake
Card: Dilapidated Ski Speeder, Power: 3, HP: 7, Cost: 3 https://swudb.com/card/JTL/248/fake

Other
Card: Stolen Landspeeder, Power: 3, HP: 2, Cost: 1 https://swudb.com/card/SHD/161/fake
Card: D'Qar Cargo Frigate, Power: 6, HP: 7, Cost: 5 https://swudb.com/card/JTL/052/fake
Card: Corporate Defense Shuttle, Power: 3, HP: 5, Cost: 2 https://swudb.com/card/JTL/059/fake
Card: Savage Opress, Power: 9, HP: 9, Cost: 6 https://swudb.com/card/LOF/137/fake

If you include cards that are "on" curve, there's 78 in total. 

## Space

Just by inspection, it would appear space units lose one point compared to ground.
TIE/LN Fighter https://www.swudb.com/card/SOR/225
Prototype TIE Advanced https://www.swudb.com/card/JTL/136

## Shielded point value

How much is a shield worth? Let's find some cards that only have a shield (not many).

Card: Crafty Smuggler, Power: 2, HP: 2, Cost: 2 https://swudb.com/card/SOR/207/fake
Card: Outer Rim Outlaws, Power: 3, HP: 3, Cost: 3 https://swudb.com/card/JTL/065/fake
Card: Techno Union Transport, Power: 4, HP: 6, Cost: 5 https://swudb.com/card/JTL/190/fake

Crafty Smuggler says a shield is worth 2 points. Outer Rim Outlaws says 2. Techno Union Transport says 2.

## Sentinel point value

Card: B1 Security Team, Cost: 2, Arena: Ground, Power: 3, HP: 1, Sentinel Value: 2, https://swudb.com/card/TWI/207/fake
Card: Pyke Sentinel, Cost: 2, Arena: Ground, Power: 2, HP: 3, Sentinel Value: 1, https://swudb.com/card/SHD/029/fake
Card: Scouting Headhunter, Cost: 2, Arena: Space, Power: 2, HP: 1, Sentinel Value: 4, https://swudb.com/card/JTL/110/fake
Card: Cloud City Wing Guard, Cost: 3, Arena: Ground, Power: 2, HP: 4, Sentinel Value: 2, https://swudb.com/card/SOR/063/fake
Card: Echo Base Defender, Cost: 3, Arena: Ground, Power: 4, HP: 3, Sentinel Value: 1, https://swudb.com/card/SOR/098/fake
Card: Cell Block Guard, Cost: 3, Arena: Ground, Power: 3, HP: 3, Sentinel Value: 2, https://swudb.com/card/SOR/229/fake
Card: Black Sun Starfighter, Cost: 3, Arena: Space, Power: 3, HP: 2, Sentinel Value: 4, https://swudb.com/card/SHD/237/fake
Card: Cell Block Guard, Cost: 3, Arena: Ground, Power: 3, HP: 3, Sentinel Value: 2, https://swudb.com/card/SHD/238/fake
Card: Omicron Strike Craft, Cost: 3, Arena: Space, Power: 2, HP: 3, Sentinel Value: 4, https://swudb.com/card/JTL/064/fake
Card: Contracted Jumpmaster, Cost: 3, Arena: Space, Power: 2, HP: 4, Sentinel Value: 3, https://swudb.com/card/JTL/184/fake
Card: System Patrol Craft, Cost: 4, Arena: Space, Power: 3, HP: 4, Sentinel Value: 4, https://swudb.com/card/SOR/066/fake
Card: Niima Outpost Constables, Cost: 4, Arena: Ground, Power: 2, HP: 6, Sentinel Value: 2, https://swudb.com/card/SHD/062/fake
Card: System Patrol Craft, Cost: 4, Arena: Space, Power: 3, HP: 4, Sentinel Value: 4, https://swudb.com/card/SHD/063/fake
Card: Perimeter AT-RT, Cost: 4, Arena: Ground, Power: 3, HP: 5, Sentinel Value: 2, https://swudb.com/card/JTL/068/fake
Card: Shadowed Hover Tank, Cost: 4, Arena: Ground, Power: 5, HP: 3, Sentinel Value: 2, https://swudb.com/card/JTL/224/fake
Card: Rogue-class Starfighter, Cost: 4, Arena: Space, Power: 4, HP: 3, Sentinel Value: 4, https://swudb.com/card/JTL/241/fake
Card: Corellian Freighter, Cost: 5, Arena: Space, Power: 4, HP: 4, Sentinel Value: 5, https://swudb.com/card/SOR/250/fake
Card: Patrolling AAT, Cost: 5, Arena: Ground, Power: 4, HP: 5, Sentinel Value: 3, https://swudb.com/card/TWI/232/fake
Card: Corellian Freighter, Cost: 5, Arena: Space, Power: 4, HP: 4, Sentinel Value: 5, https://swudb.com/card/JTL/258/fake
Card: Falchion Ion Tank, Cost: 6, Arena: Ground, Power: 4, HP: 6, Sentinel Value: 4, https://swudb.com/card/TWI/065/fake
Card: Armored Saber Tank, Cost: 6, Arena: Ground, Power: 5, HP: 5, Sentinel Value: 4, https://swudb.com/card/TWI/245/fake

Unsurprisingly we see that Pyke Sentinel and Echo Base Defender are high value.

Somewhat surprisingly, it seems that we have to pay a premium for Space Sentinels are expensive! 

At a first stab, we could say Space Sentinel is worth 4 points (2 resources). And ground is worth 2 points.

## Ambush

Card: Cloud-Rider, Cost: 2, Arena: Ground, Power: 3, HP: 1, Ambush Value: 2, https://swudb.com/card/SHD/210/fake
Card: X-34 Landspeeder, Cost: 2, Arena: Ground, Power: 2, HP: 3, Ambush Value: 1, https://swudb.com/card/JTL/214/fake
Card: Phase II Clone Trooper, Cost: 3, Arena: Ground, Power: 3, HP: 2, Ambush Value: 3, https://swudb.com/card/TWI/242/fake
Card: Eager Escort Fighter, Cost: 3, Arena: Space, Power: 4, HP: 1, Ambush Value: 3, https://swudb.com/card/JTL/112/fake
Card: Hidden Sharpshooter, Cost: 4, Arena: Ground, Power: 4, HP: 3, Ambush Value: 3, https://swudb.com/card/TWI/214/fake
Card: Auzituck Liberator Gunship, Cost: 4, Arena: Space, Power: 3, HP: 4, Ambush Value: 3, https://swudb.com/card/SOR/195/fake
Card: Syndicate Lackeys, Cost: 5, Arena: Ground, Power: 5, HP: 4, Ambush Value: 3, https://swudb.com/card/SOR/213/fake

Roughly 3? But it would appear that X-34 landspeeder is a pretty good value.

## Grit 

Card: Scout Bike Pursuer, Cost: 2, Arena: Ground, Power: 1, HP: 4, Grit Value: 1, https://swudb.com/card/SOR/032/fake
Card: Occupier Siege Tank, Cost: 5, Arena: Ground, Power: 5, HP: 4, Grit Value: 3, https://swudb.com/card/SOR/165/fake
Card: Dwarf Spider Droid, Cost: 4, Arena: Ground, Power: 3, HP: 4, Grit Value: 3, https://swudb.com/card/TWI/231/fake
Card: Wroshyr Tree Tender, Cost: 3, Arena: Ground, Power: 2, HP: 4, Grit Value: 2, https://swudb.com/card/SHD/061/fake
Card: Heroic Renegade, Cost: 2, Arena: Ground, Power: 2, HP: 3, Grit Value: 1, https://swudb.com/card/SHD/146/fake
Card: Royal Security Fighter, Cost: 2, Arena: Space, Power: 2, HP: 2, Grit Value: 2, https://swudb.com/card/JTL/061/fake
Card: Occupier Siege Tank, Cost: 5, Arena: Ground, Power: 5, HP: 4, Grit Value: 3, https://swudb.com/card/JTL/167/fake

Roughly 2?

## Value Calculator

So for a first pass, let's say:

value = HP + Power + 2*hasShield + 3*hasAmbush + 2*hasGrit + isSpace * (-1 + 4*hasSentinel) + isGround(2*hasSentinel)

So the follow cards are "above" curve, unsurprisingly we see a lot of them in play.

Card: Scout Bike Pursuer, Power: 1, HP: 4, Cost: 2 https://swudb.com/card/SOR/032/fake
Card: Devastator, Power: 10, HP: 10, Cost: 10 https://swudb.com/card/SOR/090/fake
Card: Echo Base Defender, Power: 4, HP: 3, Cost: 3 https://swudb.com/card/SOR/098/fake
Card: Bright Hope, Power: 2, HP: 6, Cost: 4 https://swudb.com/card/SOR/099/fake
Card: R2-D2, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SOR/236/fake
Card: Kashyyyk Defender, Power: 0, HP: 5, Cost: 2 https://swudb.com/card/TWI/044/fake
Card: Warrior Drone, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/TWI/057/fake
Card: Royal Guard Attaché, Power: 2, HP: 5, Cost: 2 https://swudb.com/card/TWI/059/fake
Card: Coruscant Guard, Power: 3, HP: 2, Cost: 2 https://swudb.com/card/TWI/106/fake
Card: Hylobon Enforcer, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SHD/027/fake
Card: Pyke Sentinel, Power: 2, HP: 3, Cost: 2 https://swudb.com/card/SHD/029/fake
Card: The Client, Power: 2, HP: 5, Cost: 3 https://swudb.com/card/SHD/031/fake
Card: Synara San, Power: 3, HP: 6, Cost: 4 https://swudb.com/card/SHD/033/fake
Card: Clone Deserter, Power: 2, HP: 3, Cost: 1 https://swudb.com/card/SHD/095/fake
Card: Guavian Antagonizer, Power: 2, HP: 3, Cost: 1 https://swudb.com/card/SHD/134/fake
Card: Heroic Renegade, Power: 2, HP: 3, Cost: 2 https://swudb.com/card/SHD/146/fake
Card: Stolen Landspeeder, Power: 3, HP: 2, Cost: 1 https://swudb.com/card/SHD/161/fake
Card: Kintan Intimidator, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/SHD/183/fake
Card: Doctor Evazan, Power: 3, HP: 3, Cost: 2 https://swudb.com/card/SHD/185/fake
Card: 4-LOM, Power: 4, HP: 4, Cost: 4 https://swudb.com/card/SHD/188/fake
Card: Cloud-Rider, Power: 3, HP: 1, Cost: 2 https://swudb.com/card/SHD/210/fake
Card: Protector of the Throne, Power: 3, HP: 4, Cost: 3 https://swudb.com/card/SHD/247/fake
Card: Corporate Defense Shuttle, Power: 3, HP: 5, Cost: 2 https://swudb.com/card/JTL/059/fake
Card: BB-8, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/JTL/145/fake
Card: Contracted Jumpmaster, Power: 2, HP: 4, Cost: 3 https://swudb.com/card/JTL/184/fake
Card: Fireball, Power: 3, HP: 3, Cost: 2 https://swudb.com/card/JTL/198/fake
Card: X-34 Landspeeder, Power: 2, HP: 3, Cost: 2 https://swudb.com/card/JTL/214/fake
Card: Contracted Hunter, Power: 4, HP: 4, Cost: 3 https://swudb.com/card/JTL/216/fake
Card: R2-D2, Power: 1, HP: 4, Cost: 1 https://swudb.com/card/JTL/245/fake
Card: Dilapidated Ski Speeder, Power: 3, HP: 7, Cost: 3 https://swudb.com/card/JTL/248/fake
Card: Savage Opress, Power: 9, HP: 9, Cost: 6 https://swudb.com/card/LOF/137/fake


From this list, I think I might add Kashyyyk Defender to a han2 blue deck. 

## Future

More refinement needs to be done to the value function. What is a bounty worth? What is minus health worth? What is card draw worth?