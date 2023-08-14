this.legend_wine_tipsy_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 6
	},
	function create()
	{
		this.m.ID = "effects.legend_wine_tipsy_effect";
		this.m.Name = "Tipsy";
		this.m.Icon = "skills/status_effect_92.png";
		this.m.IconMini = "status_effect_92_mini";
		this.m.Overlay = "status_effect_92";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.DrugEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "After imbibing wine, this character has [color=" + this.Const.UI.Color.PositiveValue + "]6[/color] Resolve, Melee and Ranged Skill, [color=" + this.Const.UI.Color.NegativeValue + "]-6[/color] Defenses and [color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Initiative for [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s).";
	}

	function getTooltip()
	{
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Resolve"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Melee Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Ranged Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6[/color] Melee Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-6[/color] Ranged Defense"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-12[/color] Initiative"
			}
		];
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += 6;
		_properties.MeleeSkill += 6;
		_properties.RangedSkill += 6;
		_properties.MeleeDefense -= 6;
		_properties.RangedDefense -= 6;
		_properties.InitiativeMult -= 12;
	}

	function onAdded()
	{
		this.m.TurnsLeft = 6;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onRemoved()
	{
		if (this.Math.rand(1, 100) <= 20)
		{
			this.getContainer().add(this.new("scripts/skills/effects_world/hangover_effect"));
		}
	}

});

