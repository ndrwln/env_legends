this.legend_read_omens_trance_skill <- this.inherit("scripts/skills/actives/legend_trance_abstract", {
	m = {
		BaseFatigueCost = 30,
		BaseAPCost = 4
	},
	function create()
	{
		this.legend_trance_abstract.create();
		this.m.ID = "actives.legend_read_omens_trance";
		this.m.Name = "Read Omens (Trance)";
		this.m.Icon = "skills/omen_active.png";
		this.m.IconDisabled = "skills/omen_active_sw.png";
		this.m.Overlay = "omen_active";
		this.m.Description = "Toggle Read Omens On (+15% reroll on hit)";
		this.m.ToggleOnDescription = this.m.Description;
		this.m.ToggleOffDescription = "Toggle Read Omens Off";
	}

	function removeAll()
	{
		local act = this.getContainer().getActor();

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			local skills = bro.getSkills();
			local omens = skills.getSkillByID("effects.legend_read_omens");

			if (omens != null && omens.getActor() != null && omens.getActor == act)
			{
				bro.getSkills().removeByID("effects.legend_read_omens");
			}
		}
	}

	function swapOn()
	{
		this.legend_trance_abstract.swapOn();
		local act = this.getContainer().getActor();

		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			local effect = this.new("scripts/skills/effects/legend_read_omens_effect");
			effect.setActor(act);
			bro.getSkills().add(effect);
		}
	}

});

