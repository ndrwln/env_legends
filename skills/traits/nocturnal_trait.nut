this.nocturnal_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.nocturnal";
		this.m.Name = "Nocturnal";
		this.m.Icon = "ui/traits/legend_nocturnal.png";
		this.m.Description = "This character has such disrupted sleep patterns that they became nocturnal. A natural inclination for staying up late, coupled with long years of working the night has left them unused to seeing the sun. Removes the usual night penalties, but applies them during the day.";
		this.m.Titles = [
			"Prowler",
			"Sleepy",
			"Night Hawk",
			"Vespertine",
			"Moonkin",
			"Night Crawler"
		];
		this.m.Excluded = [
			"trait.short_sighted",
			"trait.night_blind",
			"trait.legend_diurnal"
		];
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+1[/color] Vision during Night time"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] Ranged Skill during Night time"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] Ranged Defense during Night time"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-1[/color] Vision during Night time"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30%[/color] Ranged Skill during Day time"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-30%[/color] Ranged Defense during Day time"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight == true)
		{
			_properties.Vision += 1;
			_properties.RangedSkillMult *= 1.3;
			_properties.RangedDefenseMult *= 1.3;
		}

		if (!this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight == true)
		{
			_properties.Vision -= 1;
			_properties.RangedSkillMult *= 0.7;
			_properties.RangedDefenseMult *= 0.7;
		}
	}

});

