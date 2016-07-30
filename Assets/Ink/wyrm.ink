=== Top ===
VAR CREW = 10 // straightforward
VAR MORALE = 100 // straightforward
VAR DEPTH = 0 // deep depths, deep rewards
VAR SPEED = 2 // effected by drill power and depth
VAR HP = 100 // hull strength
VAR HEAT = 0 // danger counter
VAR SUPPLIES = 20 //generic fuel + food

{wormspecies()}
{drill()}
{DEPTH}
+ Mutiny -> Mutiny
+ Birthday -> Birthday
+ Drill -> Drill_1
+ Other Drill -> Drill_2


==function change(ref x, y)==
~x = x + y

==function set(ref x, y)==
~ x = y

==function drill()==
~DEPTH=1+DEPTH+SPEED
~SUPPLIES= SUPPLIES-1
~HEAT=1+(SPEED * 0.5)

==function greekname()==
~return "{~Percalus|Euphro|Phylace|Limnoreia|Megaera|Glyke|Ione|Medea|Scylla|Amatheia|Hermione|Ctimene|Milo|Astyocheia|Hecuba|Callianessa|Hermine|Megara|Dirce|Artemidora|Plutarch|Theophanes|Thyrsos|Pittacus|Copreus|Panaetius|Epimenes|Hermeros|Pigres|Apollodoros|Phineus|Agamedes|Oliatos|Peteos|Phaestus|Apisaon|Demonax|Dardanus|Aristogeiton|Asopodoros}"

==function wormspecies()==
~ return "{~Platyhelm|Cest|Acoelo|Nema|Tetra|Helm|Bilatere|Tentaculario|Diphyll|Mono|Turbella}{~inth|mate|ode|gene|ide|annelid|bothride|ozoa|aria}"

=== Mutiny ===
Your crew are tired of being cooped up in this metal coffin. They say; "{~We miss the sun!|I miss the sky!|I miss my family!|I miss fresh cheese!|I want to go home!|I want to see my family again!|I'm sick of dealing with you!|I can't abide any more drilling!|The heat! The heat!!|I'm hungry!|I don't even like wyrms!|We're all going to die!}". A mutiny is brewing.
+{not Rebellion}Try to talk them around{|| again}. -> Diplomacy
+{not Diplomacy}Inspire loyalty through force{|| again}. -> Rebellion

=Diplomacy
Diplomacy never hurt anyone; but it takes time, time, precious time, while all the while the heat of the earth seeps into your wyrmdigger.
*{Mutiny>0}[Engage them in debate.] 
    If we turn back now, what was the point of all this? Some of your crew mumble in agreement; but that argument isn't likely to work twice.
    ~change(HEAT,2)
*{Mutiny>1}[Put it to a vote]
    The vote runs close; in the end, your vote breaks the tie. 
    ~change(HEAT,3)
*{Mutiny>2}[Struggle, one last time, to persuade them.]
    They warn you; they won't listen again. 
    ~change(HEAT,4)
*[] No matter how hard you try, it's impossible to put forward a reasonable argument. You are swiftly deposed, and your crew start the long journey back to the surface. -> END
- + ->Top

=Rebellion
Brutal, short and to the point; violence is the answer to many questions.
*{Mutiny>0}[Make a show of force.]
    You execute a crewman right there and then! Their loyalty is reinvigorated, for now... 
    ~change(CREW,-1)
*{Mutiny>1}If it's war they want...
    <> then it's a war they'll get. You gather the loyal crew and fight a bitter battle to the end. 
    ~change(CREW,-3)
*{Mutiny>2}[A last stand]
    Holing up in the captain's office, you fight and fight and fight. In the end, you're left terribly wounded; you'll never survive another battle like this. 
    ~change(CREW,-3)
*[] It's no good; your crew's loyalty is frayed, and you won't last a second in a fight. Give up, return to the surface. -> END
- + ->Top

=== Birthday ===
~temp birthdayboy = greekname()
It's {birthdayboy}'s birthday today! {|It's considered lucky to have two birthdays in one voyage.|Three must be even luckier.|Four birthdays is a bit much.|Five in one trip? What?|Six???|Seven??????????|Eight? This is a bit daft.|The crew are definitely trying to pull something here.}
+Throw them a party.
    Hooray! {birthdayboy} is happy{change (MORALE,7)}, but {~they've used your supplies to bake and eat a really big cake {change (SUPPLIES,-1)}|they won't be in the morning...{change (MORALE,-5)}|someone has drunkenly punched a hole in a wall {change (HP,-5)}}.
+Ignore them.
{birthdayboy} and all their friends are very sad. {change (MORALE,-5)}
- + -> Top


== Drill_1 ==
Your drill churns ever onward, through miles of dirt and stone. You have a quiet evening to yourself. 
->lazytime
=lazytime
+[Enjoy the interlude]
{~You stretch, yawn, and lean back in your chair.|You flip through a book on philosophy|You read the hot new epic that's all the rage lately|You take a quick nap ->Dozing_off|Before you have time to relax...->tremor|It's nice to take some time off every now and then.|You enjoy exactly one jug of wine.|You chat briefly with some of your crew, but they don't have anything interesting to say.|You fiddle about with the latest steam-curiosity.|A fun time was had by all.|You study up on wyrms.|You read an exciting poem about a wyrmchaser. It's hardly accurate, but it is thrilling.}

+[Encourage the stokers]
    They tell you that they could increase the speed, but it'll ding the hull.
        ++[Make it so!]
        {change(HP,-10)}
        {change (SPEED,1)}
        They dutifully start shoveling fuel. 
        ++Nah, never mind
        -- +->Top

+[Gaze out the window]
{Dirt, rocks, dark.|Still dirt, rocks and dark.|Occasionally, dark rocks and dirt.|Sometimes there's even dirt.|No wyrms here.|Nothing to see here.|Wait, were those tracks? ->tracks|Looking out the window is always wildly exciting.|Nothing better than some window-looking.|Nice.}

- + ->Top

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
{greekname()} is worried about something: "{~{Birthday}It's not my birthday yet.|{weird_creaking}I don't like weird noises|{Drill_1.lazytime}I wish you'd stop slacking off|{Ration_trouble}I'm hungry again|{engine_malfunction}I don't want to be stuck here. Will we ever find the wyrm?|What do we even do when we find the wyrm?|What does a wyrm even look like?|Why are we doing this?}"
+[Reassure them]
All shall be well, and maybe all manner of thing too. {They're reassured, for now {change (MORALE,2)}|They aren't buying it {change (MORALE,-2)}}.
+[Yell at them]
What's their problem? You're the captain here, and you're doing fine; that's what matters. {Somehow, it works. {change (MORALE,4)}|They obviously aren't happy after that. {change (MORALE,-4)}}
+[Ignore them]
- + ->Top

==Dozing_off==
The constant whir of the drill feels almost restful. Nobody will mind if you just lie here for a moment...
+[Shake yourself awake]
    There's no time to dream!
+[Doze off]
Just close your eyes for a bit, it'll be fine ->Dreams
- + ->Top

==Dreams==
{~Burrowing{Tunnelling, tunnelling, tunnelling.| The dirt parts before you.|You pass through the soil like a fish in water.|The tracks you leave behind are a testament to your majesty.|You are strong, fast, invincible.|Rumbling, far off.|Protect the brood!|There has never been a {wormspecies()} greater than you.}|Lost{The endless bowels of the earth.|A twisting maze of many tunnels, all unalike.|You could wander here forever, 'til you}|Drill{Turn, rotate, spin.|}}

==Ration_trouble==
Running low on food.
- + ->Top

==engine_malfunction==
Engine making weird noises. 
- + ->Top

==tracks==
Not the wyrmtrack you're following. Or is it?
- + ->Top

==weird_creaking==
Noises, but not the usual noises.
- + ->Top

==tremor==
All the world atremble.
- + ->Top

==lost_trail==
You've lost sight of the wyrmtrack somewhere in all the dirt and darkness.
- + ->Top

==wallscrawl==
Someone's vandalised a wall.
- + ->Top

==airpocket==
Giant ol' gap full of nothing. What caused it?? drill's not built for this.

- + ->Top

==gasdanger==
Chief Aeoliphile warns you that you're running straight into a pocket of gas.

- + ->Top

==disagreement==
Two crew are very upset at each other.
- + ->Top

==sweltering==
The heat is getting to your crew.
- + ->Top