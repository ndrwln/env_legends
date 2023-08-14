this.perk_legend_alcohol_brewing <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_alcohol_brewing";
		this.m.Name = this.Const.Strings.PerkName.LegendAlcoholBrewing;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAlcoholBrewing;
		this.m.Icon = "ui/perks/alcohol_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

