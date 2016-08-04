===Introduction===
~ PLAYERNAME = greekname()
~ WYRMNAME = wormspecies()
~ WYRMDESC = wormdescription()
You are Metic {PLAYERNAME}. You've been appointed captain of a scientific journey into the depths of the Earth; your mission, to find and study a Wyrm. Wyrms are dreadful beasts that thrive in the deep dark soil under the earth; you and your crew are prepared to do whatever it takes. Your reward; {~the endless gratitude of the philosopher-kings of Athens.|eternal fame and fortune.|the regard of high society.|a name in the legends.|your own personal seaside villa.|a mausoleum in the Field of the Wyrmchasers} Your target is the {~fearsome|great|mighty|worrisome|dread|nightmare-inducing|creepy|oft-theorised, never found|legendary|mythic|sonnet-spoken|epic-inspiring|overhyped} {WYRMDESC} {WYRMNAME}. The deeper you dig, the more difficult things will get; but the closer you'll come to finding the wyrm.{set (SEENINTRO,1)}
- + [DRILL] -> Top

=== Top ===
VAR DEPTH = 0
VAR CREW = 100
VAR TRAIL = 0
VAR HEAT = 0
VAR PLAYERNAME = ""
VAR WYRMNAME = ""
VAR WYRMDESC = ""
VAR SEENINTRO = 0
VAR SEENWORM = 0

// {wormspecies()}
// {drill()}
+ Officer -> Officer
+ {CREW < 50}{CREW > 0}{HEAT < 99}{DEPTH < 99} Mutiny -> Mutiny
+ {TRAIL > 60}{not WyrmGlimpse}{CREW > 0}{HEAT < 99}{DEPTH < 99} There! There! -> WyrmGlimpse
+ {TRAIL < 99}{CREW > 0}{HEAT < 99}{DEPTH < 99} The Wyrm -> WyrmRunin
+ {DEPTH > 25}{CREW > 0}{HEAT < 99}{DEPTH < 99} A Party! -> Birthday
+ {DEPTH < 25}{CREW > 0}{HEAT < 99}{DEPTH < 99} Ever Deeper -> Drill_1
+ {DEPTH > 25}{DEPTH < 50}{CREW > 0}{HEAT < 99}{DEPTH < 99} Ever Warmer -> Drill_2
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}Downwards -> Dozing_off
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {CREW < 75} A Knock -> Concerns
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {DEPTH > 51} {DEPTH < 75} Deeper Still -> Drill_3
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {DEPTH > 76} Onwards -> Drill_4
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {CREW < 65} Biscuits Again -> Ration_trouble
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} Rumbling On -> tracks
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} A Creak -> weird_creaking
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} A Bang! -> tremor
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {DEPTH > 60} Wyrmcast! -> Wyrmcast
+ {CREW > 0}{HEAT < 99}{DEPTH < 99} {DEPTH > 10} Lost -> lost_trail
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}{DEPTH > 60} Gas! Gas! -> gasdanger
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}{DEPTH > 60} Diamonds! -> Diamonds
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}{DEPTH > 40} Mushrooms -> Shroom
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}{DEPTH > 50} The Deep-Cave -> Encampment
+ {CREW > 0}{HEAT < 99}{DEPTH < 99}{HEAT > 60} The Heat -> sweltering
+ {DEPTH > 99} Dug Too Deep -> DepthFailure
+ {HEAT > 99} Structural Integrity -> HeatFailure
+ {CREW<1} The Pit-Madness -> CrewFailure



==function change(ref x, y)==
~x = x + y

==function set(ref x, y)==
~ x = y

==function drill()==
~DEPTH=1+DEPTH+TRAIL

==function greekname()==
~return "{~Percalus|Euphro|Phylace|Limnoreia|Megaera|Glyke|Ione|Medea|Scylla|Amatheia|Hermione|Ctimene|Milo|Astyocheia|Hecuba|Callianessa|Hermine|Megara|Dirce|Artemidora|Plutarch|Theophanes|Thyrsos|Pittacus|Copreus|Panaetius|Epimenes|Hermeros|Pigres|Apollodoros|Phineus|Agamedes|Oliatos|Peteos|Phaestus|Apisaon|Demonax|Dardanus|Aristogeiton|Asopodoros}"

==function wormspecies()==
~ return "{~Platyhelm|Cest|Acoelo|Nema|Tetra|Helm|Bilatere|Tentaculario|Diphyll|Mono|Turbella|Scolex|Anax|Anatarax|Amaterax|Annel|Hel}{~inth|mate|ode|gene|ide|annelid|bothride|ozoa|aria|an|phile|phobe|tode|irate}"

==function crewType()==
~ return "{~First Anthyposminagos|Spearman|Philosopher-Officer|Deck Hand|Second Navarchos|Stoker|Alchemist}"

==function wormdescription()==
 ~return "{~Red|White|Invariegated|Slithering|Deep-Dwelling|Homeric|Aristotlean|Platonic|Hermetic|Aeoliphilic|Black|Orange|Bronze|Gold|Blue|Fanged|Slime|Parasitic|Dark|Bloody|Wyrm|Helm of the|}"
 
 
=== Officer ===
You sit on deck, at the very top of the Wyrmdigger. Second Metic {greekname()} suggests you call for an officer's report.  
+ Get a Sound Report from the Oread -> Oread
+ Check in with the Quartermaster -> Quartermaster
+ Ask the Pedon of the crew and Digger -> Pedon
+ Consult the Chief Aeolikos -> Aeolikos


//DEPTH & TRAIL
//Listening person
= Oread
The Oread is suspended above you, strapped into {InterviewOread.Cithaeron: the Cithaeron|what looks like a giant, exploded golden clock}, eyes closed, {~hands massaging two foot long metal bars|bare feet on a long, curved tube|fingers dancing against a vibrating set of tuning forks|one finger to her lips, another skipping on a spinning sphere}. "Little busy, Metic. Can I help?"
-> InterviewOread

= InterviewOread
+ (Talent) {InterviewOread.Cithaeron == 3}{InterviewOread.Talent < 2} Can I have a go?
    {She pauses for a beat, shocked, then roars with laughter. Worried crew turn to watch. "Sure! Sure! Go for it!" You strap in. She talks you free it and you... Feel. Feel for changes, movement, the lack of movement. A chrous of rock. A solo of water. A harmony of gas. Your feet for bass, your hands for tenor. It's not an experience for words. She grins broadly. "Nice. Come back anytime, Chief. Then we can really sing."|"Sorry Chief, not today. Limestone interference. Another time."}
    ++ DRILL -> Top
    
+ (Report) Sound report, please, Oread!
    She doesn't turn away from her work. {
        - DEPTH < 20: "Barely into the Crust. Skimming soil  
        - DEPTH < 40:  "Full Crust, Metic. On full tilt
        - DEPTH < 60:  "Upper Lithosphere. Picking up a fair amount
        - DEPTH < 80: "Lower Lithosphere." Her eyes are clenched tight "Lot of interference down here
        - else: Her face is gaunt. Etched with sweat. "Mantle. So low. I can't tell what's what
    }<>{
        - TRAIL < 20: ." She looks bored. "Cithaeron's got nothing. Rocks. Soil. Ruins. Soil." 
        - TRAIL < 40: ..." Her ear is against a metal tube. "Something... Maybe volcanic. Unsure."
        - TRAIL < 60: . I hear it, though. Wyrm-noise. Faint, rhythmic, close." She puts up her hand to ward you off.
        - TRAIL < 80: , yet here it is. The Wyrm. We're close. So close. I can feel it. All around us."
        - else: \-" She screws her eyes up in pain, "The pain! By Zeus... here! Outside, it's-" She bites off her words and clamps her hands over her ears. The machinery is vibrating. The Wyrmdigger is vibrating. You are vibrating.
    }
    ++ Understood -> InterviewOread
    
    // - + Increase Depth
    //     ~change(DEPTH,20)
    //     -> Report
    // -- + Decrease Depth
    //     ~change(DEPTH,-20)
    //     -> Report
    // -- + Increase Trail
    //     ~change(TRAIL,20)
    //     -> Report
    // -- + Decrease Trail
    //     ~change(TRAIL,-20)
    //     -> Report
    
+ (Cithaeron) {InterviewOread.Cithaeron < 3} Can you explain this machinery?
    {!"The Cithaeron. Where I listen."|"The Cithaeron. Like I said."|She opens her eyes for the first time, and leans down to you. Her eyes are green, like emeralds. "Bacchae-Thebian Cithaeron Nexus. System of reverberators.  Picks up on escaping Nerve Branches. From Arterial Steam Tributaries. Stuff happens outside. They pick it up. It comes back. And. I. Listen. To. It." She punctuates each word with a fist, punching a metal bar that rings dully with each strike. "It's! Called! The! Cithaeron!" She stares at you, teeth bared.}
    -> InterviewOread
    ++ Best be off... -> Officer

+ Back to Drilling.
    She nods, and turns away. The humming continues, after you walk away
    ++ DRILL -> Top 




//TRAIL & HEAT
//Think big tough engineering bloke. Speed and Hull.
= Aeolikos
The Chief Aeolikos is down in the bowels of the Wyrmdigger, close to the drill. You have to communicate by Hermetic pipe message.
-> InterviewAeolikos

= InterviewAeolikos
+ (Report) You type; "How is all in engines STOP"
    You unfurl the message; "SPED {
        - TRAIL < 20: slow moving 0 to 20. ok but trying to sped up stokers. to slow 
        - TRAIL < 40: half tilt, not quit 40. ok could b beter but good. to many rocks
        - TRAIL < 60: boiler is well moving fasterly. nerly 60. fast ish
        - TRAIL < 80: over 80 is good full tilt, full power that is. stoker flat out
        - else: "VERY FAS near top speed. 100!!!! is good. prefect 
    } STOP <> PRESSURE {
        - HEAT < 20: almos cold lots of water. keepin cool how u r also cool (joke)
        - HEAT < 40: startin to build have used steam releses. might get warmer
        - HEAT < 60: getting danggerous canot contain. very warm. hope u are ok
        - HEAT < 80: high. water low. getting crit- critic- cri- bad. losing control
        - else: have sealed boiler. vents dont work. men died. must stop. too hot. is bad. trapped. the heat is
    } STOP"<> {HEAT > 80: The piece of paper is charred all over. The capsule is red hot. The pipe itself, bent in the heat. They could be dead. The scroll slips from your sweat-slicked hands|{~The tube is filthy, covered in grime. Dirty fingerprints are all over the scroll|Enclosed in the capusle was two hefting pieces of coal. This explains the return delay|The edges of the paper are stained. They've tried spelling 'SPEED' three or four times on this one}}.
    ++ Understood. -> InterviewOread
    
    //     - + Increase H
    //     ~change(HEAT,20)
    //     -> Report
    // -- + Decrease H
    //     ~change(HEAT,-20)
    //     -> Report
    // -- + Increase Trail
    //     ~change(TRAIL,20)
    //     -> Report
    // -- + Decrease Trail
    //     ~change(TRAIL,-20)
    //     -> Report
    
+ {HEAT < 80} {InterviewAeolikosTour == 0} Request to tour the Engines.
    "have u been in a digger engines before? pleas be honest" the return message reads.
    ++ You lie - Of course!
    He replies, naming 'heat' and 'bad condisions' as excuses why you couldn't possibly visit. Even through the grammatical errors, you sense this isn't the truth. 
    ++ You're honest - I haven't, I'm afraid. -> InterviewAeolikosTourIntro
  
+ (Talent){InterviewAeolikosTour == 1} Send down poetry.
    You send down a thin volume from the Digger's library "much apprecited! will remember this. thank"
    -> InterviewAeolikos
    
+ Back to Drilling.
    "k" says the message. A person of many words.
    - + DRILL -> Top
    
= Tour
"Gud!" says the return message. "Honesty is best policy. Is danggerous here and need that." You descend down, through the levels. The corridors get lower, the staircases turn to ladders. You squeeze through the emergency seal and step out into light and heat. A great room, larger even than the deck, and spinning at its core - The Aeolipile. Silhouetted against the blaze is the Chief Aeolikos, arms outstretched, "A pleasure to finally meet you, Metic!"
+ Talk to the Aeolikos
    You talk of the Aeolipile, pressure controls, steam driving, the gear shaft for the driller. He is really rather erudite, and admits to having once been a Metic. "My writing impediment meant I could only go so far. Besides, this is my real passion." He beams ear to ear.
+ Talk to the Aeolikos

= InterviewAeolikosTourIntro
"Gud! Honesty is best policy. Is danggerous here and need truth." You descend down, through the levels. The corridors get lower, the staircases turn to ladders. 
+ Step out into the light and heat. -> InterviewAeolikosTour

=InterviewAeolikosTour
The Aeolipile spins on. Stokers work furiously, shirtless muscles glistening. {Sillouted against the blaze is the Chief Aeolikos, arms outstretched, "Metic! A pleasure!"|"Where next?" grins the Aeolikos}
* {InterviewAeolikosTour.heat > 0} Continue... Down... Where... 
    Your head swims. The heat, ever present, becomes too much. The Chief Aeolikos grabs your arm firmly "Easy now. Let's get back. You've done better than most. Better than I did. Come down again sometime. I appreciated it. Send me poetry. I miss poetry, down here." 
    ++ You come around, back on deck -> Officer
* {InterviewAeolikosTour.heat < 1}Talk to the Aeolikos
    You talk of the Aeolipile, pressure controls, steam driving, the gear shaft for the driller. They are really rather erudite, even admitting to once having been an Second Metic themselves. "My unfortunate writing impedement meant I could only go so far. Besides, this is my real passion." They beam ear to ear. 
    ++ (heat) Weather the heat -> InterviewAeolikosTour
+ {InterviewAeolikosTour.heat < 1}Examine the Aeolipile
    A ten foot sphere of spinning bronze, blowing white hot. "Quite impressive, no?" asks the Chief Aeolikos. "I built it myself. It's a hybrid - The Makedonians build great Male steam engines, the Athenians Female. This is something altogether different. Special." They grin that broad grin. "Much like you and I, eh, Metic?"
    ++ (heat) Weather the heat -> InterviewAeolikosTour




//HEAT & MORALE
= Quartermaster
"Welcome!" The Quartermaster is a well built, bearded gentlemen. He exhales lurid blue pipesmoke. He's smiling; he's usually smiling. "Come in Metic! Come sit. Drink?" His eyes are two different colours; {Oread: Didn't the Oread have something strange with her eyes too?|It's really rather distracting.} {InterviewOread.Talent: This |Was not}
-> InterviewQuartermaster

= InterviewQuartermaster
+ How goes the mission?
    {
        - HEAT < 20: His fingers drum the desk. "We're comfortable enough, considering."
        - HEAT < 40: One finger taps the desk. "I'm getting warm, I must say. Nothing unbearable, though."
        - HEAT < 60: He crossed his arms. "Something needs to be done about this heat.
        - HEAT < 80: He fans himself with his pipe. "This heat is getting too much, I must say."
        - else: His face is glistening. His eyes are just a bit wild. "Hot, Metis. Very hot."
    }<>{
        - CREW < 20: ." She looks bored. "Cithaeron's got nothing. Rocks. Soil. Ruins. Soil." 
        - CREW < 40: ..." Her ear is against a metal tube. "Something... Maybe volcanic. Unsure."
        - CREW < 60: . I hear it, though. Wyrm-noise. Faint, rythmic, close." She puts up her hand to ward you off.
        - CREW < 80: , yet here it is. The Wyrm. We're close. So close. I can feel it. All around us."
        - else: \-" She screws her eyes up in pain, "The pain! By Zeus... Here! Outside, it's-" She bites off her words and clamps her hands over her ears. The machinery is vibrating. The Wyrmdigger is vibrating. You are vibrating.
    }
    
        // - + Increase Depth
    //     ~change(DEPTH,20)
    //     -> Report
    // -- + Decrease Depth
    //     ~change(DEPTH,-20)
    //     -> Report
    // -- + Increase Trail
    //     ~change(TRAIL,20)
    //     -> Report
    // -- + Decrease Trail
    //     ~change(TRAIL,-20)
    //     -> Report
    ++ Understood -> InterviewQuartermaster
+ Other option.
    -> InterviewQuartermaster
+ Back to Dilling.
    The Quartermaster grins, before diving back into a ledger.
    ++ DRILL -> Top




//MORALE & DEPTH
= Pedon
{The Pedon is not what you expect. You imagined a similarly minded Metic, a tall, older gentleman of great beard and wisdom. Instead the Metic is |The Metic today is, as always, }impossibly youthful, boiling over with frenetic energy. The lad steps up with a quick, slightly askew salute.
-> InterviewPedon

= InterviewPedon
+ (Report)Report!
    A rush of words; {
        - CREW < 20: "I've gathered what men we have left!" His hand trembles "One last push!
        - CREW < 40: "That last sortie was..." His face contorts "The crew took it bad. We'll pull through!
        - CREW < 60:  "We're down a crewperson or two!" He fidgets, "Poor {greekname()}. Working hard, though!
        - CREW < 80: "Still in fine spirits! Nothing we've not handle before, I guess!
        - else: "Doing good! That is, the crew are, Metic! All in one piece! 
    }<> {
        - DEPTH < 20: Easy driving, though! Piloting, that is, or Pedoning, I guess. Or... Anyway, not that deep, yet!"
        - DEPTH < 40: She's straining, Metic, but there's much more in her! Barely into hard rock yet!"
        - DEPTH < 60: The Wyrmdigger is grand. In her element! Nothing can stop her!"
        - DEPTH < 80: But we are so, so deep. I've never been..." He trails off, looking away.
        - else: "Our depth is... Is..." He locks eyes with you. There is a fire in there. A glint of something wild and wondrous and wrong. "Deep. So deep. Deeper than anyone has ever gone." He smiles, a huge, wild grin showing many, many teeth.
    }
    ++ Understood. -> InterviewPedon

+ Talk to the Pedon {Dreams < 2: about Dreams}
    You grab the Pedon just before turning in for the night. {
    - Dreams < 1: He's a little shy at first, but opens up with a drink or two. He's very interested in dreams, for some reason. "Have you had any? Any dreams about Wyrms?". You're more interested in his understanding of Wyrm biology, which seems solid, but the topic bores him.
    - Dreams < 2: You come rushing back. He grins that broad, broad grin. "We're all having them now." he says, "All of us, and more every day. I think {greekname()}, you know, the {crewType()} that we couldn't wake up? He's got something to do with it." You feel a creeping sensation. Fear?
    - Dreams < 3: The Pedon is smiling even wider as you rush to him with a stack of your own dream notes. "The food!" he says. "It's the food! {crewType()} {greekname()} wasn't eating and his dreams, well, they stopped! Mystery solved! Panic over! Science prevails!" This does not help. You ask him if he's concerned; "Nonsense! All will be well! All will be well!" and with that he pushes you from the door. Perhaps the Pedon is more Metic than you, after all...
    - else: He laughs - "All will be well and all manner of things will be well. Once you know a thing, you cannot fear it. Fear is the mind killer, dontcha know!"
    }
    ++ I must go...
    The Pedon nods furiously. "I have notes to compile..."
    +++ DRILL -> Top
+ As you where.
    The Pedon saunters off, almost aimlessly.
    ++ DRILL -> Top
 


=== Mutiny ===
Your crew are tired of being cooped up in this metal coffin. "{~We miss the sun!|We miss the sky!|I miss my family!|I miss fresh cheese!|We want to go home!|We want to see my family again!|I'm sick of dealing with you!|We can't abide any more drilling!|The heat! The heat!!|I'm hungry!|I don't even like wyrms that much!|We're all going to die!}" they shout. A mutiny is brewing.
+{not Rebellion}Try to talk them around{|| again}. -> Diplomacy
+{not Diplomacy}Inspire loyalty through force{|| again}. -> Rebellion

=Diplomacy
Diplomacy never hurt anyone; but it takes time, time, precious time, while all the while the heat of the earth seeps into your wyrmdigger.
*{Mutiny>0}[Engage them in debate.] 
    If we turn back now, what was the point of all this? Some of your crew mumble in agreement; but that argument isn't likely to work twice.
    ~change(HEAT,5)
*{Mutiny>1}[Put it to a vote]
    The atmosphere is nervous; no one person is entirely sure of their neighbour's convictions. In the end, the tie is broken by a single vote; yours.
    ~change(HEAT,10)
*{Mutiny>2}[Struggle, one last time, to persuade them.]
    You beg, you bargain, you plead; you're so close, now, so close! Giving up now would be folly! Eventually, after what feels like years of protest, you manage to bring them around; but this is your last chance. You'll never manage it again.
    ~change(HEAT,15)
*[] No matter how hard you try, it's impossible to put forward a reasonable argument. Any longer in this cradle of horrors and there'll be nothing left of you. You are swiftly deposed, and your crew start the long journey back to the surface. -> END
    - + [DRILL] ->Top

=Rebellion
Brutal, short and to the point; violence is the answer to many questions.
*{Mutiny>0}[Make a show of force.]
    Drawing your ceremonial sword, you make an example of the most racuous mutineer. The message is clear; the mutiny dies down, but your crew's loyalty is frayed.
    ~change(CREW,-10)
*{Mutiny>1}If it's war they want... Then it's a war they'll get. You gather your loyalists and bunker down. When the fighting stops, you're left standing; unfortunately, most of your crew isn't.
    ~change(CREW,-15)
*{Mutiny>2}[A last stand]
    Holing up in the captain's office, you fight and fight and fight. A few loyal souls remain to you, 'til the bitter end; when the mutiny has been broken, they're even fewer. You sustained a hefty wound in the fight; it's not lethal, but if things turn sour again, you won't be in any condition to protect yourself.
    ~change(CREW,-20)
*[] It's no good; your crew's loyalty is frayed, and you won't last a second in a fight. Give up, return to the surface. -> END
    - + [DRILL] ->Top

=== Birthday ===
~temp birthdayboy = greekname()
It's {birthdayboy}'s birthday today! {|It's considered lucky to have two birthdays in one voyage.|Three must be even luckier.|Four birthdays is a bit much.|Five in one trip? What?|Six???|Seven??????????|Eight? This is a bit daft.|The crew are definitely trying to pull something here.}
+Throw them a party.
    Hooray! {birthdayboy} is happy{change (CREW,10)}, but {~the next morning, you find that somebody drunkenly nudged you off course. You've spent the past few hours heading away from the worm! {change (TRAIL, -5)}|somebody got a bit too rowdy and damaged some of the hull. {change (HEAT, 5)}|when the hangover hits, they won't be. {change (CREW,-12)}|the wyrm probably isn't.|everybody was too busy partying to check on the drill, and you've dug deeper than you expected {change (DEPTH,10)}}
+Ignore them.
{birthdayboy} and all their friends are very sad. {change (CREW,-10)}
    - + [DRILL] -> Top


== Drill_1 ==
Your drill churns ever onward, through miles of dirt and stone. You have a quiet evening to yourself. 
->lazytime
=lazytime
+[Enjoy the interlude]
{~You stretch, yawn, and lean back in your chair.|You flip through a book on philosophy|You read the hot new epic that's all the rage lately|You take a quick nap ->Dozing_off|Before you have time to relax...->tremor|It's nice to take some time off every now and then.|You enjoy exactly one jug of wine.|You chat briefly with some of your crew, but they don't have anything interesting to say.|You fiddle about with the latest steam-curiosity.|A fun time was had by all.|You study up on wyrms.|You read an exciting poem about a wyrmchaser. It's hardly accurate, but it is thrilling.}

+[Encourage the stokers]
    They tell you that they could increase the speed, but it'll take its toll on the hull.
        + +[Make it so!]
        {change(HEAT,10)}
        {change (TRAIL,10)}
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

{CREWTYPE} {greekname()} comes to your office {~slouching against a wall|wringing their hands|far too early for this sort of thing}; "{~I can't sleep, see, with all the noise, so I've been thinking...|Cap, us and the boys have been talking|I've had a word with the {crewType()}, see...}" they say "{-HEAT > 10:Reckon the hull can't take much more of this heat. We need to find a way to cool it, and fast.|What are we going to do when we find this wyrm?}"
+[Reassure them]
"All shall be well, and maybe all manner of thing too!" {~With that, they're reassured. For now. {change (CREW,10)}|... But they aren't buying it. {change (CREW, -8)}}
+[Yell at them]
Must you do everything on this damn digger!? You're the captain here, and you're doing fine; that's what matters. {~Somehow, it works. The {CREWTYPE} slinks away. The next time you see them, they're working with renewed vigour. {change (CREW, 15)}|All nods and humble mutterings, but the {CREWTYPE} isn't one to forget this kind of thing. {change (CREW, -14)}}
+[Ignore them]
Not your problem. {~There's an Officer for this kind of thing; usually is, anyway.{change (CREW,5)}|The worry stays etched on their face as they rush back out.{change (CREW,-4)}}
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
{~{Tunnelling, tunnelling, tunnelling.| The dirt parts before you.| You pass through the soil like a fish in water.| The tracks you leave behind are a testament to your majesty.| You are strong, fast, invincible.| Rumbling, far off.| Protect the brood!| There has never been a {wormspecies()} greater than you.}|{The endless bowels of the earth.| A twisting maze of many tunnels, all unalike.| You could wander here forever.| You may never return home.| What way are you going?| What way is up?| What way is home?| Where is the sky?}|{Turn, rotate, spin.| Carving your own path| Spiraling inwards, towards a definite point, eternally.| The wide becomes thin, becomes wide again.| Pierce the vault of the earth.|Your body is a stair; your head, a spear.| Guide them forward.| A drill for them all.}}
+Doze on
->Dreams
+[Wake up!]
You sit upright; can't sleep, you have work to do!
 -   + [DRILL] ->Top

==Ration_trouble==
Your crew are concerned that they're going to starve before they ever catch sight of a wyrm.
+ [Extra rations]
   ??? maybe loss of trail {change (CREW, 5)}
+ [Ignore them]
    Can't do much about it this far underground. {change (CREW,-10)}
    - + [DRILL] ->Top


==tracks==
Your scouts have reported something at the fringes of the drill-lights; something like a wyrmtrack. Not the track you're following... probably.
+[Divert course!]
    Maybe it'll be something interesting; maybe you'd been drifting off course the whole time. {~{change (TRAIL,10)}|{change (TRAIL,-10)}|{change (DEPTH,10)}|{change (DEPTH,-10)}}
+[Ignore it.]
    You remain resolutely stuck to your current path.
- + [DRILL] ->Top

==weird_creaking==
The hull vibrates with it. {~A foul creaking noise.|A high pitched scraping.|Scratching, over and over...|An ominous ululating noise.|The rasp of metal. Not the hull?|Something like skin rubbing against silk?|Squealing? That can't be rocks...|Not the sound... of a wyrm?}. The crews eyes swivel as they finger weapons. {change (CREW,-5)}
- + [DRILL] ->Top

==tremor==
The world shakes! {~A passing wyrm?|An angry god?|Engine failure?|Too much wine?} Whatever the case, your wyrmdigger isn't in good shape. {change (HEAT,10)}
- + [DRILL] ->Top

==lost_trail==
You've lost sight of the wyrmtrack somewhere in all the dirt and darkness.
+[Redirect course]
{~Maybe it'll help, maybe not. {~{change (TRAIL,10)}|{change (TRAIL,-10)}|{change (DEPTH,10)}|{change (DEPTH,-10)}}|You can see something, just about. ->tracks}
+[Soldier on]
If you keep going down, you'll find it eventually. {~{change (TRAIL,10)}|{change (TRAIL,-10)}|{change (DEPTH,10)}|{change (DEPTH,-10)}}

- + [DRILL] ->Top


==gasdanger==
Chief Aeoliphile warns you that you're running straight into a pocket of gas.
+[Redirect]
Not worth the risk.{~{change (TRAIL,10)}|{change (TRAIL,-10)}|{change (DEPTH,10)}|{change (DEPTH,-10)}}
+[Plow on through]
{~You emerge unscathed on the other side. That was practically a shortcut; you've gained on the wyrm. {change (TRAIL,20)}|Everything explodes! You survive but only just about. The crew are almost as badly shaken as the engines. {change (HEAT,-25)} {change (CREW, -10)}}
- + [DRILL] ->Top

==sweltering==
It's hideously hot. {~You swear you saw {greekname()} drinking... something.|Fans just move the stifling air around in circles|There is no escape from it|It's impossible to sleep}. {change (CREW,-10)}
* [Divert for water] 
    {~A day's diversion finds an underground river; You refill the onboard Baths, but the wyrm has pressed on without you...{change(TRAIL,-15)}{change(HEAT,-10)}|A day of pointless drilling; You find nothing. The heat feels so much worse for that wasted effort {change(TRAIL,-5)}{change(HEAT,5)}}.
+ [Soldier on]
    {~The crew strip down to undergarments, and you join them. Hellenic spirit prevails!{change(CREW,15)} {change(HEAT,5)} |The crew clench their teeth and crack on, working tirelessly. The heat lingers. {change(CREW, -10)} {change(HEAT,10)}}

- + [DRILL] ->Top

==Diamonds==
A vein of shiny diamonds. {greekname()}'s eyes shine just as brightly in the lamplight. These aren't what you've come here for; but few among the crew can prevent their naked greed from showing.
+[Collect them]
A bonus even your crew can't complain at! Except for the Stoker, whose engines now groan under the extra weight... {change (CREW,10)} {change (TRAIL,-10)}
+[Drill on!]
Mutinous stares and grim faces, but you know the real prize awaits in the depths. {change (CREW,-5)} {change (TRAIL,10)}
- + [DRILL] -> Top

==Wyrmcast==
The wyrm has passed through here, shedding its skin as it passed. A slimy, sinuous cast of wyrmflesh lies in the way of your drill.
+[Use the beak-shards to sharpen the drill]
    The wyrm once used this beak to cut through the earth; now you'll do it in its stead. Wyrmdiggers are not so unlike the wyrms themselves. {change (TRAIL, 10)} {~|The hull wasn't built for the added friction, though. {change (HEAT, 10)}}
+[Use the moult to harden the hull]
    Its segmented flesh is harder than boiled leather, perfectly adapted to the stresses of the deep earth. {change (HEAT, -20)}{~|The extra weight's slowing you down, mind. {change (TRAIL,-15)}}
+[Gather its innards for supplies.]
    They pay well for this meat in Athens; your crew should consider themselves fortunate. Indeed, there's a giddy atmosphere in the air as the first wyrm-rations are served... {change (CREW, 20)} {~|Perhaps too giddy; the next day, you find that the drill has somehow inverted itself. {change (TRAIL, -10)} {change (DEPTH,-10)}}
- + [DRILL] -> Top

==Shroom==
A small cavern with flourishing mushroom-life.
+[Use the stems to patch up your hull]
Not the most solid material on or under the earth, but it'll hold things together for a while {change (HEAT, -10)}
+[Take the caps for supplies]
Mushroom-flesh is woody and unappetising, but it provides enough sustenance for now. Your crew aren't wildly enthusiastic about them, but food is food. {change (CREW, 5)}
- + [DRILL] -> Top

==Encampment==
Some explorers have set up shop here; they have tools and supplies you could use.
+[Barter for supplies]
You offer them {~some surface-trinkets|a few poems|some manuscripts} for food. {~They only have old cans and some unappetising mushrooms, but it'll keep you going. {change (CREW, 5)}|They have nothing for you.|They're pleased with what you've brought; you get a little more than you bargained for {change (CREW,10)}|You can't really afford their prices; one of the crew looks forlornly at a {~spear|urn|manuscript|block of cheese|birthday cake} as you leave {change (CREW,-5)}}
+[Barter for repairs]
You swap {~some surface-trinkets|a few poems|some manuscripts} for {~some useful materials. {change (HEAT,-10)}|nothing more than a few cans and bits of string {change (HEAT,-5)}|absolutely nothing of value.|some wood which seems sturdy, but falls to bits after a few moments of drilling {change (HEAT,5)}}
/*+{DIAMONDS>0} [Offer them diamonds]
    They shower you with gifts! Most of them aren't terribly useful, but you manage to gather some supplies and material for the hull. Getting rid of the diamonds lightened your load, too.
    {change (CREW,10)} {change (HEAT,-20)} {change (TRAIL,10)}*/
    - + [DRILL] -> Top
    
==WyrmGlimpse==
Shouting from the observation deck! There've been sightings of something pale and undulating, just beyond the drill's tip. Could it be the {WYRMDESC} {WYRMNAME} you've been hunting?
+[Charge onwards recklessly!]
    This is it! This is what you've been looking for! You whip the stokers up into a frenzy (not literally, of course), and the wyrmdigger lurches forward, scraping along the tunnel walls. {change (TRAIL,5)} {change (HEAT,5)}
+[Cautiously advance]
    You've come this far; no need to throw it all away at the final hurdle. Slowly, steadily, your drill weaves its way into the wyrm's tunnel.
-    ->Glimpse2
=Glimpse2
Your drill cracks through the levee of the wyrm's tunnel. Piercing the layer of the wyrm's tunnel takes time; slowly, slowly, slowly but surely, you ease your way into the great beast's tunnel.
+[Ready...]
You have your notepad ready. Steel yourself. ->Toolate

=Toolate
The drill pierces the thick levee of soil the wyrm disturbed. But too slow, too little, too late! You arrive only in time to see the wyrm insinuating itself further and further into the earth. But you have it now; wyrms find the vibrations of the drill impossibly enticing. It'll dance around you like a moth around a flame; and when it comes, you'll be ready.
+[Exhale that breath you've been holding.]
- + [DRILL] ->Top

==WyrmRunin
{set (SEENWORM,1)}
A rumbling from above! "It's {WYRMDESC} {WYRMNAME}!", the shout comes up. The wyrm has pierced your tunnel; this is the best chance you're going to have to get up close and personal. But what will you do with the wyrm when you reach it?
+[Complete your mission: Study the wyrm for science] You've been given a task, and you intend to complete it; even if it seems mundane.  ->WyrmChaseScience
+[Ignore that: Ramming speed!] Killing a wyrm has a glory of its very own. Turn your wyrmdigger to face the beast head-on. ->WyrmChaseMurder

==WyrmChaseScience
Hand your notebook to a scribe; it'll be easier if you can dedicate all your focus to {WYRMDESC} {WYRMNAME}.
+[Note down what you're seeing] Head-on accounts of wyrms like this are rare. You manage to bark out half a description of {~its peristaltic gyrations|its birdlike maw|its crennelated sides|its vicious tentrils}, but it sweeps upon you with terrible speed! This is the best view of a wyrm you're ever going to get! ->ScienceEnding
+Enough![] The wyrm is right there! It's time to flee, before there's nothing left of you.
->LoserEnding

==WyrmChaseMurder
Charge! Your drill takes time to align, but the wyrm's still some distance away. You ready a battlecry: "{Down with wyrms!|Death to {WYRMNAME}|For science!|For Athens!|For {PLAYERNAME}!|For {greekname()}!}". It's not very good, but you're only a scientist. The wyrm's great maw descends upon you, and everything turns black. ->MurderEnding
+ Enough![] Face a Wyrm in single combat? You? You're a scientist, not a warrior! ->LoserEnding

==ScienceEnding
The inside of a Wyrm! Nobody has ever been inside a wyrm and survived before! This is, as it turns out, for good reason. Your drill is crushed and crumpled to nothing by the wyrm's great digestion. On the bright side, if anyone ever manages to find your mangled wyrmdigger, they'll find the most comprehensive account of a wyrm's bowels on or under the earth. -> END

==MurderEnding
Cackling maniacally, your driller rockets towards the {WYRMDESC} {WYRMNAME}, powered by Alexandria's finest engines. Few wyrmchasers have ever fought a wyrm and survived; for good reason, as it turns out. The inside of a wyrm is terribly hostile towards anything that isn't a wyrm, and your wyrmdriller certainly wasn't built for it. A swarm of tiny parasitic {wormspecies()}'s lunge for your driller, burrowing into every crack and crevice of your ship. You hear {crewType()} {greekname()} scream; then you, too, are beset by wyrms. Somehow, your foolish endeavour actually ended well. Your driller managed to stumble forward and pierce the wyrm's tiny brain, ending its life instantly. Some day, someone may find the husk of the wyrm; and your drill, crewed by skeletons. ->END

==LoserEnding
Your nerve doesn't hold; you flee from the wyrm before it falls upon you with all its slithering might. The surface is far, far, far away, and your crew is scattered or dazed or half-dead. Eventually, your drill shudders to a halt; the sane and stable among you, few though you are, manage to crawl through a tunnel into a fungal cavern. You live out the rest of your days there, and never see the sun again. It's not a good life; you wonder what you might have gained, if you had managed to steel yourself just a moment longer. ->END

==HeatFailure
Fires are starting to break out across the wyrmdigger. Your crew are collapsing like sandcastles in wind. You're standing in a puddle of sweat larger than some oceans. Unless you do something soon, that puddle will be all that's left of you.
* Head fror the Cithaerthingy-whatsit
If you can't stand the heat, get out of the kitchen. If you can't stand the ever-present crushing warmth of the depths of the earth, get out of the warm bits of the depths of the earth. With the Oread's help, you can find a reprieve; you just need to find it hidden in the vibrations. Carefully, cautiously, listening with the care of an inexperienced cat-burglar, you guide the driller towards your salvation. A lake! Hidden underground, a pocket of water, exactly what you need to cool off a burning piece of machinery. The drill isn't designed for underwater transit, of course, so you can't do much but wait uncomfortably for the water to drain off. It's saved you for now; but if things get worse again, there'll be no hope. No other lakes to be had. {change (HEAT, -10)}
++ [DRILL] ->Top
*->HeatEnding

==HeatEnding
Despite the desperate, panicked efforts of your crew and officers, there's nothing you can do to prevent your drill, your shell, the barrier between you and the endless depths of the earth, from coming to pieces. Without a drill you are nothing more than tiny, tiny specks, in a land which is not your own, helplessly wandering to their end. ->END


==DepthFailure
Too deep! Your whole hull starts creaking and moaning, like crushed aluminium. Which it will be fairly soon, if you stay this far underground; the pull of the Underworld is strong here, and no wyrmdigger could be built for such an awesome force.
* [But they are built for something else.]
It's true; not even the arts and minds in the hearts of Athens could manage to build anything that could survive a situation like this. However, you've gathered that they probably could build something to escape a situation like this. You dash belowdecks with all the speed you can muster, crack open the emergency seal, and behold the majesty of the control panel. The Corinthians build these systems, and only they truly can understand them. But you've picked up enough from your time belowdecks to pull off something fairly remarkable. You twist dials, pull levers, and adjust the orrery-wheels to the Aeolus Configuration. In short; you tell the hidiously complex machinery to vent a massive quantity of steam from the front of the drill. Steam has to work hard to lift an entire wyrmdigger; but it does work, and shunts you a good distance up the tunnel, to a point where the drill no longer screams quite so urgently. You're not going to be able to do this again; it takes far too much steam to do it twice. But it's bought you time. {change (DEPTH, -10)}
 ++ [DRILL] ->Top
* ->DepthEnding

==DepthEnding
The drill continues its descent into a land it was never built for. The Aeolikos, the Oread, the Pedon; none of their efforts can extricate you from this situation. Your drill cuts open a vein of the earth, spilling the hot red blood of the depths, consuming you and your crew in a great crushing flagration. The heat finds you before the rock does.
->END

==CrewFailure
No mutiny, this. The stresses and strains of the uttermost depths have taken their toll on your crew's wellbeing; and on your own. The few among you that remain are in desperate danger of succumbing to madness. You can hear one of your crew screaming that they're a drill, while desperately trying to corkscrew through a wall. Things are looking grim. You feel like twisting into the earth yourself.
* [Deploy the Quartermaster's Gambit!]
    Standing on a nearby crate, you bellow at your crew: "What is the best in life?", you roar, shaking the earth, mightier than the most colossal wyrm. Their responses are as varied as they are muted; wearied laughter, unintelligible moans, strange mantras about the taste and texture of soft black earth, weeping, silence. That's okay; that's what you expected. Nodding, as if they'd provided you with some valuable input, you wheel out your last-ditch gamble; a table piled high with the finest delicacies. Well, as fine as you can muster in a steel box miles under the earth. The sights, colours, smells, tastes; these things help revive your crew, giving them something-like-focus. Press on, while you still can. {change (CREW,10)}
    ++ [DRILL] ->Top
* ->CrewEnding

==CrewEnding
Fall to the floor. You shall not rise again. You are nothing but a slug, a snake, a snail, legless and limbless, crawling on the earth, on the belly of a beast. What else could you be, so far under the ground? This land was not made for the mind, therefore, no mind can exist within this land. Lie still. Lie still.
-> END