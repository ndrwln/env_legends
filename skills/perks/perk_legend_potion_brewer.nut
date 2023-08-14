this.perk_legend_potion_brewer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_potion_brewer";
		this.m.Name = this.Const.Strings.PerkName.LegendPotionBrewer;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPotionBrewer;
		this.m.Icon = "ui/perks/potion_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

