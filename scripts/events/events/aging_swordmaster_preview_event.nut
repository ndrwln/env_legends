this.aging_swordmaster_preview_event <- this.inherit("scripts/events/event", {
	m = {
		Swordmaster = null
	},
	function create()
	{
		this.m.ID = "event.aging_swordmaster_preview";
		this.m.Title = "Along the way...";
		this.m.Cooldown = 60.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_17.png[/img]You find %swordmaster% sitting on a stump. He\'s looking out at the land.%SPEECH_ON%You know, I\'ve realized something as an old man who has operated far too long in this business of killing. I\'m so much wiser these days. I\'ve come to know so much, so much that I now know what I don\'t know. And I look back and think, I was such a dummy back in my youth. Then I thought, what of all the men I\'ve slain, stopping their mortal coil when it was young and so ready to spring?%SPEECH_OFF%You take a seat and shrug. He continues.%SPEECH_ON%What I\'ve realized is that I\'m a killer of wisdom. That I took a lot of old men out of this world, and with them went so much learning and knowledge. There\'s so many worlds out there that I destroyed. Worlds where those men lived and went on living and did the great things they knew not was in them. Had the first man I fought slew me down, how many lives would he have saved? How much wisdom would have been spared? I\'m sorry, I don\'t mean to drone on.%SPEECH_OFF%The man stands, patting his wobbly legs. You grab his arm.%SPEECH_ON%Have you considered that you may have also saved worlds? That some of those men you\'ve slain could have lived on to be horrible monsters?%SPEECH_OFF%He smiles, but you know he\'s already thought that through and doesn\'t wish to disturb you with the answer. He simply nods before going off to join the rest of the company.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "I hope he cheers up.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
				_event.m.Swordmaster.worsenMood(1.0, "Realized he\'s getting old");

				if (_event.m.Swordmaster.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Swordmaster.getMoodState()],
						text = _event.m.Swordmaster.getName() + this.Const.MoodStateEvent[_event.m.Swordmaster.getMoodState()]
					});
				}

				_event.m.Swordmaster.getFlags().add("aging_preview");
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 6 && bro.getBackground().getID() == "background.swordmaster" && !bro.getFlags().has("aging_preview") && !bro.getSkills().hasSkill("trait.old") && !bro.getFlags().has("IsRejuvinated"))
			{
				candidates.push(bro);
			}
		}

		if (candidates.len() > 0)
		{
			this.m.Swordmaster = candidates[this.Math.rand(0, candidates.len() - 1)];
			this.m.Score = this.m.Swordmaster.getLevel();
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

	function onClear()
	{
		this.m.Swordmaster = null;
	}

});

