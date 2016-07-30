=== Top ===
VAR CREW = 10 // straightforward
VAR MORALE = 100 // straightforward
VAR DEPTH = 0 // deep depths, deep rewards
VAR SPEED = 2 // effected by drill power and depth
VAR HP = 100 // hull strength
VAR HEAT = 0 // danger counter
VAR SUPPLIES = 20 //generic fuel + food
VAR DIAMONDS = 0
VAR WYRMFLESH = 0
VAR PROXIMTY = 0 //100 = You're on it
VAR PLAYERNAME = ""
VAR WYRMNAME = ""
VAR WYRMDESC = ""
VAR SEENINTRO = 0

// {wormspecies()}
// {drill()}
// {DEPTH}
+ Intro -> Introduction
+ Mutiny -> Mutiny
+ Birthday -> Birthday
+ Drill -> Drill_1
+ Other Drill -> Drill_2
+ Dozing -> Dozing_off
+ Concerns -> Concerns
+ Other Other Drill -> Drill_3
+ Other Other Other Drill -> Drill_4
+ Rations -> Ration_trouble
+ tracks -> tracks
+ noises -> weird_creaking
+ tremor -> tremor
+ Wyrmcast -> Wyrmcast
+ lost_trail -> lost_trail
+ gasdanger -> gasdanger
+ Diamonds -> Diamonds
+ Shroom -> Shroom
+ Encampment -> Encampment




==function change(ref x, y)==
~x = x + y

==function set(ref x, y)==
~ x = y

==function drill()==
~DEPTH=1+DEPTH+SPEED
~SUPPLIES= SUPPLIES-1
~HEAT=1+(SPEED * 0.5) + HEAT
~HP = HP - (HEAT * 0.5)

==function greekname()==
~return "{~Percalus|Euphro|Phylace|Limnoreia|Megaera|Glyke|Ione|Medea|Scylla|Amatheia|Hermione|Ctimene|Milo|Astyocheia|Hecuba|Callianessa|Hermine|Megara|Dirce|Artemidora|Plutarch|Theophanes|Thyrsos|Pittacus|Copreus|Panaetius|Epimenes|Hermeros|Pigres|Apollodoros|Phineus|Agamedes|Oliatos|Peteos|Phaestus|Apisaon|Demonax|Dardanus|Aristogeiton|Asopodoros}"

==function wormspecies()==
~ return "{~Platyhelm|Cest|Acoelo|Nema|Tetra|Helm|Bilatere|Tentaculario|Diphyll|Mono|Turbella}{~inth|mate|ode|gene|ide|annelid|bothride|ozoa|aria}"

==function crewType()==
~ return "{~First Anthyposminagos|Spearman|Philosopher-Officer|Deck Hand|Second Navarchos|Stoker|Alchemist}"

==function wormdescription()==
 ~return "{~Red|White|Black|Orange|Bronze|Gold|Blue|Fanged|Slime|Parasitic|Dark|Bloody|Wyrm|Helm of the|}"
==Introduction==
~ PLAYERNAME = greekname()
~ WYRMNAME = wormspecies()
~ WYRMDESC = wormdescription()
You are Metic {PLAYERNAME}. You've been appointed captain of a scientific journey into the depths of the Earth; your mission, to find and study a Wyrm. Wyrms are dreadful beasts that thrive in the deep dark soil under the earth; you and your crew are prepared to do whatever it takes. Your reward; {~the endless gratitude of the philosopher-kings of Athens.|eternal fame and fortune.|the regard of high society.|a name in the legends.|your own personal seaside villa.|a mausoleum in the Field of the Wyrmchasers}
Your target is the {~fearsome|great|mighty|worrisome|dread|nightmare-inducing|creepy|oft-theorised, never found|legendary|mythic|sonnet-spoken|epic-inspiring|overhyped} {WYRMDESC} {WYRMNAME}. The deeper you dig, the more difficult things will get; but the closer you'll come to finding the wyrm.
{set (SEENINTRO,1)}
- + -> Top

=== Mutiny ===
Your crew are tired of being cooped up in this metal coffin. They say; "{~We miss the sun!|We miss the sky!|I miss my family!|I miss fresh cheese!|Wewant to go home!|We want to see my family again!|I'm sick of dealing with you!|We can't abide any more drilling!|The heat! The heat!!|I'm hungry!|I don't even like wyrms that much!|We're all going to die!}". A mutiny is brewing.
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
    - + [DRILL] ->Top

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
    - + [DRILL] ->Top

=== Birthday ===
~temp birthdayboy = greekname()
It's {birthdayboy}'s birthday today! {|It's considered lucky to have two birthdays in one voyage.|Three must be even luckier.|Four birthdays is a bit much.|Five in one trip? What?|Six???|Seven??????????|Eight? This is a bit daft.|The crew are definitely trying to pull something here.}
+Throw them a party.
    Hooray! {birthdayboy} is happy{change (MORALE,7)}, but {~they've used your supplies to bake and eat a really big cake {change (SUPPLIES,-1)}|they won't be in the morning...{change (MORALE,-5)}|someone has drunkenly punched a hole in a wall {change (HP,-5)}}.
+Ignore them.
{birthdayboy} and all their friends are very sad. {change (MORALE,-5)}
    - + [DRILL] -> Top


== Drill_1 ==
Your drill churns ever onward, through miles of dirt and stone. You have a quiet evening to yourself. 
->lazytime
=lazytime
+[Enjoy the interlude]
{~You stretch, yawn, and lean back in your chair.|You flip through a book on philosophy|You read the hot new epic that's all the rage lately|You take a quick nap ->Dozing_off|Before you have time to relax...->tremor|It's nice to take some time off every now and then.|You enjoy exactly one jug of wine.|You chat briefly with some of your crew, but they don't have anything interesting to say.|You fiddle about with the latest steam-curiosity.|A fun time was had by all.|You study up on wyrms.|You read an exciting poem about a wyrmchaser. It's hardly accurate, but it is thrilling.}

+[Encourage the stokers]
    They tell you that they could increase the speed, but it'll ding the hull.
        + +[Make it so!]
        {change(HP,-10)}
        {change (SPEED,1)}
        They dutifully start shoveling fuel. 
        + + Nah, never mind
        - - + + [DRILL] ->Top

+[Gaze out the window]
{Dirt, rocks, dark.|Still dirt, rocks and dark.|Occasionally, dark rocks and dirt.|Sometimes there's even dirt.|No wyrms here.|Nothing to see here.|Wait, were those tracks? ->tracks|Looking out the window is always wildly exciting.|Nothing better than some window-looking.|Nice.}
- + [DRILL] ->Top


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
~temp CREWTYPE = crewType()
//{~OFFICER|SOLDIER|SCIENTIST|CREW|NAVIGATOR|OTHER|ENGINEER}

{CREWTYPE} {greekname()} comes to your office {~slouching against a wall|wringing their hands|far too early for this sort of thing}; "{I can't sleep, see, with all the noise, so I've been thinking...|Cap, us and the boys have been talking|I've had a word with the {crewType()}, see...}" they say "{-HEAT > 10:Reckon the hull can't take much more of this heat. We need to find a way to cool it, and fast.|What are we going to do when we find this wyrm?}"
+[Reassure them]
"All shall be well, and maybe all manner of thing too!" {With that, they're reassured. For now. {change (MORALE,2)}|... But they aren't buying it. {change (MORALE,-2)}}
+[Yell at them]
Must you do everything on this damn digger!? You're the captain here, and you're doing fine; that's what matters. {~Somehow, it works. The {CREWTYPE} slinks away. {change (MORALE,4)}|All nods and humble mutterings, but the {CREWTYPE} isn't one to forget this kind of thing. {change (MORALE,-4)}}
+[Ignore them]
Not your problem. {There's an Officer for this kind of thing; usually is, anyway.{change (MORALE,1)}|The worry stays etched on their face as they rush back out.{change (MORALE,-1)}}
- + [DRILL] ->Top


==Dozing_off==
The constant whir of the drill feels almost restful. Nobody will mind if you just lie here for a moment...
+[Shake yourself awake]
    There's no time to dream!
+[Doze off]
Just close your eyes for a bit, it'll be fine. 
->Dreams
    - + [DRILL]->Top

==Dreams==
{~{Tunnelling, tunnelling, tunnelling.| The dirt parts before you.| You pass through the soil like a fish in water.| The tracks you leave behind are a testament to your majesty.| You are strong, fast, invincible.| Rumbling, far off.| Protect the brood!| There has never been a {wormspecies()} greater than you.}|{ The endless bowels of the earth.| A twisting maze of many tunnels, all unalike.| You could wander here forever.| You may never return home.| What way are you going?| What way is up?| What way is home?| Where is the sky?}|{Turn, rotate, spin.| Carving your own path| Spiraling inwards, towards a definite point, eternally.| The wide becomes thin, becomes wide again.| Pierce the vault of the earth.|Your body is a stair; your head, a spear.| Guide them forward.| A drill for them all.}}
+Doze on
->Dreams
+[Wake up!]
You sit upright; can't sleep, you have work to do!
 -   + [DRILL] ->Top

==Ration_trouble==
Your crew are concerned that they're going to starve before they ever catch sight of a wyrm.
+ [Extra rations]
    ! They'll be happy, but soon they'll be hungry. {change(SUPPLIES,-1)} {change (MORALE,2)}
+ [Ignore them]
    Can't do much about it this far underground. {change (MORALE,-4)}
    - + [DRILL] ->Top


==tracks==
Your scouts have reported something at the fringes of the drill-lights; something like a wyrmtrack. Not the track you're following... probably.
+[Divert course!]
    Maybe it'll be something interesting; maybe you'd been drifting off course the whole time. {{change (SPEED,1)}|{change (SPEED,-1)}|{change (DEPTH,5)}|{change (DEPTH,-5)}}
+[Ignore it.]
    You remain resolutely stuck to your current path.
- + [DRILL] ->Top

==weird_creaking==
Noises: {~Creaking.|Scraping.|Scratching|An ominous ululating noise.|A rasp of metal.|Something like skin rubbing against silk.|Squealing?|The sound... of a wyrm?}
The crew are a bit nervous {change (MORALE,-2)}
- + [DRILL] ->Top

==tremor==
The world shakes! {~A passing wyrm?|An angry god?|Engine failure?|Too much wine?} Whatever the case, your wyrmdigger isn't in good shape. {change (HP,-10)}
- + [DRILL] ->Top

==lost_trail==
You've lost sight of the wyrmtrack somewhere in all the dirt and darkness.
+[Redirect course]
{Maybe it'll help, maybe not. {{change (SPEED,1)}|{change (SPEED,-1)}|{change (DEPTH,5)}|{change (DEPTH,-5)}}|You can see something, just about. ->tracks}
+[Soldier on]
If you keep going down, you'll find it eventually. {{change (SPEED,1)}|{change (SPEED,-1)}|{change (DEPTH,5)}|{change (DEPTH,-5)}}

- + [DRILL] ->Top


==gasdanger==
Chief Aeoliphile warns you that you're running straight into a pocket of gas.
+[Redirect]
Not worth the risk.{{change (SPEED,1)}|{change (SPEED,-1)}|{change (DEPTH,5)}|{change (DEPTH,-5)}}
+[Plow on through]
{You emerge unscathed on the other side {change (SPEED,1)}|Everything explodes! You survive but only just about. {change (HP,-25)}}
- + [DRILL] ->Top

==sweltering==
The heat is getting to your crew. {change (MORALE,-3)}

- + [DRILL] ->Top

==Diamonds==
A vein of shiny diamonds. {greekname()} greedily eyes them up in the lamplight.
+[Collect them]
Your crew is happy! But now you're slower. {change (MORALE,5)} {change (DIAMONDS,1)}
+[Go past them]
The crew is sad but you make progress. {change (MORALE,-5)} {change (DEPTH,10)}
- + [DRILL] -> Top

==Wyrmcast==
The wyrm has passed through here, shedding its skin as it passed. A slimy, sinuous cast of wyrmflesh lies in the way of your drill.
+[Use the beak-shards to sharpen the drill]
    The wyrm once used this beak to cut through the earth; now you'll do it in its stead. {change (SPEED, 2)}
+[Use the moult to harden the hull]
    Its segmented flesh is harder than boiled leather, perfectly adapted to the stresses of the deep earth. {change (HP, 25)}
+[Gather its innards for supplies.]
    They pay well for this meat in Athens; your crew should consider themselves fortunate. {change (SUPPLIES, 10)} {change (WYRMFLESH, 2)}
- + [DRILL] -> Top

==Shroom==
A small cavern with flourishing mushroom-life.
+[Use the stems to patch up your hull]
Not the most solid material on or under the earth, but it'll hold things together for a while {change (HP, 10)}
+[Take the caps for supplies]
Mushroom-flesh is woody and unappetising, but it provides enough sustenance for now. {change (SUPPLIES, 5)}
- + [DRILL] -> Top

==Encampment==
Some explorers have set up shop here; they have tools and supplies you could use.
+[Barter for supplies]
You offer them {~some surface-trinkets|a few poems|some manuscripts} for food. They only have old cans and some unappetising mushrooms, but it'll keep you going. {change (SUPPLIES, 3)}
+[Barter for repairs]
You swap {~some surface-trinkets|a few poems|some manuscripts} for materials. {change (HP,10)}
+{DIAMONDS>0} [Offer them diamonds]
    They shower you with gifts! Most of them aren't terribly useful, but you manage to gather some supplies and material for the hull. Getting rid of the diamonds lightened your load, too.
    {change (SUPPLIES,8)} {change (HP,20)} {change (DIAMONDS,-1)} {change (SPEED,1)}
    - + [DRILL] -> Top
