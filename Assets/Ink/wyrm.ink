=== Top ===
VAR CREW = 0 // straightforward
VAR MORALE = 0 // straightforward
VAR DEPTH = 0 // deep depths, deep rewards
VAR SPEED = 0 // effected by drill power and depth
VAR HP = 0 // hull strength
VAR HEAT = 0 // danger counter
VAR SUPPLIES = 0 //generic fuel + food

+ Mutiny -> Mutiny
* Birthday -> Birthday


==function change(ref x, y)==
~x = x + y

==function set(ref x, y)==
~ x = y



=== Mutiny ===
Your crew are tired of being cooped up in this metal coffin. They say;{random stuff about the sky and sun and all that|}. A mutiny is brewing.
+{not Rebellion}Try to talk them around. ->Diplomacy
+{not Diplomacy}Inspire loyalty through force. -> Rebellion

=Diplomacy
*{Mutiny>0}[Engage them in debate.] 
    If we turn back now, what was the point of all this? ~change(heat,2)
*{Mutiny>1}[Put it to a vote]
    The vote runs close; in the end, your vote breaks the tie. ~change(heat,3)
*{Mutiny>2}[Struggle, one last time, to persuade them.]
    They warn you; they won't listen again. ~change(heat,4)
*[] No matter how hard you try, it's impossible to put forward a reasonable argument. You are swiftly deposed, and your crew start the long journey back to the surface.
- ->Top

=Rebellion
*{Mutiny>0}[Make a show of force.]
You execute a crewman right there and then! Their loyalty is reinvigorated, for now... ~change(crew,-1)
*{Mutiny>1}If it's war they want...
<> then it's a war they'll get. You gather the loyal crew and fight a bitter battle to the end. ~change(crew,-3)
*{Mutiny>2}[A last stand]
    Holing up in the captain's office, you fight and fight and fight. In the end, you're left terribly wounded; you'll never survive another battle like this. ~xchange(crew,-3)
*[] It's no good; your crew's loyalty is frayed, and you won't last a second in a fight. Give up, return to the surface. -> END
- ->Top

=== Birthday ===

--> Top


== Drill_1 ==
Your drill churns ever onward, through miles of dirt and stone. You have a quiet evening to yourself.

+[Enjoy the interlude]

+[Encourage the stokers]

+[Gaze out the window]

- ->Top

== Drill_2 ==
Your drill is a great corkscrew sheathed in steel, spiraling ever downwards. Every now and then, it digs up trouble; but not today.
+[Enjoy the interlude]

+[Encourage the stokers]

+[Gaze out the window]

- ->Top

== Drill_3 ==
On the surface, they think the only thing to be found down here is horror and death. Not so; occasionally, you find boredom.
+[Enjoy the interlude]

+[Try and get moving faster]

+[]

- ->Top

== Drill_4 ==
The efforts of Athens' finest minds have gotten you this far, but even they find themselves at a loose end sometimes.
+[Relax while you can]

+[Visit the engine room]

+[look outside]

- ->Top

==Concerns==
One of your crew has a (randomly selected) concern of some kind.
- ->Top

==Reminisce==
Remember surface days.
- ->Top

==Dozing_off==
The constant whir of the drill feels almost restful. Nobody will mind if you just lie here for a moment...
- ->Top

==Ration_trouble==
Running low on food.
- ->Top

==engine_malfunction==
Engine making weird noises. 
- ->Top

==tracks==
Not the wyrmtrack you're following. Or is it?
- ->Top

==weird_creaking==
Noises, but not the usual noises.
- ->Top

==tremor==
All the world atremble.
- ->Top

==lost_trail==
You've lost sight of the wyrmtrack somewhere in all the dirt and darkness.
- ->Top

==wallscrawl==
Someone's vandalised the wall of the canteen.
- ->Top

==past_thoughts==
One of your crew seems to be worried about something.
- ->Top

==airpocket==
Giant ol' gap full of nothing. What caused it?? drill's not built for this.

- ->Top

==gasdanger==
Chief Aeoliphile warns you that you're running straight into a pocket of gas.

- ->Top

==passtime==
You've got a break from your captaining.
- ->Top

==disagreement==
Two crew are very upset at each other.
- ->Top

==sweltering==
The heat is getting to your crew.
- ->Top