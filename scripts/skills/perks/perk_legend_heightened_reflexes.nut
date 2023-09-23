this.perk_legend_heightened_reflexes <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_heightened_reflexes";
		this.m.Name = this.Const.Strings.PerkName.LegendHeightenedReflexes;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHeightenedReflexes;
		this.m.Icon = "ui/perks/heightened_reflexes.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getBonus()
	{
		if (this.getContainer() == null)
		{
			return 3;
		}

		local actor = this.getContainer().getActor();

		if (actor == null)
		{
			return 3;
		}

		local rdef = actor.getBaseProperties().RangedDefense;
		local bonus = rdef;
		return this.Math.max(3, this.Math.floor(bonus));
	}

	function getTooltip()
	{
		local bonus = this.getBonus();
		local tooltip = this.skill.getTooltip();
		tooltip.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "You are gaining [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "[/color] initiative due to heightened reflexes"
		});
		return tooltip;
	}

	function onUpdate( _properties )
	{
		local bonus = this.getBonus();
		_properties.Initiative += bonus;
	}

});

