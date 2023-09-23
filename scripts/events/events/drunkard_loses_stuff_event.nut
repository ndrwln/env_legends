this.drunkard_loses_stuff_event <- this.inherit("scripts/events/event", {
	m = {
		Drunkard = null,
		OtherGuy = null,
		Item = null
	},
	function create()
	{
		this.m.ID = "event.drunkard_loses_stuff";
		this.m.Title = "During camp...";
		this.m.Cooldown = 14.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_05.png[/img]While taking inventory last night, %drunkard% had a little too much to drink and ended up losing %item%!\n\nYou\'ve had the mercenary brought to you, and swaying while speaking, the drunkard still reeks of alcohol. %drunkard% hiccups while trying to explain what happened, but the best defense they can muster is collapsing to the ground in a drunken heap. %drunkard% laughs and laughs, but you see nothing funny about this. %otherguy% asks what you want to do with this mess.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Everybody makes mistakes.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Latrine duty for a month!",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "If %drunkard% won\'t put down the drink I\'ll do it. Get the whip.",
					function getResult( _event )
					{
						return this.Math.rand(1, 100) <= 75 ? "D" : "E";
					}

				},
				{
					Text = "Sober them up, we will talk it out",
					function getResult( _event )
					{
						return this.Math.rand(1, 100) <= 25 ? "F" : "G";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Drunkard.getImagePath());
				this.List.push({
					id = 10,
					icon = "ui/items/" + _event.m.Item.getIcon(),
					text = "You lose " + this.Const.Strings.getArticle(_event.m.Item.getName()) + _event.m.Item.getName()
				});
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_05.png[/img]The drunkard falls on their back, staring aimlessly at the sky. You see tears in their eyes and %drunkard% covers their face, trying to hide the shame. There is something about their past that you do not know, perhaps something that led to the drink in the first place. You can\'t possibly punish someone for what they cannot control.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Get this drunkard out of my sight.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Drunkard.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_05.png[/img]You grab a shovel, a bucket, and a crusty bit of wool wrapped around a stick.%SPEECH_ON%Latrine duty. One month.%SPEECH_OFF%The drunkard looks at you and with wide eyes makes something of a plead.%SPEECH_ON%Sir, please. I -hic- don\'t... the company, sir, they -hic-...%SPEECH_OFF%You hold your hand up, stopping the protestations. The mercenary sways and tries to stand straight. Cracking your knuckles, you explain the other option.%SPEECH_ON%If you do not wish to have these duties, then we can expedite your punishment by the whip. Which would you prefer?%SPEECH_OFF%Amazingly, the drunkard actually spends a few moments thinking it over, eyebrows rising and falling and a grimace passing from side of their mouth to the other with a stream of realizations that there\'s no way out of it. Finally, %drunkard% submits to the smellier of the two options. Quite shocked to see the choice even took any time at all, you begin to wonder just how bad the company\'s diet has gotten.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Get this drunkard out of my sight.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Drunkard.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_38.png[/img]The mercenary was driven to the drink, so you plan to drive it out of them. You order a flogging. A few battle brothers drag the drunk away, hiccupping and moaning, head bouncing aloll, seemingly unaware of what is going on. They string the drunkard up beneath a tree and shred the clothes off their back. After a few lashings, the drunkard wakes up to the punishment and begins crying out uncontrollably, beggin for mercy in a tongue blurred by drink and pain, like someone fighting for freedom from a nightmare. One thing is for certain: they\'ll never make this mistake again.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That\'ll teach \'em.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Drunkard.getImagePath());
				_event.m.Drunkard.addLightInjury();
				this.List = [
					{
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Drunkard.getName() + " receives an injury"
					}
				];
				_event.m.Drunkard.getSkills().removeByID("trait.drunkard");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_29.png",
					text = _event.m.Drunkard.getName() + " is no longer a drunkard"
				});
				_event.m.Drunkard.worsenMood(2.5, "Was flogged on your orders");
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[_event.m.Drunkard.getMoodState()],
					text = _event.m.Drunkard.getName() + this.Const.MoodStateEvent[_event.m.Drunkard.getMoodState()]
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Drunkard.getID())
					{
						continue;
					}

					if (!bro.getBackground().isBackgroundType(this.Const.BackgroundType.OffendedByViolence) || bro.getBackground().getID() == "background.flagellant" || bro.getBackground().getID() == "background.cultist" || bro.getBackground().getID() == "background.converted_cultist" || bro.getBackground().getID() == "background.monk_turned_flagellant")
					{
						continue;
					}

					bro.worsenMood(1.0, "Appalled by your order to have " + _event.m.Drunkard.getName() + " flogged");

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_38.png[/img]The man was driven to the drink, so you plan to drive it out of him. You order a flogging. A few men drag the drunk away. He is hiccupping and moaning, his head bouncing aloll as he is seemingly unaware of what is going on. They string him up beneath a tree and shred the clothes off his back. After a few lashings, the drunkard wakes up to his punishment and begins crying out uncontrollably. He begs for mercy in a tongue blurred by drink and pain, like a man fighting for freedom from a nightmare.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That\'ll teach him.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Drunkard.getImagePath());
				_event.m.Drunkard.addLightInjury();
				this.List = [
					{
						id = 10,
						icon = "ui/icons/days_wounded.png",
						text = _event.m.Drunkard.getName() + " receives an injury"
					}
				];
				_event.m.Drunkard.worsenMood(2.5, "Was flogged on your orders");
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[_event.m.Drunkard.getMoodState()],
					text = _event.m.Drunkard.getName() + this.Const.MoodStateEvent[_event.m.Drunkard.getMoodState()]
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() == _event.m.Drunkard.getID())
					{
						continue;
					}

					if (!bro.getBackground().isBackgroundType(this.Const.BackgroundType.OffendedByViolence) || bro.getBackground().getID() == "background.flagellant" || bro.getBackground().getID() == "background.cultist" || bro.getBackground().getID() == "background.converted_cultist" || bro.getBackground().getID() == "background.monk_turned_flagellant")
					{
						continue;
					}

					bro.worsenMood(1.0, "Appalled by your order to have " + _event.m.Drunkard.getName() + " flogged");

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "F",
			Text = "[img]gfx/ui/events/event_23.png[/img]The mercenary\'s drinking must be a result of something. You set out to find out what the cause was. You give some water and food to the drunkard and have them excercise until they sober up. You {walk a short way | sit for a time | wander around the camp perimeter | sit in your tent | sit around the fire after others fall asleep | walk a long time through the surrounding lands | stare at the sky together | gaze into the fire} and talk on the {issues | memories | concerns | worries | fears} that {plague | haunt | hunt | pursue | govern | tarry | gnaw at | consume} them, %drunkard% tells you their story of {family abuse | lost love | tyrantical injustice | infidelity | brutal employment | childhood neglect | a wartorn hometown | natural disaster | family tradgedy | a witch curse | the cruelty of the gods | a lost child | a backstabbing business parter | abandonment | loss | tragedy | brutality}. You talk for a time about not letting the past {influence | govern | control | infect | overcome | outweigh | shade | color | undo | replace | undermine} the future. Something stirs deep inside them, and they swear they\'ll never make this mistake again.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We may have found the cause",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Drunkard.getSkills().removeByID("trait.drunkard");
				this.List.push({
					id = 10,
					icon = "ui/traits/trait_icon_29.png",
					text = _event.m.Drunkard.getName() + " is no longer a drunkard"
				});
				_event.m.Drunkard.getSkills().add(this.new("scripts/skills/effects_world/hangover_effect"));
				this.List.push({
					id = 10,
					icon = "skills/status_effect_62.png",
					text = _event.m.Drunkard.getName() + " is hungover"
				});
				_event.m.Drunkard.worsenMood(2.5, "Relived the past and realised the error of their ways");
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[_event.m.Drunkard.getMoodState()],
					text = _event.m.Drunkard.getName() + this.Const.MoodStateEvent[_event.m.Drunkard.getMoodState()]
				});
				local brothers = this.World.getPlayerRoster().getAll();
			}

		});
		this.m.Screens.push({
			ID = "G",
			Text = "[img]gfx/ui/events/event_23.png[/img]The mercenary\'s drinking must be a result of something. You set out to find out what the cause was. You give some water and food to the drunkard and have them excercise until they sober up. You {walk a short way | sit for a time | wander around the camp perimeter | sit in your tent | sit around the fire after others fall asleep | walk a long time through the surrounding lands | stare at the sky together | gaze into the fire} and talk on the {issues | memories | concerns | worries | fears} that {plague | haunt | hunt | pursue | govern | tarry | gnaw at | consume} them, %drunkard% tells you their story of {family abuse | lost love | tyrantical injustice | infidelity | brutal employment | childhood neglect | a wartorn hometown | natural disaster | family tradgedy | a witch curse | the cruelty of the gods | a lost child | a backstabbing business parter | abandonment | loss | tragedy | brutality | hopelessness | tyrany | injustice | unrequited love | unfulfilled ambition}. You talk for a time about not letting the past {influence | govern | control | infect | overcome | outweigh | shade | color | undo | replace | undermine} the future. Despite the in depth conversation, you fear the issue is not yet resolved.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "This is not over.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Drunkard.getSkills().add(this.new("scripts/skills/effects_world/hangover_effect"));
				this.List.push({
					id = 10,
					icon = "skills/status_effect_62.png",
					text = _event.m.Drunkard.getName() + " is hungover"
				});
				_event.m.Drunkard.worsenMood(1.0, "Lost an item and relived the past");
				this.List.push({
					id = 10,
					icon = this.Const.MoodStateIcon[_event.m.Drunkard.getMoodState()],
					text = _event.m.Drunkard.getName() + this.Const.MoodStateEvent[_event.m.Drunkard.getMoodState()]
				});
				local brothers = this.World.getPlayerRoster().getAll();
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getSkills().hasSkill("trait.drunkard") && bro.getBackground().getID() != "background.legend_commander_noble")
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() == 0)
		{
			return;
		}

		local items = this.World.Assets.getStash().getItems();
		local hasItem = false;

		foreach( item in items )
		{
			if (item == null)
			{
				continue;
			}

			if (item.isItemType(this.Const.Items.ItemType.Legendary))
			{
				continue;
			}

			if (item.isItemType(this.Const.Items.ItemType.Weapon) || item.isItemType(this.Const.Items.ItemType.Shield) || item.isItemType(this.Const.Items.ItemType.Armor) || item.isItemType(this.Const.Items.ItemType.Helmet))
			{
				hasItem = true;
				break;
			}
		}

		if (!hasItem)
		{
			return;
		}

		this.m.Drunkard = candidates[this.Math.rand(0, candidates.len() - 1)];
		local other_candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Drunkard.getID())
			{
				other_candidates.push(bro);
			}
		}

		if (other_candidates.len() == 0)
		{
			return;
		}

		this.m.OtherGuy = other_candidates[this.Math.rand(0, other_candidates.len() - 1)];
		this.m.Score = candidates.len() * 10;
	}

	function onPrepare()
	{
		local items = this.World.Assets.getStash().getItems();
		local candidates = [];

		foreach( item in items )
		{
			if (item == null)
			{
				continue;
			}

			if (item.isNamed() || item.isIndestructible())
			{
				continue;
			}

			if (item.isItemType(this.Const.Items.ItemType.Weapon) || item.isItemType(this.Const.Items.ItemType.Shield) || item.isItemType(this.Const.Items.ItemType.Armor) || item.isItemType(this.Const.Items.ItemType.Helmet))
			{
				candidates.push(item);
			}
		}

		this.m.Item = candidates[this.Math.rand(0, candidates.len() - 1)];
		this.World.Assets.getStash().remove(this.m.Item);
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"drunkard",
			this.m.Drunkard.getName()
		]);
		_vars.push([
			"otherguy",
			this.m.OtherGuy.getName()
		]);
		_vars.push([
			"item",
			this.Const.Strings.getArticle(this.m.Item.getName()) + this.m.Item.getName()
		]);
	}

	function onClear()
	{
		this.m.Drunkard = null;
		this.m.OtherGuy = null;
		this.m.Item = null;
	}

});

