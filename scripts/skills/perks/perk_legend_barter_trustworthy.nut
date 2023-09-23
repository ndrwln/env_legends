this.perk_legend_barter_trustworthy <- this.inherit("scripts/skills/skill", {
	m = {
		Amount = 0.02
	},
	function create()
	{
		this.m.ID = "perk.legend_barter_trustworthy";
		this.m.Name = this.Const.Strings.PerkName.LegendBarterTrustworthy;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBarterTrustworthy;
		this.m.Icon = "ui/perks/BarterT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Amount;
	}

	function onAdded()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateBarterMult();
	}

	function onRemoved()
	{
		if (this.World.State.getPlayer() == null)
		{
			return;
		}

		this.World.State.getPlayer().calculateBarterMult();
	}

});

