this.perk_legend_skillful_stacking <- this.inherit("scripts/skills/skill", {
	m = {
		StashSize = 12
	},
	function create()
	{
		this.m.ID = "perk.legend_skillful_stacking";
		this.m.Name = this.Const.Strings.PerkName.LegendSkillfulStacking;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSkillfulStacking;
		this.m.Icon = "ui/perks/MaxStashT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateStashModifier();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateStashModifier();
	}

	function getModifier()
	{
		return this.m.StashSize;
	}

	function onUpdate( _properties )
	{
		_properties.Stamina += 9;
	}

});

