this.perk_legend_woodworking <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_woodworking";
		this.m.Name = this.Const.Strings.PerkName.LegendWoodworking;
		this.m.Description = this.Const.Strings.PerkDescription.LegendWoodworking;
		this.m.Icon = "ui/perks/woodworking.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});

