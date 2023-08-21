this.goblin_city_destroyed_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.location.goblin_city_destroyed";
		this.m.Title = "After the battle";
		this.m.Cooldown = 999999.0 * this.World.getTime().SecondsPerDay;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_119.png[/img]{The goblin vanguard vanquished, you march on the city to ransack it. Tiny goblins are slain and scalped or beheaded. More yet scurry around you like ants, each carrying something above their heads like human skulls or treasures and one sprints madly about toting a flagpole with its banner aflame and another dances with the decapitated head of a wolf. Your men turn over huts and shanties and kick out leaners and anything found breathing is put to an end.\n\n An ancient fortress the goblins used for a city core is set upon with a pillager\'s eye. You enter the halls yourself and there find a blind goblin crawling with a wreath of human femurs hanging from its neck. The greenskin chitters and chamfers in your general direction, no doubt sensing your presence, though a pained grimace on its face means it also senses the annihilation of its people. You gut the greenskin and leave it to die on the stone floor. Your mercenaries run on ahead and into a council room full of elders and cut them all down in a murderous frenzy that has limbs flying and fingers scattering and blood shooting up the walls and across the tables.\n\n You head outside to the castle yard. Here you find a pile of dead humans, some mutilated, others charged, one stuffed with a torch as though his ribcage were a brazier. Past the corpses you spot the wolfrider kennels. You have wolf cages burned and their trainers thrown in the fires to die with them. One of the wolves breaks free and sprints further into the city with a cape of flame for fur. It runs from abode to abode barking and howling for relief. You watch as the flames rapidly burn thatched huts and strawroofed shacks. Before you yourself are consumed in the fiery carnage, you order the men back out and watch the whole place burn to the ground. With the savages taken care of, you take inventory of the loot.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Who is that?",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_119.png[/img]{As you count the loot, the stranger who ordained this entire goblin-slaying strategy reappears. You can\'t even see the color of him for he is utterly drenched in goblin guts and gore. He\'s got a few scalps in hand and a pouch that has ears and noses poking out the top and blood dripping from the bottom. He nods.%SPEECH_ON%All is well, traveler, all is well. We did good.%SPEECH_OFF%You ask him if he set the fire. He nods.%SPEECH_ON%Goblins stagger their rearguard in mazes of walls and mines. I shuttered their escapes to hem the population between two walls, closed the way out, closed the way in, and set fire to everything. They perished quickly. I see you fared well. You can keep the loot. I\'ve no use for it.%SPEECH_OFF%He turns and walks away. You yell out to him, this outrageous warrior, and ask how much he\'d want to join the company. This time he turns back.%SPEECH_ON%Heh, heh, haha, hahaha! Traveler! This joke, ah. Comedy. Delightful. Truly. But my work will not be stalled until every goblin has been destroyed.%SPEECH_OFF%Fair enough, a man\'s purpose is his own. But you\'re curious. You ask how many cities are out there.%SPEECH_ON%Twenty three, oh, sorry, did you ask how many there are in total? Twenty three I\'ve destroyed, but still in existence there are, ah, two, three, hmmm. I wager four thousand. Good travels, traveler.%SPEECH_OFF%This time he departs for good. You look back at the %companyname%. They are in rare agreement: they wish they hadn\'t heard any of that.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That few, huh?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Flags.set("IsGoblinCityDestroyed", true);
			}

		});
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
	}

});

