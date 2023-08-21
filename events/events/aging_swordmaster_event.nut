this.aging_swordmaster_event <- this.inherit("scripts/events/event", {
	m = {
		Swordmaster = null
	},
	function create()
	{
		this.m.ID = "event.aging_swordmaster";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 30.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_17.png[/img]You find %swordmaster% struggling to set himself down on a tree stump. As he gingerly lowers, you see his legs quaking as though they can barely bend at all. He lets out a long sigh after he takes his seat. His sword is beside him. It is younger than the hands that own it, a replacement of a replacement of a replacement. He shows no fondness for it, but when he touches it you sense there is a reflection in the very idea of a sword, of how a man lengthens himself with it, and how he shortens others by its very blade. You turn to leave, hoping to give the swordmaster time to himself, but he notices your departure and calls out.%SPEECH_ON%Hey there, captain. Didn\'t mean for you to see that.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "How are you doing?",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Well, I saw it. Now get moving.",
					function getResult( _event )
					{
						return "E";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_17.png[/img]He leans back, rubbing one of his knees with a calloused hand. A bit of wind throws his tufts of greyed hair around.%SPEECH_ON%Old. That\'s how I\'m doing. And I don\'t mean my age. By the years, I\'ve been old for a while now. I mean I\'m old in the bones. I suppose I get by on reputation a lot more than skills these days.%SPEECH_OFF%You immediately disagree, telling him that he\'s one of the deadliest men you\'ve ever met.%SPEECH_ON%Save the niceties for the women, captain. My vision\'s going. You probably don\'t want to hear that, but it is. My lead foot doesn\'t step like it used to. The knee clicks, seizes up. One day that is going to cost me. My off-hand has no feeling.%SPEECH_OFF%The swordmaster clenches and unclenches his free-hand.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Feel anything?",
					function getResult( _event )
					{
						return "C";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_17.png[/img]%SPEECH_ON%Nothing. I suppose the nerves are dying. And sometimes I forget things. I don\'t mean where I left my boots, either. I forget if there is someone standing behind me or not. My sense of my surroundings, my real blade, has been dulled. For all my speed and instinct it was time that has crept upon me, slow and steady, with no heat nor cold to give it away, it simply was and is and will be. I always thought I\'d be bested by another swordsman. Someone of talent. But I suppose I was too good for that.%SPEECH_OFF%The swordmaster grins playfully. You ask if he fears a death with no honor.%SPEECH_ON%I realized a long time ago that, when you become someone of my reputation, any route to death is going to be a disappointing one. They\'ll write it in the books how someone below my stature slew the great swordmaster. It\'s hogwash. If you want the truth I\'ll tell ya. I fear what I know is coming. That my body will betray me in the last moments. With time at its side, my body is what is going to kill me. The knee will lock, the grip will loosen, the shoulder will weaken. I don\'t fear death. I was too good for death, so death\'ll have to wait. My body is going to kill me first, then death can have what\'s left, the sorry blackened sod. The writers and historians? Piss on \'em. If I wanted eternal glory I would\'ve fought an army by myself.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "From what I heard, you did.",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_17.png[/img]The old swordmaster smiles. %SPEECH_ON%Oh get off it, captain. Now help me up so we can get back on the road.%SPEECH_OFF%",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Time marches on.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
				local old_trait = this.new("scripts/skills/traits/old_trait");
				_event.m.Swordmaster.getSkills().add(old_trait);
				_event.m.Swordmaster.setHitpoints(this.Math.min(_event.m.Swordmaster.getHitpoints(), _event.m.Swordmaster.getHitpointsMax()));
				this.List = [
					{
						id = 13,
						icon = old_trait.getIcon(),
						text = _event.m.Swordmaster.getName() + " has gotten older"
					}
				];
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_17.png[/img]You hear the old swordmaster sigh as you move away. Keeping up with the rest of the company, it seems, has become a battle in and of itself for him.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Time marches on.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
				local old_trait = this.new("scripts/skills/traits/old_trait");
				_event.m.Swordmaster.getSkills().add(old_trait);
				_event.m.Swordmaster.setHitpoints(this.Math.min(_event.m.Swordmaster.getHitpoints(), _event.m.Swordmaster.getHitpointsMax()));
				this.List = [
					{
						id = 13,
						icon = old_trait.getIcon(),
						text = _event.m.Swordmaster.getName() + " has gotten older"
					}
				];
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 9 && bro.getBackground().getID() == "background.swordmaster" && !bro.getSkills().hasSkill("trait.old") && !bro.getFlags().has("IsRejuvinated"))
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() > 0)
		{
			this.m.Swordmaster = candidates[this.Math.rand(0, candidates.len() - 1)];
			this.m.Score = this.m.Swordmaster.getLevel() - 5;
		}
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"swordmaster",
			this.m.Swordmaster.getName()
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Swordmaster = null;
	}

});

