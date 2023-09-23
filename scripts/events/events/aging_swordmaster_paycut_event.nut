this.aging_swordmaster_paycut_event <- this.inherit("scripts/events/event", {
	m = {
		Swordmaster = null
	},
	function create()
	{
		this.m.ID = "event.aging_swordmaster_paycut";
		this.m.Title = "During camp...";
		this.m.Cooldown = 100.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_17.png[/img]%swordmaster% enters your tent. You wave him to the chair across your table. He sits so slowly and feebly that you fear him standing back up will take twice as long. The man clasps his hands together and elbows his arms onto the table, grunting and shifting, finding little comfort even in doing nothing at all. His lips are dry, his face withered. Liver spots mottle his head and even the hairs about his nose and ears are grey.\n\n You always have time for %swordmaster% so you ask what it is he wishes to speak about.%SPEECH_ON%This might sound peculiar coming from a blade for hire, but I think it needs saying anyway, and it\'d make me sleep better at night. I\'ll be forward with you: I am not the man you hired so long ago. You know that. I know that. Some of the men know it, but they\'re respectful as good men are.%SPEECH_OFF%You agree, but don\'t nod. Instead, you ask what the man is getting at.%SPEECH_ON%I wish to lower my wage. Now don\'t be saying no, you don\'t have to bullshit me. I\'ll take a cut. Money\'s never been an issue anyhow. Those crowns could be used to help arm the men or even pay them better. God knows a young man could always use an extra crown or two.%SPEECH_OFF%Before you say another word, the man springs to his feet with surprising speed. He nods and grins playfully before yelling loudly.%SPEECH_ON%I agree with your decision, good sir. I could use a paycut!%SPEECH_OFF%You laugh as the man leaves your tent almost as soon as he\'d come in.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "An honorable man if there ever was one.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Swordmaster.getImagePath());
				_event.m.Swordmaster.getBaseProperties().DailyWage -= _event.m.Swordmaster.getDailyCost() / 2;
				_event.m.Swordmaster.getSkills().update();
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_daily_money.png",
					text = _event.m.Swordmaster.getName() + " is now paid " + _event.m.Swordmaster.getDailyCost() + " crowns a day"
				});
				_event.m.Swordmaster.getFlags().add("aging_paycut");
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates = [];

		foreach( bro in brothers )
		{
			if (bro.getLevel() >= 6 && bro.getBackground().getID() == "background.swordmaster" && !bro.getFlags().has("aging_paycut") && !bro.getSkills().hasSkill("trait.old"))
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

