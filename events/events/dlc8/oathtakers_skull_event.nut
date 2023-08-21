this.oathtakers_skull_event <- this.inherit("scripts/events/event", {
	m = {
		Oathtaker = null
	},
	function create()
	{
		this.m.ID = "event.oathtakers_skull";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 14.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "{[img]gfx/ui/events/event_183.png[/img]{You find %oathtaker% staring intently into the eyesockets of Young Anselm\'s skull, the weight of the bone resting on his outstretched palm. He nods now and again and murmurs to himself in a sort of whispering prayer. Sensing your presence, the Oathtaker turns around.%SPEECH_ON%I was worried, but despite the seas of chaos, we have here Young Anselm, and he is provenance of courage such that I would swim into the world\'s ocean with full assurance that he would see me through it. I should spread Young Anselm\'s teachings with the others.%SPEECH_OFF%Absolutely he should. | The Oathtakers are enjoying a fine meal beside the fire. %oathtaker% has Young Anselm\'s skull on a stump. He occasionally turns, spoon of gristle in hand, and seems to think about feeding some to the bony maw. These moments make you uneasy, but for whatever reason the little skull has a tendency to compel the Oathtakers into a better mood by mere presence alone, so much so that you\'ll let these simultaneously girly and grisly peculiarities pass. | %oathtaker% is looking over a text with felt covers and a gilt bookmark. Beside him, Young Anselm\'s skull rests near a dying candle. You ask the Oathtaker what he\'s reading. The man looks up.%SPEECH_ON%Seeing to matters of the Oaths, as Young Anselm had written them. Remember the lad\'s wise words: ink is the strongest of memories, so it is wise to not depend solely on one\'s own capacities to follow the Oaths, but instead to refresh the springs of the mind through the writings themselves. This, too, was a part of Young Anselm\'s teachings. You would know if you tended to the texts as he advised.%SPEECH_OFF%A little snippy there, but he\'s not wrong. | You see %oathtaker% cleaning off the skull of Young Anselm. Wishing to test the man\'s faith in the First Oathtaker, you ask something you already know: how did Anselm die. The Oathtaker straightens up, staring at you with a sincere look of offense.%SPEECH_ON%Captain, it matters not how he died, or even when or why or to whom, and maybe there even isn\'t a whom, but what matters is that he was on the Oath of the Final Path, and so we are also with him, and will be to the end. We are not just Oathtakers, but the Final Oathtakers.%SPEECH_OFF%He turns around, flicking a bug off the bone and then cleaning the skull as though it had been profaned by the insect\'s steps.%SPEECH_ON%This is a grand experience we are undertaking here captain, but sometimes I think you\'re just along for the ride.%SPEECH_OFF%It is at the very least a grand experience in deepening your pockets. Thankfully, the only one who seems capable of noticing your more cynical nature is a supposedly poignant skull, Young Anselm\'s eyesockets emptily staring at you as the Oathtaker spit shines the bone. | %oathtaker% kneels before Young Anselm\'s skull.%SPEECH_ON%Give me strength in our Oaths, Young Anselm, for I cannot do it alone and certainly not with just the captain\'s help.%SPEECH_OFF%You almost tell him that he\'s not alone, he\'s with the %companyname% and you\'re not a slouch yourself, but figure this probably isn\'t the place for that sorta realist talk. The man suddenly jumps to his feet and nods.%SPEECH_ON%Such guidance is much appreciated, Young Anselm.%SPEECH_OFF%A part of you wishes you could look at a young lad\'s skull for guidance and actually find it, but the only thing you take from Young Anselm\'s bony visage is an empty stare. | The company has had its up and downs, but Young Anselm is still seen as its primary piety purveyor. You have to admit, sometimes you find yourself staring at the skull with a bit of contempt. Despite you leading the band, and despite you leading it quite well, much of the company\'s successes are given to the skull. When the men need help, they often go to the skull just as well, skipping right past their captain. %oathtaker% is an example of this, having had a rough go lately but, instead of talking to you, you find him scooping up Young Anselm for some bony counsel on Oathtaking matters. You sometimes dream of taking the First Oathtaker\'s dome and skipping it across a lake like a rock. | Young Anselm\'s skull is a touchstone for the most faithful of the Oathtakers, a source of knowledge and guidance and more, all springing out from a silent, bony vessel. %oathtaker%, who has been feeling rather down and out about his past few days, is given access to the skull. Even in this brief keeping, he is renewed in his belief in the Oaths. | You set Young Anselm\'s skull onto a stick and start spinning it, the bone rattling as it goes round and round, the hollow clatter horribly amusing. %oathtaker% comes through the bushes asking something and you grab the skull and set it down in an instant. The Oathtaker looks at you, the stick, the skull, then back to you. He clears his throat and explains he\'s been having a rough go of it the past few days. For guidance, and out of laziness, you hand him Young Anselm\'s skull, telling him to find within the First Oathtaker a revivification of his vitality, a renewal of his faiths, and a resurgence of his courage. The man nods dutifully.%SPEECH_ON%Young Anselm might be the First Oathtaker, but I still believe you are wise beyond your years, captain. I should have seen to Anselm in the first place!%SPEECH_OFF% | You got Young Anselm\'s skull set on a stump and are throwing pebbles through the eyesockets. One swooshes right through the hole and you pump your fist. Just then, %oathtaker% comes around. He looks at you, your clenched fist, and Young Anselm. The Oathtaker nods.%SPEECH_ON%If even a cynic such as you may be given courage by Young Anselm, then surely the First Oathtaker\'s abilities go beyond what even I believed. I will leave you alone so that you may find further guidance from Young Anselm.%SPEECH_OFF%Nodding, you thank the Oathtaker, but after he leaves you return to the sport. Unfortunately, all you can muster is plinking pebble after pebble off Anselm\'s dome. It seems you\'ve lost the touch of the toss. | You have a thick stick in hand and are tossing rocks into the air and slamming them off into the distance. Each crack is deep and pleasing, and the sight of the stones sailing immensely satisfying. As you lean down to pick up another stone, you see Young Anselm\'s skull there, staring up at you. Naturally, you take it up, weighing it one hand. It\'s so light. You toss it up and smash it with the stick, fragments of skull spiraling outward in every direction, the fine bonemeal powdering the air around you as though you\'d cast a magic trick. Suddenly, you feel something in your side, and this world snaps away and you blink awake to %oathtaker% prodding you with his toe. Blinking your eyes, you realize you dozed off near the campfire. The Oathtaker sets a skull down beside you and nods.%SPEECH_ON%I sought counsel with Young Anselm and found it, captain, but seeing that you were sweating in your sleep I thought maybe you would like a moment with the First Oathtaker as well.%SPEECH_OFF%The man turns and leaves and you\'re left alone with the skull. It stares at you knowingly. A little too knowingly. You turn the head to look elsewhere and then go back to sleep. | %oathtaker% has had a rough go of it the past few days. You bring him Young Anselm\'s skull and tell him to sit with his thoughts, and to reflect on the Oaths. The man nods, and just a few minutes later he comes to you, skull in hand.%SPEECH_ON%You were right, captain. I had strayed from the path, but through the First Oathtaker\'s guidance I have found it again.%SPEECH_OFF% | Young Anselm\'s skull is starting to look a little ragged. Pieces of grass, mud, couple of bugs, all these things are smattered onto the bone. %oathtaker% comes up asking some inane question about inventory. You cut him off and hand him the skull and tell him to clean it. He nods, staring at the skull as though it were a pound of pure gold. He finishes the job within ten minutes, and when he gets back his disposition is entirely fresh, himself admitting that time alone with Young Anselm invigorated him, and reminded him why he took to the Oathtakers in the first place. That\'s all well and good, but the priority here is that he\'s also forgotten to talk to you about inventory which is fantastic.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Whatever makes you happy.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Oathtaker.improveMood(1.35, "Young Anselm renewed his faith in the oaths");

				if (_event.m.Oathtaker.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Oathtaker.getMoodState()],
						text = _event.m.Oathtaker.getName() + this.Const.MoodStateEvent[_event.m.Oathtaker.getMoodState()]
					});
				}

				this.Characters.push(_event.m.Oathtaker.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Paladins)
		{
			return;
		}

		if (this.World.Assets.getOrigin().getID() != "scenario.paladins")
		{
			return;
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];
		local haveSkull = false;

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.paladin" && bro.getMoodState() < this.Const.MoodState.Neutral)
			{
				candidates.push(bro);
			}

			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);

			if (item != null && (item.getID() == "accessory.oathtaker_skull_01" || item.getID() == "accessory.oathtaker_skull_02"))
			{
				haveSkull = true;
			}
		}

		if (!haveSkull)
		{
			local stash = this.World.Assets.getStash().getItems();

			foreach( item in stash )
			{
				if (item != null && (item.getID() == "accessory.oathtaker_skull_01" || item.getID() == "accessory.oathtaker_skull_02"))
				{
					haveSkull = true;
					break;
				}
			}
		}

		if (!haveSkull)
		{
			return;
		}

		if (candidates.len() == 0)
		{
			return;
		}

		this.m.Oathtaker = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.m.Score = 5 * candidates.len();
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"oathtaker",
			this.m.Oathtaker.getName()
		]);
	}

	function onClear()
	{
		this.m.Oathtaker = null;
	}

});

