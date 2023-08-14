this.perk_legend_barter_paymaster <- this.inherit("scripts/skills/skill", {
	function create()
	{
		this.m.ID = "perk.legend_barter_paymaster";
		this.m.Name = this.Const.Strings.PerkName.LegendPaymaster;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPaymaster;
		this.m.Icon = "ui/perks/BarterT1.png";
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

		this.World.State.getPlayer().calculateBarterMult();
		this.World.State.getPlayer().calculateWageModifier();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateWageModifier();
		this.World.State.getPlayer().calculateBarterMult();
	}

});

