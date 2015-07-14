#!/usr/bin/env python 
import sys
import random
messages = {
    "gun": {"woman": "shoots", "wolf": "shoots", "monkey": "shoots", "man": "shoots", "cockroach": "shoots", "snake": "shoots", "axe": "chips", "fire": "fires", "sun": "shoots at", "rock": "targets", "scissors": "destroys", "tree": "targets"}, 
    "dynamite" :  {"fire": "starts", "sun": "smoke blots out", "woman": "explodes", "monkey": "explodes", "axe": "explodes", "tree": "explodes", "cockroach": "explodes", "snake": "explodes", "rock": "explodes", "man": "explodes", "gun": "outclasses"},
    "nuke": {"fire": "starts massive", "sun": "has power of", "woman": "incinerates", "monkey": "incinerates", "axe": "incinerates", "tree": "incinerates", "snake": "incinerates", "rock": "incinerates", "scissors": "incinerates", "man": "incinerates", "gun": "outclasses", "dynamite": "outclasses"},
    "lightning": {"nuke": "defuses", "fire": "starts", "sun": "storm blocks", "rock": "splits", "scissors": "melts", "gun": "melts", "woman": "strikes", "monkey": "strikes", "man": "strikes", "snake": "strikes", "axe": "melts", "dynamite": "ignites"},
    "devil": {"woman": "tempts", "monkey": "enrages", "fire": "breathes", "sun": "curses", "axe": "immune to", "lightning": "casts", "snake": "eats", "rock": "hurls", "scissors": "immune to", "dynamite": "inspires", "nuke": "inspires", "gun": "inspires"},
    "dragon": {"nukes": "lived before", "monkey": "chars", "fire": "breathes", "rock": "rests upon", "scissors": "immune to", "gun": "immune to", "lightning": "breathes", "devil": "commands", "snake": "spawns", "axe": "immune to", "dynamite": "flosses with"},
    "alien": {"nuke": "defuses", "fire": "fuses", "sun": "destroys", "rock": "vaporizes", "scissors": "shields against", "gun": "shields against", "lightning": "shoots", "devil": "doesn't believe in", "snake": "mutates", "axe": "shields against", "dynamite": "defuses", "dragon": "vaporizes"},
    "water": {"nuke": "short-circuits", "fire": "puts out", "sun": "reflects", "rock": "erodes", "scissors": "rusts", "gun": "rusts", "lightning": "conducts", "alien": "toxic to", "devil": "blesses", "axe": "rusts", "dynamite": "douses", "dragon": "drowns"},
    "bowl": {"alien": "shapes craft of", "nuke": "encases core of", "fire": "snuffs out", "sun": "focuses", "scissors": "covers", "gun": "splashes", "dragon": "drowns", "water": "contains", "devil": "blesses", "rock": "once made of", "dynamite": "splashes", "lightning": "focuses"},
    "air": {"alien": "chokes", "nuke": "blows astray", "fire": "blows out", "sun": "cools heat of", "bowl": "tips over", "gun": "tarnishes", "lightning": "creates", "water": "evaporates", "devil": "chokes", "rock": "erodes", "dragon": "freezes"},
    "moon": {"alien": "houses", "devil": "terrifies", "dragon": "shines on", "sun": "eclipses", "bowl": "shaped like", "gun": "moonshine gunfight", "lightning": "is far above", "water": "has no", "rock": "shines on", "dynamite": "suffocates", "air": "has no"},
    "paper": { "moon": "mache", "air": "fans", "bowl": "mache", "water": "floats on", "alien": "disproves", "dynamite": "encases", "devil": "rebukes", "rock": "covers", "nuke": "defines", "dragon": "rebukes", "gun": "outlaws", "lightning": "defines"},
    "sponge": {"alien": "intrigues", "nuke": "cleans", "bowl": "cleans", "gun": "cleans", "air": "contains", "water": "absorbs", "devil": "cleanses", "paper": "soaks", "dynamite": "soaks", "dragon": "cleanses", "moon": "looks like", "lightning": "conducts"},
    "wolf": {"alien": "chases", "devil": "bites", "bowl": "drinks from", "air": "breathes", "water": "drinks", "nuke": "2 launches", "paper": "chews up", "sponge": "chews up", "moon": "howls at", "dragon": "outruns", "lightning": "outruns", "dynamite": "outruns"},
    "cockroach": {"water": "drinks", "devil": "annoys", "bowl": "hides under", "air": "breathes", "alien": "stows away with", "nuke": "survives", "wolf": "sleeps in fur of", "paper": "nests between", "sponge": "nests in", "dragon": "eats eggs of", "moon": "nocturnal with", "lightning": "hides from"},
    "tree": {"alien": "ensares ship of", "devil": "imprisons", "bowl": "wood creates", "cockroach": "shelters", "dragon": "shelters", "water": "drinks", "paper": "creates", "wolf": "shelters", "sponge": "outlives", "air": "produces", "moon": "blocks", "lightning": "attracts"},
    "man": {"alien": "disproves", "devil": "exorcises", "bowl": "eats from", "tree": "plants", "cockroach": "steps on", "air": "breathes", "water": "drinks", "paper": "writes on", "wolf": "tames", "sponge": "cleans with", "dragon": "slays", "moon": "travels to"},
    "woman": {"alien": "disproves", "man": "tempts", "bowl": "eats from", "tree": "plants", "cockroach": "steps on", "air": "breathes", "water": "drinks", "paper": "writes on", "wolf": "tames", "sponge": "cleans with", "dragon": "subdues", "moon": "aligns with"},
    "monkey": {"alien": "infuriates", "woman": "flings poop at", "bowl": "smashes", "tree": "lives in", "cockroach": "eats", "moon": "screeches at", "water": "drinks", "paper": "rips up", "wolf": "enrages", "sponge": "rips up", "air": "breathes", "man": "flings poop at"},
    "snake": {"water": "drinks", "woman": "bites", "monkey": "bites", "bowl": "sleeps in", "tree": "lives in", "cockroach": "eats", "moon": "nocturnal with", "sponge": "swallows", "paper": "nests in", "wolf": "bites", "air": "breathes", "man": "bites"},
    "axe": {"woman": "cleaves", "monkey": "cleaves", "bowl": "chops", "tree": "chops down", "cockroach": "chops", "moon": "reflects", "sponge": "chops", "paper": "slices", "wolf": "cleaves", "snake": "chops", "air": "flies through", "man": "cleaves"},
    "scissors": {"woman": "cuts hair of", "monkey": "stab", "tree": "carves", "cockroach": "stab", "moon": "reflects", "snake": "stab", "axe": "sharper than", "air": "swish through", "man": "cuts hair of"},
    "fire": {"scissors": "melts", "axe": "forges", "moon": "under light of", "snake": "burns", "monkey": "burns", "woman": "burns", "man": "burns", "cockroach": "burns", "wolf": "burns", "sponge": "burns", "paper": "burns"},
    "sun": {"snake": "warms", "monkey": "warms", "woman": "warms",  "man": "warms", "wolf": "warms", "cockroach": "warms", "rock": "warms",  "fire": "is made of", "scissors": "melts", "axe": "melts", "tree": "feeds", "sponge": "dries up", "paper": "shines through"},
    "rock": {"sun": "shades from", "fire": "pounds out", "scissors": "smashes", "axe": "chips", "tree": "blocks roots of", "cockroach": "squishes", "snake": "crushes", "monkey": "crushes", "woman": "crushes", "man": "crushes", "wolf": "crushes", "sponge": "crushes"},
}
def printmessage(s1, s2):
    if s1 == "moon" and s2 == "gun":
        print messages["moon"]["gun"],
    print messages[s1][s2],
objects=["gun", "dynamite", "nuke", "lightning", "devil", "dragon", "alien", "water", "bowl", "air", "moon", "paper", "paper", "sponge", "wolf", "cockroach", "tree", "man", "woman", "monkey", "snake", "axe", "scissors", "fire", "sun", "rock"]
try: 
    sys.argv[1]
    print "Objects: %s" %'\n'.join(objects)
    exit()
except IndexError:
    pass
random.seed()
x=random.randint(1, 9999999)
random.seed(x*9)
y=random.randint(1, 9999999)
random.seed(y+x*2)
z=random.randint(1, 9999999)
seed=(x+y+z)
random.seed(seed)
com=random.randint(1, 25)
arrnum=(com-1)
com_hr=objects[arrnum]
print "Make your choice."
player=raw_input()
if player in objects:
    plr=objects.index(player)
else:
    print "Where is your mind at? Keep your choices in the range of RPS-25."
    print "Objects: \n%s" %'\n'.join(objects)
    exit()
print "YOU: %s" %player
print "COM: %s" %com_hr
if (com-plr) % 25 < 13:
    print "The computer wins - ",
    print com_hr,
    printmessage(com_hr, player)
    print player + "."
elif (plr-com) % 25 < 13:
    print "You win - " + player,
    printmessage(player, com_hr)
    print com_hr + "."
elif (com-plr) % 25 == 0:
    print "It's a tie."
