=== Top ===
VAR CREW = 0 // straightforward
VAR MORALE = 0 // straightforward
VAR DEPTH = 0 // deep depths, deep rewards
VAR SPEED = 0 // effected by drill power and depth
VAR HP = 0 // hull strength
VAR HEAT = 0 // danger counter
VAR SUPPLIES = 0 //generic fuel + food

+ Mutiny -> Mutiny
+ Birthday -> Birthday
+ Drill -> Drill_1
+ Other Drill -> Drill_2

==function change(ref x, y)==
~x = x + y

==function set(ref x, y)==
~ x = y

==function drill==
~DEPTH=1+SPEED
~SUPPLIES= SUPPLIES-1
~HEAT=1+(SPEED * 0.5)

==function greekname==
~return 

==function wormtype==
~ return

=== Mutiny ===
Your crew are tired of being cooped up in this metal coffin. They say;{random stuff about the sky and sun and all that|}. A mutiny is brewing.
+{not Rebellion}Try to talk them around. ->Diplomacy
+{not Diplomacy}Inspire loyalty through force. -> Rebellion

=Diplomacy
*{Mutiny>0}[Engage them in debate.] 
    If we turn back now, what was the point of all this? {~change(HEAT,2)}
*{Mutiny>1}[Put it to a vote]
    The vote runs close; in the end, your vote breaks the tie. {~change(HEAT,3)}
*{Mutiny>2}[Struggle, one last time, to persuade them.]
    They warn you; they won't listen again. {~change(HEAT,4)}
*[] No matter how hard you try, it's impossible to put forward a reasonable argument. You are swiftly deposed, and your crew start the long journey back to the surface.
- ->Top

=Rebellion
*{Mutiny>0}[Make a show of force.]
You execute a crewman right there and then! Their loyalty is reinvigorated, for now... {~change(CREW,-1)}
*{Mutiny>1}If it's war they want...
<> then it's a war they'll get. You gather the loyal crew and fight a bitter battle to the end. {~change(CREW,-3)}
*{Mutiny>2}[A last stand]
    Holing up in the captain's office, you fight and fight and fight. In the end, you're left terribly wounded; you'll never survive another battle like this. {~change(CREW,-3)}
*[] It's no good; your crew's loyalty is frayed, and you won't last a second in a fight. Give up, return to the surface. -> END
- ->Top

=== Birthday ===
It's {&Eratosthenes|Doreios|Narkissos|Hephaestos|Coes|Percalus|Euphro|Phylace|Limnoreia|Megaera}'s birthday today!
{Birthday}
+Throw them a party.

- -> Top


== Drill_1 ==
Your drill churns ever onward, through miles of dirt and stone. You have a quiet evening to yourself. 
->lazytime
=lazytime
+[Enjoy the interlude]
    relax, take it easy

+[Encourage the stokers]
    They tell you that they could increase the speed, but it'll ding the hull
        ++[Make it so!]
        They dutifully start shoveling fuel. 
        {~change(SPEED,1) ~change HP(HP,-10) ~drill}
        ++Nah, never mind
        -- ->Top

+[Gaze out the window]
Dirt, rocks, dark

- ->Top

== Drill_2 ==
Your drill is a great corkscrew sheathed in steel, spiraling ever downwards. Every now and then, it digs up trouble; but not today.
->Drill_1.lazytime

== Drill_3 ==
On the surface, they think the only thing to be found this deep is horror and death. Not so; occasionally, you find boredom.
->Drill_1.lazytime

== Drill_4 ==
The efforts of Athens' finest minds have gotten you this far, but even they must find themselves at a loose end sometimes.
->Drill_1.lazytime

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