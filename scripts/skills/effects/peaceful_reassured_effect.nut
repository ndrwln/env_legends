this.peaceful_reassured_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.peaceful_reassured";
		this.m.Name = "Reassured";
		this.m.Icon = "skills/peaceful_reassured.png";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "The presence of nearby peaceful people is increasing this characters resolve and experience gain";
	}

	function getTooltip()
	{
		local peacefuls = this.getPeacefuls();
		local peaceBravery = peacefuls * 3;
		local ret = [
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
				id = 11,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + peaceBravery + "[/color] Resolve"
			},
			{
				id = 7,
				type = "hint",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + peacefuls + "%[/color] Experience Gain"
			}
		];
		return ret;
	}

	function getPeacefuls()
	{
		if (!("Entities" in this.Tactical) || this.Tactical.Entities == null || !this.Tactical.isActive())
		{
			return 0;
		}

		local hippies = 0;
		local actors = this.Tactical.Entities.getAllInstancesAsArray();

		foreach( a in actors )
		{
			if (a.getFaction() == this.Const.Faction.Player && a.getSkills().hasSkill("perk.legend_peaceful"))
			{
				hippies = hippies + 1;
			}
		}

		return hippies;
	}

	function onUpdate( _properties )
	{
		local peacefuls = this.getPeacefuls();
		local peaceBravery = peacefuls * 3;
		local peaceXP = (100 + peacefuls) * 0.01;
		_properties.Bravery += peaceBravery;
		_properties.XPGainMult *= peaceXP;
	}

});

