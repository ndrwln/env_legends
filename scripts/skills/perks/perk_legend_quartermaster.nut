this.perk_legend_quartermaster <- this.inherit("scripts/skills/skill", {
	function create()
	{
		this.m.ID = "perk.legend_quartermaster";
		this.m.Name = this.Const.Strings.PerkName.LegendQuartermaster;
		this.m.Description = this.Const.Strings.PerkDescription.LegendQuartermaster;
		this.m.Icon = "ui/perks/food56.png";
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

		this.World.State.getPlayer().calculateFoodModifier();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateFoodModifier();
	}

});

