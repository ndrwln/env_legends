this.legend_cannibal_eats_part_of_brother <- this.inherit("scripts/events/event", {
	m = {
		Cannibal = null,
		Dinner = null
	},
	function create()
	{
		this.m.ID = "event.legend_cannibal_eats_part_of_brother";
		this.m.Title = "At night...";
		this.m.Cooldown = 30 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_cannibal_eats_part_of_brother.png[/img]%cannibal% eats part of %dinner%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Gross!",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local potential = [];
				local injuries = this.Const.Injury.Cannibal;

				foreach( inj in injuries )
				{
					if (inj.ID == "injury.broken_elbow_joint" && !_event.m.Dinner.getSkills().hasSkill("injury.broken_elbow_joint") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_forearm"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.broken_knee" && !_event.m.Dinner.getSkills().hasSkill("injury.broken_knee") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_leg"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.maimed_foot" && !_event.m.Dinner.getSkills().hasSkill("injury.maimed_foot") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_foot"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_ear" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_ear") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_ear"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_eye" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_eye") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_eye"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_finger" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_finger") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_finger"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_hand" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_hand") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_hand"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_nose" && !_event.m.Dinner.getSkills().hasSkill("injury.missing_nose") && !_event.m.Dinner.getSkills().hasSkill("trait.legend_prosthetic_nose"))
					{
						potential.push(inj);
					}
					else if (inj.ID != "injury.broken_elbow_joint" && inj.ID != "injury.broken_knee" && inj.ID != "injury.maimed_foot" && inj.ID != "injury.missing_ear" && inj.ID != "injury.missing_eye" && inj.ID != "injury.missing_finger" && inj.ID != "injury.missing_hand" && inj.ID != "injury.missing_nose" && !_event.m.Dinner.getSkills().hasSkill(inj.ID))
					{
						potential.push(inj);
					}
				}

				if (potential.len() > 0)
				{
					local cannibal_injury = this.new("scripts/skills/" + potential[this.Math.rand(0, potential.len() - 1)].Script);
					_event.m.Dinner.getSkills().add(cannibal_injury);
					this.List.push({
						id = 10,
						icon = cannibal_injury.getIcon(),
						text = _event.m.Dinner.m.Name + " suffers " + cannibal_injury.m.Name
					});
					_event.m.Cannibal.improveMood(2.0, "Enjoyed a good meal");
					_event.m.Dinner.worsenMood(4.0, "Got partially eaten by " + _event.m.Cannibal.m.Name);
				}
				else
				{
					_event.m.Cannibal.improveMood(1.0, "Enjoyed a good meal");
					_event.m.Dinner.worsenMood(3.0, "Got partially eaten by " + _event.m.Cannibal.m.Name);
				}

				this.Characters.push(_event.m.Dinner.getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local cannibal_candidates = [];
		local dinner_candidates = [];

		if (this.World.Assets.getFood() > 0 || this.World.getTime().IsDaytime)
		{
			return;
		}

		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.legend_cannibal")
			{
				cannibal_candidates.push(bro);
			}
		}

		if (cannibal_candidates.len() < 1)
		{
			return;
		}

		this.m.Cannibal = cannibal_candidates[this.Math.rand(0, cannibal_candidates.len() - 1)];

		foreach( bro in brothers )
		{
			if (bro.getID() != this.m.Cannibal.getID())
			{
				local potential = [];
				local injuries = this.Const.Injury.Cannibal;

				foreach( inj in injuries )
				{
					if (inj.ID == "injury.broken_elbow_joint" && !bro.getSkills().hasSkill("injury.broken_elbow_joint") && !bro.getSkills().hasSkill("trait.legend_prosthetic_forearm"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.broken_knee" && !bro.getSkills().hasSkill("injury.broken_knee") && !bro.getSkills().hasSkill("trait.legend_prosthetic_leg"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.maimed_foot" && !bro.getSkills().hasSkill("injury.maimed_foot") && !bro.getSkills().hasSkill("trait.legend_prosthetic_foot"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_ear" && !bro.getSkills().hasSkill("injury.missing_ear") && !bro.getSkills().hasSkill("trait.legend_prosthetic_ear"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_eye" && !bro.getSkills().hasSkill("injury.missing_eye") && !bro.getSkills().hasSkill("trait.legend_prosthetic_eye"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_finger" && !bro.getSkills().hasSkill("injury.missing_finger") && !bro.getSkills().hasSkill("trait.legend_prosthetic_finger"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_hand" && !bro.getSkills().hasSkill("injury.missing_hand") && !bro.getSkills().hasSkill("trait.legend_prosthetic_hand"))
					{
						potential.push(inj);
					}
					else if (inj.ID == "injury.missing_nose" && !bro.getSkills().hasSkill("injury.missing_nose") && !bro.getSkills().hasSkill("trait.legend_prosthetic_nose"))
					{
						potential.push(inj);
					}
					else if (inj.ID != "injury.broken_elbow_joint" && inj.ID != "injury.broken_knee" && inj.ID != "injury.maimed_foot" && inj.ID != "injury.missing_ear" && inj.ID != "injury.missing_eye" && inj.ID != "injury.missing_finger" && inj.ID != "injury.missing_hand" && inj.ID != "injury.missing_nose" && !bro.getSkills().hasSkill(inj.ID))
					{
						potential.push(inj);
					}
				}

				if (potential.len() > 0)
				{
					dinner_candidates.push(bro);
				}
			}
		}

		if (dinner_candidates.len() < 1)
		{
			return;
		}

		this.m.Dinner = dinner_candidates[this.Math.rand(0, dinner_candidates.len() - 1)];
		this.m.Score = 5.5 + dinner_candidates.len() / 2.0;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"cannibal",
			this.m.Cannibal.m.Name
		]);
		_vars.push([
			"dinner",
			this.m.Dinner.m.Name
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Cannibal = null;
		this.m.Dinner = null;
	}

});

