extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var character = Sprite.new()
var background = Sprite.new()
var track = ""
var presence = ""
var width = 1920
var height = 1080
var choices = []
var people = {}
var variables = {}
var initials = {}
var textures = {}
var names = []
var data = []
var conversation = 0
var dialogue = """
[
	{
		"index": 5000,
		"location": "office",
		"person": "coworker",
		"text": "angry|\\"You're fired!\\"",
		"music": "Grim"
	},
	{
		"index": 5001,
		"location": "night",
		"text": "I'm back home safe, and I'm just so stressed about everything... I can't help but shake the feeling that I've forgotten something important."
	},
	{
		"index": 5002,
		"location": "night",
		"text": "Will life in this town really work out for me? Should I stay or should I go..."
	},
	{
		"index": 5003,
		"location": "night",
		"text": "_"
	},
	{
		"index": 3000,
		"location": "dining_room",
		"person": "barista",
		"text": "Should I try talking with her some more?`Yes'3001'time'20'barista'10^No'320"
	},
	{
		"index": 3001,
		"person": "barista",
		"text": "surprise|Do you mind if I sit down with you?"
	},
	{
		"index": 3002,
		"person": "barista",
		"text": "laugh|\\"Not at all!\\""
	},
	{
		"index": 3003,
		"person": "barista",
		"text": "Thanks!"
	},
	{
		"index": 3004,
		"person": "barista",
		"text": "surprise|Actually, I need to go to work. Sorry, I lost track of time."
	},
	{
		"index": 3005,
		"person": "barista",
		"text": "sad|\\"That's alright. Good luck at your new job... and take care...\\"`Use bathroom'300'bladder'-100^Leave'320"
	},
	{
		"index": 4000,
		"person": "barista",
		"music": "Grim",
		"text": "Could I ask you to take a look at this weird map that someone gave me?"
	},
	{
		"index": 4001,
		"person": "barista",
		"text": "sad|\\"Uh sure, what does it look like?\\""
	},
	{
		"index": 4002,
		"location": "map",
		"text": "Um, it looks like this..."
	},
	{
		"index": 4003,
		"location": "dining_room",
		"person": "barista",
		"text": "angry|\\"You need to leave town. Right now.\\""
	},
	{
		"index": 4004,
		"location": "dining_room",
		"person": "barista",
		"text": "angry|What, why? What about this map or whatever it means gives you the impression I need to move away so quickly?"
	},
	{
		"index": 4005,
		"location": "dining_room",
		"person": "barista",
		"text": "angry|\\"We do not have enough time for me to elaborate much further, but what I will say is that you are in danger, and it is too late for me and Kyoko.\\""
	},
	{
		"index": 4006,
		"location": "dining_room",
		"person": "barista",
		"text": "angry|But what about my new job and start a life here with everyone? I mean, sure Ms. Majoni is a bit odd, and maybe even suspicious, but I can't be expected to leave just because of her behavior."
	},
	{
		"index": 4007,
		"location": "dining_room",
		"person": "barista",
		"text": "surprise|\\"Shhhh!!! Don't say her name here, especially when we are having this conversation! Either take my advice and quit outright or continue to suffer. We aren't going to be able to help you though. We're all trapped as much as anyone else is.\\""
	},
	{
		"index": 4008,
		"location": "dining_room",
		"person": "barista",
		"text": "sad|Alright, well I guess I'll head home for today and think this over if this really is an emergency..."
	},
	{
		"index": 4009,
		"location": "dining_room",
		"person": "barista",
		"text": "angry|It is."
	},
	{
		"index": 4010,
		"location": "night",
		"text": "I'm back home safe, and I'm just so stressed about everything... I can't help but shake the feeling that I've forgotten something important."
	},
	{
		"index": 4011,
		"location": "night",
		"text": "Will life in this town really work out for me? Should I stay or should I go..."
	},
	{
		"index": 4012,
		"location": "night",
		"text": "_"
	},
	{
		"index": 0,
		"location": "bedroom0",
		"music": "Nostalgic",
		"text": "Monday is here again. But this time, it feels at least a little exciting since today is my first day at my new job."
	},
	{
		"index": 1,
		"text": "I spent the weekend moving into this new apartment too. The woman who owns the building is a little strange, but there is a cute girl who lives next door that I'd like to try talking to if the chance arises."
	},
	{
		"index": 2,
		"text": "It's still pretty early in the morning, and well before I need to be at the office. I'm unsure as to whether I should treat myself to a nice breakfast at the local cafe or just cook something standard in the kitchen.`Cook'3'hunger'-10'bladder'10'time'10^Eat out'100"
	},
	{
		"index": 100,
		"location": "living_room",
		"text": "I think after all the hardship I went through to move out here and land this great job, I deserve a tasty pastry as a reward! Off to the cafe I go!"
	},
	{
		"index": 101,
		"location": "hallway",
		"music": "Melancholic",
		"text": "This hallway is pretty dreary, but the meteorologist said it should be pretty swell outside today."
	},
	{
		"index": 102,
		"location": "stairs",
		"person": "eua",
		"text": "\\"Why if it isn't our newest tenant... how are we this fine morning?\\""
	},
	{
		"index": 103,
		"person": "eua",
		"text": "Ah, Ms. Majoni, I'm doing alright, how are you?"
	},
	{
		"index": 104,
		"person": "eua",
		"text": "\\"I was heading up to the roof to have a cigarette if you would care to join me...\\"`Accept'105'eua'10'time'30^Refuse'200'eua'-10"
	},
	{
		"index": 105,
		"person": "eua",
		"text": "That sounds pleasant, sure!"
	},
	{
		"index": 106,
		"person": "eua",
		"text": "\\"Splendid.\\""
	},
	{
		"index": 107,
		"text": "I definitely did not expect this..."
	},
	{
		"index": 108,
		"location": "roof",
		"text": "Wow, it's quite a long way down from up here."
	},
	{
		"index": 109,
		"location": "sky",
		"text": "But the view is absolutely gorgeous!"
	},
	{
		"index": 110,
		"person": "eua",
		"text": "\\"You certainly like to speak your mind.\\""
	},
	{
		"index": 111,
		"person": "eua",
		"text": "Huh? Oh, sorry if that came out weird or anything..."
	},
	{
		"index": 112,
		"person": "eua",
		"text": "laugh|\\"I was only teasing. Here, have a cigarette.\\""
	},
	{
		"index": 113,
		"person": "eua",
		"text": "Uh, thanks. Do you have a lighter too?"
	},
	{
		"index": 114,
		"person": "eua",
		"text": "angry|\\"I thought you were bringing one. That would be the proper courtesy when a lady invites you for a smoke.\\""
	},
	{
		"index": 115,
		"person": "eua",
		"text": "Um, yeah, I suppose so. I forgot I had one here."
	},
	{
		"index": 116,
		"person": "eua",
		"text": "laugh|\\"Thank you kindly.\\""
	},
	{
		"index": 117,
		"person": "eua",
		"text": "\\"So what do you think of our quaint, little town so far?\\""
	},
	{
		"index": 118,
		"person": "eua",
		"text": "It seems pretty cool. Have you lived here for long?"
	},
	{
		"index": 119,
		"person": "eua",
		"text": "\\"My family helped found it over a century ago.\\""
	},
	{
		"index": 120,
		"person": "eua",
		"text": "Woah! Do you have any tips for fitting in?"
	},
	{
		"index": 121,
		"person": "eua",
		"text": "angry|\\"Simply do not cause a disturbance.\\""
	},
	{
		"index": 122,
		"person": "eua",
		"text": "angry|...Understood, ma'am."
	},
	{
		"index": 123,
		"person": "eua",
		"text": "laugh|\\"I think you'll fit right in though.\\""
	},
	{
		"index": 124,
		"person": "eua",
		"text": "laugh|Thanks for vote of confidence."
	},
	{
		"index": 125,
		"person": "eua",
		"text": "\\"You should be going now.\\""
	},
	{
		"index": 126,
		"person": "eua",
		"text": "Huh? Oh crap, you're so right, I don't want to be late on my first day!`Stop home first'127^Go to cafe'200^Head to work'400"
	},
	{
		"index": 127,
		"location": "living_room",
		"text": "I'd better hurry along before I kill all the time I have before I have to clock in.`Cook breakfast'3'hunger'-10'time'10'bladder'10^Use bathroom'10'bladder'-10^Play games'8'time'10^Leave'11"
	},
	{
		"index": 200,
		"person": "eua",
		"text": "If I'm going to have enough time to make it to work and get my special treat at the cafe, I need to leave right now."
	},
	{
		"index": 201,
		"location": "stairs",
		"text": "Ugh, why are there so many stairs in this place?!"
	},
	{
		"index": 202,
		"location": "parking_lot",
		"text": "Alright I finally made it out of that place."
	},
	{
		"index": 203,
		"location": "intersection",
		"text": "Wait, now I'm suddenly forgetting my way around here. The roads all feel like they have rearranged themselves somehow..."
	},
	{
		"index": 204,
		"location": "intersection",
		"text": "Was it a left or a right turn at this intersection...?`Left'205'time'20^Right'251"
	},
	{
		"index": 205,
		"location": "crosswalk",
		"text": "I think it was a left! It might be best to just walk down a little ways and check for the cafe on the horizon."
	},
	{
		"index": 206,
		"location": "sidewalk",
		"text": "This doesn't feel right..."
	},
	{
		"index": 207,
		"location": "potty",
		"text": "A portable toilet? When did this get here?`Use it'208'bladder'-10^Keep going'210'bladder'20'time'20^Turn back'250'bladder'20"
	},
	{
		"index": 208,
		"text": "Ah, that feels much better after that heft morning coffee."
	},
	{
		"index": 209,
		"text": "What now?`Keep going'210'time'20^Turn back'250"
	},
	{
		"index": 210,
		"location": "sidewalk",
		"text": "Let's check even further, it has to be over here somewhere."
	},
	{
		"index": 211,
		"location": "dumpster",
		"text": "This area smells awful."
	},
	{
		"index": 212,
		"person": "eua",
		"text": "surprise|Ms. Majoni?!"
	},
	{
		"index": 213,
		"person": "eua",
		"text": "happy|\\"The very same...\\""
	},
	{
		"index": 214,
		"person": "eua",
		"text": "What are you doing all the way out here?"
	},
	{
		"index": 215,
		"person": "eua",
		"text": "angry|\\"I could ask you the same question.\\""
	},
	{
		"index": 216,
		"person": "eua",
		"text": "angry|A fair point, but listen, I'm lost! Can you help me get back on track so I can try to arrive at work on time?"
	},
	{
		"index": 217,
		"person": "eua",
		"text": "sad|\\"What a profound tragedy. You may take this map with you if you wish.\\""
	},
	{
		"index": 218,
		"location": "map",
		"text": "Thank you so much! Wait, what does this even mean?"
	},
	{
		"index": 219,
		"person": "eua",
		"location": "dumpster",
		"text": "laugh|\\"You have figure that out for yourself!\\""
	},
	{
		"index": 220,
		"location": "dumpster",
		"text": "And with that, she promptly departed."
	},
	{
		"index": 221,
		"text": "What just happened?"
	},
	{
		"index": 222,
		"location": "map",
		"text": "And what kind of map even is this?"
	},
	{
		"index": 223,
		"text": "Should I even bother looking at it anymore?`Study \\"map\\"'224'time'10'hunger'20'map'-1^Head back'250'map'1"
	},
	{
		"index": 224,
		"text": "This is clearly indecipherable, so I'll just throw this silly piece of paper into this dumpster."
	},
	{
		"index": 225,
		"location": "sidewalk",
		"text": "I don't have time for this lady's games, I need to go to work! I'll just head straight back to that first intersection right away."
	},
	{
		"index": 250,
		"location": "sidewalk",
		"text": "Let's go back and try the other direction."
	},
	{
		"index": 251,
		"location": "intersection",
		"text": "A right turn was definitely the right choice. The cafe is coming up ahead now."
	},
	{
		"index": 252,
		"location": "parking_lot",
		"text": "At last, my pastry awaits!"
	},
	{
		"index": 253,
		"location": "cafe",
		"music": "Nostalgic",
		"text": "The barista seems to be in the backroom, so I'll ring this service bell."
	},
	{
		"index": 254,
		"person": "barista",
		"text": "\\"Hello and welcome, sir!\\""
	},
	{
		"index": 255,
		"person": "barista",
		"text": "Hi there, miss. Can I get a fresh cinnamon roll?"
	},
	{
		"index": 256,
		"person": "barista",
		"text": "angry|\\"All of our cinnamon rolls are served after having been freshly baked, sir.\\""
	},
	{
		"index": 257,
		"person": "barista",
		"text": "angry|Of course, my apologies!"
	},
	{
		"index": 258,
		"person": "barista",
		"text": "laugh|\\"Oh, just teasing! That'll be coming out for you in a moment, so take a seat in our dining area.\\""
	},
	{
		"index": 259,
		"person": "barista",
		"text": "Thanks...`Also order coffee'260'money'-20'bladder'30'hunger'-20^Tip generously'270'money'-20'barista'20^Sit down'280'money'-10'hunger'-20"
	},
	{
		"index": 260,
		"person": "barista",
		"text": "May I also have some black coffee with that?"
	},
	{
		"index": 261,
		"person": "barista",
		"text": "happy|\\"Of course! I'll bring it all over when it's ready.\\""
	},
	{
		"index": 262,
		"person": "barista",
		"text": "happy|Thank you.`Tip generously'270'money'-20'barista'20^Sit down'280"
	},
	{
		"index": 270,
		"person": "barista",
		"text": "surprise|\\"Oh why thank you so much, sir!\\""
	},
	{
		"index": 271,
		"person": "barista",
		"text": "surprise|You're welcome."
	},
	{
		"index": 280,
		"location": "dining_room",
		"text": "This cafe is so cozy."
	},
	{
		"index": 281,
		"person": "barista",
		"text": "\\"Here is your order, sir. Enjoy!\\""
	},
	{
		"index": 282,
		"text": "This looks so tasty! I can't wait to dig in."
	},
	{
		"index": 283,
		"text": "Never have I eaten such a moist and rich cinnamon roll as that."
	},
	{
		"index": 284,
		"person": "barista",
		"text": "\\"How did I do?\\"`It was great'287^It was okay'285'barista'-10"
	},
	{
		"index": 285,
		"person": "barista",
		"text": "sad|\\"Darn, I still have a long way to go...\\""
	},
	{
		"index": 286,
		"text": "I guess I hurt her feelings.`Leave for work'400^Use bathroom'300"
	},
	{
		"index": 287,
		"person": "barista",
		"text": "laugh|\\"I'm so glad you liked it! I only recently opened up this bakery, so I'm still trying to get the hang of baking some of the menu items just right.\\""
	},
	{
		"index": 288,
		"person": "barista",
		"text": "Have you lived in this town for very long?"
	},
	{
		"index": 289,
		"person": "barista",
		"text": "sad|\\"My friend Kyoko and I grew up in this town together, but ever since she moved into that apartment building owned by Ms. Majoni, I haven't heard much from her...\\""
	},
	{
		"index": 290,
		"person": "barista",
		"text": "sad|I heard she's enrolled in the local college."
	},
	{
		"index": 291,
		"person": "barista",
		"text": "surprise|\\"What?! I hadn't even heard that myself! Are you living there too?\\""
	},
	{
		"index": 292,
		"person": "barista",
		"text": "surprise|Yeah, I moved in over the weekend."
	},
	{
		"index": 293,
		"person": "barista",
		"text": "sad|\\"Well, say hi to Kyoko for me sometime. And take good care of yourself, that landlord is a strange woman.\\""
	},
	{
		"index": 294,
		"person": "barista",
		"text": "sad|I'll do that, and hopefully you two can reconnect soon."
	},
	{
		"index": 295,
		"person": "barista",
		"text": "sad|\\"Me too.\\""
	},
	{
		"index": 296,
		"person": "barista",
		"text": "sad|I think it's almost time for me to clock in at my new job.`Order coffee'297'money'-10'bladder'20^Use bathroom'300'bladder'-100^Leave'320"
	},
	{
		"index": 297,
		"person": "barista",
		"text": "sad|May I have some coffee?"
	},
	{
		"index": 298,
		"person": "barista",
		"text": "Sure."
	},
	{
		"index": 299,
		"person": "barista",
		"text": "Such a satisfying breakfast has surely spoiled me rotten.`Use bathroom'300'bladder'-100^Leave'320"
	},
	{
		"index": 300,
		"location": "bathroom",
		"text": "Even this cafe's bathroom has a cozy atmosphere!"
	},
	{
		"index": 301,
		"location": "cafe",
		"text": "Hm, it looks like the barista isn't behind the counter anymore..."
	},
	{
		"index": 302,
		"location": "dining_room",
		"person": "barista",
		"text": "Oh, she's just having her break a little early..."
	},
	{
		"index": 320,
		"location": "parking_lot",
		"text": "It's time to leave and head to work!"
	},
	{
		"index": 3,
		"location": "kitchen",
		"text": "I guess I should probably save my money until at least my first paycheck comes in."
	},
	{
		"index": 4,
		"text": "These eggs are delicious! I put in just the right amount of salt and pepper. There wasn't any hot sauce in the fridge but I can always pick that up from the grocery store after work is over."
	},
	{
		"index": 5,
		"text": "As I chew the fluffy scrambled eggs - which upon a second thought could have possibly had a bit too much milk added to them - I realize just how nervous I really am for this first day of work. It might just be my imposter syndrome going haywire, but I feel like I am severely underqualified for this position."
	},
	{
		"index": 6,
		"text": "Hopefully I'll either be able to fake it well enough to fool any managers who happen to be sticklers for productivity, or a nice coworker will be willing to show me the ropes."
	},
	{
		"index": 7,
		"location": "living_room",
		"text": "In any case, I'd better hurry along before I kill all the time I have before I have to clock in.`Use bathroom'10'bladder'-10^Play games'8'time'10^Leave'11"
	},
	{
		"index": 8,
		"location": "living_room",
		"text": "I'll play a few quick multiplayer matches of my favorite video game in order to relax before the stressful day ahead.`Use bathroom'10'bladder'-10^Play games'9'time'10^Leave'11"
	},
	{
		"index": 9,
		"location": "living_room",
		"text": "I'll play a few more quick multiplayer matches of my favorite video game in order to relax before the stressful day ahead.`Use bathroom'10'bladder'-10^Play games'9'time'10^Leave'11"
	},
	{
		"index": 10,
		"location": "bathroom",
		"text": "It's a good idea to have a good, hot shower and go to the toilet before work to get my mind in the right space for concentration.`Play games'8'time'10^Leave'11"
	},
	{
		"index": 11,
		"location": "living_room",
		"text": "I bought some fashionable dress shoes so I can look my best on the first day. Maybe that cute girl will notice~!"
	},
	{
		"index": 12,
		"location": "hallway",
		"text": "This hallway is pretty dreary, but the meteorologist said it should be pretty swell outside today."
	},
	{
		"index": 13,
		"person": "kyoko",
		"text": "Woah, hey, it's the cute girl!"
	},
	{
		"index": 14,
		"person": "kyoko",
		"text": "\\"Oh, good morning! My name's Kyoko. Has moving in gone alright for you so far?\\""
	},
	{
		"index": 15,
		"person": "kyoko",
		"text": "Oh yeah totally. I got it all taken care of over the weekend. How long have you been living here for?"
	},
	{
		"index": 16,
		"person": "kyoko",
		"text": "laugh|\\"Who, me? It feels like it's been ages, but I'm only a sophomore in college. This town has me stuck in a rut.\\"`Hurry up'20^Offer help'30'kyoko'10"
	},
	{
		"index": 30,
		"person": "kyoko",
		"text": "surprise|I'd be happy to help you study if you want."
	},
	{
		"index": 31,
		"person": "kyoko",
		"text": "\\"Thanks for the offer, mister, but sadly, that really isn't what the problem is.\\""
	},
	{
		"index": 32,
		"person": "kyoko",
		"text": "Then what is the problem?"
	},
	{
		"index": 33,
		"person": "kyoko",
		"text": "sad|\\"I would explain, but actually I really should be going. Otherwise, I'll be late - or worse, and you might be too.\\""
	},
	{
		"index": 34,
		"text": "\\"Or worse\\"?"
	},
	{
		"index": 35,
		"text": "That girl was acting worrisomely. Maybe today is a bit of an off day for her."
	},
	{
		"index": 20,
		"person": "kyoko",
		"text": "surprise|Geese, will you look at the time, I have to hurry along to work now, sorry, bye!"
	},
	{
		"index": 21,
		"location": "parking_lot",
		"text": "As much as I want to talk with her, time is precious, and there's a limit to how much I can spend chatting before I end up being late for work."
	},
	{
		"index": 321,
		"location": "crosswalk",
		"text": "Almost there..."
	},
	{
		"index": 322,
		"location": "parking_lot",
		"text": "Here goes nothing..."
	},
	{
		"index": 323,
		"location": "office",
		"person": "coworker",
		"text": "laugh|\\"Welcome to the office, new recruit!\\""
	},
	{
		"index": 324,
		"location": "office",
		"person": "coworker",
		"text": "laugh|Thanks for hiring me, sir!"
	},
	{
		"index": 325,
		"location": "office",
		"person": "coworker",
		"text": "\\"You sure picked a smart time to get hired! The office network is down for some unanticipated maintainance courtesy of our stellar IT department, so we are just going to have a company lunch even and send everyone home early for the day.\\""
	},
	{
		"index": 326,
		"location": "office",
		"person": "coworker",
		"text": "Will I still get paid?"
	},
	{
		"index": 327,
		"location": "office",
		"person": "coworker",
		"text": "surprise|\\"That's more of a question for the people in HR since today is your first day. You can probably catch one of them at lunch though.\\"`Stay for lunch'350'money'100'coworker'10^Go home'328'money'100'coworker"
	},
	{
		"index": 328,
		"location": "office",
		"person": "coworker",
		"text": "I'll just head home early if that's alright."
	},
	{
		"index": 329,
		"location": "office",
		"person": "coworker",
		"text": "\\"That's fine! I'll talk to human resources for you. Not much is gonna get done today anyways.\\""
	},
	{
		"index": 330,
		"location": "night",
		"text": "I'm back home safe, and I'm just so stressed about everything... I can't help but shake the feeling that I've forgotten something important."
	},
	{
		"index": 331,
		"location": "night",
		"text": "Will life in this town really work out for me? Should I stay or should I go..."
	},
	{
		"index": 332,
		"location": "night",
		"text": "_"
	},
	{
		"index": 350,
		"location": "dining_room",
		"text": "The office cafeteria has a familar coziness to it..."
	},
	{
		"index": 351,
		"location": "dining_room",
		"person": "coworker",
		"text": "happy|\\"Human resources said you can expect today's wages to show up in your account as normal. Hopefully we can get your orientation process underway tomorrow, newbie!\\""
	},
	{
		"index": 352,
		"location": "dining_room",
		"person": "coworker",
		"text": "Awesome, thanks so much sir!"
	},
	{
		"index": 353,
		"location": "night",
		"text": "I'm back home safe, and I'm just so stressed about everything... I can't help but shake the feeling that I've forgotten something important."
	},
	{
		"index": 354,
		"location": "night",
		"text": "Will life in this town really work out for me? Should I stay or should I go..."
	},
	{
		"index": 355,
		"location": "night",
		"text": "_"
	},
]
"""

func _chosen(index):
	var node = get_node("Choices")
	var next = -1
	for i in range(len(choices)):
		var choice = choices[i]
		node.remove_child(choice[0])
		choice[0].queue_free()
		if (index == i):
			next = int(choice[1])
			choice.pop_front()
			choice.pop_front()
			print(str(choice))
			while (len(choice) > 1):
				if (choice[0] in variables):
					variables[choice[0]] += int(choice[1])
					if ((choice[0] == "time") or (choice[0] == "bladder") or (choice[0] == "money")):
						if (variables[choice[0]] < 0):
							variables[choice[0]] = 0
					print(choice[0]+" "+str(variables[choice[0]]))
				choice.pop_front()
				choice.pop_front()
	choices.clear()
	node.visible = false
	print(str(index))
	talk(next)

func choose(messages):
	if (len(choices) > 0):
		return
	if (variables["bladder"] >= 50):
		if (presence in variables):
			messages.append(["Take a leak", -3, presence, -abs(variables[presence]), "bladder", -variables["bladder"]])
		else:
			messages.append(["Take a leak", -3, "bladder", -variables["bladder"]])
	for i in range(len(messages)):
		var message = messages[i]
		var base = get_node("Choices/ColorRect4")
		var clone = base.duplicate()
		var choice = []
		clone.get_node("RichTextLabel").bbcode_text = "[color=white]"+message[0]+"[/color]"
		clone.name += "_"+str(i)
		clone.context = "Choices/"+clone.name
		clone.index = i
		clone.visible = true
		clone.rect_position.y += (i-1)*128
		get_node("Choices").add_child(clone)
		choice.append(clone)
		for j in range(len(message)):
			if (j == 0):
				continue
			choice.append(message[j])
		choices.append(choice)
	get_node("Choices").visible = true

func go(location, person, music, text):
	var texture = ImageTexture.new()
	if (location != ""):
		texture = textures["backs/"+location+".png"]
		background.texture = texture
		background.centered = true
		background.offset.y = texture.get_size().y/2
	if (person != ""):
		if (location != ""):
			texture = ImageTexture.new()
		presence = person
		if ("_" in person):
			texture = textures["chars/"+person+".png"]
		else:
			var emotion = ""
			if ("|" in text):
				var halves = text.split("|")
				emotion += halves[0]
			if (emotion == ""):
				emotion += "neutral"
			if (person in variables):
				var disposition = variables[person]
				if (emotion == "neutral"):
					if (disposition > 0.0):
						emotion = "happy"
					else:
						if (disposition < 0.0):
							emotion = "angry"
			texture = textures["chars/"+person+"_"+emotion+".png"]
		character.texture = texture
		character.centered = true
		character.offset.y = texture.get_size().y/2
		character.visible = true
	else:
		character.visible = false
		presence = ""
	if (music != ""):
		if (track != music):
			get_node("Grim").stop()
			get_node("Melancholic").stop()
			get_node("Nostalgic").stop()
		get_node(music).play()
		track = music
	else:
		track = ""
	if (text != ""):
		if (text == "_"):
			get_tree().reload_current_scene()
			return
		var message = ""
		get_node("Dialogue").visible = true
		get_node("Dialogue/ColorRect5").rect_size.x = width
		get_node("Dialogue/ColorRect5").rect_size.y = 320
		get_node("Dialogue/ColorRect5").rect_position.x = 0
		get_node("Dialogue/ColorRect5").rect_position.y = height-get_node("Dialogue/ColorRect5").rect_size.y
		get_node("Dialogue/ColorRect5/CenterContainer").rect_size = get_node("Dialogue/ColorRect5").rect_size
		if ("|" in text):
			var halves = text.split("|")
			message += halves[1]
		else:
			message += text
		if ("`" in message):
			var halves = message.split("`")
			var temp = halves[1].split("^")
			var choices = []
			message = halves[0]
			for i in range(len(temp)):
				choices.append(temp[i].split("'"))
			choose(choices)
		if (message.substr(0, 1) == "\""):
			message = people[person]+message
		get_node("Dialogue/ColorRect5/CenterContainer/RichTextLabel").bbcode_text = "[center][color=white]"+message+"[/color][/center]"
	else:
		get_node("Dialogue").visible = false


func talk(index):
	print("test "+str(index)+" "+str(conversation))
	if (get_node("Choices").visible):
		print("choosing")
		return
	if (len(data) == 0):
		var result = JSON.parse(dialogue)
		print(str(result.error)+" "+str(result.error_line)+" "+str(result.error_string))
		if (result.error != OK):
			var lines = dialogue.split("\n")
			print(lines[result.error_line])
		else:
			data += result.result
	var previous = conversation
	if (index == -1):
		conversation += 1
		index -= index
		index += conversation
	var check = true
	var real = index
	if (index >= 0):
		for i in range(len(data)):
			if ("index" in data[i]):
				if (str(data[i]["index"]) == str(index)):
					check = false
					index = i
					break
		if (check):
			print("previous "+str(previous))
			for i in range(len(data)):
				if ("index" in data[i]):
					if (str(data[i]["index"]) == str(previous)):
						check = false
						index = i
						while (true):
							print("zoom "+str(index))
							index += 1
							if (index >= len(data)):
								check = true
								break
							if (data[index]["index"] > previous):
								real = data[index]["index"]
								break
						break
	var entry = {}
	var person = ""
	var location = ""
	var music = ""
	var text = []
	if (check):
		if (index == -2):
			get_tree().reload_current_scene()
		elif (index == -3):
			check = false
			conversation = previous
			entry["index"] = index
			entry["person"] = presence
			entry["music"] = track
			entry["text"] = "Damn it, not again! I lost control of my bladder...\nI suppose it's best if I just play it off like I spilled something, but will they fall for it? I'd better just make a quick exit."
			if (presence in variables):
				variables[presence] -= 100
			if (presence == "coworker"):
				conversation = 5000
				entry = data[0]
			else:
				if (previous >= 0):
					for i in range(len(data)):
						if ("index" in data[i]):
							if (str(data[i]["index"]) == str(previous)):
								if ("`" in data[i]["text"]):
									var halves = data[i]["text"].split("`")
									entry["text"] += "`"+halves[len(halves)-1]
								break
			print(str(entry))
	else:
		conversation = real
	if (check):
		print("error")
		get_node("Dialogue").visible = false
		return
	if ((index >= 0) and (index < len(data))):
		entry = data[index]
	if ("index" in entry):
		if (str(entry["index"]) == "323"):
			if (variables["coworker"] < 0):
				for i in range(len(data)):
					if (str(data[i]["index"]) == "5000"):
						entry = data[i]
						conversation = 5000
						break
			else:
				if (variables["time"] > 50):
					var temp = entry["index"]
					entry = {}
					entry["index"] = temp
					entry["person"] = "coworker"
					entry["location"] = "office"
					entry["text"] = "You're late rookie, but you're lucky that that doesn't happen to mean much today on account of our servers begin down."
		elif (str(entry["index"]) == "302"):
			if (variables["barista"] >= 10):
				for i in range(len(data)):
					if (str(data[i]["index"]) == "3000"):
						entry = data[i]
						conversation = 3000
						break
		elif (str(entry["index"]) == "3003"):
			if (variables["map"] > 0):
				for i in range(len(data)):
					if (str(data[i]["index"]) == "4000"):
						entry = data[i]
						conversation = 4000
						break
		elif (str(entry["index"]) == "0"):
			var money = variables["money"]
			var coworker = variables["coworker"]
			for variable in variables:
				variables[variable] = initials[variable]
			variables["money"] = money
			variables["coworker"] = coworker
	if ("person" in entry):
		person += entry["person"]
	if ("location" in entry):
		location += entry["location"]
	if ("music" in entry):
		music += entry["music"]
	if ("text" in entry):
		text.append(entry["text"])
	for i in range(len(text)):
		print("go "+str(i))
		go(location, person, music, text[i])
		break


# Called when the node enters the scene tree for the first time.
func _ready():
	var emotions = []
	emotions.append("neutral")
	emotions.append("happy")
	emotions.append("sad")
	emotions.append("angry")
	emotions.append("surprise")
	emotions.append("laugh")
	names.append("eua")
	names.append("kyoko")
	names.append("barista")
	names.append("coworker")
	for emotion in emotions:
		for name in names:
			textures["chars/"+name+"_"+emotion+".png"] = load("res://chars/"+name+"_"+emotion+".png")
	textures["backs/bathroom.png"] = load("res://backs/bathroom.png")
	textures["backs/bedroom0.png"] = load("res://backs/bedroom0.png")
	textures["backs/bedroom1.png"] = load("res://backs/bedroom1.png")
	textures["backs/bedroom2.png"] = load("res://backs/bedroom2.png")
	textures["backs/cafe.png"] = load("res://backs/cafe.png")
	textures["backs/crosswalk.png"] = load("res://backs/crosswalk.png")
	textures["backs/dining_room.png"] = load("res://backs/dining_room.png")
	textures["backs/dumpster.png"] = load("res://backs/dumpster.png")
	textures["backs/crosswalk.png"] = load("res://backs/crosswalk.png")
	textures["backs/intersection.png"] = load("res://backs/intersection.png")
	textures["backs/sidewalk.png"] = load("res://backs/sidewalk.png")
	textures["backs/grass.png"] = load("res://backs/grass.png")
	textures["backs/night.png"] = load("res://backs/night.png")
	textures["backs/hallway.png"] = load("res://backs/hallway.png")
	textures["backs/kitchen.png"] = load("res://backs/kitchen.png")
	textures["backs/living_room.png"] = load("res://backs/living_room.png")
	textures["backs/office.png"] = load("res://backs/office.png")
	textures["backs/parking_lot.png"] = load("res://backs/parking_lot.png")
	textures["backs/potty.png"] = load("res://backs/potty.png")
	textures["backs/roof.png"] = load("res://backs/roof.png")
	textures["backs/sky.png"] = load("res://backs/sky.png")
	textures["backs/stairs.png"] = load("res://backs/stairs.png")
	var sprite = Sprite.new()
	var texture = ImageTexture.new()
	texture = textures["backs/bedroom0.png"]
	sprite.texture = texture
	sprite.centered = true
	sprite.offset.y = texture.get_size().y/2
	get_node("Background").add_child(sprite)
	background = sprite
	background.translate(Vector2(width/2, 0))
	background.scale = Vector2(1.25, 1.25)
	sprite = Sprite.new()
	texture = ImageTexture.new()
	texture = textures["chars/eua_happy.png"]
	sprite.texture = texture
	sprite.centered = true
	sprite.offset.y = texture.get_size().y/2
	get_node("Background").add_child(sprite)
	character = sprite
	character.translate(Vector2(width/2, 0))
	people[""] = ""
	people["eua"] = "Eua Majoni\n\n"
	people["kyoko"] = "Kyoko Meirotome\n\n"
	people["coworker"] = "Coworker\n\n"
	people["barista"] = "Barista\n\n"
	for name in names:
		variables[name] = 0
	variables["money"] = 100
	variables["hunger"] = 10
	variables["bladder"] = 0
	variables["time"] = 0
	variables["map"] = 0
	for variable in variables:
		initials[variable] = variables[variable]
	talk(conversation)
	#go("", "eua", "Nostalgic", "Hi there! My name is Eua and this is a big old text display test message!")
	get_node("Foreground").visible = false
	#choose(["hi", "lol", "rofl"])
	#connect("_choice", self, "_chosen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE and event.pressed:
			get_node("Foreground").visible = !get_node("Foreground").visible
			if get_node("Foreground").visible:
				if (len(choices) > 0):
					get_node("Choices").visible = false
					get_node("Dialogue").visible = false
			else:
				if (len(choices) > 0):
					get_node("Choices").visible = true
					get_node("Dialogue").visible = true
