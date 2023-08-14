this.perk_legend_bloodbath <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_bloodbath";
		this.m.Name = this.Const.Strings.PerkName.LegendBloodbath;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBloodbath;
		this.m.Icon = "ui/perks/bloodbath_circle.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		local bleeders = this.getBleeders();
		return bleeders == 0;
	}

	function getTooltip()
	{
		local bleeders = this.getBleeders();
		local bonus = bleeders * 100;
		local tooltip = this.skill.getTooltip();

		if (bleeders > 0.8)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are a lot of characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		}
		else if (bleeders > 0.5)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are some characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		}
		else if (bleeders > 0.3)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "There are a few characters bleeding, giving a bonus of [color=" + this.Const.UI.Color.PositiveValue + "]+" + bonus + "%[/color] to resolve and fatigue"
			});
		}

		return tooltip;
	}

	function getBleeders()
	{
		if (!("Entities" in this.Tactical))
		{
			return 0;
		}

		if (this.Tactical.Entities == null)
		{
			return 0;
		}

		if (!this.Tactical.isActive())
		{
			return 0;
		}

		local count = 0.0;
		local bleeders = 0.0;
		local actors = this.Tactical.Entities.getAllInstancesAsArray();

		foreach( a in actors )
		{
			if (a.getSkills().hasSkill("effects.bleeding") || a.getSkills().hasSkill("effects.legend_grazed_effect") || a.getSkills().hasSkillOfType(this.Const.SkillType.TemporaryInjury))
			{
				bleeders = bleeders + 1.0;
			}

			count = count + 1.0;
		}

		return count == 0 ? 0 : bleeders / count;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBleeders();
		_properties.BraveryMult += bonus;
		_properties.StaminaMult += bonus;
	}

});

