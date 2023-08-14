this.perk_legend_efficient_packing <- this.inherit("scripts/skills/skill", {
	m = {
		StashSize = 8
	},
	function create()
	{
		this.m.ID = "perk.legend_efficient_packing";
		this.m.Name = this.Const.Strings.PerkName.LegendEfficientPacking;
		this.m.Description = this.Const.Strings.PerkDescription.LegendEfficientPacking;
		this.m.Icon = "ui/perks/MaxStashT1.png";
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
		_properties.Stamina += 6;
	}

});

