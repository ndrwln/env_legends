this.childrens_crusade_event <- this.inherit("scripts/events/event", {
	m = {
		Monk = null,
		Doubter = null,
		Traveller = null
	},
	function create()
	{
		this.m.ID = "event.childrens_crusade";
		this.m.Title = "Along the road...";
		this.m.Cooldown = 300.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_97.png[/img]While on the path, you come across a small army of children. The oldest and biggest amongst them is probably fifteen at most with a tussled crop of orange hair and a spear for a weapon. He\'s leading the troop, a little fighting force provincial to the path more than any town or city. As they cross paths with you, this little leader tips his head at you.%SPEECH_ON%Make way! We are on a righteous march and shan\'t be stopped!%SPEECH_OFF%Curious, you ask where it is they are off to. The kid answers as though incredulous you don\'t know.%SPEECH_ON%Well let me tell you, sellsword. We are heading north through the frozen wastes. Uncultured and uncivilized tribes need to hear of the old gods, either by the word or by the sword.%SPEECH_OFF%He lifts the spear. A rather chirpy \'warcry\' is raised from the army. It appears some religious fervor has taken ahold of this wandering and harmless, and therefore suicidal, group.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "You ought to go home to your parents, kids.",
					function getResult( _event )
					{
						return "B";
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Monk != null)
				{
					this.Options.push({
						Text = "%monk%, you speak for the old gods. What say you?",
						function getResult( _event )
						{
							return "Monk";
						}

					});
				}

				if (_event.m.Doubter != null)
				{
					this.Options.push({
						Text = "%doubter%, you\'ve travelled up there. Say something.",
						function getResult( _event )
						{
							return "Doubter";
						}

					});
				}

				if (_event.m.Traveller != null)
				{
					this.Options.push({
						Text = "%walker%, you\'ve travelled up there. Say something.",
						function getResult( _event )
						{
							return "Traveller";
						}

					});
				}

				this.Options.push({
					Text = "I\'ll save you the long walk and rid you of any valuables right here.",
					function getResult( _event )
					{
						return "C";
					}

				});
				this.Options.push({
					Text = "Good luck, I guess. (Decrease Morals)",
					function getResult( _event )
					{
						this.World.Assets.addMoralReputation(-1);
						return 0;
					}

				});
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_97.png[/img]You tell the kids to go home to their parents. The leader laughs and the others follow suit, like little \'uns easily impressed by their big brother. He shakes his head.%SPEECH_ON%Why do you think we\'ve come this far? Our parents know right where we are, and they know where we are is truthfully right. The old gods need to be known throughout the land! Now, make way!%SPEECH_OFF%The kids press forth. A little banner flaps past you and there is much clinking and clanking of their little weapons, mostly bottles and sling shots and tableware.\n\n No doubt they are marching toward certain doom. Raiders and vagabonds are sure to prey upon them, like hawks upon lemmings, and slaves don\'t mind making ostensibly orphaned children \'disappear.\' Were they to get further than those threats, the northern wastes will provide for them a frozen coffin to die in. \n\n [img]gfx/ui/icons/asset_moral_reputation.png[/img] The company\'s Moral reputation increases slightly",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Godspeed.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Assets.addMoralReputation(1);
			}

		});
		this.m.Screens.push({
			ID = "Monk",
			Text = "[img]gfx/ui/events/event_97.png[/img]%monk% the holy steps forward and brings the children to a huddle. They instantly respect the religious figure, representing in part the very cause they wish to promote. %monk% bends a knee.%SPEECH_ON%Was it the old gods who told you to come out and do this?%SPEECH_OFF%The little leader nods.%SPEECH_ON%They spoke to me in my sleep.%SPEECH_OFF%The monk nods back, hand rubbing chin, mulling it over and then patting the boy on his head.%SPEECH_ON%The old gods speak to me and I for them. Interpreting their message requires years of study, let me tell you! Are you certain that it was you, little one, that was meant to carry this burden? Perhaps you were to be the messenger, no? See us, we\'re warriors. Fit, fighting folk who can kill those who despise and demark the old gods. You are not yet like us, but you have a strong voice and the command of a true leader yet. I believe the old gods wanted to use you for your charisma, not your muscles.%SPEECH_OFF%The monk gives the boy a playful push. He smiles, realizing the truth of what the friar has to say. The little leader tells his party that they are to return home as the monk is assuredly right. Some men are thankful that these kids were talked out of going to a certain doom.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Stupid kids.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Monk.getImagePath());
				this.World.Assets.addMoralReputation(2);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_moral_reputation.png",
					text = "The company\'s moral reputation increases"
				});
				local resolve = this.Math.rand(1, 2);
				_event.m.Monk.getBaseProperties().Bravery += resolve;
				_event.m.Monk.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.Monk.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + resolve + "[/color] Resolve"
				});
				_event.m.Monk.improveMood(1.0, "Saved some children from certain doom");

				if (_event.m.Monk.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Monk.getMoodState()],
						text = _event.m.Monk.getName() + this.Const.MoodStateEvent[_event.m.Monk.getMoodState()]
					});
				}

				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() != _event.m.Monk.getID() && this.Math.rand(1, 100) <= 25)
					{
						bro.improveMood(0.5, "Glad that " + _event.m.Monk.getName() + " saved children from certain doom");

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "Doubter",
			Text = "[img]gfx/ui/events/legend_doubter_kids.png[/img]Looking grizzled and sad %doubter% approaches the kids, gets on a knee down at their level and speaks directly. He encourages them to march on, saying that the heartless fires of war needed their bodies as kindling. He speaks of the inevitability of death, the gruesome horrors of violence, the certainty of injury, a lifetimes of disability for the victors, and the endless entropy which tears at the bodies and souls of fragile humans.  The children stare mouths agape in horror, one cries and another runs. Their crusade is over.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Always the life of the party.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Doubter.getImagePath());
				this.World.Assets.addMoralReputation(1);
				local resolve = this.Math.rand(1, 2);
				_event.m.Doubter.getBaseProperties().Bravery += resolve;
				_event.m.Doubter.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.mDoubter.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + resolve + "[/color] Resolve"
				});
				_event.m.Doubter.improveMood(1.0, "Saved some children from certain doom");

				if (_event.m.Doubter.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Doubter.getMoodState()],
						text = _event.m.Doubter.getName() + this.Const.MoodStateEvent[_event.m.Traveller.getMoodState()]
					});
				}

				this.List.push({
					id = 10,
					icon = "ui/icons/asset_moral_reputation.png",
					text = "The company\'s moral reputation increases"
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() != _event.m.Doubter.getID() && this.Math.rand(1, 100) <= 25)
					{
						bro.worsenMood(1.0, "Remembers what " + _event.m.Doubter.getName() + " said about certain doom");

						if (bro.getMoodState() <= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}

					if (bro.getID() != _event.m.Doubter.getID() && this.Math.rand(1, 100) <= 25)
					{
						bro.improveMood(0.5, "Glad that " + _event.m.Doubter.getName() + " saved children from certain doom");

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "Traveller",
			Text = "[img]gfx/ui/events/event_97.png[/img]Taking off well worn boots, %walker%\'s feet reveal battered soles to the children. They recoil, gagging and covering their mouths. A little girl lets out a long \'ewww\' to really drive the point home. %walker% wags a foot around, showing off disgustingly calloused skin.%SPEECH_ON%I spent years on the road and most of them without a good shoe to step with. I know what it\'s like out there. I\'ve seen the dangers. People stabbing one another in their sleep. Killing for a bite of a biscuit. Strangers befriend ya so they can betray ya. And all that is when it\'s going well! When it goes bad, it gets... well, it gets real bad. You kids got no business being out here. You\'ll be raped, murdered, enslaved, tortured, fed to dogs, eaten by boars, bears, wolves, all things that look at ya like it\'s lunchtime on two legs. Go home. The lot of you.%SPEECH_OFF%The band of children murmurs amongst themselves. One announces he\'s going back to his mom. A little girl states that she didn\'t even want to be out here anyway and never got the treats she was promised. Sensing a morale break, the little leader tries to corral the children, but it\'s no use. The group breaks apart and, thankfully, starts going home. Some of the mercenaries are relieved as they did not wish to see the little ones continue their doomed journey.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You should probably get those feet looked at.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Traveller.getImagePath());
				this.World.Assets.addMoralReputation(2);
				local resolve = this.Math.rand(1, 2);
				_event.m.Traveller.getBaseProperties().Bravery += resolve;
				_event.m.Traveller.getSkills().update();
				this.List.push({
					id = 16,
					icon = "ui/icons/bravery.png",
					text = _event.m.Traveller.getName() + " gains [color=" + this.Const.UI.Color.PositiveEventValue + "]+" + resolve + "[/color] Resolve"
				});
				_event.m.Traveller.improveMood(1.0, "Saved some children from certain doom");

				if (_event.m.Traveller.getMoodState() >= this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Traveller.getMoodState()],
						text = _event.m.Traveller.getName() + this.Const.MoodStateEvent[_event.m.Traveller.getMoodState()]
					});
				}

				this.List.push({
					id = 10,
					icon = "ui/icons/asset_moral_reputation.png",
					text = "The company\'s moral reputation increases"
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getID() != _event.m.Traveller.getID() && this.Math.rand(1, 100) <= 25)
					{
						bro.improveMood(0.5, "Glad that " + _event.m.Traveller.getName() + " saved children from certain doom");

						if (bro.getMoodState() >= this.Const.MoodState.Neutral)
						{
							this.List.push({
								id = 10,
								icon = this.Const.MoodStateIcon[bro.getMoodState()],
								text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_97.png[/img]You doubt that you can talk the fervor out of these kids, but if your pop\'s parenting is anything to go by you can probably beat it out of them. With a swift order, you have the company set upon the kids, knocking them around and taking their stuff. The little leader tries to spear a sellsword and gets cold cocked for his troubles.\n\n This isn\'t the prettiest of things to do and it\'d look really bad if anyone saw the company beating up children, but this \'end\' to their crusade is preferable to the nastier sorts that await them on the road.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Eat dirt, you little runts.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Assets.addMoralReputation(-4);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_moral_reputation.png",
					text = "The company\'s moral reputation decreases greatly"
				});
				local item = this.new("scripts/items/loot/silverware_item");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
				item = this.new("scripts/items/weapons/militia_spear");
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 11,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + this.Const.Strings.getArticle(item.getName()) + item.getName()
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.OffendedByViolence) && this.Math.rand(1, 100) <= 75)
					{
						bro.worsenMood(1.0, "Was appalled by your order to rob children");

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
			}

		});
	}

	function onUpdateScore()
	{
		if (this.World.FactionManager.isGreaterEvil())
		{
			return;
		}

		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		local currentTile = this.World.State.getPlayer().getTile();

		if (!currentTile.HasRoad)
		{
			return;
		}

		if (this.Const.DLC.Desert && currentTile.SquareCoords.Y < this.World.getMapSize().Y * 0.2)
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(currentTile) <= 5)
			{
				return;
			}
		}

		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_monk = [];
		local candidates_doubter = [];
		local candidates_traveller = [];

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.monk" || bro.getBackground().getID() == "background.legend_nun")
			{
				candidates_monk.push(bro);
			}
			else if (bro.getBackground().getID() == "background.messenger" || bro.getBackground().getID() == "background.vagabond" || bro.getBackground().getID() == "background.refugee" || bro.getBackground().getID() == "background.legend_ranger_commander")
			{
				candidates_traveller.push(bro);
			}
			else if (bro.getSkills().hasSkill("trait.double_tongued"))
			{
				candidates_doubter.push(bro);
			}
		}

		if (candidates_monk.len() != 0)
		{
			this.m.Monk = candidates_monk[this.Math.rand(0, candidates_monk.len() - 1)];
		}

		if (candidates_traveller.len() != 0)
		{
			this.m.Traveller = candidates_traveller[this.Math.rand(0, candidates_traveller.len() - 1)];
		}

		if (candidates_doubter.len() != 0)
		{
			this.m.Doubter = candidates_doubter[this.Math.rand(0, candidates_doubter.len() - 1)];
		}

		this.m.Score = 5;
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"monk",
			this.m.Monk != null ? this.m.Monk.getName() : ""
		]);
		_vars.push([
			"walker",
			this.m.Traveller != null ? this.m.Traveller.getName() : ""
		]);
		_vars.push([
			"doubter",
			this.m.Doubter != null ? this.m.Doubter.getName() : ""
		]);
	}

	function onClear()
	{
		this.m.Monk = null;
		this.m.Traveller = null;
		this.m.Doubter = null;
	}

});

